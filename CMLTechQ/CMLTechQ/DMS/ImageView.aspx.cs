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
    public partial class ImageView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //string Comm=  Request.QueryString["Auth2"].ToString();
                lblprj.Text = Request.QueryString["Auth1"].ToString();
                Comm_id.Text = Request.QueryString["Auth2"].ToString();

                Get_ProjectInfo();

                LoadCommentDetails();
            }

        }
        private void Get_ProjectInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(Request.QueryString["Auth1"].ToString());
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            if (_dt.Rows.Count > 0)
            {
                lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
            }
        }
        void LoadCommentDetails()
        {
            string _filename = "";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            _objcls.comm_id = Convert.ToInt32(Comm_id.Text);

            DataTable _dt = _objbll.load_CommentDetails(_objcls, _objdb);

            if (_dt.Rows.Count>0)
            {

                _filename = _dt.Rows[0]["Image_name"].ToString();
            }

      
            string _path = "https://dms.cmltechniques.com/DMS/Documents/"+ lblprj.Text+"//" + _filename;

           fileviewer.Src = _path;

        }
    }
}