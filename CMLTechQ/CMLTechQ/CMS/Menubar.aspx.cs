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

namespace CMLTechQ.CMS
{
    public partial class Menubar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string _prjid = Request.QueryString["Auth2"].ToString();
                lblprjid.Text = _prjid;
                Get_ProjectInfo();
                Get_User();
                Generate_Menu();
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
        private void Generate_Menu()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsuser _objcls = new _clsuser();
            _objdb.DBName = "DBCML";
            _objcls.uid = lbluserid.Text;
            _objcls.project_code = lblprj.Text;
            string _permission = _objbll.Get_User_Permission(_objcls, _objdb);
            _objdb.DBName = "DB_" + lblprj.Text;
            DataTable _dtmodule = _objbll.Load_Prj_Main_Module(_objdb);
            string _head = "<ul class='recent_works1' id='recent_works1' style='background-color:#cccccc' >";
            string _foot = "</ul>";
            string _item = "";
            int _idx=0;
            foreach (DataRow _drow in _dtmodule.Rows)
            {
                string _menuItem = "";
                if (_idx == 0)
                    _menuItem = "<li class='current' ><a class='current' href='#'>" + _drow["MODULE"].ToString() + "</a></li>";
                else
                    _menuItem = "<li><a href='#'>" + _drow["MODULE"].ToString() + "</a></li>";
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