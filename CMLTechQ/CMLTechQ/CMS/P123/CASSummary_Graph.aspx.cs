using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;
namespace CMLTechQ.CMS.P123
{
    public partial class CASSummary_Graph : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Generate_Graph();
                pageinfo.Text = "Electrical > High - Medium Voltage > Graph ";
            }
        }
        private void Generate_Graph()
        {

            DataTable _ddata = GetRptData();
            string _head = "<table class='dataforgraph'><thead><th>Bar</th><th>Value</th></thead>";
            string _data = "";
            string _headclose = "</table>";
            decimal _total = 0;
            decimal _count = 0;
            foreach (DataRow _drow in _ddata.Rows)
            {
                _count += 1;
                _total += Convert.ToDecimal(_drow["TOTAL1"].ToString());
                string _val = decimal.Round(Convert.ToDecimal(_drow["TOTAL1"].ToString())).ToString();
                _data = _data + "<tr><td>" + _drow["CODE"].ToString() + " - " + _val + "%</td><td id='td1'>" + _val + "</td></tr>";
            }
            decimal _overall = decimal.Round(_total / _count);
            string _last = "<tr><td>Overall - " + _overall.ToString() + "%</td><td id='td1'>" + _overall.ToString() + "</td></tr>";
            string _value = _head + _data + _last + _headclose;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _value;
            PlaceHolder1.Controls.Add(_lt);
        }
        private DataTable GetRptData()
        {
            //lblprj.Text = "123";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clscassheet _objcls = new _clscassheet();
            DataTable dt = new DataTable(); ;
            _objdb.DBName = "DB_123";
            _objcls.sch = 2;
            _objcls.prj_code = "123";
            dt = _objbll.Generate_pkg_Summary_2(_objcls, _objdb);
            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LiteralControl lt = new LiteralControl();
            lt.Text = "";
            PlaceHolder1.Controls.Add(lt);
            Generate_Graph();
        }
    }
}