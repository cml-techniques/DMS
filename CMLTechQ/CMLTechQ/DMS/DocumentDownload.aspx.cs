using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Properties;
using BusinessLogic;
using System.Data;
using Ionic.Zip;
using System.IO;

namespace CMLTechQ.DMS
{
    public partial class DocumentDownload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string _id = Request.QueryString["folder"].ToString();
                download_all(Convert.ToInt32(_id));
            }
        }
       
        private void download_all(int id)
        {
            _clstreefolder objcls = new _clstreefolder();
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            objcls.Folder_id = id;
            DataTable _dtresult;
            DataTable _dt = _objbll.load_AllDocumentsDirectFolder(objcls, _objdb);
            var _result = _dt.Select("Enabled=true");
            _dtresult = _result.Any() ? _result.CopyToDataTable() : _dt.Clone();
            using (ZipFile zip = new ZipFile())
            {
                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                zip.AddDirectoryByName("Documents");
                int _count = 0;
                foreach (DataRow item in _dtresult.Rows)
                {
                    // CheckBox chk = (CheckBox)item.FindControl("lbltick");
                    string path = Path.GetFullPath(Server.MapPath("Documents/") + item["doc_name"].ToString());
                    System.IO.FileInfo _finfo = new System.IO.FileInfo(path);
                    if (_finfo.Exists == true)
                    {
                        var _exist = zip.Any(entry => entry.FileName.Contains(item["doc_name"].ToString()));
                        if (_exist == false)
                        {
                            zip.AddFile(path, "Documents");
                            _count += 1;
                        }
                        
                    }
                }
                //UpdatePanel1.Update();
                if (_count == 0) return;
                try
                {

                    Response.Clear();
                    string zipName = String.Format("MI_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + zipName);
                    Response.ContentType = "application/zip";

                    zip.Save(Response.OutputStream);

                    Response.End();

                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
    }
}