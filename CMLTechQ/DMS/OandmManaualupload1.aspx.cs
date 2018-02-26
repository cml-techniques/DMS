using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;
using System.IO;
using PassProtection;

namespace CMLTechQ.DMS
{
    public partial class OandmManaualupload1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprj.Text = Request.QueryString["Auth2"].ToString();

                //pageinfo.Text = "Page / O&M Manual";
               // Get_ProjectInfo();

                lblfolder.Text = Request.QueryString["Auth4"].ToString();
                lbldocFolder.Text = Request.QueryString["Auth5"].ToString();
                //GetFolderTree();
                Get_User();
                //loadPageprojectinfo();
                ///load_document();

                lblsubtitle.Text = "O & M Manual Upload > " + GetFolderName();
                //Session["parent"]=
                load_contractor();
                LoadListDate();
                LoadStatus();
                LoadVersion();

            }

        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = lbluseridhidden.Text;
            //string _prm = "";
            //lbluserhidden.Text = _prm;
            string _decoded = "";
            if (_prm.IndexOf("?wmode") > 0)
                _decoded = _obj.Decoding(_prm.Substring(0, _prm.IndexOf("?wmode")));
            else
                _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
        }
        
        void load_contractor()
        {
            ddlContractor.Items.Clear();
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;
            ddlContractor.DataSource = _objbal.load_Contractor(_objcls, _objdb);
            ddlContractor.DataTextField = "con_name";
            ddlContractor.DataValueField = "con_code";
            ddlContractor.DataBind();
            ddlContractor.Items.Insert(0, "-- Select Contractor Name --");
        }
        private bool Validation()
        {

            if (ddlcntstatus.SelectedItem.Text == "-- Select Status --")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select Status');", true);
                return true;
            }
            else if (ddlContractor.SelectedItem.Text == "-- Select Contractor Name --")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select Contactor');", true);
                return true;
            }
            else if (ddlrevision.SelectedItem.Text == "-- Select Revision --")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select Revision');", true);
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
        private bool ChekSpecialCharacter(string FileName)
        {
            if (FileName.Contains("&") == true || FileName.Contains("%") == true)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Speacial characters not allowed');", true);
                return true;
            }
            return false;
        }
        private bool uploadFiles()
        {
            bool rvalue = false;
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

                if (FileValidation(_fileName)) return false;
                if (hpf.ContentLength > 0)
                {
                    //hpf.SaveAs(Server.MapPath("Documents") + "\\" + lblprj.Text + "\\" + System.IO.Path.GetFileName(hpf.FileName));


                    hpf.SaveAs(Server.MapPath("Documents") + "\\" + System.IO.Path.GetFileName(hpf.FileName));
                    _objcls.doc_name = System.IO.Path.GetFileName(hpf.FileName);
                    _objcls.doc_title = ddlContractor.Text;
                    _objcls.doctype_code = 0;
                    _objcls.package_code = 0;
                    _objcls.uploaded_date = DateTime.Now;
                    _objcls.service_code = 0; ;
                    _objcls.uploaded = true;
                    _objcls.schid = 0;
                    _objcls.folder_id = Convert.ToInt16(lbldocFolder.Text);
                    _objcls.file_size = decimal.Round((Convert.ToDecimal(hpf.ContentLength) / 1024), 2).ToString() + "KB";
                    _objcls.uid = (string)lbluserid.Text;
                    _objcls.type = "O & M Manual";
                    _objcls.status = ddlcntstatus.SelectedValue.ToString();
                    _objcls.Manual_title = txtmnltitle.Text;
                    _objcls.Version = ddlrevision.SelectedValue.ToString();
                    _objcls.possition = 1;
                    _objbll.FileUploadingNew(_objcls, _objdb);

                    rvalue = true;

                }

            }
            return rvalue;
        }
        private bool DateValidation(string dateString)
        {

            if (string.IsNullOrEmpty(dateString))
            {
                dateString = DateTime.Now.AddDays(30).ToString();
            }

            DateTime dateValue;
            string[] format = new string[] { "dd/MM/yyyy" };
            string[] format1 = new string[] { "dd/MM/yy" };
            string[] format2 = new string[] { "M/dd/yyyy" };
            if (DateTime.TryParseExact(dateString, format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.NoCurrentDateDefault, out dateValue))
                return true;
            else if (DateTime.TryParseExact(dateString, format1, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.NoCurrentDateDefault, out dateValue))
                return true;
            else if (DateTime.TryParseExact(dateString, format2, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.NoCurrentDateDefault, out dateValue))
                return true;
            else
                return false;

        }
        int DocrveiewPeriod()
        {
            int _period = 0;
            //if string.IsNullOrEmpty(txtreviewdate.Text))
            //{

            //}
            DateTime Datetime1 = Convert.ToDateTime(txtreviewdate.Text);
            System.TimeSpan spanForDays = Datetime1 - DateTime.Now;

            _period = Convert.ToInt16(spanForDays.Days.ToString());
            return _period;
        }
        void SetDocDuration()
        {
            //if (time.Text == "0") return;//Revised OM Manual
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocduration _objcls = new _clsdocduration();
            // string _Doc_type = lblfolder.Text;
            _objcls.Folder_id = Convert.ToInt32(lbldocFolder.Text);
            //_objcls.Duration = Convert.ToInt32(txtreviewdate.Text)-(DateTime.Now,Dat;


            _objcls.First = Convert.ToInt32(ddl1reminder.SelectedValue);
            _objcls.Second = Convert.ToInt32(ddl2reminder.SelectedValue);
            _objcls.Third = Convert.ToInt32(ddl3reminder.SelectedValue);




            if (DateValidation(txtreviewdate.Text))
            {
                _objcls.Duration = DocrveiewPeriod();

            }
            else
                _objcls.Duration = 15;

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
            _objcls1.schid = Convert.ToInt32(lblfolder.Text);
            //lblsch.Text = "1747";

            DataTable _dt = _objbll.load_dms_user_email(_objcls1, _objdb);
            var list = from o in _dt.AsEnumerable()
                       where o.Field<string>(1) == "Review/Comment" || o.Field<string>(1) == "Review/Comment/Status"
                       select o;

            foreach (var row in list)
            {
                // if ((string)Session["Rev"] == "Revised")
                if (ddlcntstatus.Text == "Revised")
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
                Body = "Ref. " + project + " - " + (string)Session["parent"] + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review the manual and make any comments using the comment screen within the next " + DocrveiewPeriod() + " days." + "\n\n" + "If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of your co-operation with the review process." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            else if (access == "Review/Comment/Status")
            {
                Body = "Ref. " + project + " - " + (string)Session["parent"] + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review the manual and make any comments using the comment screen within the next " + DocrveiewPeriod() + " days." + "\n\n" + "If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of co-operation." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
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
                Body = "Ref. " + project + " - " + lblsubtitle.Text + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been revised and is now available for further review." + "\n\n" + "Could you please find time to review changes made and make further comment(s) if required." + "\n\n" + "If no further comment(s) are required, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of your co-operation with the review process." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            else if (access == "Review/Comment/Status")
            {
                Body = "Ref. " + project + " - " + lblsubtitle.Text + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review changes and if acceptable change the status of the manual on exit from the website." + "\n\n" + "Thank you in anticipation of co-operation." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            string _sub = "Ref. " + project + " - " + lblsubtitle.Text;
            _objcls.Send_Email(user_id, _sub, Body);
        }

        void LoadListDate()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("Name");
            DataRow dRow;

            for (int i = 1; i <= 30; i++)
            {

                dRow = dt.NewRow();
                dRow["Id"] = i;
                dRow["Name"] = i + " Days";

                dt.Rows.Add(dRow);
            }


            ddl1reminder.DataSource = dt;
            ddl1reminder.DataTextField = "name";
            ddl1reminder.DataValueField = "id";
            ddl1reminder.DataBind();


            ddl2reminder.DataSource = dt;
            ddl2reminder.DataValueField = "id";
            ddl2reminder.DataTextField = "name";
            ddl2reminder.DataBind();


            ddl3reminder.DataSource = dt;
            ddl3reminder.DataTextField = "Name";
            ddl3reminder.DataValueField = "id";
            ddl3reminder.DataBind();

            //ddltest.DataSource = dt;
            //ddltest.DataTextField = "name";
            //ddltest.DataValueField = "id";
            //ddltest.DataBind();




        }
        string GetFolderName()
        {
            string foldername = "";
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();

            _objcls.Folder_id = Convert.ToInt16(lblfolder.Text);

            DataTable dtd = _objbal.Get_Folder_Description(_objcls, _objdb);
            if (dtd.Rows.Count > 0) foldername = dtd.Rows[0][0].ToString();
            return foldername;
        }
        protected void chkglobalperiod_CheckedChanged(object sender, EventArgs e)
        {

        }
        void LoadStatus()
        {
            ddlcntstatus.Items.Clear();
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            ddlcntstatus.DataSource = _objbal.Load_DocumentStatus(_objdb);
            ddlcntstatus.DataTextField = "Status";
            //ddlcntstatus.DataValueField = "con_code";
            ddlcntstatus.DataBind();
            ddlcntstatus.Items.Insert(0, "-- Select Status --");
        }
        void LoadVersion()
        {
            ddlrevision.Items.Clear();
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(lbldocFolder.Text);
            _objdb.DBName = "dbCML";
            ddlrevision.DataSource = _objbal.GetDocumentVersion(_objcls, _objdb);
            ddlrevision.DataTextField = "version";
            //ddlcntstatus.DataValueField = "con_code";
            ddlrevision.DataBind();
            ddlrevision.Items.Insert(0, "-- Select Revision --");
        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    if (draction1.SelectedItem.Text == "Select Action") ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Select Action');", true);
        //    if (draction1.SelectedItem.Text == "Upload New")
        //    {
        //        //UpdatePanel11.Update();

        //        ModalPopupExtender1.Show();

        //        //string _id = "OandmManaualupload?Prj=" + lblprj.Text + "&Folder=" + lbldocFolder.Text + "&Id=" + lbluseridhidden.Text + "&Type=2";
        //        ////Response.Redirect("schedulingsub.aspx?" + _id);
        //        //ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "window.open('" + _id + "','','left=300,top=100,width=1000,height=600,menubar=0,toolbar=0,scrollbars=0,status=0,resizable=0');", true);
        //    }
        //}


        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void btnnew_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Show();
            //tblcntr.Visible = true;

        }

        protected void btnAddcntr_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtcontracter.Text))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter the Contractor !');", true);
                ModalPopupExtender2.Show();
                txtcontracter.Focus();
                return;
            }

            if (txtcontracter.Text == "") return;
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsmanufacture _objcls = new _clsmanufacture();
            _objcls.project_code = lblprj.Text;
            _objcls.man_name = txtcontracter.Text;
            Panel1.Visible = false;
            _objbal.Create_Contractor(_objcls, _objdb);
            load_contractor();

            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Created New Contractor!');", true);
            //btn.Enabled = true;
            ModalPopupExtender2.Hide();
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            if (Validation() == true)
            {
                //ModalPopupExtender1.Show();

                return;
            }
            if (!uploadFiles())
            {
                //ModalPopupExtender1.Show();
                return;
            }
            ////SetDocDuration();

            ////lst2reminder.AutoPostBack = false;

            ////string ss = lst1reminder.SelectedItem.Value.ToString();
            //string ss1 = ddlContractor.SelectedItem.Value.ToString();
            //string p = ddlcntstatus.SelectedItem.Value.ToString();

            //string s = ddl1reminder.SelectedItem.Value.ToString();

            if (!chknoreview.Checked) SetDocDuration();
            if (chkemailnoti.Checked) load_users();

            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Document uploaded!');", true);
           
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender1.Hide();
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            // ModalPopupExtender2.Hide();

        }
    }
}