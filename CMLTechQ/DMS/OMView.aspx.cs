 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Text.RegularExpressions;
using PassProtection;
using System.IO;

namespace CMLTechQ.DMS
{
    public partial class OMView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["withComments"] = "0";



                //lbluserid.Text = "jose.joseph@cmlgroup.ae";
                //lblprj.Text = "123";

                //lblfolder.Text = "10166";
                //lbldocid.Text = "30697";
                //string _file = "OM_Test.pdf";


                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                Get_ProjectInfo();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                lbldocid.Text = Request.QueryString["Auth4"].ToString();
                Get_Title();
                Get_User();


                 string _file = Request.QueryString["Auth5"].ToString();
               
                string _path = "http://demo1.cmltechniques.com/DMS/Documents/" + _file;
                documentviewer.Attributes.Add("src", _path);

                string _docpath = "Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbldocid.Text + "&Auth5=" + _file;
                commentviewer.Attributes.Add("src", "CommentList?" + _docpath);
                string statuspath = "Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbldocid.Text;
                statusviewer.Attributes.Add("src", "statusUpdate?" + statuspath);



 
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
            if (_dt.Rows.Count>0)
            {
            lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
            lblprojectname.Text = _dt.Rows[0]["prj_name"].ToString();
            }
        }
        private void Get_Title()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            fileinfo.Text = _objbll.Get_DocumentTitle(_objcls, _objdb);
        }
        protected void btndummy_Click(object sender, EventArgs e)
        {
            
           // if (IsNullValidation() == true) return;
            Save_Comments();
            string _commentpath = "CommentList?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbldocid.Text + "&Auth5=" + Request.QueryString["Auth5"].ToString();
            commentviewer.Attributes.Add("src", _commentpath);

            //commentSubmit.Style.Add("display", "block");    
           
        }
        
        private bool IsNullValidation()
        {
            if (hidden_page.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Enter Page Number');", true);
                return true;
            }
            else if (hidden_sec.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Enter Section Number');", true);
                return true;
            }
            else if (hidden_content.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Enter Comment');", true);
                return true;
            }
            return false;
        }
        private void Save_Comments()
        {
            string _comments = hidden_content.Value;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            _objcls.com_date = DateTime.Now;
            _objcls.comment = _comments;
            _objcls.page_no = hidden_page.Value;
            _objcls.sec_no = hidden_sec.Value;
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.user_id = lbluserid.Text;

            if (!string.IsNullOrEmpty(hfile.Value))
            {
                _objcls.Image_name = hfile.Value;
            }
            else
                _objcls.Image_name = "";
            

            _objbll.addcomment_new(_objcls, _objdb);

            //Session["ImageFile"] = null;

            //ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Comment Saved!');", true);
            //Load_Comments();
        }

        private int Get_CommentCount()  
        {
            int _count = 0;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.uid = lbluserid.Text;
            DataTable _dt = _objbll.load_usercomments(_objcls, _objdb);
            _count = _dt.Rows.Count;
            return _count;
        }

        public static string StripTagsRegex(string source)
        {
            return Regex.Replace(source, "<.*?>", string.Empty);
        }

        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{
        //    BLL_Dml _objbll = new BLL_Dml();
        //    _database _objdb = new _database();
        //    _objdb.DBName = "dbCML";
        //    _clsdocument _objcls = new _clsdocument();
        //    _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
        //    _objcls.status = drstatus.SelectedItem.ToString();

        //    _objbll.Update_DocumentStatus(_objcls, _objdb);
        //    ModalPopupExtender3.Hide();

        //}
        //void LoadStstus()
        //{
        
        //        BLL_Dml _objbll = new BLL_Dml();
        //    _database _objdb = new _database();
        //    _objdb.DBName = "dbCML";
        //    _clsdocument _objcls = new _clsdocument();
        //    _objcls.doc_id = Convert.ToInt32(lbldocid.Text);

        //    DataTable _dt = _objbll.Get_DocumentDetails(_objcls, _objdb);

        //    if (_dt.Rows.Count > 0)
        //    {

        //        drstatus.Items.FindByText(_dt.Rows[0]["status"].ToString()).Selected = true;
        //    }
        //    else drstatus.SelectedIndex = 0;


        //}

        //protected void btncancel_Click(object sender, EventArgs e)
        //{
        //    ModalPopupExtender3.Hide();

        //}

        //protected void btndummy3_Click(object sender, EventArgs e)
        //{
        //    ModalPopupExtender3.Show();
           
        //}

        protected void btndummy1_Click(object sender, EventArgs e)
        {
            //if (IsNullValidation() == true) return;

            HttpPostedFile _file = Request.Files["myupload"];
            string fileNameApplication = System.IO.Path.GetFileName(_file.FileName);


            string filePath = System.IO.Path.Combine(Server.MapPath("Documents") + "\\" + lblprj.Text, fileNameApplication);


            if (!string.IsNullOrEmpty(fileNameApplication))
            {

                if (File.Exists(filePath)) File.Delete(filePath);
                _file.SaveAs(filePath);
                hfile.Value = fileNameApplication;
            }
        }

            }

        }
