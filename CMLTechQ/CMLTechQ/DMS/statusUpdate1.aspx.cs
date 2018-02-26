using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Text.RegularExpressions;
using PassProtection;

namespace CMLTechQ.DMS
{
    public partial class statusUpdate1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                lbldocid.Text = Request.QueryString["Auth4"].ToString();
                load_status();
                Get_User();
            }


        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = lbluseridhidden.Text;
            string _decoded = "";
            if (_prm.IndexOf("?wmode") > 0)
                _decoded = _obj.Decoding(_prm.Substring(0, _prm.IndexOf("?wmode")));
            else
                _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
        }

        private int Count_AllComments()
        {
            int _row = 0;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.uid = lbluserid.Text;
            DataTable _dt = _objbll.load_comments(_objcls, _objdb);
            _row = _dt.Rows.Count;

            return _row;

        }
        private int Count_Comments()
        {
            int _row = 0;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.uid = lbluserid.Text;
            DataTable _dt = _objbll.load_usercomments(_objcls, _objdb);
            _row = _dt.Rows.Count;

            return _row;

        }

        void load_status()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            //_objcls.status = rdstatus.SelectedItem.ToString();

            DataTable _dt = _objbll.Load_DocDatails(_objcls, _objdb);
            if (_dt.Rows.Count > 0)
            {

                rdstatus.Items[rdstatus.FindItemByText(_dt.Rows[0]["STATUS"].ToString()).Index].Selected = true;


            }

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {


            if (Convert.ToInt16(rdstatus.SelectedItem.Value) == 2)
            {

                Session["withComments"] = "1";

                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Please submit the comment(s) to complete the status update !');", true);

                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "SetstatusText();", true);


                return;

            }
            Session["withComments"] = "0";



            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.status = rdstatus.SelectedText;

            _objbll.Update_DocumentStatus(_objcls, _objdb);

            //Response.Redirect("Project?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text);


            //if (Convert.ToInt16(rdstatus.SelectedItem.Value) == 1 || Convert.ToInt16(rdstatus.SelectedItem.Value) == 3)
            //{
            //    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "UpdateStatus();", true);
            //    return;

            //}
            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "RemoveStatusText();", true); 

            //CallBack

            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "CallBack();", true);

        }


    }

}