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
using PassProtection;
using Ionic.Zip;
using Telerik.Web.UI;

namespace CMLTechQ.DMS
{
    public partial class MC1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();

                if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
                {
                    hmenufolder.Value = Request.QueryString["Auth5"].ToString();
                }

                loadServicefolder();


                Load_Navigation();
            }

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
        void loadServicefolder()
        {
            if (string.IsNullOrEmpty(hmenufolder.Value)) return;

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.package_code = Convert.ToInt32(hmenufolder.Value);

            srvid.Value = _objbll.Get_ServiceFolderType(_objcls, _objdb).ToString();



        }
        private void Load_Navigation()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.project_code = lblprj.Text;
            DataTable _dttree = _objbll.Load_Buildinglevel_Navigation(_objcls, _objdb);
            //string _NavStart = "<ul>";
            //string _NavStop = "</ul>";
            var _varlv1 = _dttree.Select("Parent_Folder=0");
            string _navitem = "";
            DataTable _dtlv1 = _varlv1.Any() ? _varlv1.CopyToDataTable() : _dttree.Clone();
            string _nav ="";
            int _pos=1;
            int index = 1;


            if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
            {
                if (_dttree.Rows.Count > 0)
                {
                    DataRow[] dr = _dttree.Select("folder_id=" + srvid.Value);
                    index = Convert.ToInt32(dr[0]["Folder_possition"]) ;


                }
            }

            int numberOfRecords = 0;
            int numberOfRecords1 = 0;
            foreach (DataRow _lv1row in _dtlv1.Rows)
            {
                _nav = _lv1row["Folder_Description"].ToString();

                if (lblprj.Text == "MIANew")
                {
                    _nav = _lv1row["Folder_Code"].ToString() + " " + _nav;
                }
                if (_nav.Length >= 33)
                    _nav = _nav.Substring(0, 33) + "..";
                if (_pos == index)
                    _navitem = _navitem + "<li class='main-menu-item active'><a href='#' title='" + _lv1row["Folder_Description"].ToString() + "'>" + _nav + "</a>";
                else
                    _navitem = _navitem + "<li class='main-menu-item'><a href='#' title='" + _lv1row["Folder_Description"].ToString() + "'>" + _nav + "</a>";
                var _varlv2 = _dttree.Select("Parent_Folder=" + Convert.ToInt32(_lv1row["Folder_Id"].ToString()));

                if (_varlv2.Length > 0)
                {
                    _navitem = _navitem + "<i class='fa fa-angle-right'></i>";
                }


                string _navitem1 = "";
                DataTable _dtlv2 = _varlv2.Any() ? _varlv2.CopyToDataTable() : _dttree.Clone();
                foreach (DataRow _lv2row in _dtlv2.Rows)
                {


                    var _varlv3 = _dttree.Select("Parent_Folder=" + Convert.ToInt32(_lv2row["Folder_Id"].ToString()));

                    numberOfRecords = _dttree.Select("Parent_Folder=" + Convert.ToInt32(_lv2row["Folder_Id"].ToString()) + "AND Type=0").Length;

                    _nav = _lv2row["Folder_Description"].ToString();

                    if (lblprj.Text == "MIANew")
                    {
                        _nav = _lv2row["Folder_Code"].ToString() + " " + _nav;
                    }

                    if (_nav.Length >= 43)
                        _nav = _nav.Substring(0, 43) + "..";

                    if (numberOfRecords > 0)
                    {
                        _navitem1 = _navitem1 + "<li class='tier-two-menu-item'><a href='#'>" + _nav + "</a><i class='fa fa-angle-right'></i>";
                    }
                    else
                    {
                        _navitem1 = _navitem1 + "<li class='tier-two-menu-item'><a href='#' onclick=PageNavaigation(" + _lv2row["Folder_Id"].ToString() + "," + _lv2row["DafaultType"].ToString() + "," + _lv2row["DefaultFolder"].ToString() + "); >" + _nav + "</a>";
                    }

                    string _navitem2 = "";
                    DataTable _dtlv3 = _varlv3.Any() ? _varlv3.CopyToDataTable() : _dttree.Clone();
                    foreach (DataRow _lv3row in _dtlv3.Rows)
                    {
                        numberOfRecords1 = _dttree.Select("Parent_Folder=" + Convert.ToInt32(_lv3row["Folder_Id"].ToString())).Length;

                        _nav = _lv3row["Folder_Code"].ToString() + " " +_lv3row["Folder_Description"].ToString();
                        if (_nav.Length >= 43)
                            _nav = _nav.Substring(0, 43) + "..";

                        if (numberOfRecords1 > 0)
                        {
                            _navitem2 = _navitem2 + "<li class='tier-three-menu-item'><a href='#' onclick=PageNavaigation(" + _lv3row["Folder_Id"].ToString() + "," + _lv3row["DafaultType"].ToString() + "," + _lv3row["DefaultFolder"].ToString() + "); >" + _nav + "</a></li>";

                        }

                        numberOfRecords1 = 0;

                    }
                    if (_navitem2 != "")
                        _navitem1 = _navitem1 + "<ul>" + _navitem2 + "</ul></li>";
                    else
                        _navitem1 = _navitem1 + "</li>";

                    numberOfRecords = 0;
                }
                if (_navitem1 != "")
                    _navitem = _navitem + "<ul>" + _navitem1 + "</ul></li>";
                else
                    _navitem = _navitem + "</li>";

                _pos += 1;
            }
            LiteralControl _lt = new LiteralControl();
            _lt.Text = "<ul>" + _navitem + "</ul>";
            ph_mainNav.Controls.Add(_lt);
        }

        private void GenerateInnerNav_Doc(int type)
        {
            //string a = "";
            //a = fid.Value;

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(fid.Value);
            DataTable dt = new DataTable();
            dt = _objbll.Get_CurrentUploadFolder(_objcls, _objdb);
            string _head = "<ul class='nav'>";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;

            foreach (DataRow _drow in dt.Rows)
            {
                string _menuItem = "";
                // if (_idx == 0)
                string _folder = _drow["folder_description"].ToString();

                if (_folder.Length > 30)
                    _folder = _folder.Substring(0, 30) + "...";
                if (_idx == type - 1)
                {
                    _menuItem = "<li class='item current' ><a class='current' href='#' onclick=PageNavaigation_Doc(" + _drow["Folder_id"].ToString() + "," + _drow["type"].ToString() + ");>" + _folder + "</a></li>";
                    //lbldocFolder.Text = _drow["Folder_id"].ToString();
                }
                else
                    _menuItem = "<li class='item' ><a href='#' onclick=PageNavaigation_Doc(" + _drow["Folder_id"].ToString() + "," + _drow["type"].ToString() + ");>" + _folder + "</a></li>";
                _item = _item + _menuItem;
                _idx += 1;
            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            //PlaceHolder1.Controls.Add(_lt);

        }

        protected void btndummy_Click(object sender, EventArgs e)
        {
            GenerateInnerNav_Doc(1);
            //lblms.Text = "New msg";
          
            //Load_Navigation();
        }

    }
}