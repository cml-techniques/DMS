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
    public partial class DMS_Library_new : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                Get_User();


                Load_LibraryInfo();
                Load_Manufacturer();

            }
        }



        private void Load_LibraryInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            //datatable_fixed_column.DataSource = _objbll.Load_dms_library_general(_objdb);
            //datatable_fixed_column.DataBind();

            string _head = "<tbody >";
            string _foot = "</tbody>";
            string _item = "";
            //string value = "<tr>";

            DataTable _dtcas = _objbll.Load_dms_library_general(_objdb);

            foreach (DataRow dr in _dtcas.Rows)
            {

                string _menuItem = "";

                _menuItem = "<tr ><td> <input  type='checkbox' id=" + dr["ITM_ID"].ToString() + "  /> </td><td> " + dr["MANF_NAME"].ToString() + "</td>" + "<td>" + dr["CONTRA_TYPE"].ToString() + "</td><td>" +
                    dr["Model"].ToString() + "</td><td class='tdfile'>" + dr["FILE_NAME"].ToString() + "</td><td ><a href='#'><i class='fa fa-pencil-square-o'></i></a></td><td ><a href='#'><i class='fa fa-trash-o'></i></a></td><td class='dispnone'>" + dr["ITM_ID"].ToString() + "</td><td class='dispnone'>" + dr["SOURCE_NAME"].ToString() + "</td><td class='dispnone'>" + dr["file_size"].ToString() + "</td></tr>";
                _item = _item + _menuItem;

            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            pls1.Controls.Add(_lt);

        }



        protected void btnManusave_Click(object sender, EventArgs e)
        {
            Upload();

        }
        private bool Upload()
        {

            bool uploads = false;



            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();

            string _filename = hfile.Value;
            if (haction.Value == "1")
                _objcls.doc_id = 0;
            else
            {
                _objcls.doc_id = Convert.ToInt16(hdndocid.Value);

            }
            _objcls.service_code = 0;
            _objcls.schid = 0;
            _objcls.party_id = Convert.ToInt32(ddlManufacturer.SelectedValue);
            _objcls.type = txttype.Text;
            _objcls.doc_title = txtmodel.Text;
            _objcls.doc_name = _filename;
            _objcls.reff = txtsourec.Text;
            _objcls.action = Convert.ToInt32(haction.Value);


            decimal clength;

            if (hfilesize.Value.Contains("MB"))
            {
                _objcls.file_size = hfilesize.Value;

            }
            else
            {
                decimal _size_in_mb;
                if (!string.IsNullOrEmpty(hfilesize.Value))
                {

                    clength = Convert.ToDecimal(hfilesize.Value.ToString());

                    _size_in_mb = decimal.Round((clength / 1024m) / 1024m, 2);
                }
                else _size_in_mb = 0;

                _objcls.file_size = _size_in_mb.ToString() + "MB";

            }


            _objcls.action = Convert.ToInt32(haction.Value);
            _objbll.dml_dms_library_general_new(_objcls, _objdb);
            uploads = true;

            if (Convert.ToInt16(haction.Value) == 1)
            {
                //lblmsgs.Text = "Document successfully Saved";
                //Response.Redirect("DMS_Library_new.aspx?" + Request.QueryString.ToString());

                ScriptManager.RegisterStartupScript(this, typeof(string), "function", "SaveUpdate(" + Get_MaxseqNo() + ",1);", true);

            }
            else
                ScriptManager.RegisterStartupScript(this, typeof(string), "closemdl", "SaveUpdate(0,2);", true);


            uploads = false;
            //clear();
            return true;
        }




        protected void btsaveManu_Click(object sender, EventArgs e)
        {
            ddlManufacturer.ClearSelection();

            if (Check_Exist() == 1)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "messages", "Messages(2);", true);


                ddlManufacturer.Items.FindByText(txtmanufacturer.Text).Selected = true;

                return;
            }


            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsmanufacture _objcls = new _clsmanufacture();
            _objcls.project_code = lblprj.Text;
            _objcls.man_name = txtmanufacturer.Text;
            _objbal.Insert_Manufaturer_tbl_General(_objcls, _objdb);

            Load_Manufacturer();

            //ScriptManager.RegisterStartupScript(this, typeof(string), "Savedmanu", "alert('Manufacturer Added Successfully');", true);
            ScriptManager.RegisterStartupScript(this, typeof(string), "messages", "Messages(3);", true);
            ScriptManager.RegisterStartupScript(this, typeof(string), "closemdl", "closeModal(1);", true);

            ddlManufacturer.Items.FindByText(txtmanufacturer.Text).Selected = true;

        }
        private int Check_Exist()
        {
            int manfId;
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsmanufacture _objcls = new _clsmanufacture();
            _objcls.project_code = lblprj.Text;
            _objcls.man_name = txtmanufacturer.Text;

            manfId = _objbal.Check_Manufacture_Exits(_objcls, _objdb);
            return manfId;
        }
        private bool Check_Exist(Telerik.Web.UI.RadDropDownList _drop, string _item)
        {
            foreach (Telerik.Web.UI.DropDownListItem _lst in _drop.Items)
            {
                if (string.Compare(_lst.Text, _item) == 0) return true;
            }
            return false;
        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = lbluseridhidden.Text;
            //string _prm = "";
            //lbluserhidden.Text = _prm;
            string _decoded = "";
            if (_prm.IndexOf("?wmode") > 0)
                _decoded = _obj.Decoding(_prm.Substring(0, _prm.IndexOf("?wmode")));
            else
                _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
        }
        private void Get_ProjectInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(Request.QueryString["Auth2"].ToString());
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
        }

        private void Load_Manufacturer()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";

            ddlManufacturer.DataSource = _objbll.dms_manufacuter_general(_objdb);
            ddlManufacturer.DataTextField = "MANF_NAME";
            ddlManufacturer.DataValueField = "MANF_ID";
            ddlManufacturer.DataBind();

        }
        void delete()
        {
            try
            {
                BLL_Dml _objbll = new BLL_Dml();
                _database _objdb = new _database();
                _clsdocument _objcls = new _clsdocument();
                _objdb.DBName = "DBCML";
                _objcls.doc_id = Convert.ToInt16(hdndocid.Value);
                _objcls.service_code = 0;
                _objcls.schid = 0;
                _objcls.party_id = 0;
                _objcls.type = "";
                _objcls.doc_title = "";
                _objcls.doc_name = "";
                _objcls.reff = "";
                _objcls.action = 3;
                _objcls.file_size = "";
                _objbll.dml_dms_library_general_new(_objcls, _objdb);

                //hedit.Value = "0";

                //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Document successfilly Deleted!');", true);

                ScriptManager.RegisterStartupScript(this, typeof(string), "messages", "Messages(1);", true);

            }
            catch (Exception)
            {
                throw;
            }
        }
        void clear()
        {
            ddlManufacturer.SelectedIndex = 0;
            //txt_file.Text = "";
            txtmanufacturer.Text = "";
            txttype.Text = "";
            txtsourec.Text = "";
            txtmodel.Text = "";

            //btnsave.Text = "Save";


            //hedit.Value = "0";
            haction.Value = "1";
        }
        void AddToProject()
        {

            char[] delimiterChars = { ',' };
            string[] words = hdnvalue.Value.Split(delimiterChars);

            int _savedoccount = 0;
            int _countitem = 0;
            foreach (string _doc_id in words)
            {
                if (checkexsts(_doc_id) > 0)
                {

                    //ScriptManager.RegisterStartupScript(this, typeof(string), "hide", "alert(' " + doc_name + ": already Exists');", true);

                    //lblmsgs.Text = "" + doc_name + ": already Exists'";

                }
                else
                {

                    AddToProject(Convert.ToInt32(_doc_id));

                    _savedoccount += 1;
                    //ScriptManager.RegisterStartupScript(this, typeof(string), "hide", "alert('" + _countitem.ToString() + " documents added to the project');", true);


                }
                _countitem += 1;


            }

            ScriptManager.RegisterStartupScript(this, typeof(string), "messages", "Messages(4);", true);
            //ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('" + _savedoccount.ToString() + " : documents added to the project');", true);



        }
        private int checkexsts(string docid)
        {


            int existcount = 0;

            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.doc_id = Convert.ToInt32(docid);

            existcount = _objbll.Get_Document_Library_Count(_objcls, _objdb);


            return existcount;
        }

        private void AddToProject(int _id)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = _id;
            _objcls.project_code = lblprj.Text;
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.uid = lbluserid.Text;
            _objbll.AddToProject_Library(_objcls, _objdb);


        }

        protected void btnaddtoproject_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hdnvalue.Value))
            {
                AddToProject();
            }

        }

        protected void btndlete_Click(object sender, EventArgs e)
        {
            delete();

        }
        private string Get_MaxseqNo()
        {
            string SqlNo = "";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";

            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = 0;

            DataTable dt = _objbll.Get_MaxSeqNo(_objdb);
            SqlNo = dt.Rows[0][0].ToString();
            return SqlNo;
        }
    }
}