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
using System.IO;

namespace CMLTechQ.DMS
{
    public partial class UploadSummary : System.Web.UI.Page
    {
        static DataTable _dtSummary;
        static DataTable _dtservice;    
        static bool _ccolor;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string PName = "";
                if (Request.UrlReferrer != null)
                {
                    PName = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
                }

                if (PName == "")
                {
                    Response.Redirect("https://dms.cmltechniques.com");
                }


                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();

                Get_User();
                Get_ProjectInfo();

                 

                GenerateManualQuickViewReport();

                UploadSummaryServiceList();

                if (lblprjid.Text == "25")
                {
                    pts.Attributes["class"] = "hideAnchor";
                }


            }
        }
        private void loadServiceBased(string value)
        {




            DataTable dt = new DataTable();
            dt.Columns.Add("Folder_Id");
            dt.Columns.Add("Folder_description");
            dt.Columns.Add("Scheduled");
            dt.Columns.Add("Upload");
            dt.Columns.Add("percentage");


            DataRow drow;


            if (value == "0") dt = _dtservice;
            else
            {
                foreach (DataRow dr in _dtservice.Select("Folder_Id=" + value))
                {

                    drow = dt.NewRow();

                    drow["Folder_Id"] = dr["Folder_Id"].ToString();
                    drow["Folder_description"] = dr["Folder_description"].ToString();
                    drow["Scheduled"] = dr["Scheduled"].ToString();
                    drow["Upload"] = dr["Upload"].ToString();
                    drow["percentage"] = dr["percentage"].ToString();

                    dt.Rows.Add(drow);
                }
            }

            hcount.Value = dt.Rows.Count.ToString();

            rptmmain.DataSource = dt;
            rptmmain.DataBind();


        }
        private void load_service(DataTable _dt)
        {


            rdservice.DataSource = _dt;


            rdservice.DataTextField = "Folder_description";
            rdservice.DataValueField = "Folder_Id";
            rdservice.DataBind();

            //ListItem li = new ListItem("All Services", "0");

            Telerik.Web.UI.DropDownListItem li =new Telerik.Web.UI.DropDownListItem("All Services","0");

            rdservice.Items.Insert(0, li);



        }
        private void GenerateManualQuickViewReport()
        {
            DataSet _ds = new DataSet();

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;

            _dtSummary = _objbll.Doc_Summary_Report_New(_objcls, _objdb);
        }
        void UploadSummaryServiceList()
        {


            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsuser _objcls = new _clsuser();
            _objdb.DBName = "DBCML";
            _objcls.uid = lbluserid.Text;
            _objcls.project_code = lblprj.Text;

             _dtservice = _objbll.UploadSummaryServiceList(_objcls, _objdb);

            Session["t1"] = _dtservice;

            hcount.Value = _dtservice.Rows.Count.ToString();

            rptmmain.DataSource = _dtservice;
            rptmmain.DataBind();


            load_service(_dtservice);




        }
        private void Load_Details()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsuser _objcls = new _clsuser();
            _objdb.DBName = "DBCML";
            _objcls.uid = lbluserid.Text;
            _objcls.project_code = lblprj.Text;

            DataTable _dtservice = _objbll.loadserviceDMS(_objcls, _objdb);
            rptmmain.DataSource = _dtservice;
            rptmmain.DataBind();

        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Auth1"].ToString();
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


        protected void rptmmain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _sys_id = (Label)e.Item.FindControl("lblsys");

                Label _lblpercentage = (Label)e.Item.FindControl("lblpercentage");
                _lblpercentage.Text = _lblpercentage.Text + "%";


                DataTable _dtdetails = new DataTable();

                Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails");

                _dtdetails = (DataTable)Session["t1"];


                DataTable dt = new DataTable();
                dt.Columns.Add("Package");
                dt.Columns.Add("Manual");
                dt.Columns.Add("uploaded_date");
                dt.Columns.Add("Status");
                dt.Columns.Add("Document_Type");
                dt.Columns.Add("Scheduled");
                dt.Columns.Add("Uploaded");
                dt.Columns.Add("percentage");


                DataRow drow;

                //if (lblprjid.Text=="51") _sys_id.Text = "19325";

                foreach (DataRow dr in _dtSummary.Select("servid=" + _sys_id.Text))
                {

                    drow = dt.NewRow();

                    drow["Package"] = dr["Package"].ToString();
                    drow["Manual"] = dr["Manual"].ToString();
                    drow["uploaded_date"] = dr["uploaded_date"].ToString();
                    drow["Status"] = dr["Status"].ToString();
                    drow["Document_Type"] = dr["Document_Type"].ToString();
                    drow["Scheduled"] = dr["Scheduled"].ToString();
                    drow["Uploaded"] = dr["Uploaded"].ToString();
                    drow["percentage"] = dr["percentage"].ToString();

                    dt.Rows.Add(drow);
                }

                _rptdetails.DataSource = dt;
                _rptdetails.DataBind();



            }

        }

        protected void rptmmain_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rptdetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                System.Web.UI.HtmlControls.HtmlTableCell tdv = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("tdv");
                Label lblpkg = (Label)e.Item.FindControl("lblpackage");

              

                if (!string.IsNullOrEmpty(lblpkg.Text))
                {

                    //tdv.Style.Add("border-right", "1px solid #dddddd");

                    if (!_ccolor)
                    {
                        tdv.Style.Add("background-color", "#f9f9f9");
                        
                        _ccolor = !_ccolor;

                    }
                    else
                    {
                        tdv.Style.Add("background-color", "#E8EEEF");
                        _ccolor = !_ccolor;
                    }

                    tdv.RowSpan = 4;

                }
                else
                {

                    tdv.Visible = false;
                }

                hid.Value = "1";


                Label _doctype = (Label)e.Item.FindControl("lbldtype");
                Label _lblper = (Label)e.Item.FindControl("lblper");
                Label _lbluploaddate = (Label)e.Item.FindControl("lbluploaddate");
                Label _lblstatus = (Label)e.Item.FindControl("lblstatus");


                _lblper.Text = _lblper.Text + "%";

                if (_doctype.Text != "O&M Manual")
                {
                    _lbluploaddate.Text = "N/A";
                    _lblstatus.Text = "N/A";

                }
            }
        }

        protected void dummy1_Click(object sender, EventArgs e)
        {
           

        }

        protected void drpservices_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }

        protected void rdservice_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            loadServiceBased(rdservice.SelectedValue.ToString());
        }

    }
}