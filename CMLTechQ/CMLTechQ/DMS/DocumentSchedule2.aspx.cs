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
using System.Data.OleDb;
using PassProtection;
using Telerik.Web.UI;

namespace CMLTechQ.DMS
{
    public partial class DocumentSchedule2 : System.Web.UI.Page
    {
        public static int _folderid = 0;
        public static string _prj = "";
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
                    _prj = lblprj.Text;
                    Get_User();
                    Load_Basket();
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
            pageinfo.Text = _objbll.Get_folderProjectdescription1(_objcls, _objdb).Rows[0][0].ToString() + " / Scheduling";
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
        protected void cmdupload_Click(object sender, EventArgs e)
        {
            Upload();
        }
        private void Upload()
        {
            HttpPostedFile _file = Request.Files["myupload"];
            //HttpPostedFile _file1 = myupload.PostedFile;
            string fileNameApplication = System.IO.Path.GetFileName(_file.FileName);
            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + fileNameApplication + "');", true);
            string fileExtensionApplication = System.IO.Path.GetExtension(fileNameApplication);


            //string newFile = Guid.NewGuid().ToString() + fileExtensionApplication;
            string newFile = "OM_" + lblfolder.Text + Guid.NewGuid().ToString() + fileExtensionApplication;
            // getting a valid server path to save
            string filePath = System.IO.Path.Combine(Server.MapPath("Schedules") + "\\" + lblprj.Text, newFile);
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            if (Directory.Exists(Server.MapPath("Schedules") + "\\" + lblprj.Text) == false)
                Directory.CreateDirectory(Server.MapPath("Schedules") + "\\" + lblprj.Text);
            if (fileNameApplication != String.Empty)
            {
                _file.SaveAs(filePath);
                Insert_to_DB(filePath);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Browse Schedule File');", true);
            }
        }

