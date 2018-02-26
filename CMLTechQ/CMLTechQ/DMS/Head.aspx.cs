using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;
namespace CMLTechQ.DMS
{
    public partial class Head : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();
                string _auth = Request.QueryString["Auth2"].ToString();
                lblprj.Text = _auth;
                if (lblprj.Text == "51")
                    lblprjinfo.Text = "KAIA - Saudi Arabia";
                else
                    Get_ProjectInfo();
            }
        }
        private void Get_ProjectInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(lblprj.Text);
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            lblprjinfo.Text = _dt.Rows[0].ItemArray[1].ToString() + " - " + _dt.Rows[0].ItemArray[2].ToString();
        }
    }
}