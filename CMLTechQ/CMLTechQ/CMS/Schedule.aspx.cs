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

namespace CMLTechQ.CMS
{
    public partial class Schedule : System.Web.UI.Page
    {
        public static DataTable _dtMaster;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string _prm=Request.QueryString.ToString();
                string _prjid = Request.QueryString["Auth2"].ToString();
                //lblsrv.Text = Request.QueryString["Auth3"].ToString();
                lblcas.Text = Request.QueryString["Auth4"].ToString();
                lblprjid.Text = _prjid;
                Get_ProjectInfo();
                //Get_User();
               // Generate_Nav();
                string _url="";
                if (lblprj.Text == "123")
                {
                    if (lblcas.Text == "2")
                        _url = "P123/Schedule_P123_2?" + _prm;
                    else if (lblcas.Text == "5")
                        _url = "P123/Schedule_P123_5?" + _prm;
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Not Available');", true);
                        return;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Not Available');", true);
                    return;
                }
                Response.Redirect(_url);
                //Load_Master();
                //Load_Details();
            }
        }
        //private void Get_User()
        //{
        //    Protection _obj = new Protection();
        //    string _prm = Request.QueryString["Auth1"].ToString();
        //    lbluserhidden.Text = _prm;
        //    string _decoded = _obj.Decoding(_prm);
        //    lbluserid.Text = _decoded;
        //}
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
        //            _menuItem = "<li class='current' ><a class='current' href='#' onclick='GetNav(" + _drow["PRJ_SER_ID"].ToString() + ");' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
        //        else
        //            _menuItem = "<li><a href='#' onclick='GetNav(" + _drow["PRJ_SER_ID"].ToString() + ");' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
        //        _item = _item + _menuItem;
        //        _idx += 1;
        //    }
        //    string _content = _head + _item + _foot;
        //    LiteralControl _lt = new LiteralControl();
        //    _lt.Text = _content;
        //    PlaceHolder1.Controls.Add(_lt);
        //}
        
    }
}