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

namespace CMLTechQ.DMS
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
            // string _permission = _objbll.Get_User_Permission(_objcls, _objdb);

            DataTable _dtservice = _objbll.loadserviceDMS(_objcls, _objdb);
            string _head = "<ul class='recent_works1' id='recent_works1' style='background-color:#ffffff' >";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;
            int _pos = 0;


            if (Convert.ToInt16(Request.QueryString["Auth3"].ToString()) > 0)
            {
                DataRow[] dr = _dtservice.Select("Folder_id=" + Request.QueryString["Auth3"].ToString());
                _pos = Convert.ToInt16(dr[0]["Folder_possition"]) - 1;

            }
            else _pos = 0;


            foreach (DataRow _drow in _dtservice.Rows)
            {
                string _menuItem = "";
                string _folder = _drow["folder_description"].ToString();
                if (_drow["Type"].ToString() != "11" && _drow["Type"].ToString() != "12")
                {
                    if (_folder.Length > 20)
                        _folder = _folder.Substring(0, 20) + "...";
                    if (_idx == _pos)
                        _menuItem = "<li class='current' ><a class='current' href='#' onclick=GetMenu(" + _drow["folder_id"].ToString() + "," + _drow["folder_type"].ToString() + "," + _drow["DefaultNav"].ToString() + "," + _drow["DefaultInner"].ToString() + "," + _drow["Ftype"].ToString() + "); title=" + _drow["folder_description"].ToString().Replace(" ", "&nbsp;") + ">" + _folder + "</a></li>";
                    else
                        _menuItem = "<li><a href='#' onclick=GetMenu(" + _drow["folder_id"].ToString() + "," + _drow["folder_type"].ToString() + "," + _drow["DefaultNav"].ToString() + "," + _drow["DefaultInner"].ToString() + "," + _drow["Ftype"].ToString() + "); title=" + _drow["folder_description"].ToString().Replace(" ", "&nbsp;") + ">" + _folder + "</a></li>";
                    _item = _item + _menuItem;
                    _idx += 1;
                }
            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            PlaceHolder1.Controls.Add(_lt);
        }
    }
}