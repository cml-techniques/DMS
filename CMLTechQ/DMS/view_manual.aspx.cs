using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using App_Properties;
using System.Data;

namespace CMLTechQ.DMS
{   
    public partial class view_manual : System.Web.UI.Page
    {
        //static DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string _prm = Request.QueryString[1].ToString();
                myframe.Attributes.Add("src", "http://www.cmltechniques.com/Documents/" + _prm);

                //dt = new DataTable();

                //dt.Columns.Add("PageNo");
                //dt.Columns.Add("SectionNo");
                //dt.Columns.Add("CommentS");


                Session["uid"] = "admin@cmlgroup.ae";
                Session["project"] = "123";
                Session["id"] = "21995";
                
                


                load_Basket();

            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
          

           //  BLL_Dml _objbll = new BLL_Dml();
           // _database _objdb = new _database();
           // _objdb.DBName = "dbCML";
           // _clscomment _objcls = new _clscomment();

           // _objcls.page_no = txtpageno.Value;
           // _objcls.sec_no = txtsectionNo.Value;
           // _objcls.comment = txtcomments.Text;
           // _objcls.user_id = (string)Session["uid"];
           // _objcls.prj_code = (string)Session["project"];
           // _objcls.module = "DMS";
           // _objcls.type = 1;//for OM
           //// _objcls.doc_id = Convert.ToInt32((string)Session["id"]);

    

           //if (btnadd.Text=="Add")
           // {
           //     _objcls.doc_id = Convert.ToInt32((string)Session["id"]);
           //     _objbll.addtobasket(_objcls, _objdb);
               
           // }
           // else
           // {
           //     _objcls.doc_id = Convert.ToInt32(commentid.Value);
           //     _objcls.doc_id = Convert.ToInt32(Session["cid"]);
           //     _objbll.UpdateCommentBasket(_objcls, _objdb);
           // }
           // load_Basket();
           // txtpageno.Value = "";
           // txtsectionNo.Value = "";
           // txtcomments.Text = "";
           // btnadd.Text="Add";
           // tdViewComment.Visible = false;

            //Session["type"] = "0";



        }
        void load_Basket()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            _objcls.user_id = (string)Session["uid"];
            _objcls.prj_code = (string)Session["project"];
            _objcls.module = "DMS";
            _objcls.type = 1;//for OM
            _objcls.doc_id = Convert.ToInt32((string)Session["id"]);
            gvComment.DataSource = _objbll.load_commentbasket(_objcls, _objdb);
            gvComment.DataBind();
           //Session["type"] = "0";



            string pp = (string)Session["type"];

        }

        protected void gvComment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int _rowidx = Convert.ToInt32(e.CommandArgument);
            GridViewRow _srow = gvComment.Rows[_rowidx];
            TableCell _id = _srow.Cells[7];

            if (e.CommandName == "Deletes")
            {
    
                BLL_Dml _objbll = new BLL_Dml();
                _database _objdb = new _database();
                _objdb.DBName = "dbCML";
                _clscomment _objcls = new _clscomment();
                _objcls.comm_id = Convert.ToInt32(_id.Text);
                _objbll.Remove_basket(_objcls, _objdb);
                load_Basket();
            }
            else
            {
                TableCell _Commnet = _srow.Cells[2];
                TableCell _sec = _srow.Cells[6];
                TableCell _page = _srow.Cells[5]; 
                //TableCell _Commnet1 = _srow.Cells[2];

                commentid.Value = _id.Text;
                Session["cid"] = _id.Text;
                lblPage.Text = _page.Text;
                lblSection.Text = _sec.Text;

               
               

                ////tdViewComment.Style["display"] = "inherit";

                ////tdViewComment.Style.Add("display","inherit");(
                ////tdViewComment.Style.Add("width", "1000px");
               tdViewComment.Visible = true;
               ScriptManager.RegisterStartupScript(this, GetType(), "alert", "EditComments(2);", true);
                //dvCommentGrid.Style["Height"] = (height - height1).ToString();

                
                
                TextBox1.Text = _Commnet.ToolTip;
                TextBox1.Focus();
            }
        }

        protected void gvComment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           // e.Row.Cells[7].Visible = false;
            int i = 0;
            //e.Row.Cells[4].Visible = false;
            e.Row.Cells[5].Visible = false;
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[7].Visible = false;
           // e.Row.Cells[8].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    i++;
                    string s = cell.Text;
                    if (cell.Text.Length > 13 && (i == 3))
                        cell.Text = cell.Text.Substring(0, 13) + "..";
                    cell.ToolTip = s;
                }
            }
        }

        protected void gvComment_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void neWeDIT_Click(object sender, EventArgs e)
        {
            txtcomments.Text=TextBox1.Text;
            btnadd.Text="Update";
            txtpageno.Value=lblPage.Text;
            txtsectionNo.Value=lblSection.Text;
           // Session["type"]="2";
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "EditComments(1);", true);


            		    //var type = document.getElementById("TextBox1").value;

           // document.getElementById("txtcomments").value = type;
           // document.getElementById("btnadd").value = "Update";

           // var pageno = document.getElementById("lblPage").innerText;
           // var secNo = document.getElementById("lblSection").innerText;
		    
           //document.getElementById("txtpageno").value = pageno;
           //document.getElementById("txtsectionNo").value = secNo;

           // <%Session["type"] = "111";%>
           // var session_value='<%=Session["type"]%>'; 
 
           // alert(session_value); 
        }

        protected void newdelete_Click(object sender, EventArgs e)
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            _objcls.comm_id = Convert.ToInt32(Session["cid"]);
            tdViewComment.Visible = false;
            _objbll.Remove_basket(_objcls, _objdb);
            load_Basket();
            //ScriptManager.RegisterStartupScript(this, GetType(), "alert", "EditComments(1);", true);

        }
        //void AddData()
        //{
        //  DataRow drow = dt.NewRow();
        //    drow[0] = txtpageno.Text;
        //    drow[1] = txtsectionNo.Text;           
        //  drow[2] = txtcomments.Text;
        //        //commenteditor.Content.ToString();

        //    dt.Rows.Add(drow);

        //    gvComment.DataSource = dt;
        //    gvComment.DataBind();

          

        //}
    }
}