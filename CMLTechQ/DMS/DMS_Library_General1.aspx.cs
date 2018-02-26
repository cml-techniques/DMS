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
using System.Web.UI.HtmlControls;
using PassProtection;

namespace CMLTechQ.DMS
{
    public partial class DMS_Library_General1 : System.Web.UI.Page
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
                Load_Library();
                Load_Manufacturer();

                if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
                {
                    hmenufolder.Value = Request.QueryString["Auth5"].ToString();

                }


                GenerateInnerNav_Doc(2);

            }
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
        //private void Load_Library_Main()
        //{
        //    BLL_Dml _objbll = new BLL_Dml();
        //    _clsproject _objcls = new _clsproject();
        //    _database _objdb = new _database();
        //    _objdb.DBName = "DBCML";
        //    _dtmaster = _objbll.Load_dms_library_general(_objdb);
        //    _dtresult = _dtmaster;
        //}
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
        private void Load_Library()
        {

            RadGrid1.DataSourceID = "SqlDataSource1"; ;
            //RadGrid1.DataBind();

            td_delete.Visible = false;
            haction.Value = "1";

        }
        private void Load_Manufacturer()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";

            drop_manufaturer.DataSource = _objbll.dms_manufacuter_general(_objdb);
            drop_manufaturer.DataTextField = "MANF_NAME";
            drop_manufaturer.DataValueField = "MANF_ID";
            drop_manufaturer.DataBind();

        }
        private bool Upload()
        {
            bool uploads = false;




            string filepath = Server.MapPath("Documents");
            string _filename = "";

            long clength = 0;
            foreach (Telerik.Web.UI.UploadedFile _fi in RadAsyncUpload1.UploadedFiles)
            {
                _filename = _fi.GetName();
                _fi.SaveAs(filepath + "//" + _fi.GetName(), true);
                txt_file.Text = _filename;

                clength = _fi.ContentLength;
            }

            //HttpPostedFile _file = Request.Files["myupload"];
            //HttpPostedFile _file1 = myupload.PostedFile;
            //string fileNameApplication = System.IO.Path.GetFileName(_file.FileName);
            //string fileExtensionApplication = System.IO.Path.GetExtension(fileNameApplication);
            //string _filename = fileNameApplication.Replace(" ", String.Empty);
            //_filename = fileNameApplication.Replace(",", String.Empty);
            //string filePath = System.IO.Path.Combine(Server.MapPath("DMSLibrary"), _filename);
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            ////if (Directory.Exists(Server.MapPath("DMSLibrary")) == false)
            ////    Directory.CreateDirectory(Server.MapPath("DMSLibrary"));
            ////if (fileNameApplication != String.Empty)
            ////{
            ////    _file.SaveAs(filePath);
            ////}
            ////else
            ////{
            ////    if (Convert.ToInt16(haction.Value) == 1)
            ////    {
            ////        return false;
            ////    }
            ////    else
            ////        _filename = txt_file.Text;
            ////}


            if (haction.Value == "1")
                _objcls.doc_id = 0;
            else
            {
                _objcls.doc_id = Convert.ToInt16(lblid.Text);
                _filename = txt_file.Text;
            }
            _objcls.service_code = 0;
            _objcls.schid = 0;
            _objcls.party_id = Convert.ToInt32(drop_manufaturer.SelectedValue);
            _objcls.type = txt_type.Text;
            _objcls.doc_title = txt_model.Text;
            _objcls.doc_name = _filename;
            _objcls.reff = txt_source.Text;
            _objcls.action = Convert.ToInt32(haction.Value);

            decimal _size_in_mb = decimal.Round((clength / 1024m) / 1024m, 2);
            _objcls.file_size = _size_in_mb.ToString() + "MB";



            _objcls.action = Convert.ToInt32(haction.Value);
            _objbll.dml_dms_library_general_new(_objcls, _objdb);
            uploads = true;

            if (Convert.ToInt16(haction.Value) == 1)
            {
                lblmsgs.Text = "Document successfully Saved";

                //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Document successfully Saved!');", true);
            }
            else
                lblmsgs.Text = "Document successfully Updated";
            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Document successfilly Updated!');", true);

            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            uploads = false;
            clear();
            return true;
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {

            if (drop_manufaturer.SelectedText == "")
            {
                //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select Manufacturer!');", true);
                //RadWindowManager1.RadAlert("Select Document Status", 200, 100, "Alert", "");
                return;
            }

            if (Upload()) Load_Library();

            //Session["pmanf"] = "Select Manufacturer";
            Load_Manufacturer();

            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            clear();

        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            //btndummy_//ModalPopupExtender.Hide();
            //Load_Library();

        }
        //protected void listman_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //txt_man.Text = listman.SelectedItem.Text;
        //    //lbl_manid.Text = listman.SelectedValue;
        //}



        //protected void chkbox_CheckedChanged(object sender, EventArgs e)
        //{
        //    CheckBox checkbox = (CheckBox)sender;
        //    RepeaterItem row = (RepeaterItem)checkbox.NamingContainer;
        //    HtmlTableRow trow = (HtmlTableRow)row.FindControl("trow");
        //    if (checkbox.Checked == true)
        //        trow.Attributes.Add("style", "background-color:#000000");
        //}


        //void Getdata()
        //{
        //    BLL_Dml _objbll = new BLL_Dml();
        //    _database _objdb = new _database();
        //    _clscassheet _objcls = new _clscassheet();
        //    _objdb.DBName = "DBCML";
        //    _objcls.sch = Convert.ToInt16(hdocid.Value);
        //    DataTable _dt = _objbll.Get_DMS_LIBRARY_GENERAL_Details(_objcls, _objdb);

        //    if (_dt.Rows.Count > 0)
        //    {
        //        //txt_man.Text = _dt.Rows[0]["MANF_NAME"].ToString();
        //        //lbl_manid.Text = _dt.Rows[0]["MAN_ID"].ToString();
        //        txt_type.Text = _dt.Rows[0]["CONTRA_TYPE"].ToString();
        //        txt_model.Text = _dt.Rows[0]["MODEL"].ToString();
        //        txt_source.Text = _dt.Rows[0]["SOURCE_NAME"].ToString();
        //        //txt_file.Text = _dt.Rows[0]["FILE_NAME"].ToString();
        //        //lbl_manid.Text = _dt.Rows[0]["MAN_ID"].ToString();
        //        Session["pmanf"] = _dt.Rows[0]["MANF_NAME"].ToString();
        //        btnsave.Text = "Update";
        //        //lbltitle.Text = "Edit Document";
        //        ScriptManager.RegisterStartupScript(this, typeof(string), "close", "set_chkvalue();", true);

        //        //if (txt_source.Text == "N/A") chksource.Checked = true;
        //        //if (txt_model.Text == "N/A") chkmodel.Checked = true;
        //        //hedit.Value = "0";
        //    }
        //    Load_Manufacturer();

        //}

        void clear()
        {
            drop_manufaturer.SelectedIndex = 0;
            txt_file.Text = "";
            txtManufacturer.Text = "";
            txt_type.Text = "";
            txt_source.Text = "";
            txt_model.Text = "";

            btnsave.Text = "Save";


            hedit.Value = "0";
            haction.Value = "1";
        }

        //protected void rptdetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {

        //        //System.Web.UI.HtmlControls.HtmlAnchor source_tag = (System.Web.UI.HtmlControls.HtmlAnchor)e.Item.FindControl("source_tag");
        //        //System.Web.UI.HtmlControls.HtmlLink lnl = (System.Web.UI.HtmlControls.HtmlLink)e.Item.FindControl("lnkfile");

        //        HyperLink _source_tag = (HyperLink)e.Item.FindControl("source_tag");
        //        Label lbl = (Label)e.Item.FindControl("lblsource");

        //        if (lbl.Text == "N/A")
        //        {
        //            _source_tag.Visible = false;
        //        }
        //        else
        //            _source_tag.Visible = true;


        //        //td1.Visible = false;

        //    }
        //}

        void delete()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsdocument _objcls = new _clsdocument();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = Convert.ToInt16(lbldocid.Text);
            _objcls.service_code = 0;
            _objcls.schid = 0;
            _objcls.party_id = 0;
            _objcls.type = "";
            _objcls.doc_title = "";
            _objcls.doc_name = "";
            _objcls.reff = "";
            _objcls.action = 3;
            _objcls.file_size = "";
            _objbll.dml_dms_library_general_new(_objcls, _objdb);

            hedit.Value = "0";

        }


        protected void btnconfirm_Click(object sender, EventArgs e)
        {
            delete();
            //Load_Library_Main();
            Load_Library();
            //Filter_Elements();
            //ModalPopupExtender1.Hide();


            string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        protected void btnno_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender1.Hide();
            //Filter_Elements();

            string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            txtManufacturer.Text = "";


            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            //Div1.Visible = true;
            //ModalPopupExtender2.Show();
            //ScriptManager.RegisterStartupScript(this, typeof(string), "showshadow", "showshadow();", true);
            //popdiv.d
            //Div1.Attributes.Add("displ-color", "black");


        }



        protected void btnaddtoproject_Click(object sender, EventArgs e)
        {
            int _countitem = 0;
            string _doc_id = "0";
            string doc_name = "";
            int _savedoccount = 0;
            // Filter_Elements();
            foreach (Telerik.Web.UI.GridDataItem _itm in RadGrid1.Items)
            {

                CheckBox _chk = (CheckBox)_itm.FindControl("chkselect");

                doc_name = (string)_itm.Cells[9].Text;

                _doc_id = (string)_itm.Cells[7].Text;
                if (_chk.Checked == true)
                {

                    if (checkexsts(_doc_id) > 0)
                    {

                        //ScriptManager.RegisterStartupScript(this, typeof(string), "hide", "alert(' "+ doc_name +": already Exists');", true);

                        lblmsgs.Text = "" + doc_name + ": already Exists'";
                        string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

                    }
                    else
                    {

                        AddToProject(Convert.ToInt32(_doc_id));


                        _savedoccount += 1;
                        //ScriptManager.RegisterStartupScript(this, typeof(string), "hide", "alert('" + _countitem.ToString() + " documents added to the project');", true);


                    }
                    _countitem += 1;
                    _chk.Checked = false;


                }
            }
            if (_countitem == 0)
            {
                //ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('No Document Selected');", true);

                lblmsgs.Text = "No Document Selected";
                string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

                return;
            }
            if (_savedoccount > 0)
            {

                lblmsgs.Text = _savedoccount.ToString() + " : Documents Added to the Project";
                string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

                //scriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('" + _savedoccount.ToString()+" : documents added to the project');", true);
                return;
            }


        }
        private int checkexsts(string docid)
        {


            int existcount = 0;

            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.doc_id = Convert.ToInt32(docid);

            existcount = _objbll.Get_Document_Library_Count(_objcls, _objdb);


            return existcount;
        }

        private void AddToProject(int _id)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = _id;
            _objcls.project_code = lblprj.Text;
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.uid = lbluserid.Text;
            _objbll.AddToProject_Library(_objcls, _objdb);


        }
        protected void chkbox_CheckedChanged1(object sender, EventArgs e)
        {

        }

        protected void chk_box_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox checkbox = (CheckBox)sender;
            RepeaterItem row = (RepeaterItem)checkbox.NamingContainer;
            HyperLink tick = (HyperLink)row.FindControl("HyperLink2");
            if (checkbox.Checked == true)
                tick.Attributes.Add("style", "display:block");
        }

        protected void btnfilter_Click(object sender, EventArgs e)
        {
        }
        private static void Filtering(string _str1, string _str2, string _str3)
        {
            //int _i = _dtmaster.Rows.Count;
            //if (_i == 0) return;
            //string _filter = "('" + _str1 + "'='ALL' OR [MANF_NAME]='" + _str1 + "') AND ('" + _str2 + "'='ALL' OR [CONTRA_TYPE]='" + _str2 + "') AND ('" + _str3 + "'='ALL' OR [MODEL]='" + _str3 + "')";
            //var _result = _dtmaster.Select(_filter);
            //DataTable _dtfilter = _result.Any() ? _result.CopyToDataTable() : _dtmaster.Clone();
            //_dtresult = _dtfilter;
        }


        protected void btnadd_Click(object sender, System.EventArgs e)
        {
            haction.Value = "1";
            td_delete.Visible = false;

            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        protected void btncancelm_Click(object sender, System.EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }
        protected void btnmanu_Click(object sender, EventArgs e)
        {
            if (txtManufacturer.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "message", "alert('Enter Manufacturer Name');", true);
                return;
            }
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsmanufacture _objcls = new _clsmanufacture();
            _objcls.project_code = lblprj.Text;
            _objcls.man_name = txtManufacturer.Text;
            _objbal.Insert_Manufaturer_tbl_General(_objcls, _objdb);
            //////ModalPopupExtender2.Hide();
            Load_Manufacturer();
            //ScriptManager.RegisterStartupScript(this, typeof(string), "hide", "hideshadow();", true);
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            if (Check_Exist(drop_manufaturer, txtManufacturer.Text) == true) drop_manufaturer.FindItemByText(txtManufacturer.Text).Selected = true;
        }

        protected void SqlDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
        {

        }
        private bool Check_Exist(Telerik.Web.UI.RadDropDownList _drop, string _item)
        {
            foreach (Telerik.Web.UI.DropDownListItem _lst in _drop.Items)
            {
                if (string.Compare(_lst.Text, _item) == 0) return true;
            }
            return false;
        }
        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName == "edits")
            {
                td_delete.Visible = true;

                haction.Value = "2";

                lblid.Text = (string)e.Item.Cells[7].Text;
                string manufacture = (string)e.Item.Cells[3].Text;

                txt_type.Text = (string)e.Item.Cells[4].Text;

                txt_model.Text = (string)e.Item.Cells[5].Text;
                txt_source.Text = (string)e.Item.Cells[8].Text;

                txt_file.Text = (string)e.Item.Cells[9].Text;

                drop_manufaturer.ClearSelection();
                if (Check_Exist(drop_manufaturer, manufacture) == true) drop_manufaturer.FindItemByText(manufacture).Selected = true;

                if (txt_model.Text == "N/A") chk_model.Checked = true;
                if (txt_source.Text == "N/A") chk_source.Checked = true;

                btnsave.Text = "Update";


                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);


            }
            else if (e.CommandName == "delete")
            {
                lbldocid.Text = (string)e.Item.Cells[7].Text;

                haction.Value = "3";

                lblmessage.Text = "Do You want to Delete the Document";
                string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {


            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                string source = (string)e.Item.Cells[8].Text;


                HyperLink _source_tag = (HyperLink)e.Item.FindControl("source_tag");


                if (source == "N/A")
                {
                    _source_tag.Visible = false;
                }
                else
                    _source_tag.Visible = true;



            }
        }
        private void InsertDocuments(string _file, long _size, string title)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_name = _file;
            _objcls.doc_title = title;
            _objcls.doctype_code = 0;
            _objcls.package_code = 0;
            _objcls.uploaded_date = DateTime.Now;
            _objcls.service_code = 0; ;
            _objcls.uploaded = true;
            _objcls.schid = 0;
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            decimal _size_in_mb = decimal.Round((_size / 1024m) / 1024m, 2);
            _objcls.file_size = _size_in_mb.ToString() + "MB";
            _objcls.uid = lbluserid.Text;
            _objcls.type = "";
            _objcls.possition = 1;
            _objcls.status = "REVIEW";
            _objcls.Manual_title = _file.Substring(0, _file.LastIndexOf("."));
            _objcls.Review = true;
            _objcls.DisplayVersion = "";
            _objcls.DocStyleId = 0;
            _objcls.DocStyleChange = false;
            _objcls.submit = true;
            _objcls.reff = "No";
            _objbll.FileUploading_New(_objcls, _objdb);
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

    }
}