using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;
using PassProtection;

namespace CMLTechQ.DMS
{
    public partial class dms_lib : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Load_Basket();
            }
        }

        private void Load_Basket1()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            upload_doc.DataSource = _objbll.Load_dms_library_general(_objdb);
            upload_doc.DataBind();



        }
        private void Load_Basket()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            //datatable_fixed_column.DataSource = _objbll.Load_dms_library_general(_objdb);
            //datatable_fixed_column.DataBind();

            string _head = "<tbody>";
            string _foot = "</tbody>";
            string _item = "";
            //string value = "<tr>";

            DataTable _dtcas = _objbll.Load_dms_library_general(_objdb);
            foreach (DataRow dr in _dtcas.Rows)
            {

                string _menuItem = "";

                _menuItem = "<tr><td> <input type='checkbox' id='chkcbx'  clas='call-checkbox' onclick='getid(this," + dr[0].ToString() + ")'; /> </td><td> " + dr["MANF_NAME"].ToString() + "</td>" + "<td>" + dr["CONTRA_TYPE"].ToString() + "</td><td>" + dr["Model"].ToString() + "</td><td>" + dr["FILE_NAME"].ToString() + "</td><td><input type='button' value='edit' onclick=goedit(" + dr[0].ToString() + "); /></td><td><input type='button' value='Delete' id='bb' onclick=godelete(" + dr[0].ToString() + "); /></td></tr>";
                _item = _item + _menuItem;

            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            pls1.Controls.Add(_lt);

        }
    }
}