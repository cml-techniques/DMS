using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;

namespace CMLTechQ.AMS
{
    public partial class Newasset : System.Web.UI.Page
    {
        public static DataTable _dtcas;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Service();
                Load_Vendor();
                Load_Location();
                Load_Room();
                Load_Cassheet();
            }
        }
        private void Load_Vendor()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            listvendor.DataSource = _objbll.Load_Manufacturer(_objdb);
            listvendor.DataTextField = "Manuf_Name";
            listvendor.DataValueField = "Manuf_Id";
            listvendor.DataBind();
        }
        private void Load_Location()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            listloc.DataSource = _objbll.Load_amslocation(_objdb);
            listloc.DataTextField = "location_name";
            listloc.DataValueField = "location_id";
            listloc.DataBind();
        }
        private void Load_Room()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            listroom.DataSource = _objbll.Load_amsroom(_objdb);
            listroom.DataTextField = "room_name";
            listroom.DataValueField = "room_id";
            listroom.DataBind();
        }
        private void Load_Service()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            listserv.DataSource = _objbll.Load_Prj_Service(_objdb);
            listserv.DataTextField = "PRJ_SER_NAME";
            listserv.DataValueField = "PRJ_SER_ID";
            listserv.DataBind();
        }
        protected void listserv_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_serv.Text = listserv.SelectedItem.Text;
            lbl_serv.Text = listserv.SelectedValue;
            if (lbl_serv.Text != "0")
                Load_AssetCategory();
        }
        protected void listloc_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_loc.Text = listloc.SelectedItem.Text;
        }
        protected void listvendor_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_vendor.Text = listvendor.SelectedItem.Text;
        }
        protected void listroom_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_room.Text = listroom.SelectedItem.Text;
        }

        protected void btn_vendor_Click(object sender, EventArgs e)
        {
            txt_vendor_name.Text = String.Empty;
            btndummy_ModalPopupExtender.Show();
        }

        protected void btnsave_vendor_Click(object sender, EventArgs e)
        {
            if (txt_vendor_name.Text == String.Empty)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter Vendor Name');", true);
                return;
            }
            Add_Vendor();
            Load_Vendor();
            btndummy_ModalPopupExtender.Hide();
        }

        protected void btncancel_vendor_Click(object sender, EventArgs e)
        {
            btndummy_ModalPopupExtender.Hide();
        }
        private void Add_Vendor()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            _clsams _objcls = new _clsams();
            _objcls.manufId = 0;
            _objcls.manufName = txt_vendor_name.Text;
            _objcls.action = 1;
            _objbll.DML_Manufacturer(_objcls, _objdb);
        }
        private void Add_Location()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            _clsams _objcls = new _clsams();
            _objcls.id = 0;
            _objcls.location = txt_loc_name.Text;
            _objcls.action = 1;
            _objbll.dml_amslocation(_objcls, _objdb);
        }
        private void Add_Room()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            _clsams _objcls = new _clsams();
            _objcls.id = 0;
            _objcls.location = txt_room_name.Text;
            _objcls.action = 1;
            _objbll.dml_amsroom(_objcls, _objdb);
        }
        protected void btnsave_location_Click(object sender, EventArgs e)
        {
            if (txt_loc_name.Text == String.Empty)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter Location Name');", true);
                return;
            }
            Add_Location();
            Load_Location();
            btndummy1_ModalPopupExtender.Hide();
        }
        protected void btncancel_location_Click(object sender, EventArgs e)
        {
            btndummy1_ModalPopupExtender.Hide();
        }

        protected void btn_loc_Click(object sender, EventArgs e)
        {
            txt_loc_name.Text = String.Empty;
            btndummy1_ModalPopupExtender.Show();
        }

        protected void btnsave_room_Click(object sender, EventArgs e)
        {
            if (txt_room_name.Text == String.Empty)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter Room Name');", true);
                return;
            }
            Add_Room();
            Load_Room();
            btndummy2_ModalPopupExtender.Hide();
        }

        protected void btncancel_room_Click(object sender, EventArgs e)
        {
            btndummy2_ModalPopupExtender.Hide();
        }

        protected void btn_room_Click(object sender, EventArgs e)
        {
            txt_room_name.Text = String.Empty;
            btndummy2_ModalPopupExtender.Show();
        }
        protected void listcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_category.Text = listcat.SelectedItem.Text;
            lbl_cate.Text = listcat.SelectedValue;
            Get_CategoryCode();
        }

        protected void listgroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_group.Text = listgroup.SelectedItem.Text;
            lbl_group.Text = listgroup.SelectedValue;
            if (lbl_group.Text != "0")
                load_cas_sys();
        }

        private void Load_Cassheet()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsuser _objcls = new _clsuser();
            _objdb.DBName = "DB_" + "123";
            _dtcas = _objbll.Load_Prj_Cassheet(_objdb);
        }
        private void Load_AssetCategory()
        {
            var _result = _dtcas.Select("SYS_SER_ID=" + Convert.ToInt32(lbl_serv.Text));
            DataTable _dtresult = _result.Any() ? _result.CopyToDataTable() : _dtcas.Clone();
            listgroup.DataSource = _dtresult;
            listgroup.DataTextField = "PRJ_CAS_NAME";
            listgroup.DataValueField = "PRJ_CAS_ID";
            listgroup.DataBind();
        }


        protected void load_cas_sys()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            _clscassheet _objcls = new _clscassheet();
            _objcls.sch = Convert.ToInt32(lbl_group.Text);
            listcat.DataSource = _objbll.Load_cas_sys(_objcls, _objdb);
            listcat.DataTextField = "sys_name";
            listcat.DataValueField = "sys_id";
            listcat.DataBind();
            

        }
        private void Get_CategoryCode()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            _clscassheet _objcls = new _clscassheet();
            _objcls.sys = Convert.ToInt32(lbl_cate.Text);
            txt_cate.Text = _objbll.Get_Category(_objcls, _objdb);
        }
        private void Add_NewAsset()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + "123";
            _clsams _objcls = new _clsams();
            _objcls.ams_reg_id = 0;
            _objcls.prj_reff = txt_ref.Text;
            _objcls.sch_id = Convert.ToInt32(lbl_group.Text);
            _objcls.sys_id = Convert.ToInt32(lbl_cate.Text);
            _objcls.bzone = txt_bzone.Text;
            _objcls.cat = txt_cate.Text;
            _objcls.flvl = txt_flvl.Text;
            _objcls.seq_no = "000";
            _objcls.parent = false;
            _objcls.position = 0;
            _objcls.casId = 0;
            _objcls.location = txt_loc.Text;
            _objcls.parent_id = 0;
            _objcls.action = 1;
            _objbll.AMS_Register(_objcls, _objdb);
            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('New Equipment Created');", true);
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            Add_NewAsset();
        }
        protected void btnnav_Click(object sender, EventArgs e)
        {
            //string _id = htype.Value;
            //if (_id != "0")
            //{
            //    string _clause = "SER_ID =" + _id;
            //    var _result = _dtmaster.Select(_clause);
            //    _dtfilter = _result.Any() ? _result.CopyToDataTable() : _dtmaster.Clone();
            //}
            //else
            //    _dtfilter = _dtmaster;
            //Load_Initial_Data();
        }
    }
}