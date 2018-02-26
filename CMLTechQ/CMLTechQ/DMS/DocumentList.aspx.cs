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
using System.Web.UI.HtmlControls;
namespace CMLTechQ.DMS
{
    public partial class DocumentList : System.Web.UI.Page
    {
        static DataTable dtdocStyle;
        static DataTable dtstylemaster;
        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            //scriptManager.RegisterPostBackControl(this.btndummy1);

            //Response.BufferOutput = false;
            if (!IsPostBack)
            {
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                if (lblfolder.Text == "0")
                {
                    lblfolder.Text = GetDefaultNav(Request.QueryString["Auth4"].ToString());
                }
                Get_User();
                loadPageprojectinfo();
                load_document();
                load_contractor();

                LoadStyleMaster();

                LoadVersion();


                Load_DocumentStatus();

                lbldocstylechange.Text = "false";

                Session["closestatus"] = 5;


                if (lbluserid.Text.IndexOf("@cmlgroup.ae") <=0)
                {
                    foreach (DropDownListItem lst in rd_action1.Items)
                    {
                        if (lst.Value == "1") lst.Enabled = false;

                    }
                    foreach (DropDownListItem lst in rd_action2.Items)
                    {
                        if (lst.Value == "2") lst.Enabled = false;

                    }

                }

            }
        }
        private void Load_DocumentStatus()
        {
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;
            DataTable _dt = _objbal.load_DocumentStatus(_objcls, _objdb);
            rd_editstatus.DataSource = _dt;
            rd_editstatus.DataTextField = "StatusName";
            rd_editstatus.DataValueField = "StatusId";
            rd_editstatus.DataBind();
        }

        //protected void TimerTick(object sender, EventArgs e)
        //{
        //    load_document();
        //    load_contractor();

        //    LoadStyleMaster();

        //    LoadVersion();
        //    loadPageprojectinfo();


        //    lbldocstylechange.Text = "false";
        //    Timer1.Enabled = false;
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

        private string GetDefaultNav(string folder_id)
        {
            string defaultnav = "0";
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clstreefolder _objcls = new _clstreefolder();
            _objdb.DBName = "DBCML";
            _objcls.Folder_id = Convert.ToInt32(folder_id);
            DataTable dt = _objbll.Get_DafaultNavFolder(_objcls, _objdb);
            if (dt.Rows.Count > 0) defaultnav = dt.Rows[0][0].ToString();
            return defaultnav;
        }
        private void loadPageprojectinfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt32(lblfolder.Text);
            DataTable dt = _objbll.Get_folderProjectdescription1(_objcls, _objdb);
            if (dt.Rows.Count > 0) pageinfo.Text = dt.Rows[0][0].ToString();
            //  pageinfo.Text = pageinfo.Text;
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
        private void load_document()
        {

            _clstreefolder objcls = new _clstreefolder();
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            objcls.Folder_id = Convert.ToInt32(lblfolder.Text);
            DataTable _dtresult;
            DataTable _dt = _objbll.load_AllDocumentsDirectFolder(objcls, _objdb);
            var _result = _dt.Select("Type=1 And Enabled=true");
            _dtresult = _result.Any() ? _result.CopyToDataTable() : _dt.Clone();
            RadGrid1.DataSource = _dtresult;
            RadGrid1.DataBind();

        
            _result = _dt.Select("Type=1 And Enabled=false");
            _dtresult = _result.Any() ? _result.CopyToDataTable() : _dt.Clone();

            //Blocking Previous Versions for Jordan-Queen Aliya Airport Non CML User

            if (lblprj.Text == "QAIA" && !lbluserid.Text.Contains("@cmlgroup.ae"))
            {
                _dtresult.Rows.Clear();
                dvlPreviousOM.Visible = false;
            }

            RadGrid2.DataSource = _dtresult;
            RadGrid2.DataBind();

        }


        void load_contractor()
        {
            rd_editcontractor.Items.Clear();
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;
            rd_editcontractor.DataSource = _objbal.load_Contractor(_objcls, _objdb);
            rd_editcontractor.DataTextField = "con_name";
            rd_editcontractor.DataValueField = "con_code";
            rd_editcontractor.DataBind();
        }

