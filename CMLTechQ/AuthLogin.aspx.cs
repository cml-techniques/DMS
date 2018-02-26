using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using PassProtection;
using System.Xml;
using System.Net;
using System.Web.Script.Serialization;

namespace CMLTechQ
{
    public partial class AuthLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            readcookies();

            if (!IsPostBack)
            {
                //if (!String.IsNullOrEmpty(Request.QueryString["Auth"]))
                //{
                //    string _prm = Request.QueryString["Auth"].ToString();
                //    Session["prm"] = R;



                //}
                //else
                //{
                //    Session["prm"] = "";



                //}

                txt_uid.Text = (string)Session["uid"];
                txt_pwd.Attributes.Add("value", (string)Session["pwd"]);
            }
        }
        void readcookies()
        {
            if (Request.Cookies["uid"] != null)
            {
                Session["uid"] = Server.HtmlEncode(Request.Cookies["uid"].Value);
            }
            if (Request.Cookies["pwd"] != null)
            {
                Session["pwd"] = Server.HtmlEncode(Request.Cookies["pwd"].Value);
            }
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Validate_Login(txt_uid.Text,txt_pwd.Text);
        }
        private void Validate_Login(string _user, string _pwd)
        {

            BLL_Dml _obj = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _clsobj = new _clsuser();
            _clsobj.uid = _user;
            _clsobj.pwd = _pwd;
            string _LoginInfo = _obj.ChkUserLoggedIN(_clsobj, _objdb);
            if (_obj._validUser(_clsobj, _objdb) == false)
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Invalid UserID/Password');", true);
            else
            {
                Session["uid"] = _user;
                Session["pwd"] = _pwd;
                Protection _objprt = new Protection();
                string _encoded = _objprt.Encoding(_user);
                UpdateUserLog();
                //HtmlInputCheckBox chkuser = (HtmlInputCheckBox)this.FindControl("rememberme");
                if (rememberme.Checked == false)
                {
                    Session["uid"] = "";
                    Session["pwd"] = "";
                }
                _Create_Cookies();

                if (!String.IsNullOrEmpty(Request.QueryString["Auth2"]))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "parent.call_redirect('" + _encoded + "','" + Request.QueryString["Auth2"].ToString() + "','" + Request.QueryString["Auth3"].ToString() + "');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "parent.call_home('" + _encoded + "');", true);
                }


            }
        }
        void _Create_Cookies()
        {
            if (Request.Browser.Cookies)
            {
                HttpCookie _CookieUid = new HttpCookie("uid");
                _CookieUid.Value = (string)Session["uid"];
                _CookieUid.Expires = DateTime.Now.AddDays(10);
                Response.Cookies.Add(_CookieUid);
                HttpCookie _CookiePwd = new HttpCookie("pwd");
                _CookiePwd.Value = (string)Session["pwd"];
                _CookiePwd.Expires = DateTime.Now.AddDays(10);
                Response.Cookies.Add(_CookiePwd);

                //HttpCookie _CookieChk = new HttpCookie("chk");
                //_CookieChk.Value = (string)Session["chk"];
                //_CookieChk.Expires = DateTime.Now.AddDays(10);
                //Response.Cookies.Add(_CookieChk);
            }
            else
                return;
        }

        protected void btnforgotpwd_Click(object sender, EventArgs e)
        {

            txtforgot.Text = txt_uid.Text;
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }

        protected void btnemailpwd_Click(object sender, EventArgs e)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.uid = txtforgot.Text;
            string _pwd = _objbll.GetAutoPassword(_objcls, _objdb);
            if (_pwd != "0")
            {
                Send_Mail(_pwd);
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Your Password has been sent!');", true);

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Invalid UserID!');", true);


        }
        void Send_Mail(string _pwd)
        {
            publicCls.publicCls _objcls = new publicCls.publicCls();
            string Body = "CML Techniques Access :" + "\n\n\n" + "Your User Id is : " + txtforgot.Text + "\n" + "Your Password is : " + _pwd + "\n\n\n" + "https://dms.cmltechniques.com/";
            string _sub = "CML Techniques Access";
            _objcls.Send_Email(txtforgot.Text, _sub, Body);
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }

        void UpdateUserLog()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clslog _objcls = new _clslog();
            _objcls.uid = (string)Session["uid"];            
            string _login = Request.Form["clientTime"].ToString();
            _objcls.ipaddr = GetIPAddress();                
            _objcls.login = _login;
            List<string> _result = LoadIPLocation(_objcls.ipaddr);
            _objcls.Country = _result[0];
            _objcls.Region = _result[1];
            _objcls.location = _result[2];
            _objcls.module = "DMS";
            _objbll.UpdateUserLog(_objcls, _objdb);
            
        }

        public string GetIPAddress()
        {

            //IPHostEntry Host = default(IPHostEntry);
            //string Hostname = null;
            //Hostname = System.Environment.MachineName;
            //Host = Dns.GetHostEntry(Hostname);
            //string _ip = null;
            //foreach (IPAddress IP in Host.AddressList)
            //{
            //    if (IP.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
            //    {
            //        _ip = Convert.ToString(IP);
            //    }
            //}
            //return _ip;


            string ip = Request.Form["clientIp"].ToString();
            if (string.IsNullOrEmpty(ip) || ip.Trim() == "::1") 
            {
                ip =  HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            }  
            if (string.IsNullOrEmpty(ip))
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            return ip;

        }

        private List<string> LoadIPLocation(string ipAddress)
        {            
            string City = "";
            string Country = "";
            string Region = "";

            try
            {
                if (!string.IsNullOrEmpty(ipAddress))
                {
                    XmlDocument doc = new XmlDocument();
                    string getdetails = "https://www.freegeoip.net/xml/" + ipAddress;
                    doc.Load(getdetails);

                    XmlNodeList node = doc.GetElementsByTagName("City");
                    City = node[0].InnerText;

                    node = doc.GetElementsByTagName("CountryName");
                    Country = node[0].InnerText;

                    node = doc.GetElementsByTagName("RegionName");
                    Region = node[0].InnerText;
                    doc = null;

                }

            }
            catch
            {

            }
            finally
            {

            }
            List<string> locationdetails = new List<string>(); 
            locationdetails.Add(Country);
            locationdetails.Add(Region);
            locationdetails.Add(City);
            return locationdetails;
        }
    }
}