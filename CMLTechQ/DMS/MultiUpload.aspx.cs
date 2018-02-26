using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

namespace CMLTechQ.DMS
{
    public partial class MultiUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AjaxFileUpload1_DataBinding(object sender, EventArgs e)
        {

        }
        protected void FileUploader1_FileReceived(object sender, com.flajaxian.FileReceivedEventArgs e)
        {
            e.File.SaveAs(Server.MapPath("Documents" + "\\" + e.File.FileName));

        }
        protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            string _file = Server.MapPath("Documents\\") + e.FileName;
            AjaxFileUpload1.SaveAs(_file);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //AjaxFileUpload1_UploadComplete(this,new AjaxFileUploadEventArgs e);
            //AjaxFileUpload1.SaveAs(Aja
            //Upload();
            //FileUploader1.
        }

        protected void AjaxFileUpload1_Load(object sender, EventArgs e)
        {

        }

        protected void AjaxFileUpload1_UploadStart(object sender, AjaxFileUploadStartEventArgs e)
        {

        }

        protected void AjaxFileUpload1_DataBinding1(object sender, EventArgs e)
        {

        }
        //private void Upload()
        //{
        //    e.File.SaveAs(Server.MapPath("Documents" + "\\" + e.File.FileName));
        //}

    }
}