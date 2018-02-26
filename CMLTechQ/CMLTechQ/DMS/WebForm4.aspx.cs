﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PassProtection;
using Ionic.Zip;
using System.IO;
using Telerik.Web.UI;
using BusinessLogic;
using App_Properties;

namespace CMLTechQ.DMS
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                Get_User();
                loadPageprojectinfo();
                Load_Navigation();

                if (!String.IsNullOrEmpty(Request.QueryString["Auth4"]))
                {

                    if (Request.QueryString["Auth4"].ToString() == "0") lbltype.Text = "2";
                }


                load_document();

                lblold.Text = "To be Uploaded ";


                if (lbluserid.Text.IndexOf("@cmlgroup.ae") <= 0)
                {
                    foreach (DropDownListItem lst in rd_action1.Items)
                    {
                        if (lst.Value == "1" || lst.Value == "3") lst.Enabled = false;


                    }
                    foreach (DropDownListItem lst in rd_action2.Items)
                    {
                        if (lst.Value == "1" || lst.Value == "2") lst.Enabled = false;

                    }

                }


            }
        }
        private void Load_Navigation()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.project_code = lblprj.Text;
            DataTable _dttree = _objbll.Load_Buildinglevel_Navigation(_objcls, _objdb);
            string _NavStart = "<ul>";
            string _NavStop = "</ul>";
            var _varlv1 = _dttree.Select("Parent_Folder=0");
            string _navitem = "";
            DataTable _dtlv1 = _varlv1.Any() ? _varlv1.CopyToDataTable() : _dttree.Clone();
            foreach (DataRow _lv1row in _dtlv1.Rows)
            {
                string _nav = _lv1row["Folder_Description"].ToString();
                if (_nav.Length >= 25)
                    _nav = _nav.Substring(0, 25) + "..";
                if (_navitem == "")
                    _navitem = _navitem + "<li class='main-menu-item active'><a href='#' title='" + _lv1row["Folder_Description"].ToString() + "'>" + _nav + "</a><i class='fa fa-angle-right'></i>";
                else
                    _navitem = _navitem + "<li class='main-menu-item'><a href='#' title='" + _lv1row["Folder_Description"].ToString() + "'>" + _nav + "</a><i class='fa fa-angle-right'></i>";
                var _varlv2 = _dttree.Select("Parent_Folder=" + Convert.ToInt32(_lv1row["Folder_Id"].ToString()));
                string _navitem1 = "";
                DataTable _dtlv2 = _varlv2.Any() ? _varlv2.CopyToDataTable() : _dttree.Clone();
                foreach (DataRow _lv2row in _dtlv2.Rows)
                {
                    _navitem1 = _navitem1 + "<li class='tier-two-menu-item'><a href='#'>" + _lv2row["Folder_Description"].ToString() + "</a><i class='fa fa-angle-right'></i>";
                    var _varlv3 = _dttree.Select("Parent_Folder=" + Convert.ToInt32(_lv2row["Folder_Id"].ToString()));
                    string _navitem2 = "";
                    DataTable _dtlv3 = _varlv3.Any() ? _varlv3.CopyToDataTable() : _dttree.Clone();
                    foreach (DataRow _lv3row in _dtlv3.Rows)
                    {
                        _navitem2 = _navitem2 + "<li class='tier-three-menu-item'><a href='#'>" + _lv3row["Folder_Description"].ToString() + "</a></li>";
                    }
                    if (_navitem2 != "")
                        _navitem1 = _navitem1 + "<ul>" + _navitem2 + "</ul></li>";
                    else
                        _navitem1 = _navitem1 + "</li>";
                }
                if (_navitem1 != "")
                    _navitem = _navitem + "<ul>" + _navitem1 + "</ul></li>";
                else
                    _navitem = _navitem + "</li>";
            }
            LiteralControl _lt = new LiteralControl();
            _lt.Text = "<ul>" + _navitem + "</ul>";
            ph_mainNav.Controls.Add(_lt);
        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = lbluseridhidden.Text;
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
        private void loadPageprojectinfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(lblfolder.Text);

            //pageinfo.Text = _objbll.Get_folderProjectdescription1(_objcls, _objdb).Rows[0][0].ToString();
            pageinfo.Text = "9.00 Utlity Yard (715) > 1.0 Mechanical Services > 1.1 Chillers";
        }
        private void load_document()
        {


            _clstreefolder objcls = new _clstreefolder();
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            objcls.Folder_id = Convert.ToInt16(lblfolder.Text);
            DataTable _dtresult;
            DataTable _dt = _objbll.load_FolderDocuments(objcls, _objdb);
            var _result = _dt.Select("Enabled=true");
            _dtresult = _result.Any() ? _result.CopyToDataTable() : _dt.Clone();
            RadGrid1.DataSource = _dtresult;
            RadGrid1.DataBind();
            Load_ScheduleList(Convert.ToInt16(lblfolder.Text), lblprj.Text);

        }
        private void GetSummary()
        {
            decimal _total = RadGrid1.Items.Count + RadGrid2.Items.Count;
            decimal _upload = RadGrid1.Items.Count;
            decimal _percentage = 0;
            if (_total > 0) _percentage = (_upload / _total) * 100;
            lbtotal.Text = _total.ToString();
            lbupload.Text = _upload.ToString();
            lbper.Text = Decimal.Round(_percentage).ToString() + "%";
        }
        private void Load_ScheduleList(int folder_id, string project)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.project_code = project;
            _objcls.folder_id = folder_id;
            RadGrid2.DataSource = _objbll.Load_ScheduleList(_objcls, _objdb);
            RadGrid2.DataBind();
            GetSummary();
        }

        void Downloadall()
        {

            using (ZipFile zip = new ZipFile())
            {
                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                zip.AddDirectoryByName("Documents");
                int _count = 0;
                foreach (ListViewItem item in RadGrid1.Items)
                {
                    // CheckBox chk = (CheckBox)item.FindControl("lbltick");
                    Label lbldoc = (Label)item.FindControl("lbldoc");
                    string path = Path.GetFullPath(Server.MapPath("Documents/") + lbldoc.Text);
                    System.IO.FileInfo _finfo = new System.IO.FileInfo(path);
                    if (_finfo.Exists == true)
                    {
                        zip.AddFile(path, "Documents");
                        _count += 1;
                    }
                }
                //UpdatePanel1.Update();
                if (_count == 0) return;
                try
                {

                    Response.Clear();
                    string zipName = String.Format("MI_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + zipName);
                    Response.ContentType = "application/zip";

                    zip.Save(Response.OutputStream);

                    Response.End();

                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        private void Delete_Documents()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            if (lbldocid.Text == "0")
            {
                _objcls.doc_title = "";
                _objcls.doc_name = "";
                _objcls.reff = "";
                _objcls.uid = lbluserid.Text;
                _objcls.action = 2;
                foreach (Telerik.Web.UI.GridDataItem row in RadGrid1.Items)
                {
                    _objcls.doc_id = Convert.ToInt32(row.Cells[7].Text);
                    _objbll.Update_Document_direct(_objcls, _objdb);
                }
            }
            else
            {
                _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
                _objcls.doc_title = "";
                _objcls.doc_name = "";
                _objcls.reff = "";
                _objcls.uid = lbluserid.Text;
                _objcls.action = 2;
                _objbll.Update_Document_direct(_objcls, _objdb);
            }
            load_document();
            lbldocid.Text = "0";
        }

        private void DownLoad_Single(string _filename)
        {
            try
            {
                //string _file = "OM_17599d87afd6-1245-4dec-ac78-22e72e1d92c2.pdf";
                string _path = System.IO.Path.Combine(Server.MapPath("Documents\\") + _filename);
                System.IO.FileInfo _finfo = new System.IO.FileInfo(_path);
                if (_finfo.Exists == false)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Document does not exists!');", true);
                    return;
                }
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + _finfo.Name);
                Response.AddHeader("Content-Length", _finfo.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(_finfo.FullName);
                Response.End();
            }
            catch (Exception)
            {
                throw;
            }

        }

        protected void btnno_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }
        protected void btnconfirm_Click(object sender, EventArgs e)
        {
            if (lbltype.Text == "1")
            {
                Delete_Documents();
            }
            else
            {
                Delete_Schedule();
            }
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }


        private void Delete_Schedule()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            if (lbldocid.Text == "0")
            {
                _objcls.doc_title = "";
                _objcls.doc_name = "";
                _objcls.reff = "";
                _objcls.title = "";
                _objcls.action = 2;
                foreach (Telerik.Web.UI.GridDataItem row in RadGrid2.Items)
                {
                    _objcls.doc_id = Convert.ToInt32(row.Cells[7].Text);
                    _objbll.Update_Schedule_direct(_objcls, _objdb);
                }
            }
            else
            {
                _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
                _objcls.doc_title = "";
                _objcls.doc_name = "";
                _objcls.reff = "";
                _objcls.title = "";
                _objcls.action = 2;
                _objbll.Update_Schedule_direct(_objcls, _objdb);
            }
            Load_ScheduleList(Convert.ToInt32(lblfolder.Text), lblprj.Text);
            lbldocid.Text = "0";
        }


        void deleteall()
        {

            lblmessage.Text = "Are You Sure Want To Delete All Documents?";


        }
        protected void btndeleteall1_Click(object sender, EventArgs e)
        {
            lbltype.Text = "1";
            deleteall();

        }

        protected void btndeleteall2_Click(object sender, EventArgs e)
        {
            lbltype.Text = "0";
            deleteall();

        }


        protected void btndownloadall_Click(object sender, EventArgs e)
        {
            Downloadall();

        }

        protected void rd_action1_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            switch (rd_action1.SelectedValue)
            {
                case "1":
                    {
                        string _auth1 = lbluseridhidden.Text;
                        string _auth2 = lblprjid.Text;
                        string _auth3 = lblfolder.Text;
                        string _redirect = "DocumentUpload1?Auth1=" + _auth1 + "&Auth2=" + _auth2 + "&Auth3=" + _auth3 + "&Auth4=2";
                        Response.Redirect(_redirect);
                        break;
                    }
                case "2":
                    {
                        string _path = "DocumentDownload?folder=" + lblfolder.Text;
                        ScriptManager.RegisterStartupScript(this, typeof(string), "close", "window.open('" + _path + "');", true);
                        break;
                    }
                case "3":
                    {
                        lbldocid.Text = "0";
                        lbltype.Text = "1";
                        lblmessage.Text = "Are You Sure Want To Delete All Documents?";
                        string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
                        rd_action1.ClearSelection();
                        break;

                    }

            }
        }

        protected void rd_action2_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {

            switch (rd_action2.SelectedValue)
            {
                case "1":
                    {
                        string _auth1 = lbluseridhidden.Text;
                        string _auth2 = lblprjid.Text;
                        string _auth3 = lblfolder.Text;
                        string _redirect = "DocumentSchedule?Auth1=" + _auth1 + "&Auth2=" + _auth2 + "&Auth3=" + _auth3 + "&Auth4=0";
                        Response.Redirect(_redirect);
                        break;
                    }
                case "2":
                    {
                        lbldocid.Text = "0";
                        lbltype.Text = "2";
                        lblmessage.Text = "Are You Sure Want To Delete All Schedule?";
                        string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
                        rd_action2.ClearSelection();
                        break;

                    }

            }
        }

        protected void RadGrid2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            lbldocid.Text = (string)e.Item.Cells[7].Text;
            lbltype.Text = "2";
            if (e.CommandName == "edits")
            {

                //TextBox priceText = (TextBox)e.Item.Cells[4].Controls[0];


                txtrefrence.Text = (string)e.Item.Cells[2].Text;
                txtManufacturer.Text = (string)e.Item.Cells[3].Text;
                txtDocumenttitle.Text = (string)e.Item.Cells[4].Text;
                txtfilename.Text = (string)e.Item.Cells[5].Text;



                trfile.Visible = true;
                RadWindow1.Title = "Schedule Edit";

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            else
            {

                lblmessage.Text = "Do You want to Delete the Schedule";
                string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            load_document();


        }

        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {


            lbldocid.Text = (string)e.Item.Cells[7].Text;
            lbltype.Text = "1";
            if (e.CommandName == "edits")
            {

                //TextBox priceText = (TextBox)e.Item.Cells[4].Controls[0];


                txtrefrence.Text = (string)e.Item.Cells[2].Text;
                txtManufacturer.Text = (string)e.Item.Cells[3].Text;
                txtDocumenttitle.Text = (string)e.Item.Cells[8].Text;

                trfile.Visible = false;

                RadWindow1.Title = "Document Edit";

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            else if (e.CommandName == "delete")
            {

                lblmessage.Text = "Do You want to Delete the Document";
                string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else if (e.CommandName == "download")
            {
                hfile.Value = e.Item.Cells[9].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "download", "ondownload();", true);

            }
            load_document();

        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Telerik.Web.UI.GridDataItem dataItem = e.Item as Telerik.Web.UI.GridDataItem;


                if (lbluserid.Text.IndexOf("@cmlgroup.ae") <= 0)
                {
                    (dataItem["deleteColumn"].Controls[0] as ImageButton).Enabled = false;
                    (dataItem["deleteColumn"].Controls[0] as ImageButton).Style.Add("cursor", "not-allowed");
                    (dataItem["editColumn"].Controls[0] as ImageButton).Enabled = false;
                    (dataItem["editColumn"].Controls[0] as ImageButton).Style.Add("cursor", "not-allowed");
                }

                if (e.Item.Cells[2].Text == "No")
                {
                    e.Item.Cells[2].Text = "No Reference";
                    e.Item.Cells[2].ForeColor = System.Drawing.Color.Red;

                }
                if (e.Item.Cells[3].Text == "No")
                {
                    e.Item.Cells[3].Text = "No Manufacturer";
                    e.Item.Cells[3].ForeColor = System.Drawing.Color.Red;

                }

            }

        }
        void UpdateDoc_list()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.doc_title = txtManufacturer.Text;
            _objcls.doc_name = txtDocumenttitle.Text;
            _objcls.reff = txtrefrence.Text;
            //_objcls.title = txtDocumenttitle.Text;

            _objcls.uid = lbluserid.Text;
            _objcls.action = 1;
            _objbll.Update_Document_direct(_objcls, _objdb);


        }
        void Schedulelist()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.doc_title = txtDocumenttitle.Text;

            string ext = System.IO.Path.GetExtension(txtfilename.Text);
            string filename = txtfilename.Text;
            if (ext == "") filename = txtfilename.Text + ".pdf";

            _objcls.doc_name = filename;

            _objcls.title = txtDocumenttitle.Text;
            _objcls.reff = txtrefrence.Text;
            _objcls.action = 1;
            _objbll.Update_Schedule_direct(_objcls, _objdb);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (lbltype.Text == "1")
            {
                UpdateDoc_list();
            }
            else
            {
                Schedulelist();
            }


            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            //Response.Redirect("DocumentList2?" + Request.QueryString.ToString());
            load_document();

        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        protected void btndummy_Click(object sender, EventArgs e)
        {
            DownLoad_Single(hfile.Value);

        }

        protected void RadGrid2_ItemDataBound(object sender, GridItemEventArgs e)
        {

            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Telerik.Web.UI.GridDataItem dataItem = e.Item as Telerik.Web.UI.GridDataItem;




                if (lbluserid.Text.IndexOf("@cmlgroup.ae") <= 0)
                {
                    (dataItem["deleteColumn"].Controls[0] as ImageButton).Enabled = false;
                    (dataItem["deleteColumn"].Controls[0] as ImageButton).Style.Add("cursor", "not-allowed");
                    (dataItem["editColumn"].Controls[0] as ImageButton).Enabled = false;
                    (dataItem["editColumn"].Controls[0] as ImageButton).Style.Add("cursor", "not-allowed");


                }


            }

        }

    }


}