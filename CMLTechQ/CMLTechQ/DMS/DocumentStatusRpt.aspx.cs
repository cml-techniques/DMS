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
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;

namespace CMLTechQ.DMS
{
    public partial class DocumentStatusRpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblfolder.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();

                //lbltype.Text = Request.QueryString["Type"].ToString();
             

                lbltype.Text = Session["GraphType"].ToString();
               
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
            _objcls.prj_id = Convert.ToInt32(Request.QueryString["Auth2"].ToString());
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
        }
        private void GenerateReport()
        {
            BLL_Dml _objbll = new BLL_Dml();
            DataSet _ds = new DataSet();
            _database _objdb = new _database();
           
            DataTable dt = new DataTable(); ;
            _objdb.DBName = "DBCML";
            
            DataTable _dt;

               ReportDocument cryRpt = new ReportDocument();

            if (lbltype.Text == "1")
            {

                _clsdocument _objcls = new _clsdocument();
                _objcls.project_code = lblprj.Text;
                _objcls.folder_id = Convert.ToInt16(lblfolder.Text);

                _dt = _objbll.Generate_DocumentStatus(_objcls, _objdb);

                cryRpt.Load(Server.MapPath("Documentstatus.rpt"));

            }
            else
            {

                _clscmsdocument _objcls1 = new _clscmsdocument();


                _objcls1.Type = lbltype.Text;
                _objcls1.srv_id = Convert.ToInt16(lblfolder.Text);
                _objcls1.project_code = lblprj.Text;

                _dt = _objbll.Generate_DocumentStatus_Other(_objcls1, _objdb);

                cryRpt.Load(Server.MapPath("Documentstatus1.rpt"));
            }

                _clsuser _objcls2 = new _clsuser();
                _objcls2.project_code = lblprj.Text; ;
                DataTable _dt1 = _objbll.Get_Project_Logo(_objcls2, _objdb);


            //_dt.TableName = "DocumentStatus";

            //_dt.WriteXml(Server.MapPath("Documents/DocumentStatus.xml"), true);


           
         
            cryRpt.Database.Tables[0].SetDataSource(_dt);
            cryRpt.Database.Tables[1].SetDataSource(_dt1);

            //cryRpt.SetParameterValue("Service", "All");


            CrystalReportViewer1.ReportSource = cryRpt;
            CrystalReportViewer1.Zoom(90);
            CrystalReportViewer1.DataBind();
            Session["Report"] = cryRpt;


        }
    }
}