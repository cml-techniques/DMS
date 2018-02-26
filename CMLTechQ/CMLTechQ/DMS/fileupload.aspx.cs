using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using BusinessLogic;
using App_Properties;
using System.IO;
using PassProtection;


namespace CMLTechQ.DMS  
{
    public partial class fileupload : System.Web.UI.Page
    {
       public static DataTable _dtable;
       //string _type;
       bool _status=false;
        protected void Page_Load(object sender, EventArgs e)
        {
          //  _ReadCookies();
            if (!IsPostBack)
            {
                if (Request.QueryString["Prj"].ToString() != null) lblprj.Text = Request.QueryString["Prj"].ToString();
                if (Request.QueryString["Id"].ToString() != null) lbluserhidden.Text = Request.QueryString["Id"].ToString();
                if (Request.QueryString["Folder"].ToString() != null) lblfolder.Text = Request.QueryString["Folder"].ToString();
                lblparent.Text = lblprj.Text;
                lbltype.Text = Request.QueryString["type"].ToString();

                //lbltype.Text = "2";
                //lblprj.Text = "123";
                //lblfolder.Text = "1754";
                //lbluserhidden.Text = "%20am9zZS5qb3NlcGhAY21sZ3JvdXAuYWU=";

                //Manufacturers Information
                //    Builts Drawings
                //        Test Documentation


                fileinfo.Text = "Upload New File";

                if (lbltype.Text=="2")
                {
                    fileinfo.Text = "Upload New Manufacture infomation File";
                }
                if (lbltype.Text == "3")
                {
                    fileinfo.Text = "Upload New Builts Drawings File";
                }
                if (lbltype.Text == "4")
                {
                    fileinfo.Text = "Upload New Test Documentation File";
                }



             Get_User();

               txtdoc.Text = lblparent.Text;
                Load_Schedule();
               Get_Schedule ();

                //Label1.Text = _query;
               loadPageprojectinfo();
            }
        }
        private void loadPageprojectinfo()
        {

            //BLL_Dml _objbll = new BLL_Dml();
            //_database _objdb = new _database();
            //_objdb.DBName = "dbCML";
            //_clstreefolder _objcls = new _clstreefolder();
            //_objcls.Folder_id = Convert.ToInt16(lblfolder.Text);

            //DataTable dtd = _objbll.Get_folderProjectDescription(_objcls, _objdb);
            //if (dtd.Rows.Count > 0) lblpage.Text = dtd.Rows[0][0].ToString();

           // lblpage.Text = _objbll.Get_folderProjectDescription(_objcls, _objdb).Rows[0][0].ToString();
           
        }

        void FolderName()
        {
            BLL_Dml _objbal = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();

            _objcls.Folder_id = Convert.ToInt16(lblfolder.Text);
           // lblparent.Text = _objbal.Get_Folder_Description(_objcls, _objdb).Rows[0][0].ToString();

            DataTable dtd = _objbal.Get_Folder_Description(_objcls, _objdb);
            if (dtd.Rows.Count > 0) lblparent.Text = dtd.Rows[0][0].ToString();


        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = lbluserhidden.Text;
            //lbluserhidden.Text = _prm;
            string _decoded = "";
            if (_prm.IndexOf("?wmode") > 0)
                _decoded = _obj.Decoding(_prm.Substring(0, _prm.IndexOf("?wmode")));
            else
                _decoded = _obj.Decoding(_prm);
            lbluserid.Text = _decoded;
        }
        protected void show_Click(object sender, EventArgs e)
        {
            myschedule_basket.Visible = true;
            Get_Schedule1();
            Check_OMManual();
            //Label1.Text = "";
            if (myschedule_basket.Rows.Count > 0)
                Label1.Text = myschedule_basket.Rows[0].Cells[8].Text;
            else
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('No Schedule!');", true);
        }

