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
    public partial class ViewFullDocument1 : System.Web.UI.Page
    {
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
                lblid.Text = Request.QueryString["Auth3"].ToString();
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lbldocid.Text = Request.QueryString["Auth4"].ToString();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();

            

                GetDefaultNav(lblid.Text);
               

                //string _docname = Request.QueryString["Auth6"].ToString();

               

               // Get_Title();
                GetdocumentDetails();

                string _path = "https://dms.cmltechniques.com/DMS/Documents/" + lbldocname.Text;
                documentviewer.Attributes.Add("src", _path);



                if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
                {
                    hmenufolder.Value = Request.QueryString["Auth5"].ToString();

                }

            }
        }
        int getservice_folder()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.package_code = Convert.ToInt32(lblfolder.Text);
            int folder = _objbll.Get_Servicefolder(_objcls, _objdb);

            return folder;

        }
        private void Get_Title()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);

            lbldocname.Text = "";

            lbl_doctitle.Text = _objbll.Get_DocumentTitle(_objcls, _objdb);
        }
        void GetdocumentDetails()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);

            DataTable dt = _objbll.Get_DocumentDetails(_objcls, _objdb);
            if (dt.Rows.Count > 0)
            {

                lbl_doctitle.Text = dt.Rows[0]["title"].ToString();
                lbldocname.Text = dt.Rows[0]["doc_name"].ToString();

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
            if (dt.Rows.Count > 0)
            {
                hfolder.Value = dt.Rows[0]["Folder_id"].ToString();
                //hpos.Value = dt.Rows[0]["Folder_possition"].ToString();
            }

        }

        protected void btnaddtreee_Click(object sender, EventArgs e)
        {

        }
       

    }
}