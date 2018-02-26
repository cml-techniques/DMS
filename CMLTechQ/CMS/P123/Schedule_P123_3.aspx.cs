using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PassProtection;
using System.IO;
using BusinessLogic;
using App_Properties;
namespace CMLTechQ.CMS.P123
{
    public partial class Schedule_P123_3 : System.Web.UI.Page
    {
        public static DataTable _dtMaster;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string _prjid = Request.QueryString["Auth2"].ToString();
                lblsrv.Text = Request.QueryString["Auth3"].ToString();
                lblcas.Text = Request.QueryString["Auth4"].ToString();
                lblprjid.Text = _prjid;
                Get_ProjectInfo();
                Get_User();
                Generate_Nav();
                Load_Master();
                Load_Details();
                Load_Flvl();

            }
        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Auth1"].ToString();
            lbluserhidden.Text = _prm;
            string _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
        }
        private void Get_ProjectInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(lblprjid.Text);
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
        }
        private void Generate_Nav()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsuser _objcls = new _clsuser();
            //_objdb.DBName = "DBCML";
            //_objcls.uid = lbluserid.Text;
            //_objcls.project_code = lblprj.Text;
            //string _permission = _objbll.Get_User_Permission(_objcls, _objdb);
            _objdb.DBName = "DB_" + lblprj.Text;
            DataTable _dtmodule = _objbll.Load_Prj_Service(_objdb);
            string _head = "<ul class='recent_works1' id='recent_works1'>";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;
            foreach (DataRow _drow in _dtmodule.Rows)
            {
                string _menuItem = "";
                if (_idx == 0)
                    _menuItem = "<li class='current' ><a class='current' href='#' onclick='GetNav(" + _drow["PRJ_SER_ID"].ToString() + ");' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
                else
                    _menuItem = "<li><a href='#' onclick='GetNav(" + _drow["PRJ_SER_ID"].ToString() + ");' >" + _drow["PRJ_SER_NAME"].ToString() + "</a></li>";
                _item = _item + _menuItem;
                _idx += 1;
            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            PlaceHolder1.Controls.Add(_lt);
        }
        private void Load_Master()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            _clscassheet _objcas = new _clscassheet();
            _objcas.sch = Convert.ToInt32(lblcas.Text);
            _objcas.prj_code = lblprj.Text;
            _dtMaster = _objbll.Load_casMain_Edit(_objcas, _objdb);
        }
        private void Load_Details()
        {
            DataTable _dtable = new DataTable();
            _dtable.Columns.Add("sys_id", typeof(string));
            _dtable.Columns.Add("sys_name", typeof(string));
            _dtable.Columns.Add("cat", typeof(string));
            var distinctRows = (from DataRow dRow in _dtMaster.Rows
                                select new { col1 = dRow["Sys_Id"], col2 = dRow["Sys_name"], col3 = dRow["Cat"] }).Distinct();
            foreach (var row in distinctRows)
            {
                DataRow _row = _dtable.NewRow();
                _row[0] = row.col1.ToString();
                _row[1] = row.col2.ToString();
                _row[2] = row.col3.ToString();
                _dtable.Rows.Add(_row);
            }
            //PagedDataSource _objdata = new PagedDataSource();
            //_objdata.DataSource = _dt.DefaultView;
            //_objdata.AllowPaging = true;
            //_objdata.PageSize = 20;
            //_objdata.CurrentPageIndex = GetCurrentPageNumber;
            //if (_objdata.PageCount > 0)
            //{
            //    rptmember.DataSource = _objdata;
            //    rptmember.DataBind();
            //}
            rptmmain.DataSource = _dtable;
            rptmmain.DataBind();
        }
        protected void rptmmain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    Label _sys_id = (Label)e.Row.FindControl("lbSys_Id");
            //    DataTable _dtdetails = new DataTable();
            //    var _details = from _data in _dtresult.AsEnumerable()
            //                   where _data.Field<int>("Sys_Id") == Convert.ToInt32(_sys_id.Text)
            //                   select _data;
            //    _dtdetails = _details.Any() ? _details.CopyToDataTable() : _dtMaster.Clone();
            //    GridView _mydetails = (GridView)e.Row.FindControl("mydetails");
            //    _mydetails.DataSource = _dtdetails;
            //    _mydetails.DataBind();
            //}
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _sys_id = (Label)e.Item.FindControl("lblsys");
                DataTable _dtdetails = new DataTable();
                var _details = from _data in _dtMaster.AsEnumerable()
                               where _data.Field<int>("Sys_Id") == Convert.ToInt32(_sys_id.Text)
                               select _data;
                _dtdetails = _details.Any() ? _details.CopyToDataTable() : _dtMaster.Clone();
                Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails");
                _rptdetails.DataSource = _dtdetails;
                _rptdetails.DataBind();
            }
        }

        protected void btnclosepopup_Click(object sender, EventArgs e)
        {
            btnpopup_ModalPopupExtender.Hide();
        }
        protected void btnclosepopup1_Click(object sender, EventArgs e)
        {
            btnpopup1_ModalPopupExtender.Hide();
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (EmptyValidation() == true) return;
            Add_CAS();
            Load_Master();
            Load_Details();
            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('CAS Entry Updated');", true);
        }
        private bool EmptyValidation()
        {
            if (txt_eref.Text.Length <= 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter Engineers Reference');", true);
                txt_eref.Focus();
                return true;
            }
            else if (txt_bz.Text.Length <= 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter Building/ Zone');", true);
                txt_bz.Focus();
                return true;
            }
            else if (IfExistRef() == true) return true;
            return false;
        }
        private bool IfExistRef()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            _clscassheet _objcls = new _clscassheet();
            _objcls.reff = txt_eref.Text;
            if (_objbll.Check_EngRef(_objcls, _objdb) != 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Engineer Ref. Already Exist!');", true);
                return true;
            }
            return false;

        }
        private void Load_Flvl()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            drflvl.DataSource = _objbll.Load_Flvl(_objdb);
            drflvl.DataTextField = "F_Level";
            drflvl.DataValueField = "F_Level";
            drflvl.DataBind();
        }
        private void Get_Cat()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            _clscassheet _objcls = new _clscassheet();
            _objcls.sys = Convert.ToInt32(lblsch.Text);
            txt_cat.Text = _objbll.Get_Category(_objcls, _objdb);
        }
        protected void Add_CAS()
        {
            string _sys = hid.Value;
            string _cat = cat.Value;
            string _cas = hcid.Value;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lblprj.Text;
            _clscassheet _objcas = new _clscassheet();
            _objcas.c_s_id = 3;
            _objcas.prj_code = lblprj.Text;
            _objcas.uid = lbluserid.Text;
            _objcas.sys = Convert.ToInt32(_sys);
            _objcas.reff = txt_eref.Text;
            _objcas.b_zone = txt_bz.Text;
            _objcas.cate = _cat;
            _objcas.f_level = drflvl.SelectedItem.Text;
            _objcas.desc = "";
            _objcas.loca = txt_loc.Text;
            _objcas.p_power_to = txt_ppto.Text;
            _objcas.fed_from = txt_ff.Text;
            _objcas.desc = txt_are.Text;
            _objcas.sub_st = "";
            _objcas.s_c_m = "";
            _objcas.dev1 = "";
            _objcas.dev2 = "";  
            _objcas.dev3 = "";
            _objcas.mode = 1;
            _objcas.cas_id = Convert.ToInt32(_cas);
            int _pos = 0;
            if (_cas != "0")
                _pos = Convert.ToInt32(_cas);
            else
                _pos = Get_Position(_sys);
            _objcas.Position = _pos;
            _objcas.seq_no = Get_SeqNo(_pos, _sys);
            _objbll.Cassheet_Master(_objcas, _objdb);
        }
        private int Get_Position(string _sys)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clscassheet _objcls = new _clscassheet();
            _objdb.DBName = "DB_" + lblprj.Text;
            _objcls.sys = Convert.ToInt32(_sys);
            return _objbll.Get_Position(_objcls, _objdb);
        }
        private int Get_SeqNo(int _pos, string _sys)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clscassheet _objcls = new _clscassheet();
            _objdb.DBName = "DB_" + lblprj.Text;
            _objcls.sys = Convert.ToInt32(_sys);
            _objcls.f_level = drflvl.SelectedItem.Text;
            _objcls.b_zone = txt_bz.Text;
            _objcls.Position = _pos;
            return _objbll.Get_Seq(_objcls, _objdb);
        }
        private void Reset()
        {

        }
        protected void btncancel1_Click(object sender, EventArgs e)
        {
            uploadFiles();
        }
        private void uploadFiles()
        {
            HttpFileCollection hfc = HttpContext.Current.Request.Files;
            int numFiles = Request.Files.Count;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();

            // string _dir = (string)Session["project"];
            if (Directory.Exists(Server.MapPath("Documents") + "\\" + lblprj.Text) == false)
                Directory.CreateDirectory(Server.MapPath("Documents") + "\\" + lblprj.Text);
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                string _fileName = System.IO.Path.GetFileName(hpf.FileName);

                //if (FileValidation(_fileName)) return;


                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Document uploaded!');", true);
            }
            btnpopup1_ModalPopupExtender.Show();
        }
    }
}