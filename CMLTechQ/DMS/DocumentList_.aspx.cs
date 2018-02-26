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
    public partial class DocumentList_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                load_document();
        }
        private void load_document()
        {

            _clstreefolder objcls = new _clstreefolder();
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            objcls.Folder_id = 2218;
            DataTable _dtresult;
            DataTable _dt = _objbll.load_documentsFolderBased(objcls, _objdb);
            var _result = _dt.Select("Folder_code=1 And Enabled=true");
            _dtresult = _result.Any() ? _result.CopyToDataTable() : _dt.Clone();
            datalist_latest.DataSource = _dtresult;
            datalist_latest.DataBind();
             _result = _dt.Select("Folder_code=1 And Enabled=false");
            _dtresult = _result.Any() ? _result.CopyToDataTable() : _dt.Clone();
            datalist_previous.DataSource = _dtresult;
            datalist_previous.DataBind();
           
        }
    }
}