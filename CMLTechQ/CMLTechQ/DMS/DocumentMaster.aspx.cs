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
    public partial class DocumentMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                 lbluserhidden.Text = Request.QueryString["Auth1"].ToString();
                 lblprj.Text = Request.QueryString["Auth2"].ToString();
                 //lblid.Text = Request.QueryString["Auth2"].ToString();


                 if (Request.QueryString["Auth4"].ToString() != "0")
                 {
                     lblFolderid.Text = Request.QueryString["Auth4"].ToString();

                 }
                 else
                 {
                     GetDefaultNav(Request.QueryString["Auth3"].ToString());

                 }


                 if (!string.IsNullOrEmpty(lblFolderid.Text)) GetDocumentFolder();



            }

        }
        private void GetDefaultNav(string folder_id)
        {
            //string defaultnav = "0";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clstreefolder _objcls = new _clstreefolder();
            _objdb.DBName = "DBCML";
            _objcls.Folder_id = Convert.ToInt16(folder_id);

            DataTable dt = _objbll.Get_DafaultNavFolder(_objcls, _objdb);
            if (dt.Rows.Count > 0) lblFolderid.Text = dt.Rows[0][0].ToString();
            //return defaultnav;
        }
        private void GetDocumentFolder()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(lblFolderid.Text);

            ;
            DataTable dt = new DataTable();
            dt = _objbll.Get_CurrentUploadFolder(_objcls, _objdb);

            var foundAuthors = dt.Select("type=1");
            string path = "Auth1=" + lbluserhidden.Text + "&Auth2=" + lblprj.Text + "&Auth4=" + lblFolderid.Text;
            string id="";
            if (foundAuthors.Length != 0)
            {
                    foreach(var _value in foundAuthors)
            {
                         id = _value["Folder_id"].ToString();
   
            }
                Response.Redirect("DocumentList?" + path+"&Auth5="+id);
            }else Response.Redirect("DocumentList1?" + path+"&Auth5=0&Type=2");


        }
    }
}