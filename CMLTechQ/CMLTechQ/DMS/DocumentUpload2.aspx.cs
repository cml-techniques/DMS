using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using PassProtection;
using System.IO;
using Telerik.Web.UI;
using System.Data;
namespace CMLTechQ.DMS
{
    public partial class DocumentUpload2 : System.Web.UI.Page
    {
        public static DataTable _dtschedule;
        public static string _errorfiles = "";
        public static int _folderid = 0;
        public static string _user = "";
        public static int upload = 0;
        public static int notupload = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["Auth1"]))
                {

                    lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                    lblprjid.Text = Request.QueryString["Auth2"].ToString();
                    Get_ProjectInfo();
                    lblfolder.Text = Request.QueryString["Auth3"].ToString();
                    _folderid = Convert.ToInt32(lblfolder.Text);
                    loadPageprojectinfo();
                    Get_User();
                    _user = lbluserid.Text;
                    lbltype.Text = Request.QueryString["Auth4"].ToString();
                    Load_Schedule();

                    if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
                    {
                        hmenufolder.Value = Request.QueryString["Auth5"].ToString();

                    }


                    GenerateInnerNav_Doc(Convert.ToInt32 (lbltype.Text));

                }
            }
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
        private void Load_Schedule()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = _folderid;
            DataTable _dtable = _objbll.LoadFolderSchedule(_objcls, _objdb);
            lvshowSchedule.DataSource = _dtable;
            lvshowSchedule.DataBind();
        }
        private void loadPageprojectinfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(lblfolder.Text);
            pageinfo.Text = _objbll.Get_folderProjectdescription1(_objcls, _objdb).Rows[0][0].ToString() + " / Uploading";
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
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Auth1"].ToString();
            lbluseridhidden.Text = _prm;
            string _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
        }

        private void InsertDocuments(string _file, long _size)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_name = _file;
            _objcls.doc_title = "No";
            _objcls.doctype_code = 0;
            _objcls.package_code = 0;
            _objcls.uploaded_date = DateTime.Now;
            _objcls.service_code = 0; ;
            _objcls.uploaded = true;
            _objcls.schid = Convert.ToInt32(lblschid.Text);
            _objcls.folder_id = _folderid;
            decimal _size_in_mb = decimal.Round((_size / 1024m) / 1024m, 2);
            _objcls.file_size = _size_in_mb.ToString() + " MB";
            _objcls.uid = _user;
            _objcls.type = lbltype.Text;
            _objcls.possition = 1;
            _objcls.status = "REVIEW";
            _objcls.Manual_title = _file.Substring(0, _file.LastIndexOf("."));
            _objcls.Review = true;
            _objcls.DisplayVersion = "";
            _objcls.DocStyleId = 0;
            _objcls.DocStyleChange = false;
            _objcls.submit = true;
            _objcls.reff = "No";
            _objbll.FileUploading_New(_objcls, _objdb);
        }

        private void Save_Documents()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lblfolder.Text);
            _objcls.doc_title = "";
            _objcls.uid = lbluserid.Text;
            _objcls.action = 3;
            _objbll.Update_Document_Submit(_objcls, _objdb);
        }

        protected void upload_doc_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                Label _id = (Label)e.Item.FindControl("doc_idLabel");
                TextBox _title = (TextBox)e.Item.FindControl("txttitle");
                BLL_Dml _objbll = new BLL_Dml();
                _database _objdb = new _database();
                _objdb.DBName = "dbCML";
                _clsdocument _objcls = new _clsdocument();
                _objcls.doc_id = Convert.ToInt32(_id.Text);
                _objcls.doc_title = _title.Text;
                _objcls.uid = lbluserid.Text;
                _objcls.action = 1;
                _objbll.Update_Document_Submit(_objcls, _objdb);
            }
            else if (e.CommandName == "Delete")
            {
                Label _id = (Label)e.Item.FindControl("doc_idLabel");
                BLL_Dml _objbll = new BLL_Dml();
                _database _objdb = new _database();
                _objdb.DBName = "dbCML";
                _clsdocument _objcls = new _clsdocument();
                _objcls.doc_id = Convert.ToInt32(_id.Text);
                _objcls.doc_title = "";
                _objcls.uid = lbluserid.Text;
                _objcls.action = 2;
                _objbll.Update_Document_Submit(_objcls, _objdb);
            }
        }

        protected void btnupload_doc_Click(object sender, EventArgs e)
        {
            if (RadAsyncUpload1.UploadedFiles.Count <= 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Select Document');", true);
                return;
            }
            System.Threading.Thread.Sleep(2000);
            string filepath = Server.MapPath("Documents");
            string _filename = "";
            foreach (UploadedFile _fi in RadAsyncUpload1.UploadedFiles)
            {
                _filename = filepath + "\\" + _fi.GetName();
                _fi.SaveAs(filepath + "\\" + _fi.GetName(), true);
                InsertDocuments(_fi.GetName(), _fi.ContentLength);
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "clearUpload", String.Format("$find('{0}').deleteAllFileInputs()", RadAsyncUpload1.ClientID), true);
            BacktoPrevious();
        }

        protected void btnupload_sch_Click(object sender, EventArgs e)
        {
            if (RadAsyncUpload2.UploadedFiles.Count <= 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Select Document');", true);
                return;
            }
            System.Threading.Thread.Sleep(2000);
            string filepath = Server.MapPath("Documents");
            string _filename = "";
            DataTable _dtnotupload = new DataTable();
            _dtnotupload.Columns.Add("FileName", typeof(string));
            foreach (UploadedFile _fi in RadAsyncUpload2.UploadedFiles)
            {

                if (Check_ScheduleFile(_fi.GetName()) == true)
                {
                    _filename = filepath + "\\" + _fi.GetName();
                    _fi.SaveAs(filepath + "\\" + _fi.GetName(), true);
                    InsertDocuments(_fi.GetName(), _fi.ContentLength);
                }
                else
                {
                    DataRow _drow = _dtnotupload.NewRow();
                    _drow["FileName"] = _fi.GetName();
                    _dtnotupload.Rows.Add(_drow);
                }
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "clearUpload", String.Format("$find('{0}').deleteAllFileInputs()", RadAsyncUpload2.ClientID), true);
            if (_dtnotupload.Rows.Count > 0)
            {
                error_list.DataSource = _dtnotupload;
                error_list.DataBind();
                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else
            {
                BacktoPrevious();
            }

        }
        private bool Check_ScheduleFile(string _file)
        {
            foreach (ListViewDataItem _itm in lvshowSchedule.Items)
            {
                Label _docname = (Label)_itm.FindControl("lblschdocname");
                Label _docid = (Label)_itm.FindControl("sch_idLabel");
                if (string.Compare(_docname.Text, _file) == 0)
                {
                    lblschid.Text = _docid.Text;
                    return true;
                }
            }
            return false;
        }

        protected void btnno_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }
        private void BacktoPrevious()
        {
            string _path = "";
            if (lbltype.Text == "2")
            {
                _path = "NavWebForm2?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbltype.Text;
            }
            else if (lbltype.Text == "3")
            {
                _path = "NavWebForm3?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbltype.Text;
            }
            else if (lbltype.Text == "4")
            {
                _path = "NavWebForm4?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbltype.Text;
            }
            Response.Redirect(_path+"&Auth5="+hmenufolder.Value);
        }
    }
}