        private bool FileValidation(string _fileName)
        {
            if (string.IsNullOrEmpty(_fileName))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select the file!');", true);
                return true;
            }
            else if (ChekSpecialCharacter(_fileName) == true)
            {

                return true;
            }

            else if (!(_fileName.EndsWith(".pdf", StringComparison.Ordinal) || _fileName.EndsWith(".Pdf", StringComparison.Ordinal) || _fileName.EndsWith(".PDF", StringComparison.Ordinal)))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('File format should be .Pdf!');", true);
                return true;
            }
            else
                return false;

        }
        private bool ChekSpecialCharacter(string FileName)
        {
            if (FileName.Contains("&") == true || FileName.Contains("%") == true)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Speacial characters not allowed');", true);
                return true;
            }
            return false;
        }

        private bool DateValidation(string dateString)
        {

            if (string.IsNullOrEmpty(dateString))
            {
                dateString = DateTime.Now.AddDays(30).ToString();
            }

            DateTime dateValue;
            string[] format = new string[] { "dd/MM/yyyy" };
            string[] format1 = new string[] { "dd/MM/yy" };
            string[] format2 = new string[] { "M/dd/yyyy" };
            if (DateTime.TryParseExact(dateString, format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.NoCurrentDateDefault, out dateValue))
                return true;
            else if (DateTime.TryParseExact(dateString, format1, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.NoCurrentDateDefault, out dateValue))
                return true;
            else if (DateTime.TryParseExact(dateString, format2, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.NoCurrentDateDefault, out dateValue))
                return true;
            else
                return false;

        }



        string GetFolderName()
        {
            string foldername = "";
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();

            _objcls.Folder_id = Convert.ToInt32(lblfolder.Text);

            DataTable dtd = _objbal.Get_Folder_Description(_objcls, _objdb);
            if (dtd.Rows.Count > 0) foldername = dtd.Rows[0][0].ToString();
            return foldername;
        }
        protected void chkglobalperiod_CheckedChanged(object sender, EventArgs e)
        {

        }
        void LoadVersion()
        {
            DataTable dt;
            //listrev.Items.Clear();
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.enabled = false;
            _objdb.DBName = "dbCML";
            dt = _objbal.GetDocumentVersion(_objcls, _objdb);
            dtstylemaster = dt;


            if (dt.Rows.Count > 0)
            {
                lbldocstyleId.Text = dt.Rows[0]["DocStyleId"].ToString();

                if (Convert.ToInt32(lbldocstyleId.Text) > 0)
                {
                    SetDafaultStyle(Convert.ToInt32(lbldocstyleId.Text));
                }
            }



        }
        //protected void btngolatest_Click(object sender, EventArgs e)
        //{

  

        //}
        protected void listaction1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txt_action1.Text = listaction1.SelectedItem.Text;

            //if (txt_action1.Text == "Select Action...")
            //{
            //    ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Select Action');", true);
            //    return;
            //}
            //if (txt_action1.Text == "Upload New")
            //{
            //    string _prm = "&Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text;
            //    Response.RedirectPermanent("OMUpload?=" + _prm, false);
            //}
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {

           
        }



        protected void datalist_latest_ItemCommand(object source, RepeaterCommandEventArgs e)
        {


        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            if (Validation()) return;
            UpdateDocumentDetails();
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 
            load_document();
        }


        protected void cmdcancel_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 

        }
        void UpdateDocumentDetails()
        {
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();

            _objcls.doc_title = rd_editcontractor.SelectedItem.Text;
            _objcls.uid = (string)lbluserid.Text;
            _objcls.status = rd_editstatus.SelectedItem.Text;
            _objcls.Manual_title = txt_doctitle.Text;
            _objcls.DisplayVersion = rd_editstyle.SelectedItem.Text;
            _objcls.doc_id = Convert.ToInt32(txtdocid.Text);
            _objcls.DocStyleChange = Convert.ToBoolean(lbldocstylechange.Text);
            //if (lbldocstylechange.Text == "true")
            //{
            _objcls.DocStyleId = Convert.ToInt32(lbldocstyleId.Text);

            //}else
            //    _objcls.DocStyleId = Convert.ToInt16(dr_revision.SelectedItem.Value);    
            _objcls.folder_id = Convert.ToInt32(lblfolder.Text);
            _objbal.Update_documentdetails(_objcls, _objdb);

        }
        private bool Validation()
        {

            if (txt_doctitle.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter Manual Title');", true);
                return true;
            }
            else if (rd_editstatus.SelectedText == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select Status');", true);
                return true;
            }
            else if (rd_editcontractor.SelectedText == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select Contractor');", true);
                return true;
            }
            else if (rd_editstyle.SelectedText == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select Revision');", true);
                return true;
            }
            return false;
        }

        protected void datalist_previous_ItemCommand(object source, RepeaterCommandEventArgs e)
        {


        }

        protected void btnAddcntr_Click(object sender, EventArgs e)
        {
            lbldocstylechange.Text = "true";
            lbldocstyleId.Text = rd_style.SelectedValue;


            rd_editstyle.SelectedIndex = Convert.ToInt16(hindex.Value);



            SetDafaultStyle(Convert.ToInt32(lbldocstyleId.Text));
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 
        }
        void LoadStyleComboMaster()
        {
            rd_style.DataSource = dtdocStyle;
            rd_style.DataValueField = "DocStyleId";
            rd_style.DataTextField = "StyleFormat";
            rd_style.DataBind();
        }


        protected void Cancel_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender2.Hide();

        }
        void SetDafaultStyle(int docid)
        {

            // DataTable dt = (DataTable)Session["DocStyle"];
            // DataTable dt1 = (DataTable)Session["DocVersion"];


            DataRow[] sel = dtdocStyle.Select("DocStyleId=" + docid);
            string[] styledata = { };

            foreach (DataRow dr in sel)
            {
                styledata = dr["StyleData"].ToString().Split(',');
            }



            DataTable dt2 = new DataTable();
            dt2.Columns.Add("version");
            DataRow dr3;



            foreach (DataRow dr1 in dtstylemaster.Rows)
            {
                dr3 = dt2.NewRow();
                dr3["version"] = styledata.GetValue(Convert.ToInt32(dr1["version"].ToString()) - 1).ToString();
                dt2.Rows.Add(dr3);

            }


            dt2.DefaultView.Sort = "version desc";
            dt2.AcceptChanges();

            rd_editstyle.DataSource = dt2;
            rd_editstyle.DataTextField = "version";
            rd_editstyle.DataBind();


        }


        void LoadStyleMaster()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            dtdocStyle = _objbll.Load_DocumentStyleMaster(_objdb);

        }

        void Delete_DmsDocument()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsdocument _objcls = new _clsdocument();
            _objdb.DBName = "DBCML";
            if (lbldocid.Text == "0")
            {

                foreach (Telerik.Web.UI.GridDataItem row in RadGrid1.Items)
                {
                    _objcls.uid = lbluserid.Text;
                    _objcls.doc_id = Convert.ToInt32(row.Cells[8].Text);
                    _objbll.Delete_DMS_Document_New(_objcls, _objdb);
                }

            }
            else
            {
                _objcls.uid = lbluserid.Text;
                _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
                _objbll.Delete_DMS_Document_New(_objcls, _objdb);
            }

        }
        protected void btndelete_Click(object sender, EventArgs e)
        {

            //string s = txtdocid.Text;
            Delete_DmsDocument();
            load_document();
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 
        }

        protected void btnContrcator_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtcontractor.Text))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter the Contractor !');", true);
                //ModalPopupExtender3.Show();
                txtcontractor.Focus();
                return;
            }

            if (checkContractorexists() != 0)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert(' Contractor already Exists !');", true);
                //ModalPopupExtender3.Show();
                txtcontractor.Focus();
                return;
            }

            if (txtcontractor.Text == "") return;
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsmanufacture _objcls = new _clsmanufacture();
            _objcls.project_code = lblprj.Text;
            _objcls.man_name = txtcontractor.Text;
            _objbal.Create_Contractor(_objcls, _objdb);
            load_contractor();
            if (Check_Exist(rd_editcontractor, txtcontractor.Text) == true)
            {
                rd_editcontractor.ClearSelection();
                rd_editcontractor.FindItemByText(txtcontractor.Text).Selected = true;
            }
            txtcontractor.Text = "";
            string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 

        }
        private bool Check_Exist(RadDropDownList _drop, string _item)
        {
            foreach (DropDownListItem _lst in _drop.Items)
            {
                if (string.Compare(_lst.Text, _item) == 0) return true;
            }
            return false;
        }
        int checkContractorexists()
        {
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsmanufacture _objcls = new _clsmanufacture();
            _objcls.project_code = lblprj.Text;
            _objcls.man_name = txtcontractor.Text;

            return _objbal.Check_Contractor_Exits(_objcls, _objdb);


        }
        protected void btncancelc_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 

        }
        protected void btnaddcont_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow3.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }

        protected void btnChangeStyle_Click(object sender, EventArgs e)
        {
            hindex.Value=rd_editstyle.SelectedIndex.ToString();
            LoadStyleComboMaster();
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

        }


        protected void btndummy1_Click(object sender, EventArgs e)
        {



            //ModalPopupExtender1.Show();
        }

        protected void btndummy2_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender2.Show();


        }

        protected void btndummy3_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender3.Show();

        }

        //protected void btnDel_Click(object sender, EventArgs e)
        //{

        //    if (CheckStyleExits() > 0)
        //    {

        //        ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Cannot delete Style because it used by another Document');", true);
        //        return;
        //    }

        //    string s = drstyle.SelectedValue;
        //    Delete_Defaultstyle();
        //    LoadStyleMaster();
        //    LoadStyleComboMaster();
        //    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Style Deleted Successfully');", true);
        //    ModalPopupExtender2.Hide();



        //}
        void Delete_Defaultstyle()
        {
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.project_code = lblprj.Text;
            _objcls.DocStyleId = Convert.ToInt32(rd_style.SelectedValue);
            _objbal.Delete_DocumentStyle(_objcls, _objdb);
        }
        int CheckStyleExits()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(rd_style.SelectedValue);

            int rvalue = 0;
            rvalue = _objbll.Check_DocumentStyleExists(_objcls, _objdb);
            return rvalue;

        }

        protected void btndownload_Click(object sender, EventArgs e)
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(hdocid.Value);

            DataTable dt = _objbll.Get_DocumentFileName(_objcls, _objdb);
            string docName = "";

            if (dt.Rows.Count > 0) docName = dt.Rows[0][0].ToString();

            if (!string.IsNullOrEmpty(docName))
            {

                try
                {
                    //string _file = "OM_17599d87afd6-1245-4dec-ac78-22e72e1d92c2.pdf";
                    string _path = System.IO.Path.Combine(Server.MapPath("Documents/") + docName);

                    System.IO.FileInfo _finfo = new System.IO.FileInfo(_path);
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
        }

        //protected void btngoprevious_Click(object sender, EventArgs e)
        //{
           
        //}

        protected void doc_list_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit_")
            {

                LoadVersion();
                Label _id = (Label)e.Item.FindControl("lblid");
                Label _title = (Label)e.Item.FindControl("lbltitle");
                Label _contr = (Label)e.Item.FindControl("lbldoctitle");
                Label _version = (Label)e.Item.FindControl("lblversion");
                Label _status = (Label)e.Item.FindControl("lblstatus");
                txt_doctitle.Text = _title.Text;
                txtdocid.Text = _id.Text;
                rd_editcontractor.ClearSelection();
                rd_editstatus.ClearSelection();
                rd_editstyle.ClearSelection();
                if (Check_Exist(rd_editcontractor, _contr.Text) == true) rd_editcontractor.FindItemByText(_contr.Text).Selected = true;
                if (Check_Exist(rd_editstatus, _status.Text) == true) rd_editstatus.FindItemByText(_status.Text).Selected = true;
                if (Check_Exist(rd_editstyle, _version.Text) == true) rd_editstyle.FindItemByText(_version.Text).Selected = true;
                //lbldocindex.Text = listrev.Items.IndexOf(listrev.Items.FindByText(_version.Text)).ToString();
                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else if (e.CommandName == "Delete")
            {
                Label _id = (Label)e.Item.FindControl("lblid");
                txtdocid.Text = _id.Text;
                lblmessage.Text = "Are you sure want to delete the selected document?";
                string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else if (e.CommandName == "Download")
            {
                Label _file = (Label)e.Item.FindControl("lbldoc");
                DownLoad_Single(_file.Text);
            }
        }

        
        //protected void doc_list_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        //{
        //    doc_list.EditIndex = -1;
        //    //load_document();
        //}

        protected void doc_list_Previous_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit_")
            {
                LoadVersion();

                Label _id = (Label)e.Item.FindControl("lblid");
                Label _title = (Label)e.Item.FindControl("lbltitle");
                Label _contr = (Label)e.Item.FindControl("lbldoctitle");
                Label _version = (Label)e.Item.FindControl("lblversion");
                Label _status = (Label)e.Item.FindControl("lblstatus");
                txt_doctitle.Text = _title.Text;
                txtdocid.Text = _id.Text;
                rd_editcontractor.ClearSelection();
                rd_editstatus.ClearSelection();
                rd_editstyle.ClearSelection();
                if (Check_Exist(rd_editcontractor, _contr.Text) == true) rd_editcontractor.FindItemByText(_contr.Text).Selected = true;
                if (Check_Exist(rd_editstatus, _status.Text) == true) rd_editstatus.FindItemByText(_status.Text).Selected = true;
                if (Check_Exist(rd_editstyle, _version.Text) == true) rd_editstyle.FindItemByText(_version.Text).Selected = true;
                //lbldocindex.Text = listrev.Items.IndexOf(listrev.Items.FindByText(_version.Text)).ToString();
                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else if (e.CommandName == "Delete")
            {
                Label _id = (Label)e.Item.FindControl("lblid");
                txtdocid.Text = _id.Text;
                lblmessage.Text = "Are you sure want to delete the selected document?";
                string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else if (e.CommandName == "Download")
            {
                Label _file = (Label)e.Item.FindControl("lbldoc");
                DownLoad_Single(_file.Text);
            }
        }

        //protected void doc_list_Previous_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        //{
        //    doc_list_Previous.EditIndex = -1;
        //    //load_document();
        //}

        protected void btnno_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 
        }
        protected void btnconfirm_Click(object sender, EventArgs e)
        {
            Delete_DmsDocument();
            load_document();
            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 
        }
        protected void btnno1_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 
        }
        protected void btnconfirm1_Click(object sender, EventArgs e)
        {
            //Delete_Schedule();
            //btndummy1_ModalPopupExtender.Hide();
        }
        private void DownLoad_Single(string _filename)
        {
            try
            {
                //string _file = "OM_17599d87afd6-1245-4dec-ac78-22e72e1d92c2.pdf";
                string _path = System.IO.Path.Combine(Server.MapPath("Documents/") + _filename);
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
        bool GetDuration()
        {
            bool docview = false;

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(hdocid.Value);
            DataTable _dtduration = _objbll.LoadDocDatails(_objcls, _objdb);

            DateTime _date = DateTime.Now;
            int duration = 0;
            foreach (DataRow drow in _dtduration.Rows)
            {
                _date = Convert.ToDateTime(drow[1].ToString());
                duration = Convert.ToInt32(drow[2].ToString());

            }

            System.TimeSpan diff = DateTime.Now.Subtract(_date);

            if (duration >= diff.Days) docview = true;
            //return docview;
            return true;

            //var _service = from o in _dtduration.AsEnumerable()
            //               select o;
            //DateTime _date = DateTime.Now;
            //int duration = 0;
            //foreach (var row in _service)
            //{
            //    _date = Convert.ToDateTime(row[1].ToString());
            //    if (row[2].ToString() != "")
            //        duration = Convert.ToInt32(row[2].ToString());
            //    //_Create_Cookies();
            //    lbstatus.Text = row[3].ToString();
            //    lblsrv.Text = row["service_code"].ToString();
            //    //if(lbstatus.Text != "ACCEPTED")
            //    //    duration = Convert.ToInt32(row[2].ToString());
            //}
            //System.TimeSpan diff = DateTime.Now.Subtract(_date);
            //if (duration <= diff.Days)
            //{
            //    lbduration.Text = "DOCUMENT IS CLOSED";
            //    //lbstatus.Text = "CLOSSED";
            //    mydiv.Visible = false;
            //}
            //else
            //{
            //    lbduration.Text = (duration - diff.Days).ToString() + " DAYS REMAINING FOR REVIEWING";
            //}
            //if (lbduration.Text != "DOCUMENT IS CLOSED")
            //{
            //    cmdsave.Visible = true;
            //    if ((string)Session["access"] == "Review/Comment")
            //    {
            //        mydiv.Visible = false;
            //        mydiv1.Visible = false;
            //    }
            //    else
            //    {
            //        mydiv.Visible = true;
            //        mydiv1.Visible = true;
            //    }
            //}
            //else
            //{
            //    if ((string)Session["access"] != "Review/Comment")
            //    {
            //        mydiv1.Visible = true;
            //        cmdsave.Visible = true;
            //        cmdsave.Text = "Update Status";
            //    }
            //    else
            //        cmdsave.Visible = false;
            //    mydiv.Visible = false;

        }
        bool getdocStstus()
        {

            string status = "";
            bool docstatus = false;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(hdocid.Value);

            DataTable _dt = _objbll.Get_DocumentDetails(_objcls, _objdb);

            if (_dt.Rows.Count > 0) status = _dt.Rows[0]["status"].ToString();
            if ((status == "For Review") || status == "Revised") docstatus = true;

            return docstatus;

        }
        bool CheckUserPermission()
        {
            bool userpermission = false;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;
            _objcls.uid = lbluserid.Text;


            DataTable _dt = _objbll.Get_UserProjectPermission(_objcls, _objdb);
            foreach (DataRow drow in _dt.Rows)
            {
                if ((drow["access_level"].ToString() == "Super Admin") || (drow["access_level"].ToString() == "Review/Comment") || (drow["access_level"].ToString() == "Review/Comment/Status"))
                {
                    userpermission = true;
                    break;
                }

            }

            return userpermission;

        }
        protected void btndummyView_Click(object sender, EventArgs e)
        {
            bool docviewcomment = false;

            if (hreview.Value == "True")
            {
                if ((GetDuration()) && (getdocStstus()) && (CheckUserPermission())) docviewcomment = true;

                //if (GetDuration()) docviewcomment = true;
                //if (getdocStstus()) docviewcomment = true;
                //if (CheckUserPermission()) docviewcomment = true; 

            }



             string _redirect ="";
            if (docviewcomment)
            {
                //Response.Redirect("OMView?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + hdocid.Value + "&Auth5=" + hfile.Value);
              _redirect= "ViewManual?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + hdocid.Value + "&Auth5=" + hfile.Value;
               //string _redirect = "ViewOM?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + hdocid.Value + "&Auth5=" + hfile.Value;
                //string _redirect = "ViewDocument?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + hdocid.Value + "&Auth5=" + hfile.Value;
                //string _redirect = "OMView?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + hdocid.Value + "&Auth5=" + hfile.Value;
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "parent.location.replace('"+ _redirect +"');", true);
            }
            else
            {
                _redirect = "ViewFullDocument?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + hdocid.Value + "&Auth5=" + hfile.Value;
            }
             ScriptManager.RegisterStartupScript(this, typeof(string), "close", "parent.location.replace('"+ _redirect +"');", true);
                //Response.Redirect("Docview?Id=" + hdocid.Value + "&File=" + hfile.Value + "&source=1");
            }
        protected void liststatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txt_status.Text = liststatus.SelectedItem.Text;
        }
        protected void listcontr_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txt_contr.Text = listcontr.SelectedItem.Text;
        }
        protected void listrev_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txt_rev.Text = listrev.SelectedItem.Text;
        }
        protected void listaction2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txt_action2.Text = listaction2.SelectedItem.Text;
            //if (txt_action2.Text == "Select Action...")
            //{
            //    ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Select Action');", true);
            //    return;
            //}
            //if (txt_action2.Text == "Download All")
            //{
            //    using (ZipFile zip = new ZipFile())
            //    {
            //        zip.AlternateEncodingUsage = ZipOption.AsNecessary;
            //        zip.AddDirectoryByName("Documents");
            //        int _count = 0;
            //        foreach (ListViewItem item in doc_list_Previous.Items)
            //        {
            //            CheckBox chk = (CheckBox)item.FindControl("lbltick");
            //            Label lbldoc = (Label)item.FindControl("lbldoc");
            //            string path = Path.GetFullPath(Server.MapPath("Documents/") + lblprj.Text + "/" + lbldoc.Text);
            //            System.IO.FileInfo _finfo = new System.IO.FileInfo(path);
            //            if (_finfo.Exists == true)
            //            {
            //                zip.AddFile(path, "Documents");
            //                _count += 1;
            //            }
            //        }

            //        //UpdatePanel1.Update();
            //        if (_count == 0) return;
            //        try
            //        {

            //            Response.Clear();
            //            string zipName = String.Format("O&M_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
            //            Response.AddHeader("Content-Disposition", "attachment; filename=" + zipName);
            //            Response.ContentType = "application/zip";

            //            zip.Save(Response.OutputStream);


            //            //load_document();



            //            Response.End();

            //        }
            //        catch (Exception)
            //        {
            //            throw;
            //        }


            //    }

            //}
            //else if (txt_action2.Text == "Delete All")
            //{
            //    txtdocid.Text = "0";
            //    lblmessage.Text = "Are You Sure Want To Delete All Previous Documents?";
            //    btndummy_ModalPopupExtender.Show();
            //}
        }

        protected void Butnbtndownloadall_Click(object sender, EventArgs e)
        {
            using (ZipFile zip = new ZipFile())
            {
                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                zip.AddDirectoryByName("Documents");
                int _count = 0;
                foreach (ListViewItem item in RadGrid2.Items)
                {
                    CheckBox chk = (CheckBox)item.FindControl("lbltick");
                    Label lbldoc = (Label)item.FindControl("lbldoc");
                    string path = Path.GetFullPath(Server.MapPath("Documents/") + lbldoc.Text);
                    System.IO.FileInfo _finfo = new System.IO.FileInfo(path);
                    if (_finfo.Exists == true)
                    {
                        zip.AddFile(path, "Documents");
                        _count += 1;
                    }
                }

                if (_count == 0) return;
                try
                {

                    Response.Clear();
                    string zipName = String.Format("O&M_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
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

       
        
        protected void rd_action1_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            string _redirect = "OMUpload?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text;
            Response.Redirect(_redirect);
        }
        protected void rd_action2_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            switch (rd_action2.SelectedValue)
            {
                case "1":
                    {
                        string _path = "DocumentDownload?folder=" + lblfolder.Text;
                        ScriptManager.RegisterStartupScript(this, typeof(string), "close", "window.open('" + _path + "');", true);
                        break;
                    }
                case "2":
                    {
                        lbldocid.Text = "0";
                        lblmessage.Text = "Are You Sure Want To Delete All Documents?";
                        string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
                        rd_action2.ClearSelection();
                        break;

                    }

            }
        }

        protected void btnCancel1_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {

            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Telerik.Web.UI.GridDataItem dataItem = e.Item as Telerik.Web.UI.GridDataItem;

                //RadChart chart = e.Item.FindControl("Chart_CourseGrade") as RadChart;


                LinkButton lnkcomments = (LinkButton)e.Item.FindControl("lnkcomments");


                if (dataItem.Cells[4].Text == "For Information")
                {
                    lnkcomments.Enabled = false;
                    lnkcomments.OnClientClick = null;
                    lnkcomments.Style.Add("cursor", "not-allowed");
                }

               

                if (lbluserid.Text.IndexOf("@cmlgroup.ae") <= 0)
                {
                    (dataItem["deleteColumn"].Controls[0] as ImageButton).Enabled = false;
                    (dataItem["deleteColumn"].Controls[0] as ImageButton).Style.Add("cursor","not-allowed");
                    (dataItem["editColumn"].Controls[0] as ImageButton).Enabled = false;
                    (dataItem["editColumn"].Controls[0] as ImageButton).Style.Add("cursor", "not-allowed");
                }


            }
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
           
            if (e.CommandName == "edits")
            {
                txtdocid.Text = (string)e.Item.Cells[8].Text;
                txt_doctitle.Text = (string)e.Item.Cells[10].Text;

                LoadVersion();

             
              string status = (string)e.Item.Cells[4].Text;
              string version = (string)e.Item.Cells[3].Text;
              string contactor = (string)e.Item.Cells[9].Text;


                rd_editcontractor.ClearSelection();
                rd_editstatus.ClearSelection();
                rd_editstyle.ClearSelection();
                if (Check_Exist(rd_editcontractor, contactor) == true) rd_editcontractor.FindItemByText(contactor).Selected = true;
                if (Check_Exist(rd_editstatus, status) == true) rd_editstatus.FindItemByText(status).Selected = true;
                if (Check_Exist(rd_editstyle, version) == true) rd_editstyle.FindItemByText(version).Selected = true;

                //lbldocindex.Text = listrev.Items.IndexOf(listrev.Items.FindByText(_version.Text)).ToString();

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);


            }
            else if (e.CommandName == "delete")
            {
                lbldocid.Text = (string)e.Item.Cells[8].Text;

                lblmessage.Text = "Do You want to Delete the Document";
                string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
            }
            else if (e.CommandName == "download")
            {
                hfile.Value = (string)e.Item.Cells[11].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "download", "ondownload();", true);

            }
            load_document();

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

                LinkButton lnkcomments = (LinkButton)e.Item.FindControl("lnkcomments1");
                if (dataItem.Cells[4].Text == "For Information")
                {
                    lnkcomments.Enabled = false;
                    lnkcomments.OnClientClick = null;
                    lnkcomments.Style.Add("cursor", "not-allowed");
                }


            }

        }

        protected void RadGrid2_ItemCommand(object sender, GridCommandEventArgs e)
        {
           
           
          
            if (e.CommandName == "edits")
            {
                txt_doctitle.Text = (string)e.Item.Cells[10].Text;
                txtdocid.Text = (string)e.Item.Cells[8].Text;

                LoadVersion();


                string status = (string)e.Item.Cells[4].Text;
                string version = (string)e.Item.Cells[3].Text;
                string contactor = (string)e.Item.Cells[9].Text;


                rd_editcontractor.ClearSelection();
                rd_editstatus.ClearSelection();
                rd_editstyle.ClearSelection();
                if (Check_Exist(rd_editcontractor, contactor) == true) rd_editcontractor.FindItemByText(contactor).Selected = true;
                if (Check_Exist(rd_editstatus, status) == true) rd_editstatus.FindItemByText(status).Selected = true;
                if (Check_Exist(rd_editstyle, version) == true) rd_editstyle.FindItemByText(version).Selected = true;

                //lbldocindex.Text = listrev.Items.IndexOf(listrev.Items.FindByText(_version.Text)).ToString();

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);


            }
            else if (e.CommandName == "delete")
            {
                lbldocid.Text = (string)e.Item.Cells[8].Text;
                lblmessage.Text = "Do You want to Delete the Document";
                string script = "function f(){$find(\"" + RadWindow4.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            else if (e.CommandName == "download")
            {
                hfile.Value = (string)e.Item.Cells[11].Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "download", "ondownload();", true);

            }
            load_document();

        }

        protected void btndummy_Click(object sender, EventArgs e)
        {
            DownLoad_Single(hfile.Value);
        }
}
}
   