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

namespace CMLTechQ.CMS.P123
{
    public partial class Schedule_P123_5 : System.Web.UI.Page
    {
        public static DataTable _dtMaster;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string _prjid = Request.QueryString["Auth2"].ToString();
                lblsrv.Text = Request.QueryString["Auth3"].ToString();
                lblcas.Text = Request.QueryString["Auth4"].ToString();
                lblprjid.Text = _prjid;
                Get_ProjectInfo();
                Get_User();
                Generate_Nav();
                Load_Master();
                Load_Details();
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
            _clsuser _objcls = new _clsuser();
            //_objdb.DBName = "DBCML";
            //_objcls.uid = lbluserid.Text;
            //_objcls.project_code = lblprj.Text;
            //string _permission = _objbll.Get_User_Permission(_objcls, _objdb);
            _objdb.DBName = "DB_" + lblprj.Text;
            DataTable _dtmodule = _objbll.Load_Prj_Service(_objdb);
            string _head = "<ul class='recent_works1' id='recent_works1'>";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;
            foreach (DataRow _drow in _dtmodule.Rows)
            {
                string _menuItem = "";
                if (_idx == 0)
                    _menuItem = "<li class='current' ><a class='current' href='#' onclick='GetNav(" + _drow["PRJ_SER_ID"].ToString() + ");' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
                else
                    _menuItem = "<li><a href='#' onclick='GetNav(" + _drow["PRJ_SER_ID"].ToString() + ");' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
                _item = _item + _menuItem;
                _idx += 1;
            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            PlaceHolder1.Controls.Add(_lt);
        }
        private void Load_Master()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            _clscassheet _objcas = new _clscassheet();
            _objcas.sch = Convert.ToInt32(lblcas.Text);
            _objcas.prj_code = lblprj.Text;
            _dtMaster = _objbll.Load_casMain_Edit(_objcas, _objdb);
        }
        private void Load_Details()
        {
            DataTable _dtable = new DataTable();
            _dtable.Columns.Add("sys_id", typeof(string));
            _dtable.Columns.Add("sys_name", typeof(string));
            var distinctRows = (from DataRow dRow in _dtMaster.Rows
                                select new { col1 = dRow["Sys_Id"], col2 = dRow["Sys_name"] }).Distinct();
            foreach (var row in distinctRows)
            {
                DataRow _row = _dtable.NewRow();
                _row[0] = row.col1.ToString();
                _row[1] = row.col2.ToString();
                _dtable.Rows.Add(_row);
            }
            //PagedDataSource _objdata = new PagedDataSource();
            //_objdata.DataSource = _dt.DefaultView;
            //_objdata.AllowPaging = true;
            //_objdata.PageSize = 20;
            //_objdata.CurrentPageIndex = GetCurrentPageNumber;
            //if (_objdata.PageCount > 0)
            //{
            //    rptmember.DataSource = _objdata;
            //    rptmember.DataBind();
            //}
            rptmmain.DataSource = _dtable;
            rptmmain.DataBind();
        }
        protected void rptmmain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    Label _sys_id = (Label)e.Row.FindControl("lbSys_Id");
            //    DataTable _dtdetails = new DataTable();
            //    var _details = from _data in _dtresult.AsEnumerable()
            //                   where _data.Field<int>("Sys_Id") == Convert.ToInt32(_sys_id.Text)
            //                   select _data;
            //    _dtdetails = _details.Any() ? _details.CopyToDataTable() : _dtMaster.Clone();
            //    GridView _mydetails = (GridView)e.Row.FindControl("mydetails");
            //    _mydetails.DataSource = _dtdetails;
            //    _mydetails.DataBind();
            //}
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _sys_id = (Label)e.Item.FindControl("lblsys");
                DataTable _dtdetails = new DataTable();
                var _details = from _data in _dtMaster.AsEnumerable()
                               where _data.Field<int>("Sys_Id") == Convert.ToInt32(_sys_id.Text)
                               select _data;
                _dtdetails = _details.Any() ? _details.CopyToDataTable() : _dtMaster.Clone();
                Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails");
                _rptdetails.DataSource = _dtdetails;
                _rptdetails.DataBind();
            }
        }
    }
}