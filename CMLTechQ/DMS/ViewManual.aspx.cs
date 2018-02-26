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
    public partial class ViewManual : System.Web.UI.Page
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




                Session["withComments"] = "0";

                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblid.Text = Request.QueryString["Auth3"].ToString();
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                Get_User();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
             
                lbldocid.Text = Request.QueryString["Auth4"].ToString();
                Get_ProjectInfo();

                //string _docname = Request.QueryString["Auth5"].ToString();


                //string _docname = Get_DocumentFileName();


                GetDefaultNav(lblid.Text);

                Generate_Nav();

                GetdocumentDetails();

                string _path = "https://dms.cmltechniques.com/DMS/Documents/" + lbl_doctitle.Text;
                documentviewer.Attributes.Add("src", _path);

                Get_Title();

                string _docpath = "Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbldocid.Text + "&Auth5=" + lbl_doctitle.Text;
                commentviewer.Attributes.Add("src", "CommentList?" + _docpath);

                string statuspath = "Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbldocid.Text;
                statusviewer.Attributes.Add("src", "statusUpdate?" + statuspath);


                loadPageprojectinfo();
                get_Username();
                if (!String.IsNullOrEmpty(Request.QueryString["Auth5"]))
                {
                    hmenufolder.Value = Request.QueryString["Auth5"].ToString();

                }
            }
        }
        void GetdocumentDetails()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);

            DataTable dt = _objbll.Get_DocumentDetails(_objcls, _objdb);
            if (dt.Rows.Count > 0)
            {

                lbl_doctitle.Text = dt.Rows[0]["doc_name"].ToString();
                //lbldocname.Text = dt.Rows[0]["doc_name"].ToString();

            }


        }
        private void get_Username()
        {
          BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsuser _objcls = new _clsuser();
            _objcls.uid = lbluserid.Text;
           lblusername.Text= _objbll.Get_UserName(_objcls, _objdb);
           
        }
        private void loadPageprojectinfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            _objcls.Folder_id = Convert.ToInt32(lblfolder.Text);
            DataTable dt = _objbll.Get_folderProjectdescription(_objcls, _objdb);
            if (dt.Rows.Count > 0) lblfoldername.Text = dt.Rows[0][0].ToString();
            //  pageinfo.Text = pageinfo.Text;
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

        }
        //void AddImage()
        //{
        //    HttpPostedFile _file = Request.Files["myupload"];
        //    string fileNameApplication = System.IO.Path.GetFileName(_file.FileName);


        //    string filePath = System.IO.Path.Combine(Server.MapPath("Documents") + "\\" + lblprj.Text, fileNameApplication);


        //    if (!string.IsNullOrEmpty(fileNameApplication))
        //    {

        //        if (File.Exists(filePath)) File.Delete(filePath);
        //        _file.SaveAs(filePath);
        //        hfile.Value = fileNameApplication;
        //    }
        //}
        protected void btnsavecomment_Click(object sender, EventArgs e)
        {
            //AddImage();
            Save_Comments();




            string _docname = Request.QueryString["Auth5"].ToString();

            //string _docname = "";


            string _commentpath = "CommentList?Auth1=" + lbluseridhidden.Text + "&Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text + "&Auth4=" + lbldocid.Text + "&Auth5=" + _docname;
            commentviewer.Attributes.Add("src", _commentpath);



           
          
            
        }
        private void Redirect()
        {
            //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "UpdateStatus();", true);
            //Response.Redirect("DocumentList.aspx?" + Request.QueryString.ToString());

            Session["withComments"] = "0";
            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "CallBack();", true);

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

            //if (!string.IsNullOrEmpty(hfile.Value))
            //{
            //    _objcls.Image_name = hfile.Value;
            //}
            //else
                _objcls.Image_name = "";


            _objbll.addcomment_new(_objcls, _objdb);
        }

      

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Redirect();

        }
        void updatestatus()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.status = "Accepted with Comments";

            _objbll.Update_DocumentStatus(_objcls, _objdb);
           
        }

        bool CheckcommentExists()       
        {
            bool commentexits=false;
                   
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.uid = lbluserid.Text;
            DataTable _dt = _objbll.load_usercomments(_objcls, _objdb);
            if (_dt.Rows.Count>0 )commentexits=true; 
            return commentexits;

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (!CheckcommentExists())
            {
                  ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Enter the comment');", true);
                return;
            }


            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsSnag _objcls = new _clsSnag();
            _objcls.pkg_id = Convert.ToInt32(lbldocid.Text);
            _objcls.userid = lbluserid.Text;

            _objbll.Update_CommentStatus(_objcls, _objdb);


            if (Session["withComments"].ToString() == "1")
            {
                updatestatus();

            }  

            ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Comments succesfully submitted');", true);


            string foldervalues = "Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text;
            Send_Acknow(lblprojectname.Text, Request.QueryString["Auth5"].ToString(), foldervalues);
            Send_Admin(lblprojectname.Text, Request.QueryString["Auth5"].ToString(), foldervalues);

            Redirect();

        }
        void Send_Acknow(string project, string file, string value)
        {

            publicCls.publicCls _objcls = new publicCls.publicCls();
            string links = "<tr style=height:20px;><td /></tr><tr><td>Click <a href=https://dms.cmltechniques.com//AuthLogin?" + value + "> Here </a> To View O&M Manual </td></tr><tr style=height:30px;><td /></tr>";
            string htmlopen = "<html><body><table>";

            string Body = "<tr style=height:20px;><td /></tr><tr><td><p>Dear " + lblusername.Text + " ,<br/><br/>This is an automatically generated email to confirm CML Techniques are in receipt of your comments made for the above manual.<br/>The comments will receive attention and the manual will be revised as required.</p><p> Thank you in anticipation of your co-operation with the review process.</p></td></tr>";

            string _sub = "Ref. " + lblfoldername.Text + " - " + lbl_doctitle.Text;

            string signature = "<tr style=height:30px;><td /></tr><tr><td><tr><td><img src='https://dms.cmltechniques.com//Assets/img/logo.jpg' /></td></tr><tr><td>CML Techniques</td></tr> ";
            Body = Body + links + signature;
            string htmlclose = "</table></body></html>";
            _objcls.Send_Email_Html(lbluserid.Text, _sub, htmlopen + Body + htmlclose);


        }
        void Send_Admin(string project, string file, string value)
        {
            publicCls.publicCls _obj = new publicCls.publicCls();

            string links = "<tr style=height:20px;><td /></tr><tr><td>Click <a href=https://dms.cmltechniques.com//AuthLogin?" + value + "> Here </a> To View O&M Manual </td></tr><tr style=height:30px;><td /></tr>";
            string htmlopen = "<html><body><table>";
            string Body = "<tr style=height:20px;><td><p>To:</p></td></tr><tr><td><p> CML Techniques Project Managers," + "</p></td></tr>" + "<tr style=height:20px;><td /></tr><tr><td style=font-size:15px ><b>Ref. " + project + " - " + lbl_doctitle.Text + "</p></td></tr>" + "<tr><td><p>A comment(s) has been made on the above manual by : " + lblusername.Text + ", Please consider the comment(s) and revise the O & M appropriate.<p></td></tr><tr style=height:20px><td /></tr>";
            string _sub = "Ref. " + lblfoldername.Text + " - " + lbl_doctitle.Text;

            string signature = "<tr style=height:30px;><td /></tr><tr><td><tr><td><img src='https://dms.cmltechniques.com//Assets/img/logo.jpg' /></td></tr><tr><td>CML Techniques</td></tr> ";
            Body = Body + links + signature;
            string htmlclose = "</table></body></html>";

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.project_code = lblprj.Text;
            _objcls.schid = Convert.ToInt32(lblfolder.Text);
            DataTable _dt = _objbll.Load_dms_user_email_New(_objcls, _objdb);


            var list = from o in _dt.AsEnumerable()
                       where o.Field<string>(1) == "Review/Comment" || o.Field<string>(1) == "Review/Comment/Status"
                       select o;
            foreach (var row in list)
            {
                if (row[0].ToString() != lbluserid.Text)
                {
                    _obj.Send_Email_Html(row[0].ToString(), _sub, htmlopen + Body + htmlclose);
                }

            }

        }

    }
}