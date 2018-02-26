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
using System.Web.UI.HtmlControls;
namespace CMLTechQ.AMS

{
    public partial class AssetRegister : System.Web.UI.Page
    {
        public static DataTable _dtmaster;
        public static DataTable _dtfilter;
        private void Load_Master()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            _dtmaster = _objbll.Load_Asset_Register(_objdb);
            _dtfilter = _dtmaster;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();
                Get_User();
                Get_ProjectInfo();
                Load_Master();
                Load_Initial_Data();
            }
        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Auth1"].ToString();
            // string _prm = "am9zZS5qb3NlcGhAY21sZ3JvdXAuYWU=";
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
        private void Load_Initial_Data()
        {
            DataView view = new DataView(_dtfilter);
            DataTable distinctValues = new DataTable();
            distinctValues = view.ToTable(true, "SER_ID", "ASSET");
            rptmmain.DataSource = distinctValues;
            rptmmain.DataBind();

        }
        protected void rptdetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _regid = (Label)e.Item.FindControl("lblasset");
                string _clause="AMS_REG_ID =" + _regid.Text;
                var _result = _dtfilter.Select(_clause);
                DataTable _dtresult = _result.Any() ? _result.CopyToDataTable() : _dtfilter.Clone();
                Repeater _rptinner1 = (Repeater)e.Item.FindControl("rptinner1");
                _rptinner1.DataSource = _dtresult;
                _rptinner1.DataBind();
                string _clause1 = "PARENT_ASSET =" + _regid.Text;
                var _result1 = _dtfilter.Select(_clause1);
                DataTable _dtresult1 = _result1.Any() ? _result.CopyToDataTable() : _dtfilter.Clone();
                Repeater _rptinner2 = (Repeater)e.Item.FindControl("rptinner2");
                _rptinner2.DataSource = _dtresult1;
                _rptinner2.DataBind();
            }
        }
        protected void rptinner1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _haschild = (Label)e.Item.FindControl("lblhaschild");
                HtmlAnchor _link = (HtmlAnchor)e.Item.FindControl("expbtn");
                if (_haschild.Text == "True")
                    _link.Visible = true;
                else
                    _link.Visible = false;
            }
        }
        protected void rptmmain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _srvid = (Label)e.Item.FindControl("lblsrv");
                var _result = _dtfilter.Select("SER_ID =" + Convert.ToInt32(_srvid.Text) + " AND PARENT_ASSET = 0");
                DataTable _dtresult = _result.Any() ? _result.CopyToDataTable() : _dtfilter.Clone();
                Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails");
                _rptdetails.DataSource = _dtresult;
                _rptdetails.DataBind();
            }
        }
        protected void btnnav_Click(object sender, EventArgs e)
        {
            string _id = htype.Value;
            if (_id != "0")
            {
                string _clause = "SER_ID =" + _id;
                var _result = _dtmaster.Select(_clause);
                _dtfilter = _result.Any() ? _result.CopyToDataTable() : _dtmaster.Clone();
            }
            else
                _dtfilter = _dtmaster;
            Load_Initial_Data();
        }
    }
}