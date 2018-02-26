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
    public partial class DocumentStatusGraphDisplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lblprj.Text = Request.QueryString["Auth1"].ToString();

                lblfolder.Text = Request.QueryString["Auth2"].ToString();

                Generate_Graph();

           }

        }

        void changestyle(int gap)
        {
            Literal cssFile;

            if (htype.Value == "1")
            {
                 cssFile = new Literal()
                {
                    Text = @"<link href=""" + Page.ResolveUrl("../Assets/css/livegraph.css") + @"""  
            type=""text/css"" rel=""stylesheet"" />"
                };
                Page.Header.Controls.Add(cssFile);

                if( gap>6)hgap.Value = "2";
                else hgap.Value = "3";


            }
            else
            {
                cssFile = new Literal()
                {
                    Text = @"<link href=""" + Page.ResolveUrl("../Assets/css/livegraph1.css") + @"""  
            type=""text/css"" rel=""stylesheet"" />"
                };
                Page.Header.Controls.Add(cssFile);
                hgap.Value = "1";
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
                _total += Convert.ToDecimal(_drow["Percentage"].ToString());
                string _val = decimal.Round(Convert.ToDecimal(_drow["Percentage"].ToString())).ToString();
                _data = _data + "<tr><td>" + _drow["Status"].ToString() + "</td><td id='td1'>" + _val + "</td></tr>";
            }
            //decimal _overall = decimal.Round(_total / _count);
           // string _last = "<tr><td>Overall - " + _overall.ToString() + "%</td><td id='td1'>" + _overall.ToString() + "</td></tr>";
            string _value = _head + _data + _headclose;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _value;

            changestyle(_ddata.Rows.Count);

            PlaceHolder1.Controls.Add(_lt);
        }
        private DataTable GetRptData()
        {
            //lblprj.Text = "123";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsdocument _objcls = new _clsdocument();
            _clscmsdocument _objcls1 = new _clscmsdocument();

  
            DataTable dt = new DataTable();
            _objdb.DBName = "DBCML";

            Session["GraphType"] = htype.Value.ToString();

            if (htype.Value == "1")
            {
 
                _objcls.project_code = lblprj.Text;
                _objcls.folder_id = Convert.ToInt16(lblfolder.Text);
                dt = _objbll.Generate_DocumentStatus(_objcls, _objdb);
            }
            else
            {

                _objcls1.Type = htype.Value;
                _objcls1.srv_id = Convert.ToInt16(lblfolder.Text);
                _objcls1.project_code = lblprj.Text;

                dt = _objbll.Generate_DocumentStatus_Other(_objcls1, _objdb);

            }
          
            return dt;
    }


        protected void rdaction_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            if (rdaction.SelectedText.ToString() == "O&M")
            {
                htype.Value = "1";
                dvstatushead.Visible = false;

            }
            else
            {
                htype.Value = "2";
                dvstatushead.Visible = true;

            }
             Generate_Graph();
        }
    }
}