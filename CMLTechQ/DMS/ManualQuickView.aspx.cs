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
    public partial class ManualQuickView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();

                Get_User();
                Get_ProjectInfo();
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
        protected void rptdetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
        protected LiteralControl getcheckvalue()
        {

            LiteralControl _lt = new LiteralControl();
            _lt.Text = "<a><i class='icon-check'></i></a>";
            return _lt;
        }
        protected Label getlabelvalue(string setvalue)
        {
            Label _lbl = new Label();
            _lbl.Text = setvalue;
            return _lbl;
        }
        protected void rptmmain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _sys_id = (Label)e.Item.FindControl("lblsys");
                DataTable _dtdetails = new DataTable();


                BLL_Dml _objbll = new BLL_Dml();
                _clsdocument _objcls = new _clsdocument();
                _database _objdb = new _database();
                _objdb.DBName = "DBCML";
                _objcls.folder_id = Convert.ToInt32(_sys_id.Text);
                _objcls.uid = lbluserid.Text;
                _dtdetails = _objbll.Load_ManualQuick_View(_objcls, _objdb);
                Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails");
                _rptdetails.DataSource = _dtdetails;
                _rptdetails.DataBind();
            }
        }



        protected void rptmmain_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnpopup_Click1(object sender, EventArgs e)
        {

        }

        //protected void btndummy_Click(object sender, EventArgs e)
        //{


        //}

    }
}