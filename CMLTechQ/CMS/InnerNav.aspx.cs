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
    public partial class InnerNav : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                //lblfolder.Text = Request.QueryString["Auth3"].ToString();
                //lbldocFolder.Text = Request.QueryString["Auth5"].ToString();
                GnerateInnerNav();
                //Get_User();
            }
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
        //private void Generate_Nav()
        //{
        //    BLL_Dml _objbll = new BLL_Dml();
        //    _database _objdb = new _database();
        //    _clsuser _objcls = new _clsuser();
        //    //_objdb.DBName = "DBCML";
        //    //_objcls.uid = lbluserid.Text;
        //    //_objcls.project_code = lblprj.Text;
        //    //string _permission = _objbll.Get_User_Permission(_objcls, _objdb);
        //    _objdb.DBName = "DB_" + lblprj.Text;
        //    DataTable _dtmodule = _objbll.Load_Prj_Service(_objdb);
        //    string _head = "<ul class='recent_works1' id='recent_works1'>";
        //    string _foot = "</ul>";
        //    string _item = "";
        //    int _idx = 0;
        //    foreach (DataRow _drow in _dtmodule.Rows)
        //    {
        //        string _menuItem = "";
        //        if (_idx == 0)
        //            _menuItem = "<li class='current' ><a class='current' href='#' onclick='PageNavaigation(" + _drow["PRJ_SER_ID"].ToString() + ",0);' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
        //        else
        //            _menuItem = "<li><a href='#' onclick='PageNavaigation(" + _drow["PRJ_SER_ID"].ToString() + ",0);' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
        //        _item = _item + _menuItem;
        //        _idx += 1;
        //    }
        //    string _content = _head + _item + _foot;
        //    LiteralControl _lt = new LiteralControl();
        //    _lt.Text = _content;
        //    PlaceHolder1.Controls.Add(_lt);
        //}
        private void GnerateInnerNav()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            DataTable _dtmodule = _objbll.Load_Prj_DefaultService(_objdb);
            string _head = "<ul class='nav'>";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;

            foreach (DataRow _drow in _dtmodule.Rows)
            {
                string _menuItem = "";
                // if (_idx == 0)
                if (_idx == 0)
                {
                    _menuItem = "<li class='item current' ><a class='current' href='#' onclick='PageNavaigation(" + _drow["PRJ_SER_ID"].ToString() + "," + _drow["PRJ_CAS_ID"].ToString() + ");' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
                }
                else
                    _menuItem = "<li class='item' ><a href='#' onclick='PageNavaigation(" + _drow["PRJ_SER_ID"].ToString() + "," + _drow["PRJ_CAS_ID"].ToString() + ");' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
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