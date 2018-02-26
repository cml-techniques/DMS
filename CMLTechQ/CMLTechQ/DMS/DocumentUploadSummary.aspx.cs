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
    public partial class DocumentUploadSummary : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();


                Get_User();
                Get_ProjectInfo();


                //lbluserid.Text = "jose.joseph@cmlgroup.ae";
                //lblprj.Text = "123";

               Load_Details();
            }


        }
        private void Load_Details() 
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsuser _objcls = new _clsuser();
            _objdb.DBName = "DBCML";
            _objcls.uid = lbluserid.Text;
            _objcls.project_code = lblprj.Text;

            DataTable _dtservice = _objbll.Doc_Summary_Report_New(_objcls, _objdb);
            rptsummary.DataSource = _dtservice;
            rptsummary.DataBind();



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
        //protected void rptdetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{

        //}
        //protected LiteralControl getcheckvalue()
        //{

        //    LiteralControl _lt = new LiteralControl();
        //    _lt.Text = "<a><i class='icon-check'></i></a>";
        //    return _lt;
        //}
        //protected Label getlabelvalue(string setvalue)
        //{
        //    Label _lbl = new Label();
        //    _lbl.Text = setvalue;
        //    return _lbl;
        //}
        //protected void rptmmain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Label _sys_id = (Label)e.Item.FindControl("lblsys");
        //        DataTable _dtdetails = new DataTable();



        //    }
        //}



        //protected void rptmmain_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{

        //}

        protected void btnpopup_Click1(object sender, EventArgs e)
        {

        }

        protected void rptsummary_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblper = (Label)e.Item.FindControl("lblper");
                Label lbltype = (Label)e.Item.FindControl("lbltype");

                if (lbltype.Text!="O&M Manual")
                {
                    lblper.Text = lblper.Text + "%";
                }
            }

        }

    }
}