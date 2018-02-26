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
    public partial class CommentList : System.Web.UI.Page
    {
        // string file = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //ClientScript.RegisterStartupScript(GetType(), "disable", "window.onload = function() { setdis(); }", true);

                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                lbldocid.Text = Request.QueryString["Auth4"].ToString();

                Get_User();

                Get_UserName();
                Get_ProjectInfo();
                Load_Comments();
                Load_DocDetails();



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
        void Load_DocDetails()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);

            DataTable _dt = _objbll.Load_DocDatails(_objcls, _objdb);
            if (_dt.Rows.Count > 0) lbltitle.Text = _dt.Rows[0]["title"].ToString();
        }
        private string Get_UserName()
        {

            string _username = "";
            BLL_Dml _objbll = new BLL_Dml();
            _clsuser _objcls = new _clsuser();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.uid = lbluserid.Text;

            _username = _objbll.Get_UserName(_objcls, _objdb);
            return _username;

        }
        private void Get_ProjectInfo()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _clsproject _objcls = new _clsproject();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _objcls.prj_id = Convert.ToInt32(Request.QueryString["Auth2"].ToString());
            DataTable _dt = _objbll.Get_ProjectInformation(_objcls, _objdb);
            if (_dt.Rows.Count > 0)
            {
                lblprj.Text = _dt.Rows[0].ItemArray[0].ToString();
                lblprojectname.Text = _dt.Rows[0]["prj_name"].ToString();
            }
        }
        private void Load_Comments()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            _objcls.uid = lbluserid.Text;
            DataTable _dt = _objbll.load_usercomments(_objcls, _objdb);
            rptcomment.DataSource = _dt;
            rptcomment.DataBind();


        }


        protected void rptcomment_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _title = (Label)e.Item.FindControl("lbltitle");
                Label _dummy2 = (Label)e.Item.FindControl("lbldummy2");
                Label _dummy3 = (Label)e.Item.FindControl("lbldummy3");
                //_title.Text = "Page No." + _dummy2.Text + " > Section No." + _dummy3.Text;
                //Label lblimage = (Label)e.Item.FindControl("lblimage");


            }
        }
        protected void btndummy1_Click(object sender, EventArgs e)
        {
            Edit_Comments();
        }
        protected void btndummy2_Click(object sender, EventArgs e)
        {
            Delete_Comments();
        }
        private void Edit_Comments()
        {
            string _comments = hidden_content.Value;
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            _objcls.comment = _comments;
            _objcls.user_id = lbluserid.Text;
            _objcls.comm_id = Convert.ToInt32(hidden_id.Value);

            //if ((string)hfile.Value != null)
            //{
            //    _objcls.Image_name = hfile.Value;
            //}
            //else
                _objcls.Image_name = "";

            _objbll.Editcomment_new(_objcls, _objdb);
            hfile.Value = null;

            Load_Comments();
        }
        private void Delete_Comments()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            _objcls.comm_id = Convert.ToInt32(hidden_id.Value);
            _objbll.Deletecomment(_objcls, _objdb);
            Load_Comments();
        }


        protected void btndummy3_Click(object sender, EventArgs e)
        {
            Load_Comments();
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
            Session["withComments"] = "0";
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsSnag _objcls = new _clsSnag();
            _objcls.pkg_id = Convert.ToInt32(lbldocid.Text);
            _objcls.userid = lbluserid.Text;

            _objbll.Update_CommentStatus(_objcls, _objdb);

            Load_Comments();

            ScriptManager.RegisterStartupScript(this, typeof(string), "", "alert('Comments succesfully submitted');", true);


            //if (Session["withComments"].ToString() == "1")
            //{
            //    updatestatus();

            //}

            string foldervalues = "Auth2=" + lblprjid.Text + "&Auth3=" + lblfolder.Text;
            Send_Acknow(lblprojectname.Text, Request.QueryString["Auth5"].ToString(), foldervalues);
            Send_Admin(lblprojectname.Text, Request.QueryString["Auth5"].ToString(), foldervalues);

            //Response.Redirect("DocumentList?" + Request.QueryString.ToString());  
            ScriptManager.RegisterStartupScript(this, typeof(string), "close", "UpdateStatus();", true);


        }
        void Send_Acknow(string project, string file, string value)
        {

            publicCls.publicCls _objcls = new publicCls.publicCls();
            string links = "<tr style=height:20px;><td /></tr><tr><td>Click <a href=http://dms.cmltechniques.com//AuthLogin?" + value + "> Here </a> To View O&M Manual </td></tr><tr style=height:30px;><td /></tr>";
            string htmlopen = "<html><body><table>";

            string Body = "<tr style=height:20px;><td /></tr><tr><td><p>Dear " + Get_UserName() + ",<br/><br/>This is an automatically generated email to confirm CML Techniques are in receipt of your comments made for the above manual.<br/>The comments will receive attention and the manual will be revised as required.</p><p> Thank you in anticipation of your co-operation with the review process.</p></td></tr>";

            string _sub = "Ref. " + project + " - " + lbltitle.Text;

            string signature = "<tr style=height:30px;><td /></tr><tr><td><tr><td><img src='http://dms.cmltechniques.com//Assets/img/logo.jpg' /></td></tr><tr><td>CML Techniques</td></tr> ";
            Body = Body + links + signature;
            string htmlclose = "</table></body></html>";
            _objcls.Send_Email_Html(lbluserid.Text, _sub, htmlopen + Body + htmlclose);


        }
        void Send_Admin(string project, string file, string value)
        {
            publicCls.publicCls _obj = new publicCls.publicCls();

            string links = "<tr style=height:20px;><td /></tr><tr><td>Click <a href=http://dms.cmltechniques.com//AuthLogin?" + value + "> Here </a> To View O&M Manual </td></tr><tr style=height:30px;><td /></tr>";
            string htmlopen = "<html><body><table>";
            string Body = "<tr style=height:20px;><td><p>To:</p></td></tr><tr><td><p> CML Techniques Project Managers," + "</p></td></tr>" + "<tr style=height:20px;><td /></tr><tr><td style=font-size:15px ><b>Ref. " + project + " - " + lbltitle.Text + "</p></td></tr>" + "<tr><td><p>A comment(s) has been made on the above manual by : " + Get_UserName() + ", Please consider the comment(s) and revise the O & M appropriate.<p></td></tr><tr style=height:20px><td /></tr>";
            string _sub = "Ref. " + project + " - " + lbltitle.Text;

            string signature = "<tr style=height:30px;><td /></tr><tr><td><tr><td><img src='http://dms.cmltechniques.com//Assets/img/logo.jpg' /></td></tr><tr><td>CML Techniques</td></tr> ";
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

        protected void btndummyfile_Click(object sender, EventArgs e)
        {
            //if (IsNullValidation() == true) return;

            //HttpPostedFile _file = Request.Files["myupload"];
            //HttpPostedFile _file1 = myupload.PostedFile;
            //string fileNameApplication = System.IO.Path.GetFileName(_file.FileName);
            //string fileExtensionApplication = System.IO.Path.GetExtension(fileNameApplication);


            //string newFile = Guid.NewGuid().ToString() + fileExtensionApplication;
            //string filePath = System.IO.Path.Combine(Server.MapPath("Documents"), newFile);

            //if (fileNameApplication != String.Empty)
            //{
            //    _file.SaveAs(filePath);
            //    hfile.Value = fileNameApplication;
            //}
        }

        protected void rptcomment_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btncancel_Click(object sender, EventArgs e)
        {

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {

        }
    }
}