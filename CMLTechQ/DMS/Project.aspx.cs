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

namespace CMLTechQ.DMS
{
    public partial class Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.BufferOutput = false;
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



                 string _auth = "Auth1="+ Request.QueryString["Auth1"].ToString() + "&Auth2=" + Request.QueryString["Auth2"].ToString();
                string _prjid = Request.QueryString["Auth2"].ToString();
                string _prjcode = Get_ProjectInfo(_prjid);
                head.Attributes.Add("src", "Head?" + _auth);

                string defaultMenu = "";
                string defaultNav = "";
                string defaultFolder = "";
                string _type = "";

                if (!String.IsNullOrEmpty(Request.QueryString["Auth3"]))
                {

              BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsdocument _objcls = new _clsdocument();
            _objdb.DBName = "DBCML";
            _objcls.folder_id = Convert.ToInt32(Request.QueryString["Auth3"].ToString());
            DataTable dt = _objbll.Load_DMS_ParentFolders(_objcls, _objdb);



            if (dt.Rows.Count > 0)
            {

                defaultNav = dt.Rows[0]["Parent_folder"].ToString();
                defaultMenu = dt.Rows[0]["MenuFolder"].ToString();
                _type = dt.Rows[0]["Type"].ToString();

            }


            menubar.Attributes.Add("src", "Menubar?" + _auth + "&Auth3=" + defaultMenu);
            navbar.Attributes.Add("src", "Navbar?" + _auth + "&Auth3=" + defaultMenu + "&Auth4=" + defaultNav);
            //content.Attributes.Add("src", "DocumentList?" + _auth + "&Auth3=" + Request.QueryString["Auth3"].ToString());
            //navbar.Attributes.Add("src", "Navbar?" + _auth + "&Auth3=" + defaultMenu + "&Auth4=" + Request.QueryString["Auth3"].ToString());
           

             
          
            if (_type == "1")
                content.Attributes.Add("src", "DocumentList?" + _auth + "&Auth3=" + Request.QueryString["Auth3"].ToString());
            else if (_type == "2")
                content.Attributes.Add("src", "DocumentList1?" + _auth + "&Auth3=" + Request.QueryString["Auth3"].ToString());
            else if (_type == "3")
                content.Attributes.Add("src", "DocumentList2?" + _auth + "&Auth3=" + Request.QueryString["Auth3"].ToString());
            else if (_type == "4")
            {
                content.Attributes.Add("src", "DocumentList3?" + _auth + "&Auth3=" +Request.QueryString["Auth3"].ToString());
            }
            innernav.Attributes.Add("src", "InnerNav?" + _auth + "&Auth3=" + defaultNav + " &Auth4=" + _type);

                }
                else
                {

                    menubar.Attributes.Add("src", "Menubar?" + _auth + "&Auth3=0");
                    DataTable dt = GetDefaultMenu(_prjcode);


                    if (dt.Rows.Count > 0)
                    {
                        defaultMenu = dt.Rows[0]["Folder_id"].ToString();

                    }

                     defaultNav = GetDefaultNav(defaultMenu);
                     defaultFolder = GetDefaultNav(defaultNav);
                     _type = GetFolderType(defaultNav);
                    navbar.Attributes.Add("src", "Navbar?" + _auth + "&Auth3=" + defaultMenu + "&Auth4=0");
                    if (_type == "1")
                        content.Attributes.Add("src", "DocumentList?" + _auth + "&Auth3=" + defaultFolder);
                    else if(_type=="2")
                        content.Attributes.Add("src", "DocumentList1?" + _auth + "&Auth3=" + defaultFolder);
                    else if (_type == "3")
                        content.Attributes.Add("src", "DocumentList2?" + _auth + "&Auth3=" + defaultFolder);
                    else if (_type == "4")
                        content.Attributes.Add("src", "DocumentList3?" + _auth + "&Auth3=" + defaultFolder);
                    innernav.Attributes.Add("src", "InnerNav?" + _auth + "&Auth3=" + defaultNav);

                }
            }
        }
         private string Get_ProjectInfo(string _id)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(_id);
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            return _dt.Rows[0].ItemArray[0].ToString();
        }

         private string Get_User()
         {
             Protection _obj = new Protection();
             string _prm = Request.QueryString["Auth1"].ToString();
             string _decoded = _obj.Decoding(_prm);
            return  _decoded;
         }
         private DataTable GetDefaultMenu(string _prj)
         {
             BLL_Dml _objbll = new BLL_Dml();
             _database _objdb = new _database();
             _clsuser _objcls = new _clsuser();
             _objdb.DBName = "DBCML";
             _objcls.uid = Get_User();
             _objcls.project_code = _prj;
             DataTable dt = _objbll.Get_DafaultMenuFolder(_objcls, _objdb);
             return dt;
         }


         private string GetDefaultNav(string folder_id)
         {
             string defaultnav = "0";
             BLL_Dml _objbll = new BLL_Dml();
             _database _objdb = new _database();
             _clstreefolder _objcls = new _clstreefolder();
             _objdb.DBName = "DBCML";
             _objcls.Folder_id = Convert.ToInt16(folder_id);
             DataTable dt = _objbll.Get_DafaultNavFolder(_objcls, _objdb);
             if (dt.Rows.Count > 0) defaultnav = dt.Rows[0][0].ToString();
             return defaultnav;
         }
         private string GetFolderType(string folder_id)
         {
             string defaultnav = "0";
             BLL_Dml _objbll = new BLL_Dml();
             _database _objdb = new _database();
             _clstreefolder _objcls = new _clstreefolder();
             _objdb.DBName = "DBCML";
             _objcls.Folder_id = Convert.ToInt16(folder_id);
             DataTable dt = _objbll.Get_DafaultNavFolder(_objcls, _objdb);
             if (dt.Rows.Count > 0) defaultnav = dt.Rows[0][5].ToString();
             return defaultnav;
         }
    }
}