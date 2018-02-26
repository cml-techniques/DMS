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
using System.IO;

namespace CMLTechQ.DMS
{
    public partial class ViewFullDocument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              if (!IsPostBack)
            {

                string PName = "";
                if (Request.UrlReferrer != null)
                {
                    PName = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
                }

                if (PName == "")
                {
                    Response.Redirect("https://dms.cmltechniques.com");
                }




                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblid.Text = Request.QueryString["Auth3"].ToString();
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lbldocid.Text = Request.QueryString["Auth4"].ToString();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                GetDefaultNav(lblid.Text);

               // string _docname = Request.QueryString["Auth5"].ToString();


                Get_Title();

                string _path = "";
                string _docname = "";
                _docname = Get_DocumentFileName();
                 _path = "https://dms.cmltechniques.com/DMS/Documents/" + _docname;


                if (!String.IsNullOrEmpty(Request.QueryString["Auth6"]))
                {
                    if (Request.QueryString["Auth6"].ToString() == "1")
                    {

                        _docname = Request.QueryString["Auth5"].ToString();
                        string ProjectCode = Get_ProjectInfo();
                        _path = "https://cmltechniques.com/CMS_DOCS/" + ProjectCode +"/" + _docname;

                        lbl_doctitle.Text = Request.QueryString["Auth7"].ToString();
                    }

                }

               
                documentviewer.Attributes.Add("src", _path);

             
                Generate_Nav(true);
    
            }
        }
        private string Get_ProjectInfo()
        {
            string ProjectCode = "";
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(Request.QueryString["Auth2"].ToString());
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            if (_dt.Rows.Count>0)  ProjectCode =_dt.Rows[0]["prj_code"].ToString();
            return ProjectCode;
        }
        private string Get_DocumentFileName()
        {
            string DocumentFileName = "";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            DataTable dt = _objbll.Get_DocumentFileName(_objcls, _objdb);
            if (dt.Rows.Count > 0) DocumentFileName = dt.Rows[0][0].ToString();
            return DocumentFileName;
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
        private void Get_Title()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            lbl_doctitle.Text = _objbll.Get_DocumentTitle(_objcls, _objdb);
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

        protected void btnaddtreee_Click(object sender, EventArgs e)
        {

        }
        private void Generate_Nav(bool _postback)
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


            foreach (DataRow _drow in _dtcas.Rows)
            {

                string _menuItem = "";
                string parm = "";

                //string _folder =_drow["Folder_code"].ToString()+" " +_drow["folder_description"].ToString();
                string _folder = _drow["folder_description"].ToString();

                if (_folder.Length > 30)
                    _folder = _folder.Substring(0, 30) + "...";

                parm = _drow["folder_id"].ToString() + "," + _drow["Folder_possition"].ToString() + "," + _drow["DefNav"].ToString();


                if (_idx == _pos)
                {
                    hfolder.Value = _drow["folder_id"].ToString();
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