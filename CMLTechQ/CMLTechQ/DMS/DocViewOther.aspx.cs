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
    public partial class DocViewOther : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       
            if (!IsPostBack)
            {
                loadparent();
            }

        }
        void loadparent()
        {
                string defaultmenu="";
                string defaultnav = "";
              

             string _auth ="Auth1=" + Request.QueryString["Auth1"].ToString() + "&Auth2=" + Request.QueryString["Auth2"].ToString()  ;
                


            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.folder_id = Convert.ToInt32(Request.QueryString["Auth3"].ToString());
            DataTable _dt = _objbll.Get_ParentFolders(_objcls, _objdb);

            if (_dt.Rows.Count>0)
            {

                 defaultmenu=_dt.Rows[0]["Menu_folder"].ToString();
                 defaultnav = _dt.Rows[0]["Parent_folder"].ToString();
       

            }

                menubar.Attributes.Add("src", "Menubar?" + _auth + "&Auth3=" + defaultmenu);
                navbar.Attributes.Add("src", "Navbar?" + _auth + "&Auth3=" + defaultmenu);
                innernav.Attributes.Add("src", "InnerNav?" + _auth + "&Auth3=" + defaultnav);
                content.Attributes.Add("src", "DocumentList?" + _auth + "&Auth3=" + Request.QueryString["Auth3"].ToString());


            
        }
        //private string Get_ProjectInfo(string _id)
        //{
        //    BLL_Dml _objbll = new BLL_Dml();
        //    _clsproject _objcls = new _clsproject();
        //    _database _objdb = new _database();
        //    _objdb.DBName = "DBCML";
        //    _objcls.prj_id = Convert.ToInt32(_id);
        //    DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
        //    return _dt.Rows[0].ItemArray[0].ToString();
        //}

        //private string Get_User()
        //{
        //    Protection _obj = new Protection();
        //    //string _prm = Request.QueryString["Auth1"].ToString();
        //    string _prm = "am9zZS5qb3NlcGhAY21sZ3JvdXAuYWU=";
        //    string _decoded = _obj.Decoding(_prm);
        //    return _decoded;

        //}
    }
}