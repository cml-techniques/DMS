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

namespace CMLTechQ.DMS
{
    public partial class ScheduleUpload : System.Web.UI.Page
    {
        static DataTable _dtschedule1;
        public static string _errorfiles = "";
        public static int _folderid = 0;
        public static string _user = "";
        public static int upload = 0;
       public static int selectfile = 0;
        public static int notupload = 0;
        public static bool uperr = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!String.IsNullOrEmpty(Request.QueryString["Auth1"]))
                {
                    lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                    lblprjid.Text = Request.QueryString["Auth2"].ToString();
                    Get_ProjectInfo();
                    lblfolder.Text = Request.QueryString["Auth3"].ToString();
                    _folderid = Convert.ToInt32(lblfolder.Text);
                    Get_User();
                    _user = lbluserid.Text;

                    Load_Schedule();
                    lblfcount.Text = _dtschedule1.Rows.Count.ToString();
                    lblpcount.Text = "0";
                    lblucount.Text = "0";
                }

            }
        }
        private void Load_Schedule()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = _folderid;
           DataTable _dtable = _objbll.LoadFolderSchedule(_objcls, _objdb);
            _dtschedule1 = _dtable;
            lvshowSchedule.DataSource = _dtable;
            lvshowSchedule.DataBind();

            



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
        private void InsertDocuments(string _file, int _size)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_name = _file;
            _objcls.doc_title = lbltitle.Text;
            _objcls.doctype_code = 0;
            _objcls.package_code = 0;
            _objcls.uploaded_date = DateTime.Now;
            _objcls.service_code = 0; ;
            _objcls.uploaded = true;
            _objcls.schid = Convert.ToInt32(lblschid.Text);
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
            _objcls.submit = true;
            _objcls.reff = lblref.Text;
            _objbll.FileUploading_New(_objcls, _objdb);
        }
        bool checkSchedule(string filename)
        {
            bool schedule = false;

            foreach (DataRow dr in _dtschedule1.Rows)
            {
                if (dr["doc_name"].ToString() == filename)
                {
                    schedule = true;
                    lblschid.Text = dr["Sch_id"].ToString();
                    lblref.Text = dr["doc_ref"].ToString();
                    lbltitle.Text = dr["doc_title"].ToString();

                }


            }
            return schedule;
        }
        protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            if (uperr) return;
            try
            {

                if ((_dtschedule1 == null)||(_dtschedule1.Rows.Count==0)) return;
                selectfile += 1;
                string _file = Server.MapPath("Documents\\123\\") + e.FileName;
               
               
                if (checkSchedule(e.FileName))
                {
                    upload += 1;
                    AjaxFileUpload1.SaveAs(_file);
                    InsertDocuments(e.FileName, e.FileSize);
                }
                uperr = false;
            }
            catch (Exception)
            {
                uperr = true;
                upload = 0;
            }

        }

        protected void AjaxFileUpload1_UploadCompleteAll(object sender, AjaxControlToolkit.AjaxFileUploadCompleteAllEventArgs e)
        {
            AjaxFileUpload1.Attributes.Clear();

        }


        protected void cmduploadall_Click(object sender, EventArgs e)
        {
          
            string value = "";

            if (uperr)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "clear", "clear();", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "msg", "alert('Upload Error Ocuured.Please Check file');", true);
                
                uperr = false;
                return;
            }

            uperr = false;

            if ((_dtschedule1 == null)||(_dtschedule1.Rows.Count==0))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "clear", "clear();", true);
                ScriptManager.RegisterStartupScript(this, typeof(string), "msg", "alert('No Schedule for upload');", true);
                
                return;

            } 


            if ((selectfile - upload) > 0)
            {
                value = (selectfile - upload).ToString() + ": Documents Pending  for Schedule";
                ScriptManager.RegisterStartupScript(this, typeof(string), "select", "alert('" + value + "');", true);

            }

            if (upload > 0)
            {
                value = upload + ": Documents Successfully Uploaded";
                ScriptManager.RegisterStartupScript(this, typeof(string), "upload", "alert('" + value + "');", true);

                //ScriptManager.RegisterStartupScript(this, typeof(string), "move", "BacktoDocument();", true);
            }



            lblfcount.Text = _dtschedule1.Rows.Count.ToString();
            lblucount.Text = upload.ToString();

            if (_dtschedule1.Rows.Count > 0)
            {
                lblpcount.Text = (_dtschedule1.Rows.Count - upload).ToString();
            }
            else lblpcount.Text = "0";

            upload = 0;
            selectfile = 0;

            Load_Schedule();   

        }

        protected void lvshowSchedule_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        string BuildWrapText(string value, int Cutlen)
        {
            int pos = 0;
            string wResult = "";
            int nextpos = Cutlen;

            for (int ins = 0; ins <= value.Length; ins++)
            {
                if (value.Length < nextpos)
                {
                    if (wResult.Length > 0) wResult = wResult + " ";
                    wResult = wResult + value.Substring(pos, (value.Length - pos));
                    return wResult;
                }

                if (ins == nextpos)
                {
                    if (wResult.Length > 0) wResult = wResult + " ";
                    wResult = wResult + value.Substring(pos, Cutlen);
                    nextpos = nextpos + Cutlen;
                    pos = ins;

                }

            }

            return wResult;
        }
        protected void lvshowSchedule_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //if (e.Item.ItemType == ListViewItemType.DataItem)
            //{
            //    Label lbltitle = (Label)e.Item.FindControl("lblschtitle");
            //    if (lbltitle != null) lbltitle.Text = BuildWrapText(lbltitle.Text, 30);
               
            //}

        }
    }
}