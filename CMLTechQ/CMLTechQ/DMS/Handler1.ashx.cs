using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile _file = files[i];   
 
                    string fileNameApplication = System.IO.Path.GetFileName(_file.FileName);
                    string fileExtensionApplication = System.IO.Path.GetExtension(fileNameApplication);
                    string _filename = fileNameApplication.Replace(" ", String.Empty);


                    if (System.IO.Directory.Exists(context.Server.MapPath("~/DMS/DMSLibrary")) == false)
                        System.IO.Directory.CreateDirectory(context.Server.MapPath("~/DMS/DMSLibrary"));


                    if (fileNameApplication != String.Empty)
                    {
                        _file.SaveAs(context.Server.MapPath("~/DMS/DMSLibrary/" + _filename));
                    }
                    
                }
                context.Response.ContentType = "text/plain";
                context.Response.Write("File Uploaded Successfully!");
            } 
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}