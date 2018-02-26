using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Properties;
using BusinessLogic;
using System.Data;
using PassProtection;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;

namespace CMLTechQ.DMS
{
    public partial class ManualQuickViewReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!Page.IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();

                Get_ProjectInfo();

               //lblprj.Text = "123";
       
                    GenerateManualQuickViewReport();

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
        private void GenerateManualQuickViewReport()
        {
            DataSet _ds = new DataSet();

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.project_code = lblprj.Text;

            //DataTable _dt = new DataTable("ProgressTrackingReport");

            DataTable _dt = _objbll.load_ManualQuickView_Report(_objcls, _objdb);
            // _dt.TableName = "ManualQuickViewReport";

            //_dt.WriteXml(Server.MapPath("Documents/ManualQuickViewReport.xml"), true);


            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("ManualQuickViewReport.rpt"));
            cryRpt.Database.Tables[0].SetDataSource(_dt);

            CrystalReportViewer1.ReportSource = cryRpt;
            CrystalReportViewer1.Zoom(90);
            CrystalReportViewer1.DataBind();
            Session["Report"] = cryRpt;




        }
    }
}