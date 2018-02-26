using PassProtection;
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
    public partial class Navbar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblid.Text = Request.QueryString["Auth3"].ToString();
                Get_User();
                Get_ProjectInfo();
                Generate_Nav();
            }
        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Auth1"].ToString();
            lbluserhidden.Text = _prm;
            string _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
        }
        private void Get_ProjectInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(lblprjid.Text);
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
        }
        private void Generate_Nav()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            _clsFolderTree _objcls = new _clsFolderTree();
            _objcls.Parent_folder = Convert.ToInt32(lblid.Text);
            DataTable _dtcas = _objbll.Load_SubFolder(_objcls,_objdb);
            string _head = "<ul class='nav'>";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;
            string _listid = "";
            foreach (DataRow _drow in _dtcas.Rows)
            {
                string _menuItem = "";
                if (_idx == 0)
                    _menuItem = "<li class='item current' ><a class='current' href='#' onclick='GetNav(" + _drow["PRJ_CAS_ID"].ToString() + ");' >" + _drow["PRJ_CAS_NAME"].ToString() + "</a><i class='icon-chevron-right pull-right icon'></i></li>";
                else
                    _menuItem = "<li class='item' ><a href='#' onclick='GetNav(" + _drow["PRJ_CAS_ID"].ToString() + ");' >" + _drow["PRJ_CAS_NAME"].ToString() + "</a><i class='icon-chevron-right pull-right icon'></i></li>";
                _item = _item + _menuItem;
                _idx += 1;
            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            PlaceHolder1.Controls.Add(_lt);
        }
    }
}