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
using Ionic.Zip;
using System.IO;
using Telerik.Web.UI;

namespace CMLTechQ.DMS
{
    public partial class NavWebForm4 : System.Web.UI.Page
    {

        static int docCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                //lbldocFolder.Text = Request.QueryString["Auth5"].ToString();
                Get_User();
                loadPageprojectinfo();


                if (!String.IsNullOrEmpty(Request.QueryString["Auth4"]))
                {

                    if (Request.QueryString["Auth4"].ToString() == "0") lbltype.Text = "2";
                }

                if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
                {
                    hmenufolder.Value = Request.QueryString["Auth5"].ToString();

                }

                load_document();

                //lblold.Text = "Documents to be Uploaded ";

                Session["closestatus"] = 5;


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
            GenerateInnerNav_Doc(4);
        }
        private void GenerateInnerNav_Doc(int type)
        {
            //string a = "";
            //a = fid.Value;

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt16(hmenufolder.Value);
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
                    _menuItem = "<li class='item current' ><a class='current' href='#' onclick=PageNavaigation_Doc(" + _drow["Folder_id"].ToString() + "," + _drow["type"].ToString() + "," + hmenufolder.Value + ");>" + _folder + "</a></li>";
                    //lbldocFolder.Text = _drow["Folder_id"].ToString();
                }
                else
                    _menuItem = "<li class='item' ><a href='#' onclick=PageNavaigation_Doc(" + _drow["Folder_id"].ToString() + "," + _drow["type"].ToString() + "," + hmenufolder.Value + ");>" + _folder + "</a></li>";
                _item = _item + _menuItem;
                _idx += 1;
            }
            string _content = _head + _item + _foot;
            LiteralControl _lt = new LiteralControl();
            _lt.Text = _content;
            PlaceHolder1.Controls.Add(_lt);

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

            //pageinfo.Text = "Mechanical Services > Cooling Towers > Test Documentation";
        }
        DataTable Load_DMS_TC_LinkDocument()
        {
            _clscassheet objcls = new _clscassheet();
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            objcls.prj_code = lblprj.Text;
            objcls.srv = Convert.ToInt16(lblfolder.Text);
            DataTable _dt = _objbll.Load_DMS_TC_LinkDocument(objcls, _objdb);

            return _dt;
        }
        private void load_document()
        {
            docCount = 0;
            _clstreefolder objcls = new _clstreefolder();
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            objcls.Folder_id = Convert.ToInt16(lblfolder.Text);

            DataTable _dtresult = new DataTable();
            _dtresult.Columns.Add("doc_name");
            _dtresult.Columns.Add("doc_ref");
            _dtresult.Columns.Add("udate");
            _dtresult.Columns.Add("file_size");
            _dtresult.Columns.Add("type");
            _dtresult.Columns.Add("doc_id");
            _dtresult.Columns.Add("title");



            DataTable _dt = _objbll.load_AllDocumentsDirectFolder_TD(objcls, _objdb);

            foreach (DataRow dr in _dt.Select("Enabled=true"))
            {

                DataRow _row = _dtresult.NewRow();
                _row["doc_name"] = dr["doc_name"].ToString();
                _row["doc_ref"] = dr["doc_ref"].ToString();
                _row["udate"] = dr["udate"].ToString();
                _row["file_size"] = dr["file_size"].ToString();
                _row["doc_id"] = dr["doc_id"].ToString();
                _row["type"] = dr["Type"].ToString();
                _row["title"] = dr["title"].ToString();

                _dtresult.Rows.Add(_row);
                docCount += 1;


            }

            RadGrid1.DataSource = _dtresult;
            RadGrid1.DataBind();
            //doc_list.DataSource = _dtresult;
            //doc_list.DataBind();


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

            //sch_list.DataSource = _objbll.Load_ScheduleList(_objcls, _objdb);
            //sch_list.DataBind();

            RadGrid2.DataSource = _objbll.LoadSchedule_List_New(_objcls, _objdb);
            RadGrid2.DataBind();


            GetSummary();
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
                    _objcls.doc_id = Convert.ToInt32(row.Cells[6].Text);
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
                    Response.Redirect("NavWebForm4?" + Request.QueryString.ToString());
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

            // Response.Redirect("DocumentList2?" + Request.QueryString.ToString());
            load_document();
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
                    _objcls.doc_id = Convert.ToInt32(row.Cells[6].Text);
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

        protected void doc_list_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label _ref = (Label)e.Item.FindControl("lblref");
                Label _type = (Label)e.Item.FindControl("lbltype");
                if (_type.Text == "2")
                {
                    TextBox txtref = (TextBox)e.Item.FindControl("txtref");
                    TextBox txttitle = (TextBox)e.Item.FindControl("txttitle");

                    if (txtref != null) txtref.Enabled = false;
                    if (txttitle != null) txttitle.Enabled = false;

                }
                if (_ref.Text == "No")
                {
                    _ref.ForeColor = System.Drawing.Color.Red;
                    _ref.Text = "No Reference";
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
                        string _redirect = "DocumentSchedule6?Auth1=" + _auth1 + "&Auth2=" + _auth2 + "&Auth3=" + _auth3 + "&Auth4=4&Auth5=" + hmenufolder.Value;
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

        protected void rd_action1_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            switch (rd_action1.SelectedValue)
            {
                case "1":
                    {
                        string _auth1 = lbluseridhidden.Text;
                        string _auth2 = lblprjid.Text;
                        string _auth3 = lblfolder.Text;
                        string _redirect = "DocumentUpload2?Auth1=" + _auth1 + "&Auth2=" + _auth2 + "&Auth3=" + _auth3 + "&Auth4=4&Auth5=" + hmenufolder.Value;
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

        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            lbltype.Text = "1";
            if (e.CommandName == "edits")
            {

                //TextBox priceText = (TextBox)e.Item.Cells[4].Controls[0];
                txtdocid.Text = (string)e.Item.Cells[9].Text;

                txtDocumenttitle.Text = (string)e.Item.Cells[3].Text;
                txtrefrence.Text = (string)e.Item.Cells[11].Text;
                txtfilename.Text = (string)e.Item.Cells[3].Text;

                //trfile.Visible = false;

                RadWindow1.Title = "Document Edit";

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            else if (e.CommandName == "delete")
            {
                lbldocid.Text = (string)e.Item.Cells[9].Text;
                lblmessage.Text = "Do You want to Delete the Document";
                string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else if (e.CommandName == "download")
            {
                hfile.Value = e.Item.Cells[10].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "download", "ondownload();", true);

            }
            load_document();


        }

        protected void btndummy_Click(object sender, EventArgs e)
        {
            DownLoad_Single(hfile.Value);

        }

        protected void RadGrid2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {




            lbltype.Text = "2";
            if (e.CommandName == "edits")
            {

                //TextBox priceText = (TextBox)e.Item.Cells[4].Controls[0];

                //txtDocumenttitle.Text = (string)e.Item.Cells[2].Text;
                txtdocid.Text = (string)e.Item.Cells[8].Text;

                txtrefrence.Text = (string)e.Item.Cells[2].Text;
                txtfilename.Text = (string)e.Item.Cells[3].Text;

                //trfile.Visible = true;
                RadWindow1.Title = "Schedule Edit";

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            else
            {
                lbldocid.Text = (string)e.Item.Cells[8].Text;
                lblmessage.Text = "Do You want to Delete the Schedule";
                string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
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


                string strKey = e.Item.Cells[9].Text;
                if (strKey == "2")
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

            }

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
        void UpdateDoc_list()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(txtdocid.Text);
            _objcls.doc_title = txtDocumenttitle.Text;
            _objcls.doc_name = txtfilename.Text;
            _objcls.reff = txtrefrence.Text;
            _objcls.title = "";

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
            _objcls.doc_id = Convert.ToInt32(txtdocid.Text);
            _objcls.doc_title = txtfilename.Text;

            string ext = System.IO.Path.GetExtension(txtfilename.Text);
            string filename = txtfilename.Text;
            if (ext == "") filename = txtfilename.Text + ".pdf";

            _objcls.doc_name = filename;

            _objcls.title = txtfilename.Text;
            _objcls.reff = txtrefrence.Text;
            _objcls.action = 1;
            _objbll.Update_Schedule_direct(_objcls, _objdb);
        }

        protected void RadGrid2_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
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
