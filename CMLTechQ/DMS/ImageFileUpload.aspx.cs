using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace CMLTechQ.DMS
{
    public partial class ImageFileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblprj.Text = Request.QueryString["Auth1"].ToString();
                lblindex.Text = Request.QueryString["Auth2"].ToString();

            }

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            
            string _filename=file1.PostedFile.FileName;

             string filePath = System.IO.Path.Combine(Server.MapPath("Documents") + "\\" + lblprj.Text, _filename);

            if (!string.IsNullOrEmpty(file1.PostedFile.FileName))
            {

                if (File.Exists(filePath)) File.Delete(filePath);

                file1.PostedFile.SaveAs(filePath);
                Session["ImageFile"] = file1.PostedFile.FileName;

            }
            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "closeAddImage();", true);
        }
    }
}