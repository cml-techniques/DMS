using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using PassProtection;
using System.Data;

namespace CMLTechQ.DMS
{
    public partial class DMS_Library : System.Web.UI.Page
    {
        public static DataTable _dtmaster;
        public static DataTable _dtresult;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                Get_User();
                Load_Library_Main();
                Session["manf"] = "All";
                Session["type"] = "All";
                Session["model"] = "All";
                Load_Library();
            }
        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = lbluseridhidden.Text;
            //string _prm = "";
            //lbluserhidden.Text = _prm;
            string _decoded = "";
            if (_prm.IndexOf("?wmode") > 0)
                _decoded = _obj.Decoding(_prm.Substring(0, _prm.IndexOf("?wmode")));
            else
                _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
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
        private void Load_Library_Main()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.project_code = lblprj.Text;
            _dtmaster = _objbll.Load_Document_Library_Project(_objcls, _objdb);
            _dtresult = _dtmaster;
        }
        private void Load_Library()
        {
            rptdetails.DataSource = _dtresult;
            rptdetails.DataBind();
            Filter_Elements();
        }
        private void Filter_Elements()
        {
            var _manufaturer = (from DataRow dRow in _dtresult.Rows
                                orderby dRow["MANF_NAME"]
                                select new { col1 = dRow["MANF_NAME"] }).Distinct();
            string _list = "";
            foreach (var row in _manufaturer)
            {
                _list = _list + "<li><span style='display:none'>0_id</span><a href='#'>" + row.col1.ToString() + "</a></li>";
            }
            LiteralControl _lt = new LiteralControl();
            if ((string)Session["manf"] != "All")
                _lt.Text = "<span>" + (string)Session["manf"] + "</span><ul class='dropdown'><li><span style='display:none'>0_id</span><a href='#' style='color:#ff9667;font-style:italic;'>Clear Filter</a></li>" + _list + "</ul>";
            else
                _lt.Text = "<span>" + (string)Session["manf"] + "</span><ul class='dropdown'>" + _list + "</ul>";
            ph_filter1.Controls.Add(_lt);

            var _type = (from DataRow dRow in _dtresult.Rows
                         orderby dRow["CONTRA_TYPE"]
                         select new { col1 = dRow["CONTRA_TYPE"] }).Distinct();
            _list = "";
            foreach (var row in _type)
            {
                _list = _list + "<li><span style='display:none'>0_id</span><a href='#'>" + row.col1.ToString() + "</a></li>";
            }
            _lt = new LiteralControl();
            if ((string)Session["type"] != "All")
                _lt.Text = "<span>" + (string)Session["type"] + "</span><ul class='dropdown'><li><span style='display:none'>0_id</span><a href='#' style='color:#ff9667;font-style:italic;'>Clear Filter</a></li>" + _list + "</ul>";
            else
                _lt.Text = "<span>" + (string)Session["type"] + "</span><ul class='dropdown'>" + _list + "</ul>";
            ph_filter2.Controls.Add(_lt);

            var _model = (from DataRow dRow in _dtresult.Rows
                          orderby dRow["MODEL"]
                          select new { col1 = dRow["MODEL"] }).Distinct();
            _list = "";
            foreach (var row in _model)
            {
                _list = _list + "<li><span style='display:none'>0_id</span><a href='#'>" + row.col1.ToString() + "</a></li>";
            }
            _lt = new LiteralControl();
            if ((string)Session["model"] != "All")
                _lt.Text = "<span>" + (string)Session["model"] + "</span><ul class='dropdown'><li><span style='display:none'>0_id</span><a href='#' style='color:#ff9667;font-style:italic;'>Clear Filter</a></li>" + _list + "</ul>";
            else
                _lt.Text = "<span>" + (string)Session["model"] + "</span><ul class='dropdown'>" + _list + "</ul>";
            ph_filter3.Controls.Add(_lt);
        }
        protected void rptdetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink _source_tag = (HyperLink)e.Item.FindControl("source_tag");
                Label lbl = (Label)e.Item.FindControl("lblsource");
                if (lbl.Text == "N/A")
                {
                    _source_tag.Visible = false;
                }
                else
                    _source_tag.Visible = true;
            }
        }
        protected void btnfilter_Click(object sender, EventArgs e)
        {
            string _str1 = string.IsNullOrEmpty(filter1.Value) ? "All" : filter1.Value;
            string _str2 = string.IsNullOrEmpty(filter2.Value) ? "All" : filter2.Value;
            string _str3 = string.IsNullOrEmpty(filter3.Value) ? "All" : filter3.Value;
            if (_str1 == "Clear Filter") { Session["manf"] = "All"; _str1 = "All"; } else Session["manf"] = _str1;
            if (_str2 == "Clear Filter") { Session["type"] = "All"; _str2 = "All"; } else Session["type"] = _str2;
            if (_str3 == "Clear Filter") { Session["model"] = "All"; _str3 = "All"; } else Session["model"] = _str3;
            Filtering(_str1, _str2, _str3);
            Load_Library();
        }
        private static void Filtering(string _str1, string _str2, string _str3)
        {
            int _i = _dtmaster.Rows.Count;
            if (_i == 0) return;
            string _filter = "('" + _str1 + "'='ALL' OR [MANF_NAME]='" + _str1 + "') AND ('" + _str2 + "'='ALL' OR [CONTRA_TYPE]='" + _str2 + "') AND ('" + _str3 + "'='ALL' OR [MODEL]='" + _str3 + "')";
            var _result = _dtmaster.Select(_filter);
            DataTable _dtfilter = _result.Any() ? _result.CopyToDataTable() : _dtmaster.Clone();
            _dtresult = _dtfilter;
        }

    }
}