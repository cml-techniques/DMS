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
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                //lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                lblfolder.Text = Request.QueryString["Auth1"].ToString();
                //lblfolder.Text = "22557";
                
                GenerateReport();
                //pageinfo.Text = "O & M Manual / View Comment Details";
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
        private void GenerateReport()
        {

            DataSet _ds = new DataSet();
            DataTable _dt = load_docdetails();
            DataTable _dt1 = load_comments();

            for (int ins = 0; ins <= _dt1.Rows.Count - 1; ins++)
            {
                _dt1.Rows[ins]["comment"] = StripTagsRegex(_dt1.Rows[ins]["comment"].ToString());
                _dt1.AcceptChanges();

            }

            _ds.Tables.Add(_dt);
            _ds.Tables.Add(_dt1);


            //_dt1.TableName = "Table1";

            //_dt1.WriteXmlSchema(Server.MapPath("") + "\\Comments1.xml");

            //_dt.TableName = "Table1";

            //_dt.WriteXmlSchema(Server.MapPath("") + "\\DocDetails.xml");


            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls1 = new _clsuser();
            _objcls1.project_code = lblprj.Text; ;
            _dt1 = _objbll.Get_Project_Logo(_objcls1, _objdb);





            //_dt1.TableName = "ProjectLogo";

            //_dt1.WriteXmlSchema(Server.MapPath("") + "\\ProjectLogo.xml");




            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("Comments_rpt.rpt"));
            cryRpt.Database.Tables[0].SetDataSource(_ds.Tables[1]);
            cryRpt.Database.Tables[1].SetDataSource(_dt1);

            cryRpt.Subreports[0].Database.Tables[0].SetDataSource(_ds.Tables[0]);
            CrystalReportViewer1.ReportSource = cryRpt;
            CrystalReportViewer1.Zoom(90);
            CrystalReportViewer1.DataBind();
            Session["Report"] = cryRpt;
        }
        public static string StripTagsRegex(string source)
        {
            return System.Text.RegularExpressions.Regex.Replace(source, "<.*?>", string.Empty);
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

        DataTable load_comments()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lblfolder.Text);
            DataTable dt = _objbll.Load_DMSComments(_objcls, _objdb);
            //dt.TableName = "Table2";
            return dt;
        }
        DataTable load_docdetails()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lblfolder.Text);
            DataTable _dtable = _objbll.Get_DocumentDetails(_objcls, _objdb);
           // _dtable.TableName = "Table1";
            return _dtable;
        }
    }
}