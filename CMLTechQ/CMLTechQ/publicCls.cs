using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
//using System.Net.Mail;
//using System.Net;
using System.Net.Mail;
using BusinessLogic;
using App_Properties;
using System.Xml;
using System.Net;

namespace publicCls
{
    public class publicCls
    {
        public static string _user = "";
        public static string _logintime = "";
        public static string _filename = "";
        public static string _access = "";
        public static string _doctype = "";
        public static string _project = "";
        public static string _project_name = "";
        public static DataTable _dtservice;
        public static DataTable _dtpackage;
        public static DataTable _dtdoctype;
        public static DataTable _dtgroup;
        public static DataTable _dtsubgroup;
        public static DataTable _dtsubgroup1;
        public static DataTable _dtdocuments;
        public static DataTable _dtdocdur;
        public static DataTable _dtsnag;
        //public static DataTable _dtSubTee;

        public void Send_Email(string _toAddress, string _Subject, string _Body)
        {
            try
            {
                if (System.Configuration.ConfigurationManager.AppSettings["environment"] == "server")
                {
                    SmtpClient _myclient = new SmtpClient("mail.cmltechniques.com");
                    _myclient.EnableSsl = false;
                    _myclient.Port = 25;
                    _myclient.Credentials = new System.Net.NetworkCredential("admin@cmltechniques.com", "Admin@123");
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("\"CML Techniques\"  <admin@cmltechniques.com>");
                    msg.To.Add(new MailAddress(_toAddress));
                    msg.Priority = MailPriority.High;
                    msg.Subject = _Subject;
                    msg.Body = _Body;
                    _myclient.Send(msg);
                }                    
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void Send_Email_Html(string _toAddress, string _Subject, string _Body)
        {
            try
            {
                if (System.Configuration.ConfigurationManager.AppSettings["environment"] == "server")
                {
                    SmtpClient _myclient = new SmtpClient("mail.cmltechniques.com");
                    _myclient.EnableSsl = false;
                    _myclient.Port = 25;
                    _myclient.Credentials = new System.Net.NetworkCredential("admin@cmltechniques.com", "Admin@123");
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("\"CML Techniques\"  <admin@cmltechniques.com>");
                    msg.To.Add(new MailAddress(_toAddress));
                    msg.Priority = MailPriority.High;
                    msg.Subject = _Subject;
                    msg.IsBodyHtml = true;
                    msg.Body = _Body;
                    _myclient.Send(msg);
                }                    
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public void Load_Tree(string project,string user)
        {
            //if (user != "nothing")
            //    if (_dtservice != null) return;
            BLL_Dml _dtobj = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = project;
            _objcls.uid = user;
            _dtservice = _dtobj.load_service(_objcls,_objdb);
            _dtpackage = _dtobj.load_package(_objdb);
            _dtdoctype = _dtobj.load_doctype(_objdb);
            _dtgroup = _dtobj.load_group(_objdb);
            _dtsubgroup = _dtobj.load_subgroup(_objdb);
            _dtsubgroup1 = _dtobj.load_subgroup1(_objdb);
        }
        
        
        

       

        
    }
}
