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

namespace CMLTechQ.ADM
{
    public partial class User : System.Web.UI.Page
    {
        public static DataTable _dtMaster;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Get_User();
                Load_Master();
                Load_Projects();
                load_Company();
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
        private void Load_Master()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _dtMaster = _objbll.Load_CMLT_Projects(_objdb);
        }
        private void Load_Projects()
        {

            var distinctRows = (from DataRow dRow in _dtMaster.Rows
                                select new { col1 = dRow["Location"] }).Distinct();
            DataTable _dtregion = new DataTable();
            _dtregion.Columns.Add("Region", typeof(string));
            foreach (var _rrow in distinctRows)
            {
                DataRow _drow = _dtregion.NewRow();
                _drow[0] = _rrow.col1.ToString();
                _dtregion.Rows.Add(_drow);
            }
            rptmain.DataSource = _dtregion;
            rptmain.DataBind();
        }
        protected void rptmmain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _region = (Label)e.Item.FindControl("lblregion");
                DataTable _dtdetails = new DataTable();
                var _details = _dtMaster.Select("Location = '" + _region.Text + "'");
                _dtdetails = _details.Any() ? _details.CopyToDataTable() : _dtMaster.Clone();
                Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails");
                _rptdetails.DataSource = _dtdetails;
                _rptdetails.DataBind();
            }
        }
        protected void chkmain_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox checkbox = (CheckBox)sender;
            RepeaterItem _itm = (RepeaterItem)checkbox.NamingContainer;
            //GridViewRow row = (GridViewRow)checkbox.NamingContainer;
            //GridView _details = (GridView)row.FindControl("mydetails");
            Repeater _rptsub = (Repeater)_itm.FindControl("rptdetails");
            if (checkbox.Checked == true)
            {
                for (int j = 0; j <= _rptsub.Items.Count - 1; j++)
                {
                    CheckBox check = (CheckBox)_rptsub.Items[j].FindControl("chkrow");
                    check.Checked = true;
                    //_rptsub.Items[j].BackColor = System.Drawing.Color.Gainsboro;
                }
            }
            else
            {
                for (int j = 0; j <= _rptsub.Items.Count - 1; j++)
                {
                    CheckBox check = (CheckBox)_rptsub.Items[j].FindControl("chkrow");
                    check.Checked = false;
                    //_details.Rows[j].BackColor = System.Drawing.Color.White;
                }
            }
        }
        private void load_Company()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            drcompany.DataSource = _objbll.Load_Company_Master(_objdb);
            drcompany.DataTextField = "Com_name";
            drcompany.DataValueField = "Com_id";
            drcompany.DataBind();
            drcompany.Items.Insert(0, new ListItem("Company...", "0"));
        }

        protected void chkmodules_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtmodule.Text = "";
            string _mod="";
            foreach (ListItem _li in chkmodules.Items)
            {
                if (_li.Selected == true)
                    _mod = _mod + _li.Text + ",";
            }
            txtmodule.Text = _mod;
        }
        //private void Load_Projects()
        //{
        //    BLL_Dml _objbll = new BLL_Dml();
        //    _database _objdb = new _database();
        //    _objdb.DBName = "dbCML";
        //    DataTable _dt = _objbll.Load_CMLT_Projects(_objdb);
        //    var distinctRows = (from DataRow dRow in _dt.Rows
        //                        select new { col1 = dRow["Location"]}).Distinct();
        //    int _count=1;
        //    string _projecthead = "<div class='accordion-inner' style='display: none;' ><table border='0' cellspacing='0'>";
        //    string _projectfoot = "</table></div><div class='checkbottom'></div>";
        //    string _projectregion="";
        //    foreach (var _rrow in distinctRows)
        //    {
        //        string _region = "<div class='accordion-title' id='R" + _count.ToString() + "'><table border='0' cellspacing='0'><tr><td><asp:CheckBox ID='C" + _count.ToString() + "' runat='server' CssClass='mycheck'  /></td><td class='region-class' onclick='getdata(" + _count.ToString() + ");' >" + _rrow.col1.ToString() + "</td></tr></table></div>";
        //         string _project="";
 
        //        var _result = _dt.Select("Location = '" + _rrow.col1.ToString() + "'");
        //        DataTable _dtprj = _result.Any() ? _result.CopyToDataTable() : _dt.Clone();

        //        foreach (var _prow in _result)
        //        {
        //            _project = _project + "<tr><td><asp:CheckBox ID='CheckBox2' runat='server' CssClass='mycheck'  /></td><td class='prj-class' ><span>" + _prow["prj_name"].ToString() + "</span></td></tr>";
        //        }

        //        _projectregion = _projectregion + _region + _projecthead + _project + _projectfoot;
        //        _count += 1;
        //    }
        //    LiteralControl _lt = new LiteralControl();
        //    _lt.Text = _projectregion;
        //    PlaceHolder1.Controls.Add(_lt);
        //}
    }
}