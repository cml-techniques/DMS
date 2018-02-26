using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Properties;
using BusinessLogic;
using PassProtection;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;
using System.Data;
namespace CMLTechQ.DMS
{
    public partial class DocumentUploadSummaryRpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();

                Get_ProjectInfo();

               // lblprj.Text = "123";

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
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;

            DataTable _dt = _objbll.Doc_Summary_Report_New(_objcls, _objdb);

           // _dt.TableName = "DocSummary";

           //_dt.WriteXml(Server.MapPath("Documents/DocumentUploadSummary.xml"), true);


           DataTable _dt1 = new DataTable();
           _clsuser _objcls1 = new _clsuser();
           _objcls1.project_code = lblprj.Text; ;

           _dt1 = _objbll.Get_Project_Logo(_objcls1, _objdb);



           //_dt1.TableName = "ProjectLogo";

           //_dt1.WriteXml(Server.MapPath("Documents/ProjectLogo.xml"), true);

        



            

            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("DocumentSummaryReport.rpt"));
            cryRpt.Database.Tables[0].SetDataSource(_dt);

            cryRpt.Database.Tables[1].SetDataSource(_dt1);



            CrystalReportViewer1.ReportSource = cryRpt;
            CrystalReportViewer1.Zoom(90);
            CrystalReportViewer1.DataBind();
            Session["Report"] = cryRpt;




        }
    }
}