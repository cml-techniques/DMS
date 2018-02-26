using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;

namespace CMLTechQ.CMS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        private void Page_Init(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //lblprjid.Text =;

                //lblprjid.Text = Request.QueryString["Auth2"].ToString();
                //lblsch.Text = Request.QueryString["Auth3"].ToString();
                //Get_ProjectInfo();
                //Generate_Nav();
                Generate_Reports();

                //if (lblsch.Text == "2")
                //{
                //    lbltitle.Text = "Electrical -->High Medium Volatage Graph";
                //}
                //else lbltitle.Text = "Electrical -->Transformer Graph";

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
        private DataTable GetRptData(int type)
        {
            //lblprj.Text = "123";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clscassheet _objcls = new _clscassheet();
            DataTable dt = new DataTable(); ;
            _objdb.DBName = "DB_123";
            _objcls.sch = 2;
            _objcls.prj_code = "123";


            dt = _objbll.Generate_pkg_Summary_2(_objcls, _objdb);


            return dt;
        }
        private void Generate_Reports()
        {

            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("P123/Graph.rpt"));

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


            cryRpt.SetParameterValue("name", "Test");
            cryRpt.SetParameterValue("project", "Sample Project");
            cryRpt.SetParameterValue("data_title", "Summary");
            cryRpt.SetParameterValue("graph", "Summary - Package Basis");
            cryRpt.SetParameterValue("bz", "All");
            cryRpt.SetParameterValue("cat", "All");
            cryRpt.SetParameterValue("fl", "All");
            cryRpt.SetParameterValue("ff", "All");
            cryRpt.SetParameterValue("lo", "All");
            CrystalReportViewer1.ReportSource = cryRpt;
            CrystalReportViewer1.DataBind();
            Session["Report"] = cryRpt;
        }
    }
}