        private bool ChekSpecialCharacter(string FileName)
        {
            if (FileName.Contains("&") == true)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Invalid Document Name! < & sign is not allowed >');", true);
                return true;
            }
            return false;
        }
        private void uploadFiles()
        {
            HttpFileCollection hfc = Request.Files;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    CheckBox _chk =(CheckBox)myschedule_basket.Rows[i].Cells[0].FindControl("chk");
                    if (_chk.Checked == true)
                    {
                        
                        if (myschedule_basket.Rows[i].Cells[4].Text != System.IO.Path.GetFileName(hpf.FileName))
                        {
                            //Label1.Text = "Please check the document name which you selected!";
                            return;
                        }
                        string _filename = System.IO.Path.GetFileName(hpf.FileName);
                       // if (ChekSpecialCharacter(_filename) == true) return;
                        hpf.SaveAs(Server.MapPath("Documents") + "\\" + System.IO.Path.GetFileName(hpf.FileName));
                        _objcls.doc_name = System.IO.Path.GetFileName(hpf.FileName);
                        _objcls.doc_title = myschedule_basket.Rows[i].Cells[3].Text;
                        _objcls.doctype_code = 0;
                        _objcls.package_code = 0;
                        _objcls.uploaded_date = DateTime.Now;
                        _objcls.service_code = 0; ;
                        _objcls.uploaded = true;
                        _objcls.schid = Convert.ToInt32(myschedule_basket.Rows[i].Cells[7].Text);
                        _objcls.folder_id = Convert.ToInt32(myschedule_basket.Rows[i].Cells[5].Text);
                        _objcls.file_size = decimal.Round((Convert.ToDecimal(hpf.ContentLength) / 1024), 2).ToString() + "KB";
                        _objcls.uid = lbluserid.Text;
                        if (lbltype.Text == "1")
                        {
                            _objcls.type = "O & M Manual";

                        }
                        else
                            _objcls.type = "";
                        _objcls.possition = Convert.ToInt32(myschedule_basket.Rows[i].Cells[9].Text);
                        _objbll.file_upload(_objcls,_objdb);
                        if (lbltype.Text == "1")
                        {
                            SetDocDuration();
                            load_users();
                            //Panel3.Visible = false;
                        }
                        
                       

                    }
                  
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Documents Uploaded!');", true);
                    clear();
                }

            }

        }


        void Check_OMManual()
        {
            //string _type = (string)Session["type"];
            if (myschedule_basket.Rows.Count > 0)
            {
                if (lbltype.Text == "1")
                {
                    //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + myschedule_basket.Rows[0].Cells[5].Text + "');", true);
                    int Folder_Id = Convert.ToInt32(myschedule_basket.Rows[0].Cells[5].Text);
                    BLL_Dml _objbll = new BLL_Dml();
                    _database _objdb = new _database();
                    _objdb.DBName = "dbCML";
                    _clstreefolder _objcls = new _clstreefolder();
                    _objcls.Folder_id = Folder_Id;
                    //Session["status"] = "true";
                    btnDummy_ModalPopupExtender.Show();
                    _status = true;
                }
                else
                    //Session["status"] = "false";
                    _status = false;
            }
        }

        protected void cmdupload_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('"+ (string)Session["status"] +"');", true);
           uploadFiles();
           Get_Schedule();
           Get_Schedule1();
            
        }
        void clear()
        {
            //loadData();
            myschedule_basket.Visible = false;
        }
        protected void upload_Click(object sender, EventArgs e)
        {
            
        }

        private void Load_Schedule()
        {
            
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.project_code = lblprj.Text;
            _dtable = _objbll.load_schedule(_objcls, _objdb);
        }
        private void Get_Schedule()
        {
           // string _folder = lblfo.Text;
            DataTable _dtable1 = new DataTable();
            _dtable1.Columns.Add("package");
            _dtable1.Columns.Add("Folder");
            _dtable1.Columns.Add("manufacture");
            _dtable1.Columns.Add("doc_name");
            _dtable1.Columns.Add("Folder_id");
            _dtable1.Columns.Add("id");
            _dtable1.Columns.Add("srv");
            var _List = from o in _dtable.AsEnumerable()
                        where o.Field<int>(5) == Convert.ToInt32(lblfolder.Text)
                        select o;
            try
            {
                foreach (var row in _List)
                {
                    DataRow _myrow = _dtable1.NewRow();
                    _myrow[0] = "aa";
                    _myrow[1] = row[6].ToString();
                    _myrow[2] = row[2].ToString();
                    _myrow[3] = row[3].ToString();
                    _myrow[4] = row[5].ToString();
                    _myrow[5] = row[0].ToString();
                    _myrow[6] = row[7].ToString();
                    _dtable1.Rows.Add(_myrow);
                }
                //myschedule_basket.DataSource = _dtable1;
                //myschedule_basket.DataBind();
                myschedule.DataSource = _dtable1;
                myschedule.DataBind();
            }
            catch (Exception ex)
            {
                //Label1.Text = ex.ToString();
            }

        }
        private void Get_Schedule1()
        {
           // string _folder = (string)Session["folder"];
            DataTable _dtable1 = new DataTable();
            _dtable1.Columns.Add("package");
            _dtable1.Columns.Add("Folder");
            _dtable1.Columns.Add("manufacture");
            _dtable1.Columns.Add("doc_name");
            _dtable1.Columns.Add("Folder_id");
            _dtable1.Columns.Add("id");
            _dtable1.Columns.Add("srv");
            _dtable1.Columns.Add("possition");
            var _List = from o in _dtable.AsEnumerable()
                        where o.Field<int>(5) == Convert.ToInt32(lblfolder.Text)
                        select o;
            try
            {
                foreach (var row in _List)
                {
                    DataRow _myrow = _dtable1.NewRow();
                    _myrow[0] = "aa";
                    _myrow[1] = row[6].ToString();
                    _myrow[2] = row[2].ToString();
                    _myrow[3] = row[3].ToString();
                    _myrow[4] = row[5].ToString();
                    _myrow[5] = row[0].ToString();
                    _myrow[6] = row[7].ToString();
                    _myrow[7] = row["possition"].ToString();
                    _dtable1.Rows.Add(_myrow);
                }
                myschedule_basket.DataSource = _dtable1;
                myschedule_basket.DataBind();
                //myschedule.DataSource = _dtable1;
                //myschedule.DataBind();
            }
            catch (Exception ex)
            {
                //Label1.Text = ex.ToString();
            }

        }
        

        

        
        protected void myschedule_basket_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[5].Visible = false;
            e.Row.Cells[7].Visible = false;
            e.Row.Cells[8].Visible = false;
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[2].Visible = false;
            e.Row.Cells[9].Visible = false;
            //Label1.Text = "hai";
        }

        //protected void drppackages_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    load_doctype();
        //}

        void Check_IfOMManual()
        {
            //Label1.Text = "Success";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Label1.Text = "Success";
        }

        protected void myschedule_basket_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Label1.Text = "Success";
        }

        protected void myschedule_basket_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Panel3.Visible = true;
        }

        protected void myschedule_basket_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Label1.Text = "Success";
        }

        protected void chk_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow _row = (GridViewRow)chk.Parent.Parent;
            string _folder = myschedule_basket.Rows[_row.RowIndex].Cells[2].Text;
            //Label1.Text = _folder;
            string str = "O & M Manual";
            //Panel3.Visible = true;
            if (chk.Checked == true)
            {
            if (_folder.Substring(_folder.IndexOf("M"))== str.Substring(str.IndexOf("M")))
            {
                //Panel3.Visible = true;
                //myschedule_basket.Enabled = false;
            }
            else
            {
                //Panel3.Visible = false;
            }
            }
            else
            {
                //Panel3.Visible = false;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void myschedule_basket_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Label1.Text = "this is currect";
        }

        protected void myschedule_basket_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //Label1.Text = "this is currect";

        }

        void SetDocDuration()
        {
            if (time.Text == "0") return;//Revised OM Manual
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocduration _objcls = new _clsdocduration();
            //string _Doc_type = drpmanufacture.SelectedItem.Value.Substring(0, drpmanufacture.SelectedItem.Value.IndexOf("_T"));
           // string _Doc_type = (string)Session["folder"];
            _objcls.Folder_id = Convert.ToInt32(lblfolder.Text);
            _objcls.Duration =Convert.ToInt32( time.Text);
            _objcls.First = Convert.ToInt32(remind1.Text);
            _objcls.Second = Convert.ToInt32(remind2.Text);
            _objcls.Third = Convert.ToInt32(remind3.Text);
            _objcls.prj_code = lblprj.Text;
            _objbll.SetDocDuration(_objcls,_objdb);
        }

        protected void cmdsetduration_Click(object sender, EventArgs e)
        {
            if (time.Text == "0")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter Review Period');", true);
                return;
            }                
            //Session["status"] = "true";
            _status = true;

            cmdupload.Enabled = true;
            myschedule_basket.Enabled = true;
            //cmdupload.Attributes["onclick"] = "Button2_Click";
            
        }
        protected void btnCont_Click(object sender, EventArgs e)
        {
            
        }
        void load_users()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser   _objcls = new _clsuser ();
            _objcls.project_code = lblprj.Text;
            string project = _objbll.Get_ProjectName(_objcls, _objdb);

           // int count = 0;

            _clsdocument _objcls1 = new _clsdocument();
            _objcls1.project_code = lblprj.Text;
            _objcls1.schid = Convert.ToInt32(Label1.Text);
            DataTable _dt = _objbll.load_dms_user_email(_objcls1, _objdb);
            var list = from o in _dt.AsEnumerable()
                       where o.Field<string>(1) == "Review/Comment" || o.Field<string>(1) == "Review/Comment/Status"
                       select o;

            foreach (var row in list)
            {
               
                //if ((string)Session["Rev"] == "Revised")
                //    Send_Mail_Revised(row[0].ToString(), row[1].ToString(), project);
                //else
                    Send_Mail(row[0].ToString(), row[1].ToString(), project);
            }
            

        }
        void Send_Mail(string user_id,string access,string project)
        {
            
            publicCls.publicCls _objcls = new publicCls.publicCls();
            string Body = "";
            if (access == "Review/Comment")
            {
                Body = "Ref. " + project + " - " + lblparent.Text + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review the manual and make any comments using the comment screen within the next " + time.Text + " days." + "\n\n" + "If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of your co-operation with the review process." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            else if (access == "Review/Comment/Status")
            {
                Body = "Ref. " + project + " - " + lblparent.Text + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review the manual and make any comments using the comment screen within the next " + time.Text + " days." + "\n\n" + "If you review and have no comments on the manual, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of co-operation." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            string _sub = "Ref. " + project + " - " + lblparent.Text;                
            _objcls.Send_Email(user_id, _sub, Body);
        }
        void Send_Mail_Revised(string user_id, string access,string project)
        {
           
            publicCls.publicCls _objcls = new publicCls.publicCls();
            string Body = "";
            if (access == "Review/Comment")
            {
                Body = "Ref. " + project + " - " + lblparent.Text + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been revised and is now available for further review." + "\n\n" + "Could you please find time to review changes made and make further comment(s) if required." + "\n\n" + "If no further comment(s) are required, please confirm with 'No comments' on exit from the website." + "\n\n" + "Thank you in anticipation of your co-operation with the review process." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            else if (access == "Review/Comment/Status")
            {
                Body = "Ref. " + project + " - " + lblparent.Text + "\n\n" + "This is an automatically generated email to advise you that the O & M noted above has been uploaded to CML web site and is available for review." + "\n\n" + "Could you please find time to review changes and if acceptable change the status of the manual on exit from the website." + "\n\n" + "Thank you in anticipation of co-operation." + "\n\n" + "CML" + "\n" + "Techniques" + "\n\n\n" + "http://www.cmltechniques.com";
            }
            string _sub = "Ref. " + project + " - " + lblparent.Text;
            _objcls.Send_Email(user_id, _sub, Body);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            uploadFiles();
        }

        //protected void drpmanufacture_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //Label1.Text = drpmanufacture.SelectedItem.Value;
        //   // load_group();
        //}
      
        //protected void drpsub1_SelectedIndexChanged(object sender, EventArgs e)
        //{
            
        //}

        //protected void drpsub_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //load_Subgroup();
        //}
        protected void FileUploader1_FileReceived(object sender, com.flajaxian.FileReceivedEventArgs e)
        {
            if (Validate_File(e.File.FileName) == true)
            {
                e.File.SaveAs(Server.MapPath("UploadFolder" + "\\" + e.File.FileName));
               // Multi_Upload(e.File.FileName);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + e.File.FileName + "');", true);
            }
        }
        private bool Validate_File(string _fname)
        {
            string _Doc_type = lblfolder.Text;
           
            var _List = from o in _dtable.AsEnumerable()
                        where o.Field<int>(5) == Convert.ToInt32(_Doc_type)
                        select o;
            foreach (var row in _List)
            {
                if (_fname == row[3].ToString())
                {
                    FileInfo _finfo = new FileInfo(Server.MapPath("UploadFolder" + "\\" + _fname));
                    if (_finfo.Exists == true) _finfo.Delete();
                    return true;
                }
            }
            return false;
        }
        private void Multi_Upload(string _fname)
        {
            string _Doc_type = lblfolder.Text;
            var _List = from o in _dtable.AsEnumerable()
                        where o.Field<int>(5) == Convert.ToInt32(_Doc_type)
                        select o;
            try
            {
                BLL_Dml _objbll = new BLL_Dml();
                _database _objdb = new _database();
                _objdb.DBName = "dbCML";
                _clsdocument _objcls = new _clsdocument();
                foreach (var row in _List)
                {
                    if (_fname == row[3].ToString())
                    {
                        FileInfo _finfo = new FileInfo(Server.MapPath("Documents" + "\\" + _fname));
                        if (_finfo.Exists == true)
                        {
                            
                            _objcls.doc_name = row[3].ToString();
                            _objcls.doc_title = row[2].ToString();
                            _objcls.doctype_code = 0;
                            _objcls.package_code = 0;
                            _objcls.uploaded_date = DateTime.Now;
                            _objcls.service_code = 0;
                            _objcls.uploaded = true;
                            _objcls.schid = Convert.ToInt32(row[0].ToString());
                            _objcls.folder_id = Convert.ToInt32(row[5].ToString());
                            string _size = _finfo.Length.ToString();
                            _objcls.file_size = decimal.Round((Convert.ToDecimal(_size) / 1024), 2).ToString() + "KB";
                           // _objcls.file_size = decimal.Round((Convert.ToDecimal(_size) / 1024), 2).ToString() + "KB";
                            _objcls.uid = lbluserid.Text;
                            _objcls.type = "";
                            _objbll.file_upload(_objcls, _objdb);
                            //load_schedule();
                            Get_Schedule();
                            return;

                        }
                    }
                }
               
            }
            catch (Exception ex)
            {
                Label1.Text = ex.ToString();
            }

        }

       
    }
}