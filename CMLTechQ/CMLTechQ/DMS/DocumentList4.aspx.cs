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
using Ionic.Zip;
using System.IO;

namespace CMLTechQ.DMS
{
    public partial class DocumentList4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
               //// lbldocFolder.Text = Request.QueryString["Auth5"].ToString();
                Get_User();
                loadPageprojectinfo();
                load_document();
                //string _type = Request.QueryString["Auth4"].ToString();
                //lbllatest.Text = "Uploaded Documents";
                lblold.Text = "To be Uploaded ";

                Session["closestatus"] = 5;

            }
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
        private void loadPageprojectinfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(lblfolder.Text);

            pageinfo.Text = _objbll.Get_folderProjectdescription1(_objcls, _objdb).Rows[0][0].ToString();
        }
        private void load_document()
        {
            _clstreefolder objcls = new _clstreefolder();
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            objcls.Folder_id = Convert.ToInt16(lblfolder.Text);
            DataTable _dtresult;
            DataTable _dt = _objbll.load_AllDocumentsDirectFolder(objcls, _objdb);
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

        protected void btn_schaction_Click(object sender, EventArgs e)
        {


            //if (draction_schedule.SelectedValue == "1")
            //{
            //    string _prm = "Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=0";
            //    Response.Redirect("DocumentSchedule?" + _prm);
            //}
            //else
            //{
            //    lbltype.Text = "0";
            //    lblmessage.Text = "Are You Sure Want To Delete All Schedule?";
            //    btndummy_ModalPopupExtender.Show();

            //}
        }

        protected void btnaction1_Click(object sender, EventArgs e)
        {



            //if (draction1.SelectedValue == "1")
            //{
            //    string _prm = "Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=0";
            //    Response.Redirect("DocumentUpload1?" + _prm);
            //}
            //else if (draction1.SelectedValue == "3")
            //{
            //    lbltype.Text = "1";
            //    lblmessage.Text = "Are You Sure Want To Delete All Documents?";
            //    btndummy_ModalPopupExtender.Show();
            //}
            //else if (draction1.SelectedValue == "2")
            //{
            //    Downloadall();
            //}
        }
        void Downloadall()
        {

            using (ZipFile zip = new ZipFile())
            {
                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                zip.AddDirectoryByName("Documents");
                int _count = 0;
                //foreach (ListViewItem item in doc_list.Items)
                //{
                //    // CheckBox chk = (CheckBox)item.FindControl("lbltick");
                //    Label lbldoc = (Label)item.FindControl("lbldoc");
                //    string path = Path.GetFullPath(Server.MapPath("Documents/") + lbldoc.Text);
                //    System.IO.FileInfo _finfo = new System.IO.FileInfo(path);
                //    if (_finfo.Exists == true)
                //    {
                //        zip.AddFile(path, "Documents");
                //        _count += 1;
                //    }
                //}
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
            //if (lbldocid.Text == "0")
            //{
            //    _objcls.doc_title = "";
            //    _objcls.doc_name = "";
            //    _objcls.reff = "";
            //    _objcls.uid = lbluserid.Text;
            //    _objcls.action = 2;
            //    foreach (list  _itm in RadGrid1.Items)
            //    {
            //        Label _id = (Label)_itm.FindControl("doc_idLabel");
            //        _objcls.doc_id = Convert.ToInt32(_id.Text);
            //        _objbll.Update_Document_direct(_objcls, _objdb);
            //    }
            //}
            //else
            //{
                _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
                _objcls.doc_title = "";
                _objcls.doc_name = "";
                _objcls.reff = "";
                _objcls.uid = lbluserid.Text;
                _objcls.action = 2;
                _objbll.Update_Document_direct(_objcls, _objdb);
            //}
            load_document();
            lbldocid.Text = "0";
        }
        //protected void doc_list_ItemCanceling(object sender, ListViewCancelEventArgs e)
        //{
        //    //doc_list.EditIndex = -1;
        //    //load_document();
        //}
        //protected void doc_list_ItemCommand(object sender, ListViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Update")
        //    {
        //        Label _id = (Label)e.Item.FindControl("doc_idLabel");
        //        TextBox _docname = (TextBox)e.Item.FindControl("txttitle");
        //        TextBox _title = (TextBox)e.Item.FindControl("txtdocname");
        //        TextBox _ref = (TextBox)e.Item.FindControl("txtref");
        //        BLL_Dml _objbll = new BLL_Dml();
        //        _database _objdb = new _database();
        //        _objdb.DBName = "dbCML";
        //        _clsdocument _objcls = new _clsdocument();
        //        _objcls.doc_id = Convert.ToInt32(_id.Text);
        //        _objcls.doc_title = _title.Text;
        //        _objcls.doc_name = _docname.Text;
        //        _objcls.reff = _ref.Text;
        //        _objcls.uid = lbluserid.Text;
        //        _objcls.title = txtDocumenttitle.Text;
        //        _objcls.action = 1;
        //        _objbll.Update_Document_direct(_objcls, _objdb);
        //    }
        //    else if (e.CommandName == "Delete")
        //    {
        //        Label _id = (Label)e.Item.FindControl("doc_idLabel");
        //        //lbldocid.Text = _id.Text;
        //        //lbltype.Text = "1";
        //        //lblmessage.Text = "Are you sure want to delete the selected document?";
        //        //string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
        //        //ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        //    }
        //    else if (e.CommandName == "Download")
        //    {
        //        Label _file = (Label)e.Item.FindControl("lbldoc");
        //        DownLoad_Single(_file.Text);
        //    }
        //    load_document();
        //}
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
        //protected void doc_list_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        //{
        //    //doc_list.EditIndex = -1;
        //    //load_document();
        //}

        //protected void doc_list_ItemEditing(object sender, ListViewEditEventArgs e)
        //{
        //    //doc_list.EditIndex = e.NewEditIndex;
        //    //load_document();
        //}

        //protected void doc_list_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        //{
        //    //doc_list.EditIndex = -1;
        //    //load_document();
        //}
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

        //protected void sch_list_ItemCanceling(object sender, ListViewCancelEventArgs e)
        //{
        //    //sch_list.EditIndex = -1;
        //    //Load_ScheduleList(Convert.ToInt32(lblfolder.Text), lblprj.Text);
        //}

        //protected void sch_list_ItemCommand(object sender, ListViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Update")
        //    {
        //        Label _id = (Label)e.Item.FindControl("sch_idLabel");
        //        TextBox txtdocref_sch = (TextBox)e.Item.FindControl("txtdocref_sch");
        //        TextBox txtdoctitle_sch = (TextBox)e.Item.FindControl("txtdoc_title_sch");
        //        TextBox txttitle_sch = (TextBox)e.Item.FindControl("txttitle_sch");
        //        TextBox txtdocname_sch = (TextBox)e.Item.FindControl("txtdoc_name_sch");

        //        BLL_Dml _objbll = new BLL_Dml();
        //        _database _objdb = new _database();
        //        _objdb.DBName = "dbCML";
        //        _clsdocument _objcls = new _clsdocument();
        //        _objcls.doc_id = Convert.ToInt32(_id.Text);
        //        _objcls.doc_title = txtdoctitle_sch.Text;

        //        string ext = System.IO.Path.GetExtension(txtdocname_sch.Text);
        //        string filename = txtdocname_sch.Text;
        //        if (ext == "") filename = txtdocname_sch.Text + ".pdf";

        //        _objcls.doc_name = filename;

        //        _objcls.title = txttitle_sch.Text;
        //        _objcls.reff = txtdocref_sch.Text;
        //        _objcls.action = 1;
        //        _objbll.Update_Schedule_direct(_objcls, _objdb);
        //    }
        //    else if (e.CommandName == "Delete")
        //    {
        //        Label _id = (Label)e.Item.FindControl("sch_idLabel");
        //        //lbldocid.Text = _id.Text;
        //        //lbltype.Text = "0";
        //        //lblmessage.Text = "Are you sure want to delete the selected schedule?";
        //        //string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
        //        //ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        //    }
        //    load_document();

        //}

        //protected void sch_list_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        //{
        //    //sch_list.EditIndex = -1;
        //    //Load_ScheduleList(Convert.ToInt32(lblfolder.Text), lblprj.Text);
        //}

        //protected void sch_list_ItemEditing(object sender, ListViewEditEventArgs e)
        //{
        //    //sch_list.EditIndex = e.NewEditIndex;
        //    //Load_ScheduleList(Convert.ToInt32(lblfolder.Text), lblprj.Text);
        //}

        //protected void sch_list_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        //{
        //    //sch_list.EditIndex = -1;
        //    //Load_ScheduleList(Convert.ToInt32(lblfolder.Text), lblprj.Text);
        //}
        private void Delete_Schedule()
        {

            //BLL_Dml _objbll = new BLL_Dml();
            //_database _objdb = new _database();
            //_objdb.DBName = "dbCML";
            //_clsdocument _objcls = new _clsdocument();
            //if (lbldocid.Text == "0")
            //{
            //    _objcls.doc_title = "";
            //    _objcls.doc_name = "";
            //    _objcls.reff = "";
            //    _objcls.title = "";
            //    _objcls.action = 2;
            //    //foreach (ListViewItem _itm in sch_list.Items)
            //    //{
            //    //    Label _id = (Label)_itm.FindControl("sch_idLabel");
            //    //    _objcls.doc_id = Convert.ToInt32(_id.Text);
            //    //    _objbll.Update_Schedule_direct(_objcls, _objdb);
            //    //}
            //}
            //else
            //{
            //    _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            //    _objcls.doc_title = "";
            //    _objcls.doc_name = "";
            //    _objcls.reff = "";
            //    _objcls.title = "";
            //    _objcls.action = 2;
            //    _objbll.Update_Schedule_direct(_objcls, _objdb);
            //}
            //Load_ScheduleList(Convert.ToInt32(lblfolder.Text), lblprj.Text);
            //lbldocid.Text = "0";
        }

        //protected void doc_list_ItemDataBound(object sender, ListViewItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListViewItemType.DataItem)
        //    {
        //        Label _ref = (Label)e.Item.FindControl("lblref");
        //        Label _man = (Label)e.Item.FindControl("lblman");
        //        if (_ref.Text == "No")
        //        {
        //            _ref.ForeColor = System.Drawing.Color.FromName("#ff9667");
        //            _ref.Text = "No Ref.";
        //        }
        //        if (_man.Text == "No")
        //        {
        //            _man.ForeColor = System.Drawing.Color.FromName("#ff9667");
        //            _man.Text = "No Manufacturer";
        //        }
        //    }
        //}

        //protected void listaction1_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    //txt_action1.Text = listaction1.SelectedItem.Text;
        //    //if (txt_action1.Text == "Upload New")
        //    //{
        //    //    string _prm = "Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=2";
        //    //    Response.Redirect("DocumentUpload1?" + _prm);
        //    //}
        //    //else if (txt_action1.Text == "Delete All")
        //    //{
        //    //    lbltype.Text = "1";
        //    //    lblmessage.Text = "Are You Sure Want To Delete All Documents?";
        //    //    btndummy_ModalPopupExtender.Show();

        //    //}
        //    //else if (txt_action1.Text == "Download All")
        //    //{
        //    //    Downloadall();

        //    //}

        //}

        //protected void listaction2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //txt_action2.Text = listaction2.SelectedItem.Text;
        //    //if (txt_action2.Text == "New Schedule")
        //    //{
        //    //    string _prm = "Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=0";
        //    //    Response.Redirect("DocumentSchedule?" + _prm);

        //    //}
        //    //else if (txt_action2.Text == "Delete All")
        //    //{
        //    //    lbltype.Text = "0";
        //    //    lblmessage.Text = "Are You Sure Want To Delete All Schedule?";
        //    //    btndummy_ModalPopupExtender.Show();

        //    //}


        //}

        //protected void doc_list_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
        void deleteall()
        {

            //lblmessage.Text = "Are You Sure Want To Delete All Documents?";


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
                        //lblmessage.Text = "Are You Sure Want To Delete All Documents?";
                        //string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
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
                        //lblmessage.Text = "Are You Sure Want To Delete All Schedule?";
                        //string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
                        rd_action2.ClearSelection();
                        break;

                    }

            }
        }

        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
             lbldocid.Text = (string)e.Item.Cells[7].Text;
            if (e.CommandName == "edits")
            {
               
                //TextBox priceText = (TextBox)e.Item.Cells[4].Controls[0];

                trfile.Visible = false;
                lbltype.Text = "1";
                RadWindow1.Title = "Document Edit";

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            else
            {
                lblmessage.Text = "Do You want to Delete the Document";
                lbltype.Text = "1";
                string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            load_document();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string a = lbldocid.Text;
            string b = lbltype.Text;

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

        }
        void UpdateDoc_list()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.doc_title = txtDocumenttitle.Text;
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

            _objcls.title = txtManufacturer.Text;
            _objcls.reff = txtrefrence.Text;
            _objcls.action = 1;
            _objbll.Update_Schedule_direct(_objcls, _objdb);
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }


        protected void RadGrid2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            lbldocid.Text = (string)e.Item.Cells[7].Text;
            if (e.CommandName == "edits")
            {
               
                //TextBox priceText = (TextBox)e.Item.Cells[4].Controls[0];

                trfile.Visible = true;
                lbltype.Text = "2";


                RadWindow1.Title = "Schedule Edit";

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            else
            {
                lblmessage.Text = "Do You want to Delete the Schedule";
                lbltype.Text = "2";
                string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            load_document();

        }


    }
}