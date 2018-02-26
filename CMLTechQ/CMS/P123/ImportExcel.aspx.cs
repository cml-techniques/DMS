using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.IO;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;

namespace CMLTechQ.CMS
{
    public partial class ImportExcel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string _prm = Request.QueryString[0].ToString();

               lblprjid.Text= Request.QueryString["Auth2"].ToString();
               lbluserhidden.Text = Request.QueryString["Auth1"].ToString();
               Get_ProjectInfo();
               Generate_Nav();
               lbsch.Text = Request.QueryString["Auth3"].ToString();
               if (lblsch.Text == "2")
               {
                   lbltitle.Text = "Electrical > High-Medium Voltage - Import from Excel";
               }
               else
                   lbltitle.Text = "Electrical > Transformer - Import from Excel";


            }
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
            _objdb.DBName = "DB_" + lbprj.Text;
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
        private void Get_ProjectInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(lblprjid.Text);
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            lbprj.Text = _dt.Rows[0].ItemArray[0].ToString();
        }


        protected void btnupload_Click(object sender, EventArgs e)
        {
            uploadFiles();
            Insert_to_DB();
            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Documents Uploaded!');", true);
        }

        private void uploadFiles()
        {
            HttpFileCollection hfc = Request.Files;
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    FileInfo _info = new FileInfo(Server.MapPath("Cassheet") + "\\" + System.IO.Path.GetFileName(hpf.FileName));
                    if (_info.Exists == true) _info.Delete();
                    hpf.SaveAs(Server.MapPath("Cassheet") + "\\" + System.IO.Path.GetFileName(hpf.FileName));
                    Session["xls"] = System.IO.Path.GetFileName(hpf.FileName);
                }
                //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Documents Uploaded!');", true);
            }
        }
        static bool IsNumeric(object Expression)
        {
            // Variable to collect the Return value of the TryParse method.
            bool isNum;

            // Define variable to collect out parameter of the TryParse method. If the conversion fails, the out parameter is zero.
            double retNum;

            // The TryParse method converts a string in a specified style and culture-specific format to its double-precision floating point number equivalent.
            // The TryParse method does not generate an exception if the conversion fails. If the conversion passes, True is returned. If it does not, False is returned.
            isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
            return isNum;
        }
        private void Insert_to_DB()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DB_" + lbprj.Text;
            _clscassheet _objcas = new _clscassheet();
            DataSet _dset = Read_File();
            //UploadError _obj = new UploadError();
            //_obj.clear();
            int _Idx = 0;
            int _Insert = 0;
            foreach (DataRow row in _dset.Tables[0].Rows)
            {
                _Idx += 1;
                string _sch = lbsch.Text;
                _objcas.c_s_id = Convert.ToInt32(_sch);
                _objcas.prj_code = lbprj.Text;
                _objcas.uid = "admin@cmlinternational.net";
                _objcas.reff = row[0].ToString();
                _objcas.b_zone = row[1].ToString();
                _objcas.cate = row[2].ToString();
                _objcas.sch = Convert.ToInt32(_sch);
                _objcas.sys = _objbll.Get_SysId(_objcas, _objdb);
                _objcas.f_level = row[3].ToString();
                int _sqno = 0;
                if (IsNumeric(row[4].ToString()) == true)
                    _sqno = Convert.ToInt32(row[4].ToString());
                _objcas.seq_no = _sqno;
                _objcas.loca = "";
                _objcas.p_power_to = "";
                _objcas.fed_from = "";
                _objcas.sub_st = "";
                _objcas.desc = "";
                _objcas.dev1 = "";
                _objcas.dev2 = "0";
                _objcas.dev3 = "0";
                if (_sch == "3")
                {
                    _objcas.loca = row[5].ToString();
                    _objcas.p_power_to = row[7].ToString();
                    _objcas.fed_from = row[6].ToString();
                    _objcas.sub_st = row[8].ToString();
                    if (lbprj.Text == "CCAD")
                        _objcas.dev1 = row[9].ToString();
                }
  

                _objcas.mode = 1;
                _objcas.cas_id = 0;
                _objcas.Position = _Idx;
                _objbll.Cassheet_Master(_objcas, _objdb);
                _Insert += 1;

            }
            string _Msg = _Insert.ToString() + " Rows Uploaded";
            ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('" + _Msg + "');", true);
        }
        private DataSet Read_File()
        {
            DataSet ds = new DataSet();
            //FileInfo _info = new FileInfo("http://63.134.201.180/ControlPanel/MEMBER_UPLOADS/" + (string)Session["xls"]);
            FileInfo _info = new FileInfo(Server.MapPath("Cassheet") + "\\" + (string)Session["xls"]);
            if (_info.Exists == false) return ds;
            string filelocation = _info.FullName;
            //string filelocation = "http://63.134.201.180/ControlPanel/MEMBER_UPLOADS/" + (string)Session["xls"];
            OleDbCommand excelCommand = new OleDbCommand(); OleDbDataAdapter excelDataAdapter = new OleDbDataAdapter();
            string excelConnStr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + filelocation + "; Extended Properties ='Excel 8.0;HDR=Yes;IMEX=1'";
            OleDbConnection excelConn = new OleDbConnection(excelConnStr);
            excelConn.Open();
            DataTable dtPatterns = new DataTable();
            string _sch_id = lbsch.Text;
            string _Table = "";
            if (_sch_id == "2")
            {
                    excelCommand = new OleDbCommand("SELECT `ENG_REF` as ENG_REF,`BUILDING_ZONE` as BUILDING_ZONE,`CATEGORY` as CATEGORY,`FLOOR_LEVEL` as FLOOR_LEVEL,`SEQ_NO` as SEQ_NO,`LOCATION` as LOCATION,`FED_FROM` as FED_FROM,`PROVIDES_POWER_TO` as PROVIDES_POWER_TO,`SUBSTATION` AS SUBSTATION FROM [E1$]", excelConn);
                _Table = "E1";
            }

            
            excelDataAdapter.SelectCommand = excelCommand;
            excelDataAdapter.Fill(dtPatterns);
            dtPatterns.TableName = _Table;
            ds.Tables.Add(dtPatterns);
            return ds;


        }
    }
}