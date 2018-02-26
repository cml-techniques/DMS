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
    public partial class dmsuploads1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblType.Text = Request.QueryString["Auth4"].ToString();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();

                Get_ProjectInfo();

                Load_Master(lblType.Text);
 
                loadPageprojectinfo();

                setlabel();


            }
        }
        void setlabel()
        {
            if (lblType.Text == "11")
            {
                
                if (lblprj.Text == "11784")
                {
                    lblhead.Text = "Latest Progress Tracking Sheet";
                    lblpagehead.Text = "Progress Tracking Sheet";
                    lblhead1.Text = "Previous Months Reports";
                }
                else
                {
                    lblhead.Text = "Latest O&M Progress Report";
                    lblpagehead.Text = "O&M Progress Report";
                    lblhead1.Text = "Previous Months Reports";
                }
            }
            else if (lblType.Text == "12")
            {
                if (lblprj.Text == "11784")
                {
                    lblhead.Text = "Latest O&M Template";
                    lblpagehead.Text = "O&M Template";
                    lblhead1.Text = "Previous O&M Template";
                }
                else
                {
                    lblhead.Text = "Latest Training Manual Progress Report";
                    lblhead1.Text = "Previous Months Reports";
                    lblpagehead.Text = "Training Manual Progress Report";
                   
                }
            }
            else if (lblType.Text == "13")
            {
                if (lblprj.Text == "11784")
                {
                    lblhead.Text = "Latest Documentation PLan";
                    lblpagehead.Text = "Documentation PLan";
                    lblhead1.Text = "Previous Documentation PLan";
                }
                else
                {
                    lblhead.Text = "Latest Training Schedule";
                    lblhead1.Text = "Previous Schedule";
                    lblpagehead.Text = "Training Schedule";
                }
            }
        }
        private void Load_Master(string type)
        {
            DataTable _dtmaster = new DataTable();

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(type);
            _objcls.project_code = lblprj.Text;
            _dtmaster = _objbll.load_dms_doc_upload(_objcls, _objdb);

            IEnumerable<DataRow> result = from _data in _dtmaster.AsEnumerable()
                                          where _data.Field<bool>("status") == true
                                          select _data;
            if (result.Any())
            {
                datalist_latest.DataSource = result.CopyToDataTable<DataRow>();
                datalist_latest.DataBind();
            }

            IEnumerable<DataRow> result1 = from _data in _dtmaster.AsEnumerable()
                                          where _data.Field<bool>("status") == false
                                          select _data;
            if (result1.Any())
            {
                datalist_previous.DataSource = result1.CopyToDataTable<DataRow>();
                datalist_previous.DataBind();
            }



        }
  
     
        private void loadPageprojectinfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(lblfolder.Text);

            pageinfo.Text = _objbll.Get_folderProjectdescription1(_objcls, _objdb).Rows[0][0].ToString();
            pageinfo.Text = pageinfo.Text + "\\ O&M Manual";
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


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (draction1.SelectedItem.Text == "Select Action") ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('select Action');", true);
            
             //            var e = document.getElementById(sender);
             //var strindex = e.options[e.selectedIndex].value;

             //var prj = document.getElementById('lblprj').innerText;
             //var userid = document.getElementById('lbluserhidden').innerText;
             //var ftype = document.getElementById('lblType').innerText;
             //var folder = document.getElementById('lblfolder').innerText;
             //var fcode = document.getElementById('lblfcode').innerText;

             //var querystring = 'Prj=' + prj + '&Id=' + userid + '&Folder=' + folder + '&Type=' + ftype + '&Code=' + fcode;
            
            
            if (draction1.SelectedItem.Text == "Upload New")
            {
                string querystring = "OandmManaualupload?Prj=" + lblprj.Text + "&Id=" + lbluserhidden.Text + "&Folder=" + lblfolder.Text + "&Type=" + lblType.Text + "&Code=" + lblfolder.Text;
                ScriptManager.RegisterStartupScript(this, typeof(string), "Message", "window.open('" + querystring + "','','left=300,top=100,width=1000,height=600,menubar=0,toolbar=0,scrollbars=0,status=0,resizable=0');", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}