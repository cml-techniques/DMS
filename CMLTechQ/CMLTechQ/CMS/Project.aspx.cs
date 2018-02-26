using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;

namespace CMLTechQ.CMS
{
    public partial class Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string _auth = Request.QueryString.ToString();
                string _prjid = Request.QueryString["Auth2"].ToString();
                string _prjcode = Get_ProjectInfo(_prjid);
                string _SRV = GetDefaultSRV(_prjcode);
                string _CAS = GetDefaultCAS(_prjcode);
                head.Attributes.Add("src", "Head?" + _auth);
                menubar.Attributes.Add("src", "Menubar?" + _auth);
                navbar.Attributes.Add("src", "Navbar?" + _auth + "&Auth3=" + _SRV);
                innernav.Attributes.Add("src", "InnerNav?" + _auth );
                content.Attributes.Add("src", "P123/Schedule_P123_2?" + _auth + "&Auth3=" + _SRV + "&Auth4=" + _CAS);
            }
        }
        private string Get_ProjectInfo(string _id)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(_id);
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            return _dt.Rows[0].ItemArray[0].ToString();
        }
        private string GetDefaultSRV(string _prj)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + _prj;
            return _objbll.Get_DefaultService(_objdb).ToString();
        }
        private string GetDefaultCAS(string _prj)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + _prj;
            return _objbll.Get_DefaultCassheet(_objdb).ToString();
        }
    }
}