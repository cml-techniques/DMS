using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Properties;
using BusinessLogic;
using System.IO; 
using System.Data; 
using PassProtection;

namespace CMLTechQ.DMS
{
    public partial class OandmManaualupload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                //if (Request.QueryString["Prj"].ToString() != null) lblprj.Text = Request.QueryString["Prj"].ToString();
                //if (Request.QueryString["Folder"].ToString() != null) lblfolder.Text = Request.QueryString["Folder"].ToString();
                //if (Request.QueryString["id"].ToString() != null) lbluserhidden.Text = Request.QueryString["Id"].ToString();
                ////lblServid.Text = "1747";
                ////lblpage.Text = "";

                //lblprj.Text = "123";
                //lblfolder.Text = "1724";
                //lbluserhidden.Text = "111111";
                fileinfo.Text = "O & M Manual Upload";



                //Get_User();

                //Panel1.Visible = false;

                //load_contractor();
                //getServiceFolder();

                //loadPageprojectinfo();
            }

        }
        private void loadPageprojectinfo()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(lblfolder.Text);


            //lblpage.Text = _objbll.Get_folderProjectDescription(_objcls, _objdb).Rows[0][0].ToString();
        }
        void load_contractor()
        {
            drpContractor.Items.Clear();
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;
            drpContractor.DataSource = _objbal.load_Contractor(_objcls, _objdb);
            drpContractor.DataTextField = "con_name";
            drpContractor.DataValueField = "con_code";
            drpContractor.DataBind();
            drpContractor.Items.Insert(0, "-- Select Contractor Name --");
        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Id"].ToString();
            //string _prm = "";
            //lbluserhidden.Text = _prm;
            string _decoded = "";
            if (_prm.IndexOf("?wmode") > 0)
                _decoded = _obj.Decoding(_prm.Substring(0, _prm.IndexOf("?wmode")));
            else
                _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
        }
        protected void cmdnew_Click(object sender, EventArgs e)
        {

            Panel1.Visible = true;
            cmdnew.Enabled = false;

        }
        protected void cmdadd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtnewContractor.Text))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter the Contractor !');", true);
                txtnewContractor.Focus();
                return;
            }

            if (txtnewContractor.Text == "") return;
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsmanufacture _objcls = new _clsmanufacture();
            _objcls.project_code = lblprj.Text;
            _objcls.man_name = txtnewContractor.Text;
            Panel1.Visible = false;
            _objbal.Create_Contractor(_objcls, _objdb);
            load_contractor();
            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Created New Contractor!');", true);
            cmdnew.Enabled = true;
        }
        private bool Validation()
        {

            if (drpContractor.SelectedItem.Text == "-- Select Contractor Name --")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select Contactor');", true);
                return true;
            }
            return false;
        }
        private bool FileValidation(string _fileName)
        {
            if (string.IsNullOrEmpty(_fileName))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select the file!');", true);
                return true;
            }
            else if (ChekSpecialCharacter(_fileName) == true)
            {

                return true;
            }

            else if (!(_fileName.EndsWith(".pdf", StringComparison.Ordinal) || _fileName.EndsWith(".Pdf", StringComparison.Ordinal) || _fileName.EndsWith(".PDF", StringComparison.Ordinal)))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('File format should be .Pdf!');", true);
                return true;
            }
            else
                return false;

        }

        protected void cmdupload_Click(object sender, EventArgs e)
        {
            if (Validation() == true) return;

            uploadFiles();
            SetDocDuration();
            if (emailNotification1.Checked)
            {
                load_users();

            }
        }
        private bool ChekSpecialCharacter(string FileName)
        {
            if (FileName.Contains("&") == true || FileName.Contains("%") == true)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Speacial characters not allowed');", true);
                return true;
            }
            return false;
        }
        private void uploadFiles()
        {
            HttpFileCollection hfc = HttpContext.Current.Request.Files;
            int numFiles = Request.Files.Count;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();

            // string _dir = (string)Session["project"];
            if (Directory.Exists(Server.MapPath("Documents") + "\\" + lblprj.Text) == false)
                Directory.CreateDirectory(Server.MapPath("Documents") + "\\" + lblprj.Text);
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                string _fileName = System.IO.Path.GetFileName(hpf.FileName);

                if (FileValidation(_fileName)) return;
                if (hpf.ContentLength > 0)
                {
                    hpf.SaveAs(Server.MapPath("Documents") + "\\" + lblprj.Text + "\\" + System.IO.Path.GetFileName(hpf.FileName));


                    //hpf.SaveAs(Server.MapPath("Documents") + "\\" + System.IO.Path.GetFileName(hpf.FileName));
                    _objcls.doc_name = System.IO.Path.GetFileName(hpf.FileName);
                    _objcls.doc_title = drpContractor.Text;
                    _objcls.doctype_code = 0;
                    _objcls.package_code = 0;
                    _objcls.uploaded_date = DateTime.Now;
                    _objcls.service_code = 0; ;
                    _objcls.uploaded = true;
                    _objcls.schid = 0;
                    _objcls.folder_id = Convert.ToInt16(lblfolder.Text);
                    _objcls.file_size = decimal.Round((Convert.ToDecimal(hpf.ContentLength) / 1024), 2).ToString() + "KB";
                    _objcls.uid = (string)Session["uid"];
                    _objcls.type = "O & M Manual";

                    _objcls.possition = 1;
                    _objbll.file_upload(_objcls, _objdb);


                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Document uploaded!');", true);
                }
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            drpContractor.SelectedIndex = 0;
            emailNotification1.Checked = false;

        }
        void SetDocDuration()
        {
            if (time.Text == "0") return;//Revised OM Manual
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocduration _objcls = new _clsdocduration();
            // string _Doc_type = lblfolder.Text;
            _objcls.Folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.Duration = Convert.ToInt32(time.Text);
            _objcls.First = Convert.ToInt32(remind1.Text);
            _objcls.Second = Convert.ToInt32(remind2.Text);
            _objcls.Third = Convert.ToInt32(remind3.Text);
            _objcls.prj_code = lblprj.Text;
            _objbll.SetDocDuration(_objcls, _objdb);
        }
        void load_users()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;
            string project = _objbll.Get_ProjectName(_objcls, _objdb);
            ;

            _clsdocument _objcls1 = new _clsdocument();
            _objcls1.project_code = lblprj.Text;
            _objcls1.schid = Convert.ToInt32(lblServid.Text);
            //lblsch.Text = "1747";

            DataTable _dt = _objbll.load_dms_user_email(_objcls1, _objdb);
            var list = from o in _dt.AsEnumerable()
                       where o.Field<string>(1) == "Review/Comment" || o.Field<string>(1) == "Review/Comment/Status"
                       select o;

            foreach (var row in list)
            {
                if ((string)Session["Rev"] == "Revised")
                    Send_Mail_Revised(row[0].ToString(), row[1].ToString(), project);
                else
                    Send_Mail(row[0].ToString(), row[1].ToString(), project);
            }


        }
        void Send_Mail(string user_id, string access, string project)
        {

            publicCls.publicCls _objcls = new publicCls.publicCls();
            string Body = "";
            if (access == "Review/Comment")
            {
                Body = "Ref. " + project + " - " + (string)Session["parent"] + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review the manual and make any comments using the comment screen within the next " + time.Text + " days." + "\n\n" + "If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of your co-operation with the review process." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            else if (access == "Review/Comment/Status")
            {
                Body = "Ref. " + project + " - " + (string)Session["parent"] + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review the manual and make any comments using the comment screen within the next " + time.Text + " days." + "\n\n" + "If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of co-operation." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            string _sub = "Ref. " + project + " - " + (string)Session["parent"];
            _objcls.Send_Email(user_id, _sub, Body);
        }
        void Send_Mail_Revised(string user_id, string access, string project)
        {

            publicCls.publicCls _objcls = new publicCls.publicCls();
            string Body = "";
            if (access == "Review/Comment")
            {
                Body = "Ref. " + project + " - " + (string)Session["parent"] + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been revised and is now available for further review." + "\n\n" + "Could you please find time to review changes made and make further comment(s) if required." + "\n\n" + "If no further comment(s) are required, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of your co-operation with the review process." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            else if (access == "Review/Comment/Status")
            {
                Body = "Ref. " + project + " - " + (string)Session["parent"] + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review changes and if acceptable change the status of the manual on exit from the website." + "\n\n" + "Thank you in anticipation of co-operation." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            string _sub = "Ref. " + project + " - " + (string)Session["parent"];
            _objcls.Send_Email(user_id, _sub, Body);
        }
        private void getServiceFolder()
        {
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _clsdocument _objcls = new _clsdocument();
            _objdb.DBName = "dbCML";
            _objcls.package_code = Convert.ToInt16(lblfolder.Text);
            lblServid.Text = _objbal.Get_Servicefolder(_objcls, _objdb).ToString();

        }
    }
}