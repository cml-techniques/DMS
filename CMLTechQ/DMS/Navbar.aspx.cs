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
    public partial class Navbar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblid.Text = Request.QueryString["Auth3"].ToString();
                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();
                Get_User();
                Get_ProjectInfo();


                hfolder.Value = GetDefaultNav(lblid.Text).ToString();

                if (Convert.ToInt16(Request.QueryString["Auth4"]) > 0)
                {
                    hfolder.Value = Request.QueryString["Auth4"].ToString();
                    Generate_Nav(false);
                }
                else
                    Generate_Nav(true);
                //Generate_Nav(true);


                if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
                {

                    string defaultfolder = GetDefaultNav(hfolder.Value).ToString();
                    string type = GetFolderType(hfolder.Value);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "loadedfault", "refreshdefaultnav(" + hfolder.Value + "," + defaultfolder + "," + type + ");", true);


                }

                loadfolder();

            }
        }
        private string GetFolderType(string folder_id)
        {
            string defaultnav = "0";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clstreefolder _objcls = new _clstreefolder();
            _objdb.DBName = "DBCML";
            _objcls.Folder_id = Convert.ToInt16(folder_id);
            DataTable dt = _objbll.Get_DafaultNavFolder(_objcls, _objdb);
            if (dt.Rows.Count > 0) defaultnav = dt.Rows[0][5].ToString();
            return defaultnav;
        }
        private string GetDefaultNav(string folder_id)
        {
            string defaultnav = "0";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clstreefolder _objcls = new _clstreefolder();
            _objdb.DBName = "DBCML";
            _objcls.Folder_id = Convert.ToInt16(folder_id);

            DataTable dt = _objbll.Get_DafaultNavFolder(_objcls, _objdb);
            if (dt.Rows.Count > 0)
            {
                defaultnav = dt.Rows[0]["Folder_id"].ToString();
            }
            return defaultnav;

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
        private void Get_FolderDetails(string folderid)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.folder_id = Convert.ToInt16(folderid);
            DataTable _dt = _objbll.Get_FolderDetails(_objcls, _objdb);
            //txtfolder.Text = _dt.Rows[0]["Folder_description"].ToString();
            if (_dt.Rows.Count > 0)
            {
                txtfolder.Text = _dt.Rows[0]["Folder_description"].ToString();
                txtcode.Text = _dt.Rows[0]["Folder_code"].ToString();
            }

        }
        private void Generate_Nav(bool _postback)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt32(lblid.Text);
            DataTable _dtcas = _objbll.Load_AllsubFolders(_objcls, _objdb);
            string _head = "<ul class='nav'>";
            string _foot = "</ul>";
            string _item = "";
            int _idx = 0;
            int _pos = 0;

            if (!_postback)
            {
                if (!string.IsNullOrEmpty(hfolder.Value))
                {
                    if (_dtcas.Rows.Count > 0)
                    {
                        DataRow[] dr = _dtcas.Select("folder_id=" + hfolder.Value);
                        _pos = Convert.ToInt16(dr[0]["Folder_possition"]) - 1;

                    }

                }
                else _pos = 0;
            }
            else _pos = 0;


            foreach (DataRow _drow in _dtcas.Rows)
            {

                string _menuItem = "";
                string parm = "";

                //string _folder =_drow["Folder_code"].ToString()+" " +_drow["folder_description"].ToString();
                string _folder = _drow["folder_description"].ToString();


                parm = _drow["folder_id"].ToString() + "," + _drow["Folder_possition"].ToString() + "," + _drow["DefNav"].ToString() + "," + _drow["Ftype"].ToString();

                if (_folder.Length > 30)
                    _folder = _folder.Substring(0, 30) + "...";

                if (_idx == _pos)
                {
                    hfolder.Value = _drow["folder_id"].ToString();
                    //hpos.Value = _drow["Folder_possition"].ToString();

                    _menuItem = "<li class='item current' ><a href='#' onclick=GetNav(" + parm + "); title=" + _drow["folder_description"].ToString().Replace(" ", "&nbsp;") + " >" + _folder + "<i class='icon-chevron-right pull-right icon'></i></a>";

                    //_menuItem = "<li class='item current'><a href='#' onclick=goup(" + parm + ");><i class='icon-arrow-up pull-left icon'></i></a><a class='current' href='#' onclick=GetNav(" + parm + ");" + _drow["folder_description"].ToString() + " </a><a href='#' onclick=godown(" + parm + ");><i class='icon-arrow-down pull-right icon'></i></a></li>";

                }
                else
                {
                   
                    _menuItem = "<li class='item' ><a href='#' onclick=GetNav(" + parm + ");   title=" + _drow["folder_description"].ToString().Replace(" ", "&nbsp;") + " >" + _folder + "<i class='icon-chevron-right pull-right icon'></i></a>";
                    // _menuItem = "<li class='item'><a href='#' onclick=goup(" + parm + ");><i class='icon-arrow-up pull-left icon'></i></a><a href='#' onclick=GetNav(" + parm + ");" + _drow["folder_description"].ToString() + " </a><a href='#' onclick=godown(" + parm + ");><i class='icon-arrow-down pull-right icon'></i></a></li>";
                }
                _item = _item + _menuItem;
                _idx += 1;

            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            PlaceHolder1.Controls.Add(_lt);

        }

        protected void btncreate_Click(object sender, EventArgs e)
        {

            txtcode.Text = "";
            txtfolder.Text = "";

            if (htype.Value == "1")
            {
                btncreatefolder.Text = "CREATE";


            }
            else
            {
                Get_FolderDetails(hfolder.Value);
                btncreatefolder.Text = "UPDATE";
            }

            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }

        protected void btncreatefolder_Click(object sender, EventArgs e)
        {

            if (rbtfolder.SelectedValue == "2")
            {
                if (string.IsNullOrEmpty(txtcode.Text))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter the Code');", true);
                    return;
                }
            }


            if (string.IsNullOrEmpty(txtfolder.Text))
            {
                string msgstring = "Enter the Folder";


                if (rbtfolder.SelectedValue == "1")
                {
                    msgstring = "Enter the Parent";
                }

                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + msgstring + "');", true);
                return;
            }


            if (htype.Value == "1")
            {
                CreateFolder();
            }

            else if (htype.Value == "2")
            {
                EditFolder();
            }
            txtcode.Text = "";
            txtcode.Text = "";
            //htype.Value ="0";

            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            if (Convert.ToInt16(rbtfolder.SelectedValue) == 1)
            {
                loadmainmenu(false);
            }
            else
                loadnavmenu(false);

          

        }

        protected void rbtfolder_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (rbtfolder.SelectedValue == "1")
            {

                tdcode.Style.Add("display", "none");
                lblfolderhead.Text = "Enter Parent";

            }
            else
            {
                tdcode.Style.Add("display", "tablecell");
                lblfolderhead.Text = "Enter Code and Folder";

            }

            if (htype.Value == "2")
            {

                if (rbtfolder.SelectedValue == "1")
                {
                    Get_FolderDetails(lblid.Text);
                }
                else
                    Get_FolderDetails(hfolder.Value);
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }
        void EditFolder()
        {


            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();

            string msgstring = "";

            if (Convert.ToInt16(rbtfolder.SelectedValue) == 1)
            {
                _objcls.Folder_id = Convert.ToInt16(lblid.Text);
                msgstring = "Parent Updated !";

            }
            else
            {
                _objcls.Folder_id = Convert.ToInt16(hfolder.Value);
                msgstring = "Folder Updated !";
            }

            _objcls.mode = "rename";
            _objcls.Folder_code = txtcode.Text;
            _objcls.Folder_description = txtfolder.Text;
            _objbll.Edit_Tree_FolderNew(_objcls, _objdb);

            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + msgstring + "');", true);

        }

        void CreateFolder()
        {


            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();

            _objcls.Folder_code = txtcode.Text;
            _objcls.Userid = lbluserid.Text;

            _objcls.Folder_description = txtfolder.Text;
            _objcls.Folder_type = Convert.ToInt16(rbtfolder.SelectedValue);
            //if (string.IsNullOrEmpty(hpos.Value)) hpos.Value = "1";

            _objcls.Folder_possition = 1;
            _objcls.Enabled = true;
            _objcls.Project_code = lblprj.Text;

            string msgstring = "";


            if (Convert.ToInt16(rbtfolder.SelectedValue) == 1)
            {
                _objcls.Parent_folder = "0";
                _objcls.auto = 0;
                msgstring = "Parent Created !";
            }
            else
            {
                _objcls.Parent_folder = lblid.Text;
                _objcls.auto = 1;
                msgstring = "Folder Created !";
            }




            _objbll.Create_TreeFolderNew(_objcls, _objdb);
            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + msgstring + "');", true);
            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('New Folder Created!');", true);
        }

        void Delete_folder(String folderid)
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(folderid);
            _objcls.uid = lbluserid.Text;
            _objbll.Delete_Tree_FolderNew(_objcls, _objdb);


        }

        void loadfolder()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt32(lblid.Text);
            DataTable _dtcas = _objbll.Load_AllsubFolders(_objcls, _objdb);

            rdlmenu.DataTextField = "Folder_Description";
            rdlmenu.DataValueField = "Folder_Id";

            rdlmenu.DataSource = _dtcas;
            rdlmenu.DataBind();

        }

        void loadmenu()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsuser _objcls = new _clsuser();
            _objdb.DBName = "DBCML";
            _objcls.uid = lbluserid.Text;
            _objcls.project_code = lblprj.Text;


            DataTable _dtservice = _objbll.loadserviceDMS(_objcls, _objdb);


            rdlmenu.DataTextField = "Folder_Description";
            rdlmenu.DataValueField = "Folder_Id";

            rdlmenu.DataSource = _dtservice;
            rdlmenu.DataBind();
        }

        protected void rblmove_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblmove.SelectedValue.ToString() == "1")
            {
                loadmenu();

            }
            else
            {
                loadfolder();

            }
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        protected void btnmove_Click(object sender, EventArgs e)
        {

            loadmenu();
            loadfolder();

            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            Folder_Update();

            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            if (Convert.ToInt16(rblmove.SelectedValue) == 1)
            {
                loadmainmenu(true);
            }
            else
                loadnavmenu(true);

        }

        protected void btnmoveclose_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);


        }

        void Folder_Update()
        {


            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();


            foreach (Telerik.Web.UI.RadListBoxItem lbmenu in rdlmenu.Items)
            {
                _objcls.folder_id = Convert.ToInt32(lbmenu.Value);
                _objcls.possition = lbmenu.Index + 1;
                _objcls.move = "";
                _objbll.Move_Folder_New(_objcls, _objdb);



            }
        }

        protected void btndelyes_Click(object sender, EventArgs e)
        {
            string msgstring = "";
            if (Convert.ToInt16(rbldelete.SelectedValue) == 1)
            {
                Delete_folder(lblid.Text);

                loadmainmenu(true);
                msgstring = "Parent Deleted !";

            }
            else
            {
                Delete_folder(hfolder.Value);
                msgstring = "Folder Deleted !";
                loadnavmenu(true);
                loadmainmenu(true);

            }



            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + msgstring + "');", true);

            string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);



        }

        protected void btndelno_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }

        protected void btnfdelete_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        void loadmainmenu(bool type)
        {
            if (type)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Loadmenus", "refreshdefaultmenu();", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Loadmenus", "loadmenu(0);", true);

        }

        void loadnavmenu(bool type)
        {
            if (type)
            {
                Response.Redirect("Navbar?" + Request.QueryString.ToString() + "&Auth5=1");
            }
            else
                Response.Redirect("Navbar?" + Request.QueryString.ToString());

        }

        protected void rbld_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadAllDocuments();
            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        protected void btnmovedupdate_Click(object sender, EventArgs e)
        {

            Folder_Doc_Update();
            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }

        protected void btnmovedclose_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        protected void btngodoc_Click(object sender, EventArgs e)
        {
            LoadAllDocuments();

            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }
        void LoadAllDocuments()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(hfolder.Value);
            _objcls.project_code = rbld.SelectedValue.ToString();
            DataTable _dtcas = _objbll.LoadAllDocuments_Service(_objcls, _objdb);


            rbmd.DataTextField = "title";
            rbmd.DataValueField = "Doc_Id";



            rbmd.DataSource = _dtcas;
            rbmd.DataBind();

        }
        void Folder_Doc_Update()
        {


            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();


            foreach (Telerik.Web.UI.RadListBoxItem lbmenu in rbmd.Items)
            {
                _objcls.folder_id = Convert.ToInt32(lbmenu.Value);
                _objcls.possition = lbmenu.Index + 1;
                _objcls.move = "";
                _objbll.Manage_Document_Position(_objcls, _objdb);



            }

            GenerateInnerNav_Doc(Convert.ToInt32(rbld.SelectedValue));


            
        }
        private void GenerateInnerNav_Doc(int type)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt32(hfolder.Value);
            DataTable dt = new DataTable();
            dt = _objbll.Get_CurrentUploadFolder(_objcls, _objdb);

            int folder = 0;
            foreach (DataRow dr in dt.Select("Type=" + type))
            {
                folder = Convert.ToInt32(dr["Folder_Id"].ToString());

            }


            ScriptManager.RegisterStartupScript(this, this.GetType(), "Loaddoc", "DocumentNavaigation_Doc(" + hfolder.Value + "," + folder + "," + type + ");", true);


        }
    }
}