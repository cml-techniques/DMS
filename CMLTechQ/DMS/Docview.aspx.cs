using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;
namespace CMLTechQ.DMS
{
    public partial class Docview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbldocId.Text = Request.QueryString["ID"].ToString();
            //string _source = Request.QueryString["SOURCE"].ToString();
            //string _file = Request.QueryString["FILE"].ToString();
            //fileinfo.Text = _file;
            string _path = "";
            //_path = "https://dms.cmltechniques.com/DMS/Documents/" + _file;

            //if (_source == "1")//MI,TD,RD
            //{
            //    _path = "https://dms.cmltechniques.com/DMS/Documents/" + _file;
            //}
            //else if (_source == "2")//DOCUMENT LIBRARY
            //{
            //    _path = "https://dms.cmltechniques.com/DMS/DMSLibrary/" + _file;
            //}

            string _docname = "";
            _docname = Get_DocumentFileName();

            fileinfo.Text = _docname;
            _path = "https://dms.cmltechniques.com/DMS/Documents/" + _docname;

            documentviewer.Attributes.Add("src", _path);
        }
        private string Get_DocumentFileName()
        {
            string DocumentFileName = "";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocId.Text);
            DataTable dt = _objbll.Get_LibraryFileName(_objcls, _objdb);
            if (dt.Rows.Count > 0) DocumentFileName = dt.Rows[0][0].ToString();
            return DocumentFileName;
        }
        private void Get_Title()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = Convert.ToInt32(lbldocId.Text);
            fileinfo.Text = _objbll.Get_DocumentTitle(_objcls, _objdb);
        }
    }
}