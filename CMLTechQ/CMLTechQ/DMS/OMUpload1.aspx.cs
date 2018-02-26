using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;
using App_Properties;
using PassProtection;
using System.IO;
using Telerik.Web.UI;

namespace CMLTechQ.DMS
{
    public partial class OMUpload1 : System.Web.UI.Page
    {
        static DataTable dtDocStyle;
        static DataTable dtDocMaster;
        static int ReviewPeriod;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();

                Get_ProjectInfo();
                loadPageprojectinfo();
                Get_User();



                Load_ReminderSettings();
                load_contractor();
                LoadStyleMaster();
                lbldocstylechange.Text = "false";
                SetCurrentVersion();
                Session["closestatus"] = 1;
            }


            if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
            {
                hmenufolder.Value = Request.QueryString["Auth5"].ToString();

            }

            GenerateInnerNav_Doc(1);
        }

        private void GenerateInnerNav_Doc(int type)
        {
            //string a = "";
            //a = fid.Value;

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(hmenufolder.Value);
            DataTable dt = new DataTable();
            dt = _objbll.Get_CurrentUploadFolder(_objcls, _objdb);
            string _head = "<ul class='nav'>";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;

            foreach (DataRow _drow in dt.Rows)
            {
                string _menuItem = "";
                // if (_idx == 0)
                string _folder = _drow["folder_description"].ToString();

                if (_folder.Length > 30)
                    _folder = _folder.Substring(0, 30) + "...";
                if (_idx == type - 1)
                {
                    _menuItem = "<li class='item current' ><a class='current' href='#' onclick=PageNavaigation_Doc(" + _drow["Folder_id"].ToString() + "," + _drow["type"].ToString() + "," + hmenufolder.Value + ");>" + _folder + "</a></li>";
                    //lbldocFolder.Text = _drow["Folder_id"].ToString();
                }
                else
                    _menuItem = "<li class='item' ><a href='#' onclick=PageNavaigation_Doc(" + _drow["Folder_id"].ToString() + "," + _drow["type"].ToString() + "," + hmenufolder.Value + ");>" + _folder + "</a></li>";
                _item = _item + _menuItem;
                _idx += 1;
            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            PlaceHolder1.Controls.Add(_lt);

        }
        private void Get_ProjectInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(Request.QueryString["Auth2"].ToString());
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
        }
        private void loadPageprojectinfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(lblfolder.Text);
            DataTable dt = _objbll.Get_folderProjectdescription1(_objcls, _objdb);
            string strfolder;

            if (dt.Rows.Count > 0)
            {
                strfolder = dt.Rows[0][0].ToString();
                pageinfo.Text = "O&M Manual Upload >" + strfolder.Substring(0, strfolder.IndexOf("/")); ;
                //pagehead.Text = "Upload As O&M Manual > " + strfolder.Substring(0, strfolder.IndexOf("/")); ;
            }
            //  pageinfo.Text = pageinfo.Text;
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
        private void load_contractor()
        {
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;
            DataTable _dt = _objbal.load_Contractor(_objcls, _objdb);
            drop_contractor.DataSource = _dt;
            drop_contractor.DataTextField = "con_name";
            drop_contractor.DataValueField = "con_code";
            drop_contractor.DataBind();
        }
        void LoadStyleMaster()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            dtDocStyle = _objbll.Load_DocumentStyleMaster(_objdb);
            //drop_revision.DataSource = dtDocStyle;
            //drop_revision.DataTextField = "version";
            //drop_revision.DataValueField = "version";
            //drop_revision.DataBind();
        }
        void SetCurrentVersion()
        {

            //DataTable dt = (DataTable)Session["DocStyle"];
            //Session["DocStyle"] = dt;

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";


            //DataTable dt1;
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt16(lblfolder.Text);
            _objcls.enabled = true;

            dtDocMaster = _objbll.GetDocumentVersion(_objcls, _objdb);
            // Session["DocVersion"] = dt1;

            int DocStyleId = 0;

            if (dtDocMaster.Rows.Count > 0) DocStyleId = Convert.ToInt16(dtDocMaster.Rows[0]["DocStyleId"].ToString());

            if (DocStyleId == 0) DocStyleId = Convert.ToInt16(dtDocStyle.Rows[0][0].ToString());


            lbldocstyleId.Text = DocStyleId.ToString();

            SetDafaultStyle(DocStyleId);

        }
        void SetDafaultStyle(int docid)
        {

            //DataTable dt = (DataTable)Session["DocStyle"];
            // DataTable dt1 = (DataTable)Session["DocVersion"];


            DataRow[] sel = dtDocStyle.Select("DocStyleId=" + docid);
            string[] styledata = { };

            foreach (DataRow dr in sel)
            {
                styledata = dr["StyleData"].ToString().Split(',');
            }



            DataTable dt2 = new DataTable();
            dt2.Columns.Add("version");
            dt2.Columns.Add("id", typeof(Int32));
            DataRow dr3;

            int ins = 1;

            foreach (DataRow dr1 in dtDocMaster.Rows)
            {
                dr3 = dt2.NewRow();
                dr3["id"] = ins;
                dr3["version"] = styledata.GetValue(Convert.ToInt16(dr1[0].ToString()) - 1).ToString();
                dt2.Rows.Add(dr3);

                ins += 1;

            }


            dt2.DefaultView.Sort = "id";
            dt2.AcceptChanges();

            drop_revision.DataSource = dt2;
            drop_revision.DataTextField = "version";
            drop_revision.DataValueField = "version";
            drop_revision.DataBind();

        }
        private void Load_ReminderSettings()
        {
            DataTable _dt = new DataTable();
            _dt.Columns.Add("Value", typeof(string));
            _dt.Columns.Add("Text", typeof(string));
            for (int i = 1; i <= 30; i++)
            {
                DataRow _drow = _dt.NewRow();
                _drow[0] = i.ToString();
                _drow[1] = "After " + i.ToString() + " Days";
                _dt.Rows.Add(_drow);
            }
            //drop_rem1.DataSource = _dt;
            //drop_rem1.DataTextField = "Text";
            //drop_rem1.DataValueField = "Value";
            //drop_rem1.DataBind();
            //drop_rem2.DataSource = _dt;
            //drop_rem2.DataTextField = "Text";
            //drop_rem2.DataValueField = "Value";
            //drop_rem2.DataBind();
            //drop_rem3.DataSource = _dt;
            //drop_rem3.DataTextField = "Text";
            //drop_rem3.DataValueField = "Value";
            //drop_rem3.DataBind();
        }
        protected void dummy_Click(object sender, EventArgs e)
        {
            //HttpPostedFile _file = Request.Files["myupload"];
            //HttpPostedFile _file1 = myupload.PostedFile;
            //string fileNameApplication = System.IO.Path.GetFileName(_file.FileName);
            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + fileNameApplication + "');", true);
            //string fileExtensionApplication = System.IO.Path.GetExtension(fileNameApplication);


            //string newFile = Guid.NewGuid().ToString() + fileExtensionApplication;
            //// getting a valid server path to save
            //string filePath = System.IO.Path.Combine(Server.MapPath("Documents"), newFile);

            //if (fileNameApplication != String.Empty)
            //{
            //    _file.SaveAs(filePath);
            //}

        }
        private bool EmpyValidation()
        {
            if (RadAsyncUpload1.UploadedFiles.Count <= 0)
            {
                //Notification.Text = "Select Document";
                //Notification.Show();
                return true;
            }
            else if (txt_doctitle.Text == "")
            {
                //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter Manual Title');", true);
                return true;
            }
            else if (drop_status.SelectedText == "")
            {
                //RadWindowManager1.RadAlert("Select Document Status", 200, 100, "Alert", "");
                return true;
            }
            else if (drop_contractor.SelectedText == "")
            {
                //RadWindowManager1.RadAlert("Select Contractor", 200, 100, "Alert", "");
                return true;
            }
            else if (drop_revision.SelectedText == "")
            {
                //RadWindowManager1.RadAlert("Select Revision", 200, 100, "Alert", "");
                return true;
            }
            else if (chk_noreview.Checked == false && chkdreview.Checked == false)
            {
                if (RadDatePicker1.SelectedDate.ToString() == "")
                {
                    //RadWindowManager1.RadAlert("Select Review End Date", 200, 100, "Alert", "");
                    return true;
                }
                else if (!RadDatePicker2.SelectedDate.HasValue)
                {
                    //RadWindowManager1.RadAlert("Select First Reminder", 200, 100, "Alert", "");
                    return true;
                }
                else if (!RadDatePicker3.SelectedDate.HasValue)
                {
                    //RadWindowManager1.RadAlert("Select Second Reminder", 200, 100, "Alert", "");
                    return true;
                }
                else if (!RadDatePicker4.SelectedDate.HasValue)
                {
                    //RadWindowManager1.RadAlert("Select Third Reminder", 200, 100, "Alert", "");
                    return true;
                }
            }
            return false;
        }
        protected void cmdupload_Click(object sender, EventArgs e)
        {
            if (EmpyValidation() == true) return;

            if (Upload())
            {
                Response.Redirect("NavWebForm1?" + Request.QueryString.ToString());
            }
        }
        private bool Upload()
        {
            bool uploads = false;
            //HttpPostedFile _file = Request.Files["myupload"];
            //HttpPostedFile _file1 = myupload.PostedFile;
            //string fileNameApplication = System.IO.Path.GetFileName(_file.FileName);
            ////ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + fileNameApplication + "');", true);
            //string fileExtensionApplication = System.IO.Path.GetExtension(fileNameApplication);


            ////string newFile = Guid.NewGuid().ToString() + fileExtensionApplication;
            ////string _filename = _file.FileName.Replace(" ", String.Empty);

            //string _filename = fileNameApplication.Replace(" ", String.Empty);

            //_filename = _filename.Replace(",", String.Empty);
            ////string newFile = "OM_" + lblfolder.Text + "_" + dr_revision.SelectedItem.Text + _filename;
            //// getting a valid server path to save
            //string filePath = System.IO.Path.Combine(Server.MapPath("Documents"), _filename);
            string filepath = Server.MapPath("Documents");
            string _filename = "";
            foreach (UploadedFile _fi in RadAsyncUpload1.UploadedFiles)
            {
                _filename = _fi.GetName();
                _fi.SaveAs(filepath + "//" + _fi.GetName(), true);
            }

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            if (Directory.Exists(Server.MapPath("Documents")) == false)
                Directory.CreateDirectory(Server.MapPath("Documents"));
            //if (fileNameApplication != String.Empty)
            //{
            //    _file.SaveAs(filePath);
            _objcls.doc_name = _filename;
            _objcls.doc_title = drop_contractor.SelectedText;
            _objcls.doctype_code = 0;
            _objcls.package_code = 0;
            _objcls.uploaded_date = DateTime.Now;
            _objcls.service_code = 0; ;
            _objcls.uploaded = true;
            _objcls.schid = 0;
            _objcls.folder_id = Convert.ToInt16(lblfolder.Text);
            _objcls.file_size = "0";
            _objcls.uid = lbluserid.Text;
            _objcls.type = "O & M Manual";
            _objcls.possition = 1;
            _objcls.status = drop_status.SelectedText;
            _objcls.Manual_title = txt_doctitle.Text;
            _objcls.Review = (chk_noreview.Checked ? false : true);
            _objcls.DisplayVersion = drop_revision.SelectedValue;
            _objcls.DocStyleId = Convert.ToInt16(lbldocstyleId.Text);
            _objcls.DocStyleChange = Convert.ToBoolean(lbldocstylechange.Text);
            _objcls.submit = true;
            _objcls.reff = "No";
            _objbll.FileUploading_OM(_objcls, _objdb);

            if (!chk_noreview.Checked) SetDocDuration();
            if (!chkemail.Checked) load_users();

            uploads = true;

            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Document uploaded!');", true);
            //}
            //else
            //    uploads = false;
            return uploads;
        }


        protected void btnchnagestyle_Click(object sender, EventArgs e)
        {
            LoadStyleComboMaster();
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }

        void LoadStyleComboMaster()
        {
            drop_style.DataSource = dtDocStyle;
            drop_style.DataValueField = "DocStyleId";
            drop_style.DataTextField = "StyleFormat";
            drop_style.DataBind();
        }

        protected void cmdcancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("NavWebForm1?" + Request.QueryString.ToString());

        }

        protected void btnnewcntr_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }

        protected void btddummyaddcntr_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender3.Show();
        }



        protected void btnContrcator_Click(object sender, EventArgs e)
        {
            if (txtcontractor.Text.Trim().Length <= 0) return;
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsmanufacture _objcls = new _clsmanufacture();
            _objcls.project_code = lblprj.Text;
            _objcls.man_name = txtcontractor.Text;
            _objbal.Create_Contractor(_objcls, _objdb);
            load_contractor();
            if (Check_Exist(drop_contractor, txtcontractor.Text) == true)
            {
                drop_contractor.ClearSelection();
                drop_contractor.FindItemByText(txtcontractor.Text).Selected = true;
            }
            txtcontractor.Text = "";
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }
        private bool Check_Exist(RadDropDownList _drop, string _item)
        {
            foreach (DropDownListItem _lst in _drop.Items)
            {
                if (string.Compare(_lst.Text, _item) == 0) return true;
            }
            return false;
        }
        //int checkContractorexists()
        //{
        //    //BLL_Dml _objbal = new BLL_Dml();
        //    //_database _objdb = new _database();
        //    //_objdb.DBName = "dbCML";
        //    //_clsmanufacture _objcls = new _clsmanufacture();
        //    //_objcls.project_code = lblprj.Text;
        //    //_objcls.man_name = txtcontractor.Text;
        //    // return _objbal.Check_Contractor_Exits(_objcls, _objdb);
        //    return 0;

        //}
        protected void btndummychangestyle_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender2.Show();
        }

        protected void btncancelc_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender3.Hide();
            load_contractor();

        }

        protected void btndummy3_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender3.Show();

        }
        void Delete_Defaultstyle()
        {
            //BLL_Dml _objbal = new BLL_Dml();
            //_database _objdb = new _database();
            //_objdb.DBName = "dbCML";
            //_clsdocument _objcls = new _clsdocument();
            //_objcls.project_code = lblprj.Text;
            //_objcls.DocStyleId = Convert.ToInt16(drstyle.SelectedValue);
            //_objbal.Delete_DocumentStyle(_objcls, _objdb);
        }
        int CheckStyleExits()
        {

            //BLL_Dml _objbll = new BLL_Dml();
            //_database _objdb = new _database();
            //_objdb.DBName = "dbCML";
            //_clsdocument _objcls = new _clsdocument();
            //_objcls.folder_id = Convert.ToInt32(drstyle.SelectedValue);

            int rvalue = 0;
            //rvalue = _objbll.Check_DocumentStyleExists(_objcls, _objdb);
            return rvalue;

        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (CheckStyleExits() > 0)
            {

                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Cannot delete Style because it used by another Document');", true);
                return;
            }

            //string s = drstyle.SelectedValue;
            //Delete_Defaultstyle();

            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Style Deleted Successfully');", true);
            //LoadStyleMaster();
            //LoadStyleComboMaster();
            //ModalPopupExtender2.Hide();
        }
        ////////////////////////////////Set Period and Email

        void SetDocDuration()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocduration _objcls = new _clsdocduration();

            _objcls.Folder_id = Convert.ToInt32(lblfolder.Text);

            DateTime now = Convert.ToDateTime(RadDatePicker2.SelectedDate);
            _objcls.First = now.Day;

            now = Convert.ToDateTime(RadDatePicker3.SelectedDate);
            _objcls.Second = now.Day;

            now = Convert.ToDateTime(RadDatePicker4.SelectedDate);
            _objcls.Third = now.Day;


            if (DateValidation(RadDatePicker1.SelectedDate.ToString()))
            {
                _objcls.Duration = DocrveiewPeriod();

            }
            else
            {
                _objcls.Duration = 15;
                ReviewPeriod = 15;
            }


            //if ((chkdreview.Checked == true) || (string.IsNullOrEmpty(txt_redate.Text)))
            //{
            //    _objcls.Duration = 30;

            //    _objcls.First = 10;
            //    _objcls.Second = 15;
            //    _objcls.Third = 20;
            //    ReviewPeriod = 15;

            //}


            _objcls.prj_code = lblprj.Text;
            _objbll.SetDocDuration(_objcls, _objdb);
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
            if (!DateValidation(RadDatePicker1.SelectedDate.ToString())) return 0;
            int _period = 0;
            DateTime Datetime1 = DateTime.ParseExact(RadDatePicker1.SelectedDate.ToString(), "dd/MM/yyyy", null);
            System.TimeSpan spanForDays = Datetime1 - DateTime.Now;

            _period = Convert.ToInt16(spanForDays.Days.ToString());
            ReviewPeriod = _period;
            return _period;
        }
        //private string Load_ParentFolders()
        //{
        //    string value = "";
        //    BLL_Dml _objbll = new BLL_Dml();
        //    _database _objdb = new _database();
        //    _clsdocument _objcls = new _clsdocument();
        //    _objdb.DBName = "DBCML";
        //    _objcls.folder_id = Convert.ToInt16(lblfolder.Text);
        //    DataTable dt = _objbll.Load_DMS_ParentFolders(_objcls, _objdb);
        //    if (dt.Rows.Count > 0)
        //    {
        //        value = value + dt.Rows[0]["folder_id"].ToString();
        //        value = value + "_P" + dt.Rows[0]["Parent_folder"].ToString();
        //        value = value + "_M" + dt.Rows[0]["MenuFolder"].ToString();

        //    }
        //    return value;


        //}
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

            DataTable _dt = _objbll.Load_dms_user_email_New(_objcls1, _objdb);
            var list = from o in _dt.AsEnumerable()
                       where o.Field<string>(1) == "Review/Comment" || o.Field<string>(1) == "Review/Comment/Status"
                       select o;

            int type;

            string foldervalues = "Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text;

            foreach (var row in list)
            {
                type = 0;
                //if (txt_status.Text == "Revised") type = 1;
                SendMail(row[0].ToString(), row[1].ToString(), project, type, foldervalues);
            }

        }
        void SendMail(string user_id, string access, string project, int type, string value)
        {
            publicCls.publicCls _objcls = new publicCls.publicCls();
            //string ReviewPeriod = "";
            string Body = "";
            string links = "<tr style=height:20px;><td /></tr><tr><td>Click <a href=http://dms.cmltechniques.com//AuthLogin?" + value + "> Here </a> To View O&M Manual </td></tr><tr style=height:30px;><td /></tr>";
            string htmlopen = "<html><body><table>";



            if (chk_noreview.Checked == true)
            {
                //Body = "Ref. " + project + " - " + txt_doctitle.Text + "\n\n" + "This is an automatically generated email to advise you that the O&M Manual noted above has been uploaded to CML Techniques." + "\n\n" + "CML Techniques";
                Body = Body + "<tr><td style=font-size:15px><b><u>Ref. " + project + " - " + txt_doctitle.Text + "</u></b></td></tr><tr style=height:30px;><td /></tr>" + "<tr><td><p> This is an automatically generated email to advise you that the O&amp;M Manual noted above has been uploaded to CML Techniques.<p></td></tr>";
            }
            else
            {
                if (type == 1)
                {
                    if (access == "Review/Comment")
                    {
                        Body = "<tr><td style=font-size:15px><b><u>Ref. " + project + " - " + txt_doctitle.Text + "</u><b></td></tr><tr style=height:30px;><td /></tr> <tr><td><p>This is an automatically generated email to advise you that the O&M Manual noted above has been revised and is now available for further review .</p><p>Could you please find time to review changes made and make further comment(s) if required.</p><p>If no further comment(s) are required, please confirm with 'No comments' on exit from the website. </p></td></tr> <tr style=height:20px><td /></tr><tr><td><p>Thank you in anticipation of your co-operation with the review process.</p></td></tr>";
                    }
                    else if (access == "Review/Comment/Status")
                    {
                        Body = "<tr><td style=font-size:15px><b><u>Ref. " + project + " - " + txt_doctitle.Text + "</u></b></td></tr><tr style=height:30px;><td /></tr> <tr><td><p>This is an automatically generated email to advise you that the O&M Manual noted above has been uploaded to CML web site and is available for review.</p><p>Could you please find time to review changes and if acceptable change the status of the manual on exit from the website.</p></td></tr><tr style=height:20px><td /></tr> <tr><td><p>Thank you in anticipation of co-operation.</p></td></tr>";
                    }

                }
                else
                {
                    if (access == "Review/Comment")
                    {
                        Body = "<tr><td style=font-size:15px><b><u>Ref. " + project + " - " + pageinfo.Text.Replace(">", ">>") + "</u></b></td></tr><tr style=height:30px;><td /></tr> <tr><td><p>This is an automatically generated email to advise you that the O&M Manual noted above has been uploaded to CML web site and is available for review. </p><p>Could you please find time to review the manual and make any comments using the comment screen within the next " + ReviewPeriod + " days.</p><p>If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website. </p></td></tr> <tr style=height:20px><td /></tr><tr><td><p>Thank you in anticipation of your co-operation with the review process.</p> </td></tr>";
                    }
                    else if (access == "Review/Comment/Status")
                    {
                        Body = "<tr><td style=font-size:15px><b><u>Ref. " + project + " - " + pageinfo.Text.Replace(">", ">>") + "</u></b></td></tr><tr style=height:30px;><td /></tr> <tr><td><p>This is an automatically generated email to advise you that the O&M Manual noted above has been uploaded to CML web site and is available for review. </p><p> Could you please find time to review the manual and make any comments using the comment screen within the next " + ReviewPeriod + " days. </p><p>If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website.</p> </td></tr> <tr style=height:20px><td /></tr><tr><td><p>Thank you in anticipation of co-operation.</p></td></tr>";
                    }

                }
            }

            string signature = "<tr style=height:30px;><td /></tr><tr><td><tr><td><img src='http://dms.cmltechniques.com//Assets/img/logo.jpg' /></td></tr><tr><td>CML Techniques</td></tr> ";
            Body = Body + links + signature;
            string _sub = "Ref. " + project + " - " + txt_doctitle.Text;
            string htmlclose = "</table></body></html>";
            // _objcls.Send_Email(user_id, _sub, Body);
            _objcls.Send_Email_Html(user_id, _sub, htmlopen + Body + htmlclose);


        }



        //void SendMail(string user_id, string access, string project, int type,string value)
        //{
        //    publicCls.publicCls _objcls = new publicCls.publicCls();
        //    string Body = "";
        //    string links = "<p>View  Document </p> <a href=http://demo1.cmltechniques.com//AuthLogin?" + value + "Click Here </a>";
        //    string htmlopen="<html><body>";



        //    if (chk_noreview.Checked == true)
        //    {
        //        //Body = "Ref. " + project + " - " + txt_doctitle.Text + "\n\n" + "This is an automatically generated email to advise you that the O&M Manual noted above has been uploaded to CML Techniques." + "\n\n" + "CML Techniques";
        //        Body = Body + "<p> Ref. Demo Project - 123-test </p> <br /><br/> <p >This is an automatically generated email to advise you that the O&amp;M Manual noted above has been uploaded to CML Techniques.CML Techniques  </p> <br /><br /><p>";
        //    }
        //    else
        //    {
        //        if (type == 1)
        //        {
        //            if (access == "Review/Comment")
        //            {
        //                Body = "Ref. " + project + " - " + txt_doctitle.Text + "\n\n" + "This is an automatically generated email to advise you that the O&M Manual noted above has been revised and is now available for further review." + "\n\n" + "Could you please find time to review changes made and make further comment(s) if required." + "\n\n" + "If no further comment(s) are required, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of your co-operation with the review process." + "\n\n" + "CML Techniques" ;
        //            }
        //            else if (access == "Review/Comment/Status")
        //            {
        //                Body = "Ref. " + project + " - " + txt_doctitle.Text + "\n\n" + "This is an automatically generated email to advise you that the O&M Manual noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review changes and if acceptable change the status of the manual on exit from the website." + "\n\n" + "Thank you in anticipation of co-operation." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" ;
        //            }

        //        }
        //        else
        //        {
        //            if (access == "Review/Comment")
        //            {
        //                Body = "Ref. " + project + " - " + pageinfo.Text + "\n\n" + "This is an automatically generated email to advise you that the O&M Manual noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review the manual and make any comments using the comment screen within the next " + ReviewPeriod + " days." + "\n\n" + "If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of your co-operation with the review process." + "\n\n" + "CML Techniques" ;
        //            }
        //            else if (access == "Review/Comment/Status")
        //            {
        //                Body = "Ref. " + project + " - " + pageinfo.Text + "\n\n" + "This is an automatically generated email to advise you that the O&M Manual noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review the manual and make any comments using the comment screen within the next " + ReviewPeriod + " days." + "\n\n" + "If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of co-operation." + "\n\n" + "CML Techniques" ;
        //            }

        //        }
        //    }

        //    Body=Body+links;
        //    string _sub = "Ref. " + project + " - " + txt_doctitle.Text;
        //    string htmlclose = "</body></html>";
        //   // _objcls.Send_Email(user_id, _sub, Body);
        //    _objcls.Send_Email_Html(user_id, _sub, htmlopen+ Body + htmlclose);


        //}

        protected void liststatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txt_status.Text = liststatus.SelectedItem.Text;
        }
        protected void listcontractor_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txt_contrator.Text = listcontractor.SelectedItem.Text;
        }
        protected void listrev_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txt_rev.Text = listrev.SelectedItem.Text;
        }
        protected void btnAddstyle_Click(object sender, EventArgs e)
        {

            //lbldocstylechange.Text = "true";
            //lbldocstyleId.Text = drstyle.SelectedItem.Value;

            //SetDafaultStyle(Convert.ToInt16(lbldocstyleId.Text));
            //ModalPopupExtender2.Hide();

            //UpdatePanel2.Update();

            ScriptManager.RegisterStartupScript(this, typeof(string), "news", "set_newrevision();", true);
        }

        protected void btnCancelstyle_Click(object sender, EventArgs e)
        {

            SetCurrentVersion();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SetDafaultStyle(Convert.ToInt16(lbldocstyleId.Text));

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Load_ReminderSettings();
        }

        protected void chk_noreview_CheckedChanged(object sender, EventArgs e)
        {
            chkdreview.Checked = false;
            if (chk_noreview.Checked == true)
            {
                RadDatePicker1.Clear();
                RadDatePicker2.Clear();
                RadDatePicker3.Clear();
                RadDatePicker4.Clear();

                RadDatePicker1.Enabled = false;
                RadDatePicker2.Enabled = false;
                RadDatePicker3.Enabled = false;
                RadDatePicker4.Enabled = false;
            }
            else
            {
                RadDatePicker1.Enabled = true;
                RadDatePicker2.Enabled = false;
                RadDatePicker3.Enabled = false;
                RadDatePicker4.Enabled = false;
            }
        }

        protected void chkdreview_CheckedChanged(object sender, EventArgs e)
        {

            RadDatePicker1.Enabled = true;
            chk_noreview.Checked = false;

            if (chkdreview.Checked == true)
            {
                RadDatePicker1.SelectedDate = DateTime.Now.AddDays(30);
                RadDatePicker2.SelectedDate = DateTime.Now.AddDays(10);
                RadDatePicker3.SelectedDate = DateTime.Now.AddDays(15);
                RadDatePicker4.SelectedDate = DateTime.Now.AddDays(20);



            }
            else
            {
                RadDatePicker1.Clear();
                RadDatePicker2.Clear();
                RadDatePicker3.Clear();
                RadDatePicker4.Clear();


            }
        }


    }
}