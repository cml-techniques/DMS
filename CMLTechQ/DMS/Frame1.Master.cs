using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using PassProtection;
using System.Data;


namespace CMLTechQ.DMS
{
    public partial class Frame1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //lblprjid.Text = Request.QueryString["Auth2"].ToString();
                //lblid.Text = Request.QueryString["Auth3"].ToString();
                //lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                //Get_User();
                //lblfolder.Text = Request.QueryString["Auth3"].ToString();
                //Get_ProjectInfo();
                //GetDefaultNav(lblid.Text);
                //Generate_Nav();

            }
        }
        
        private void GetDefaultNav(string folder_id)
        {
            //string defaultnav = "0";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clstreefolder _objcls = new _clstreefolder();
            _objdb.DBName = "DBCML";
            _objcls.Folder_id = Convert.ToInt16(folder_id);

            DataTable dt = _objbll.Get_DafaultNavFolder(_objcls, _objdb);
            if (dt.Rows.Count > 0)
            {
                hfolder.Value = dt.Rows[0]["Folder_id"].ToString();
                //hpos.Value = dt.Rows[0]["Folder_possition"].ToString();
            }

        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Auth1"].ToString();
            lbluseridhidden.Text = _prm;
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
        int getservice_folder()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.package_code = Convert.ToInt32(lblfolder.Text);
            int folder = _objbll.Get_Servicefolder(_objcls, _objdb);

            return folder;

        }
        private void Generate_Nav()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clstreefolder _objcls = new _clstreefolder();
            //_objcls.Folder_id = Convert.ToInt32(lblid.Text);
            _objcls.Folder_id = getservice_folder();
            DataTable _dtcas = _objbll.Load_AllsubFolders(_objcls, _objdb);
            string _head = "<ul class='nav'>";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;
            int _pos = 0;

            //if (!_postback)
            //{
            //    if (!string.IsNullOrEmpty(hfolder.Value))
            //    {
            //        if (_dtcas.Rows.Count > 0)
            //        {
            //            DataRow[] dr = _dtcas.Select("folder_id=" + hfolder.Value);
            //            _pos = Convert.ToInt16(dr[0]["Folder_possition"]) - 1;

            //        }

            //    }
            //    else _pos = 0;
            //}
            //else _pos = 0;


            foreach (DataRow _drow in _dtcas.Rows)
            {

                string _menuItem = "";
                string parm = "";

                //string _folder =_drow["Folder_code"].ToString()+" " +_drow["folder_description"].ToString();
                string _folder = _drow["folder_description"].ToString();

                if (_folder.Length > 30)
                    _folder = _folder.Substring(0, 30) + "...";

                parm = _drow["folder_id"].ToString() + "," + _drow["Folder_possition"].ToString() + "," + _drow["DefNav"].ToString();


                if (_drow["folder_id"].ToString() == hfolder.Value)
                {
                    //hfolder.Value = _drow["folder_id"].ToString();
                    hpos.Value = _drow["Folder_possition"].ToString();




                    _menuItem = "<li class='item current' ><a href='#' onclick=GetNav(" + parm + "); title=" + _drow["folder_description"].ToString().Replace(" ", "&nbsp;") + " >" + _folder + "<i class='icon-chevron-right pull-right icon'></i></a>";

                    //_menuItem = "<li class='item current'><a href='#' onclick=goup(" + parm + ");><i class='icon-arrow-up pull-left icon'></i></a><a class='current' href='#' onclick=GetNav(" + parm + ");" + _drow["folder_description"].ToString() + " </a><a href='#' onclick=godown(" + parm + ");><i class='icon-arrow-down pull-right icon'></i></a></li>";

                }
                else
                {
                    //parm = _drow["folder_id"].ToString() + "," + _drow["Folder_possition"].ToString();
                    _menuItem = "<li class='item' ><a href='#' onclick=GetNav(" + parm + ");   title=" + _drow["folder_description"].ToString().Replace(" ", "&nbsp;") + " >" + _folder + "<i class='icon-chevron-right pull-right icon'></i></a>";
                    // _menuItem = "<li class='item'><a href='#' onclick=goup(" + parm + ");><i class='icon-arrow-up pull-left icon'></i></a><a href='#' onclick=GetNav(" + parm + ");" + _drow["folder_description"].ToString() + " </a><a href='#' onclick=godown(" + parm + ");><i class='icon-arrow-down pull-right icon'></i></a></li>";
                }
                _item = _item + _menuItem;
                _idx += 1;

            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            ph_nav.Controls.Add(_lt);

            //UpdatePanel4.Update();

        }


    }
}