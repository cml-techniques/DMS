using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Data;

namespace CMLTechQ.DMS
{
    public partial class ViewSourceDocument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Getdata();
            }

        }
        void Getdata()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clscassheet _objcls = new _clscassheet();
            _objdb.DBName = "DBCML";
            _objcls.sch = Convert.ToInt16( Request.QueryString["Auth1"].ToString());
            DataTable _dt = _objbll.Get_DMS_LIBRARY_GENERAL_Details(_objcls, _objdb);

            if (_dt.Rows.Count > 0)
            {

                string _file = _dt.Rows[0]["SOURCE_NAME"].ToString();

                string ext = System.IO.Path.GetExtension(_file);
                string filename = _file;
                if (ext == "") filename = _file + ".com";


                string _path = "http://" + filename;
                documentviewer.Attributes.Add("src", _path);
            }

        }
    }
}