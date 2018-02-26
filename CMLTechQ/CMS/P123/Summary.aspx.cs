using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;
using App_Properties;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;

namespace CMLTechQ.CMS
{
    public partial class Summary : System.Web.UI.Page
    {
        public static DataTable _dtresult;
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }
        private void Page_Init(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //lblprjid.Text =;

                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblsch.Text = Request.QueryString["Auth3"].ToString();
                Get_ProjectInfo();
                Generate_Nav();
                Generate_Reports();

                if (lblsch.Text == "2")
                {
                    lbltitle.Text = "Electrical > High Medium Volatage Graph";
                }
                else lbltitle.Text = "Electrical > Transformer Graph";

            }
            else
            {
                if (Session["Report"] != null)
                {
                    CrystalReportViewer1.ReportSource = (ReportDocument)Session["Report"];
                    CrystalReportViewer1.DataBind();
                }

            }
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



        private void Load_Master()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            _clscassheet _objcas = new _clscassheet();
            _objcas.sch = Convert.ToInt32(lblsch.Text);
            _objcas.prj_code = lblprj.Text;
            _dtresult = _objbll.Load_casMain_Edit(_objcas, _objdb);



        }
        private void Generate_Reports()
        {

            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("Graph.rpt"));

            DataSet _ds = new DataSet();
            DataTable _dt = GetRptData(2);

            _ds.Tables.Add(_dt);

            cryRpt.Database.Tables[0].SetDataSource(_ds.Tables[0]);
            //string title="";
            //if (lblsch.Text == "2")
            //{
            //    title = "CAS E1 Electrical Services. HV, MV Switchgear & RMU's Commissioning Activity Schedule";
            //}
            //else if (lblsch.Text == "3")
            //{
            //    title = "CAS E1 Electrical Services.Transformers Commissioning Activity Schedule";
            //}


            cryRpt.SetParameterValue("name", lblsch.Text);
            cryRpt.SetParameterValue("project", "Sample Project");
            cryRpt.SetParameterValue("data_title", "Summary");
            cryRpt.SetParameterValue("graph", "Summary - Package Basis");
            cryRpt.SetParameterValue("bz", "All");
            cryRpt.SetParameterValue("cat", "All");
            cryRpt.SetParameterValue("fl", "All");
            cryRpt.SetParameterValue("ff", "All");
            cryRpt.SetParameterValue("lo", "All");
            CrystalReportViewer1.ReportSource = cryRpt;
            CrystalReportViewer1.Zoom(90);
            CrystalReportViewer1.DataBind();
            Session["Report"] = cryRpt;
        }

        private DataTable GetRptData(int type)
        {
            //lblprj.Text = "123";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clscassheet _objcls = new _clscassheet();
            DataTable dt = new DataTable(); ;
            _objdb.DBName = "DB_" + lblprj.Text;
            _objcls.sch = Convert.ToInt16(lblsch.Text);
            _objcls.prj_code = lblprj.Text;
            


            if (type == 1)
            {

                dt = _objbll.Generate_CAS_RPT_NEW(_objcls, _objdb);
            }
            else
            {
                if (lblsch.Text == "2")
                {
                    dt = _objbll.Generate_pkg_Summary_2(_objcls, _objdb);
                }
                else
                {
                    dt = _objbll.Generate_pkg_Summary_3(_objcls, _objdb);
                }
                
            }

            return dt;
        }
    }
}