        private DataSet Read_File(string _file)
        {
            DataSet ds = new DataSet();
            FileInfo _info = new FileInfo(_file);
            if (_info.Exists == false) return ds;
            string filelocation = _info.FullName;
            OleDbCommand excelCommand = new OleDbCommand(); OleDbDataAdapter excelDataAdapter = new OleDbDataAdapter();
            string excelConnStr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + filelocation + "; Extended Properties ='Excel 8.0;HDR=Yes;IMEX=1'";
            OleDbConnection excelConn = new OleDbConnection(excelConnStr);
            excelConn.Open();
            DataTable dtPatterns = new DataTable(); excelCommand = new OleDbCommand("SELECT `REF` as REF, `TITLE` as TITLE,`FILENAME` as FILENAME FROM [RD$]", excelConn);
            excelDataAdapter.SelectCommand = excelCommand;
            excelDataAdapter.Fill(dtPatterns);
            dtPatterns.TableName = "RD";
            ds.Tables.Add(dtPatterns);
            return ds;

        }
        private void Insert_to_DB(string _file)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.project_code = lblprj.Text;
            DataSet _dset = Read_File(_file);
            _objcls.service_code = 0;
            _objcls.doctype_code = 0;
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.package_code = 0;
            _objcls.uploaded_date = DateTime.Now;
            _objcls.uid = lbluserid.Text;
            int _idx = _objbll.get_schedule_possition(_objcls, _objdb) + 1;
            foreach (DataRow row in _dset.Tables[0].Rows)
            {
                _objcls.party_name = row["TITLE"].ToString();
                _objcls.doc_name = row["FILENAME"].ToString();
                _objcls.doc_title = row["TITLE"].ToString();
                _objcls.possition = _idx;
                _objcls.reff = row["REF"].ToString();
                _objbll.CreateDocSchedule(_objcls, _objdb);
                _idx += 1;
            }

        }
        private bool Check_Exist(RadDropDownList _drop, string _item)
        {
            foreach (DropDownListItem _lst in _drop.Items)
            {
                if (string.Compare(_lst.Text, _item) == 0) return true;
            }
            return false;
        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            if (NullValidation() == true) return;
            AddToBasket();
            Reset();
            Load_Basket();

        }
        private void Load_Basket()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.uid = lbluserid.Text;
            doc_list.DataSource = _objbll.Load_ScheduleBasket(_objcls, _objdb);
            doc_list.DataBind();
        }
        private void AddToBasket()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.schid = 0;
            _objcls.project_code = lblprj.Text;
            _objcls.uid = lbluserid.Text;
            _objcls.doc_title = txttitle.Text;
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            string ext = System.IO.Path.GetExtension(txtfilename.Text);
            string filename = txtfilename.Text;
            if (ext == "") filename = txtfilename.Text + "." + drop_type.SelectedValue.ToString();
            _objcls.doc_name = filename;
            _objcls.party_id = 0;
            _objcls.party_name = txttitle.Text;
            _objcls.reff = txt_ref.Text;
            _objcls.action = 1;
            _objbll.dml_schedule_basket(_objcls, _objdb);
        }
        private bool NullValidation()
        {
            if (txttitle.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Enter Document Title');", true);
                return true;
            }

            else if (txtfilename.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Enter File Name');", true);
                return true;
            }
            return false;
        }
        private void Reset()
        {
            txtfilename.Text = "";
            txttitle.Text = "";
            //drparty.ClearSelection();
            //drparty.Items.FindByValue("0").Selected = true;
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (doc_list.Items.Count <= 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('No Schedule Exists!');", true);
                return;
            }
            Create_Schedule();
            RadWindowManager1.RadConfirm("Schedule File has been Uloaded", "", 200, 100, null, "Confirmation");
            Response.Redirect("DocumentList2?" + Request.QueryString.ToString());
            Load_Basket();
        }
        private void Create_Schedule()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.uid = lbluserid.Text;
            _objbll.Create_Schedulebskt(_objcls, _objdb);
        }
        protected void doc_list_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                Label _id = (Label)e.Item.FindControl("doc_idLabel");
                Delete_Schedule(Convert.ToInt32(_id.Text));
            }

        }
        private void Delete_Schedule(int id)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.schid = id;
            _objcls.project_code = "";
            _objcls.uid = "";
            _objcls.doc_title = "";
            _objcls.folder_id = 0;
            _objcls.doc_name = "";
            _objcls.party_id = 0;
            _objcls.party_name = "";
            _objcls.reff = "";
            _objcls.action = 3;
            _objbll.dml_schedule_basket(_objcls, _objdb);
        }
        protected void doc_list_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            doc_list.EditIndex = -1;
            Load_Basket();
        }
        protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            //string _file = Server.MapPath("Schedules") + "\\" + lblprj.Text + "\\" + e.FileName;
            //AjaxFileUpload1.SaveAs(_file);
            //Insert_to_DB(_file);
        }
        //protected void AjaxFileUpload1_UploadCompleteAll(object sender, AjaxControlToolkit.AjaxFileUploadCompleteAllEventArgs e)
        //{
        //}
         private void BacktoPrevious()
        {
            string _path="DocumentList2?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=0";
            Response.Redirect(_path);
        }
        protected void btnupload_schedule_Click(object sender, EventArgs e)
        {
            if (RadAsyncUpload1.UploadedFiles.Count <= 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Select Schedule File');", true);
                return;
            }
            System.Threading.Thread.Sleep(2000);
            string filepath = Server.MapPath("Schedules") + "\\" + lblprj.Text;
            string _filename = "";
            foreach (UploadedFile _fi in RadAsyncUpload1.UploadedFiles)
            {
                _filename = filepath + "\\" + _fi.GetName();
                _fi.SaveAs(filepath + "\\" + _fi.GetName(), true);
                Insert_to_DB(_filename);
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "clearUpload", String.Format("$find('{0}').deleteAllFileInputs()", RadAsyncUpload1.ClientID), true);

                 BacktoPrevious();
        }
        }
    }