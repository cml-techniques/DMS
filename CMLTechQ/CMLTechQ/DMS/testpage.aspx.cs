using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMLTechQ.DMS
{
    public partial class testpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        
            string lblprjcode = "BCC1";
            string filename = "booster pumps FIR.pdf";
            string _path = "https://cmltechniques.com/CMS_DOCS/" + lblprjcode + "/" + filename;
            ////string _path = "http://domino.watson.ibm.com/library/CyberDig.nsf/papers/"+ filename;

            Get(_path, filename);
        }
        private void ProgressChanged(object sender, DownloadProgressChangedEventArgs e)
        {
           
        }

        private void Completed(object sender, AsyncCompletedEventArgs e)
        {
          
        }
        public void Get(string uri, string fileName)
        {
            Stream stream = null;

            //This controls how many bytes to read at a time and send to the client
            int bytesToRead = 10000;

            // Buffer to read bytes in chunk size specified above
            byte[] buffer = new Byte[bytesToRead];
            try
            {
                HttpWebRequest fileReq = (HttpWebRequest)HttpWebRequest.Create(uri);

                //Create a response for this request
                HttpWebResponse fileResp = (HttpWebResponse)fileReq.GetResponse();

                if (fileReq.ContentLength > 0) fileResp.ContentLength = fileReq.ContentLength;

                //Get the Stream returned from the response
                stream = fileResp.GetResponseStream();

                // prepare the response to the client. resp is the client Response
                var resp = HttpContext.Current.Response;

                //Indicate the type of data being sent
                resp.ContentType = "application/octet-stream";

                //Name the file 
                resp.AddHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                resp.AddHeader("Content-Length", fileResp.ContentLength.ToString());

                int length;
                do
                {
                    // Verify that the client is connected.
                    if (resp.IsClientConnected)
                    {
                        // Read data into the buffer.
                        length = stream.Read(buffer, 0, bytesToRead);

                        // and write it out to the response's output stream
                        resp.OutputStream.Write(buffer, 0, length);

                        // Flush the data
                        resp.Flush();

                        //Clear the buffer
                        buffer = new Byte[bytesToRead];
                    }
                    else
                    {
                        // cancel the download if client has disconnected
                        length = -1;
                    }
                } while (length > 0); //Repeat until no data is read

            }
            catch (Exception ex)
            {
                string results = ex.Message;
            }
            //return results;
        }
    }
}