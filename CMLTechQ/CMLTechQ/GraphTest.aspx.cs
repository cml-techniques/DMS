using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;

namespace CMLTechQ
{
    public partial class GraphTest : System.Web.UI.Page
    {
        public static DataTable _dtresult;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Generate_Graph();
            }
        }
        private void Generate_Graph()
        {
            //string _data="<table id='data-table' border='1' cellspacing='0' cellpadding='10' summary=''><caption>Population in thousands</caption><thead><tr><td>&nbsp;</td><th scope='col'>2012</th><th scope='col'>2013</th><th scope='col'>2014</th><th scope='col'>2015</th><th scope='col'>2016</th></tr></thead><tbody><tr><th scope='row'>Carbon Tiger</th><td>4080</td><td>6080</td><td>6240</td><td>3520</td><td>2240</td></tr><tr><th scope='row'>Blue Monkey</th><td>5680</td><td>6880</td><td>5760</td><td>5120</td><td>2640</td></tr><tr><th scope='row'>Tanned Zombie</th><td>1040</td><td>1760</td><td>2880</td><td>4720</td><td>7520</td></tr></tbody></table>";
            //LiteralControl _lt = new LiteralControl();
            //_lt.Text = _data;
            //PlaceHolder1.Controls.Add(_lt);

            DataTable _ddata = GetRptData();
            string _head = "";
            string _headopen = "<table id='data-table' border='1' cellspacing='0' cellpadding='10' summary=''><caption>Population in thousands</caption><thead><tr><td>&nbsp;</td>";
            string _headclose = "</tr></thead>";
            string _data = "";
            string _dataopen = "<tbody><tr>";
            string _dataclose = "</tr></tbody></table>";
            string _dummy = "";
            foreach (DataRow _drow in _ddata.Rows)
            {
                decimal _dvalue = Convert.ToDecimal(_drow["TOTAL1"].ToString()) * 100;
                _head = _head + "<th scope='col'>" + _drow["CODE"].ToString() + "</th>";
                _data = _data + "<td>" + _dvalue + "</td>";
                _dummy = _dummy + "<td></td>";
            }
            _dummy = _dummy + "</tr><tr>";
            string _group = _headopen + _head + _headclose;
            string _value = _dataopen + _dummy + _data + _dataclose;
            //string _data="<tbody><tr><th scope='row'>Carbon Tiger</th><td>4080</td><td>6080</td><td>6240</td><td>3520</td><td>2240</td></tr><tr><th scope='row'>Blue Monkey</th><td>5680</td><td>6880</td><td>5760</td><td>5120</td><td>2640</td></tr><tr><th scope='row'>Tanned Zombie</th><td>1040</td><td>1760</td><td>2880</td><td>4720</td><td>7520</td></tr></tbody></table>";
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _group + _value;
            PlaceHolder1.Controls.Add(_lt);
        }
        private void Load_Master()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_123";
            _clscassheet _objcas = new _clscassheet();
            _objcas.sch = 2;
            _objcas.prj_code = "123";
            _dtresult = _objbll.Load_casMain_Edit(_objcas, _objdb);



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
    }
}