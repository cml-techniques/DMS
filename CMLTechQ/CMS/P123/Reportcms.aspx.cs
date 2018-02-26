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
    public partial class Reportcms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblsch.Text = Request.QueryString["Auth3"].ToString();
                Get_ProjectInfo();
                GenerateReport();
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
            _objcls.prj_id = Convert.ToInt32(lblprjid.Text);
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
        }

        private void GenerateReport()
        {

            DataSet _ds = new DataSet();
           DataTable _dt = GetRptData(1);
           DataTable _dt1 = GetRptData(2);

            _ds.Tables.Add(_dt);
            _ds.Tables.Add(_dt1);

            //_ds.WriteXmlSchema(Server.MapPath("") + "\\barea.xml");
            ReportDocument cryRpt = new ReportDocument();
            string parm = "";

            if (lblsch.Text == "2")
            {
                cryRpt.Load(Server.MapPath("cas_mv.rpt"));

            }
            else if (lblsch.Text == "3")
            {
                cryRpt.Load(Server.MapPath("cas_tx.rpt"));
            }


           

            cryRpt.Database.Tables[0].SetDataSource(_ds.Tables[0]);
            cryRpt.Subreports[0].Database.Tables[0].SetDataSource(_ds.Tables[1]);
           // cryRpt.Subreports[1].SetDataSource(_ds.Tables[1]);

            cryRpt.SetParameterValue(0, lblzone.Text);
            cryRpt.SetParameterValue(1, lblcat.Text);
            cryRpt.SetParameterValue(2, lblfl.Text);
            cryRpt.SetParameterValue(3, lblfd.Text);


            CrystalReportViewer1.ReportSource = cryRpt;
            CrystalReportViewer1.DataBind();
            Session["Report"] = cryRpt;
        }
        private DataTable GetRptData(int type)
        {
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