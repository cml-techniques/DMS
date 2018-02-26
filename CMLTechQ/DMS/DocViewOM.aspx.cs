using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Web.UI.HtmlControls;
using System.Data;
namespace CMLTechQ.DMS
{
    public partial class DocViewOM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fileinfo.Text = Request.QueryString[1].ToString();
                string _path = "http://demo1.cmltechniques.com/DMS/Documents/123/" + fileinfo.Text;
                documentviewer.Attributes.Add("src", _path);
                Load_Comments();
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            Save_Comments();
            Load_Comments();
        }
        private void Save_Comments()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            HtmlInputText _txtpage = (HtmlInputText)this.FindControl("txtpage");
            HtmlInputText _txtsection = (HtmlInputText)this.FindControl("txtsec");
            _objcls.com_date = DateTime.Now;
            _objcls.comment = txtcomments.Text;
            _objcls.page_no = _txtpage.Value;
            _objcls.sec_no = _txtsection.Value;
            _objcls.doc_id = 21927;
            _objcls.user_id = "admin@cmlinternational.net";
            _objbll.addcomment(_objcls, _objdb);
            ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Comment Saved!');", true);

        }
        private void Load_Comments()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = 21927;
            DataTable _dt = _objbll.load_comments(_objcls, _objdb);
            rptcomments.DataSource = _dt;
            rptcomments.DataBind();
        }
    }
}