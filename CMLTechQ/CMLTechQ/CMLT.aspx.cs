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

namespace CMLTechQ
{
    public partial class CMLT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, typeof(string), "alerts", "resize();", true);

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


                //System.Threading.Thread.Sleep(5000);
                Get_User();
                //Load_CMS_Projects();
                Load_DMS_Projects();
                //Load_SNS_Projects(_prm);
                //Load_AMS_Projects();
                //Load_TMS_Projects(_prm);

                lbltime.Text = DateTime.Now.ToString();
            }
        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Auth1"].ToString();
            lbluserhidden.Text = _prm;
            string _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
            lbllogin.Text = GetUserName() + " [" + lbluserid.Text + "]";
        }
        private string GetUserName()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsuser _objcls = new _clsuser();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.uid = lbluserid.Text;
            return _objbll.Get_UserName(_objcls, _objdb);
        }
        
        private void Load_DMS_Projects()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsproject _objcls = new _clsproject();
            _objcls.user = lbluserid.Text;
            _objcls.module = "DMS";
            DataTable _dtcms = _objbll.LOAD_PROJECT_MODULE(_objcls, _objdb);
            var distinctRows = (from DataRow dRow in _dtcms.Rows
                                select new { col1 = dRow["Location"] }).Distinct();
            string _stringBuilder = "";
            string _innercontent = "";
            string _head = "<ul class='tabs1'>";
            string _head_main = "<div class='panes'>";
            string _details = "";
            int _idx = 0;
            foreach (var row in distinctRows)
            {
                string _head_sub = "";

                string _inner = "";
                string _foot = "</ul></div>";
                if (row.col1.ToString() != "")
                {

                    string _str = "";
                    if (_idx == 0 || (_idx % 7 == 0))
                        _str = "<li class='first' ><a  href='#'>" + row.col1.ToString() + "</a></li>";
                    else
                        _str = "<li ><a href='#'>" + row.col1.ToString() + "</a></li>";
                    _details = _details + _str;
                    var _project = from _data in _dtcms.AsEnumerable()
                                   where _data.Field<string>("Location") == row.col1.ToString()
                                   select _data;
                    int _rowindex = 0;

                    foreach (var row1 in _project)
                    {
                        _inner = _inner + "<li><a href='Javascript:CallModules(2," + row1["prj_id"].ToString() + ");'>" + row1["prj_name"].ToString() + "</a></li>";
                    }
                    if (_idx == 0)
                        _head_sub = "<div class='pane' style='display:none;'><ul class='tabs2'>";
                    else
                        _head_sub = "<div class='pane' style='display:none;'><ul class='tabs2'>";
                    _innercontent = _innercontent + _head_sub + _inner + "<div style='height:200px;width:100%'></div>" + _foot;
                    _idx += 1;
                }


            }
            _stringBuilder = _head + _details + "</ul><div class='clear'></div>" + _head_main + _innercontent + "</div>";
            Literal _lt = new Literal();
            if (_stringBuilder == "")
                _lt.Text = "No Projects Available";
            else
                _lt.Text = _stringBuilder;
            ph_dms.Controls.Add(_lt);
        }
       

        //protected void TimerTick(object sender, EventArgs e)
        //{
        //    Load_CMS_Projects();
        //    Load_DMS_Projects();
        //    Timer1.Enabled = false;
        //}
    }
}