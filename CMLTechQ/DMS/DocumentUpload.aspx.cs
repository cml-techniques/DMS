using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;
using PassProtection;
using System.IO;

namespace CMLTechQ.DMS
{
    public partial class DocumentUpload : System.Web.UI.Page
    {
        public static DataTable _dtschedule;
        public static string _errorfiles = "";
        public static int _folderid = 0;
        public static string _user ="";
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
                    Load_ScheduleList(Convert.ToInt32(lblfolder.Text), lblprj.Text);
                   /// Load_Document_Submit();
                    //cmdupload.Visible = false;
                }
            }
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
        private void Load_ScheduleList(int folder_id, string project)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.project_code = project;
            _objcls.folder_id = folder_id;
            _dtschedule = _objbll.Load_ScheduleList(_objcls, _objdb);
        }
        protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            string _file = Server.MapPath("Documents\\") + e.FileName;
            //if (Validate_File(e.FileName) == false)
            //{
            //    notupload += 1;
            //    return;
            //}
            upload += 1;
            AjaxFileUpload1.SaveAs(_file);
            InsertDocuments(e.FileName,e.FileSize);
        }
        private void InsertDocuments(string _file,int _size)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_name = _file;
            _objcls.doc_title = "Sample Manufacturer";
            _objcls.doctype_code = 0;
            _objcls.package_code = 0;
            _objcls.uploaded_date = DateTime.Now;
            _objcls.service_code = 0; ;
            _objcls.uploaded = true;
            _objcls.schid = 0;
            _objcls.folder_id = _folderid;
            decimal _size_in_mb = decimal.Round((_size / 1024m) / 1024m, 2);
            _objcls.file_size = _size_in_mb.ToString() + "MB";
            _objcls.uid = _user;
            _objcls.type = "";
            _objcls.possition = 1;
            _objcls.status = "REVIEW";
            _objcls.Manual_title = _file.Substring(0, _file.LastIndexOf("."));
            _objcls.Review = true;
            _objcls.DisplayVersion = "";
            _objcls.DocStyleId = 0;
            _objcls.DocStyleChange = false;
            _objcls.submit = false;
            _objbll.FileUploading_New(_objcls, _objdb);
        }

        protected void tbclose_Click(object sender, EventArgs e)
        {
        }
        private bool Validate_File(string _fname)
        {
            var _List = from o in _dtschedule.AsEnumerable()
                        where o.Field<string>(3) == _fname
                        select o;
            foreach (var row in _List)
            {
                //if (_fname == row[3].ToString())
                //{
                FileInfo _finfo = new FileInfo(Server.MapPath("Documents" + "\\123\\" + _fname));
                if (_finfo.Exists == true) _finfo.Delete();
                //lblpos.Text = row["possition"].ToString();
                return true;
                //}
            }
           // lblpos.Text = "0";
            _errorfiles = _errorfiles + _fname;
            return false;
        }
        protected void AjaxFileUpload1_UploadCompleteAll(object sender, AjaxControlToolkit.AjaxFileUploadCompleteAllEventArgs e)
        {
        }

        protected void cmdupload_Click(object sender, EventArgs e)
        {
            if (upload_doc.Items.Count <= 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('No Document Uploaded');", true);
                return;
            }
            Save_Documents();
            ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Document Saved & Available for review');", true);
            Load_Document_Submit();
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
        protected void btnreload_Click(object sender, EventArgs e)
        {
            //btndummy3_ModalPopupExtender.Hide();
            //lblfileinfo.Text = upload.ToString() + " File(s) Uploaded and " + notupload.ToString() + " File(s) Not Uploaded";
            Load_Document_Submit();
            
        }
        private void Load_Document_Submit()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.uid = lbluserid.Text;
            upload_doc.DataSource = _objbll.Load_Document_Submit(_objcls, _objdb);
            upload_doc.DataBind();
            if (upload_doc.Items.Count > 0)
                upload_doc.Visible = true;
        }

        protected void upload_doc_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            upload_doc.EditIndex = -1;
            Load_Document_Submit();
        }

        protected void upload_doc_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            upload_doc.EditIndex = e.NewEditIndex;
            Load_Document_Submit();
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

        protected void upload_doc_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            upload_doc.EditIndex = -1;
            Load_Document_Submit();
        }

        protected void upload_doc_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            upload_doc.EditIndex = -1;
            Load_Document_Submit();
        }

       
    }
}
