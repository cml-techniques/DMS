using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Properties;
using BusinessLogic;
using System.Data;
using PassProtection;

namespace CMLTechQ.DMS
{
    public partial class Viewcomments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                lbluseridhidden.Text = Request.QueryString["Auth1"].ToString();
                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lblfolder.Text = Request.QueryString["Auth3"].ToString();
                lbldocid.Text = Request.QueryString["Auth4"].ToString();
           
                load_comments();
               

            }

        }
        void load_comments()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(lbldocid.Text);
            DataTable dt = _objbll.Load_DMSComments(_objcls, _objdb);


            DataTable _dtresult;

            var _result = dt.Select("resp<>''");
            _dtresult = _result.Any() ? _result.CopyToDataTable() : dt.Clone();


            RadGrid1.DataSource = _dtresult;
            RadGrid1.DataBind();

            _dtresult = new DataTable();

            _result = dt.Select("resp is null");
            _dtresult = _result.Any() ? _result.CopyToDataTable() : dt.Clone();

            RadGrid2.DataSource = _dtresult;
            RadGrid2.DataBind();






        }
       
        //protected void lvcomments_ItemCanceling(object sender, ListViewCancelEventArgs e)
        //{
        //    lvcomments.EditIndex = -1;
        //    load_comments();

        //}

        //protected void lvcomments_ItemEditing(object sender, ListViewEditEventArgs e)
        //{
        //    lvcomments.EditIndex = e.NewEditIndex;
        //    load_comments();
           

    //       var item = sender as ListViewItem;
    //       var debugLabel = item.FindControl("txtresp") as TextBox;
    //debugLabel.Text = "Works";
          

    //        load_comments();

        //}

        //protected void lvcomments_ItemCommand(object sender, ListViewCommandEventArgs e)
        //{
           
        //    if (e.CommandName == "Update")
        //    {
        //         Label _id = (Label)e.Item.FindControl("lblcomm_id");
        //        TextBox _resp = (TextBox)e.Item.FindControl("txtresp");

        //        BLL_Dml _objbll = new BLL_Dml();
        //        _database _objdb = new _database();
        //        _objdb.DBName = "dbCML";
        //        _clscomment _objcls = new _clscomment();
        //        _objcls.comm_id = Convert.ToInt32(_id.Text);
        //        _objcls.resp = _resp.Text;
        //        _objbll.Update_CmlResponse(_objcls, _objdb);
                           
        //    }
        //    else if (e.CommandName == "Delete")
        //    {
        //        htype.Value = "0";
        //        Label _id = (Label)e.Item.FindControl("lblcomm_id");

        //        lblid.Text = _id.Text;

        //        lblmessage.Text = "Are you sure want to delete the selected schedule?";
        //        string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);
              

        //    }

        //}

        //protected void lvcomments_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        //{
        //    lvcomments.EditIndex = -1;
        //    load_comments();

        //}

        //protected void lvcomments_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        //{
        //    lvcomments.EditIndex = -1;
        //   load_comments();

        //}

        protected void btnconfirm_Click(object sender, EventArgs e)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            _objcls.comm_id = Convert.ToInt32(lblid.Text);

            if (htype.Value == "0")
            {
                _objbll.Delete_Comment_Response(_objcls, _objdb);
            }
            else
            {
                _objbll.Deletecomment(_objcls, _objdb);
            }


            //btndummy_ModalPopupExtender.Hide();
            load_comments();


            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 

           
            


        }

        protected void btnno_Click(object sender, EventArgs e)
        {

            string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 
        }

        //protected void comm_list_wait_ItemCommand(object sender, ListViewCommandEventArgs e)
        //{

        //    if (e.CommandName == "Delete")
        //    {
        //        htype.Value = "1";
        //        Label _id = (Label)e.Item.FindControl("lblcomm_id");
        //        lblid.Text = _id.Text;
        //        lblmessage.Text = "Are you sure to delete the comment ?";

        //        string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);


        //    }
        //    else if (e.CommandName == "Add")
        //    {
        //        Label _id = (Label)e.Item.FindControl("lblcomm_id");
        //        lblcommid.Text = _id.Text;

        //        string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);


        //    }

        //}
        void AddComment()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clscomment _objcls = new _clscomment();
            _objcls.comm_id = Convert.ToInt32(lblcommid.Text);
            _objcls.resp = txtcomment.Text;
            _objbll.Update_CmlResponse(_objcls, _objdb);

        }

        //protected void comm_list_wait_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        //{
        //    comm_list_wait.EditIndex = -1;
        //    load_comments();

        //}



        //protected void lvcomments_ItemDataBound(object sender, ListViewItemEventArgs e)
        //{

            //if (lvcomments.EditIndex > -1)
            //{
                //TextBox txtresp = (TextBox)e.Item.FindControl("txtresp");
                //if (txtresp == null) return;

                //int t;
                //t = txtresp.Rows;

                //txtresp.Rows = Convert.ToUInt16(txtresp.Text.Length / 30);

              

                //if (txtresp.Text.Length > 20) txtresp.Height = (txtresp.Text.Length); ;

                    //System.Web.UI.HtmlControls.HtmlTableCell tdv = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("txtid");

                    //if (_resp != null)
                    //{
                    //    string id = "";
                    //    id = tdv.Height;

                    //    if (_resp.Text.Length>20 )  _resp.Height = (_resp.Text.Length); ;


                    //}

            //}


        //}

        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtcomment.Text))
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Enter the Comments');", true);
                return;

            }

            AddComment();
            load_comments();

            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 

        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").close(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true); 

        }

        protected void RadGrid2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "add")
            {
                lblcommid.Text = (string)e.Item.Cells[9].Text;

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

                btnSave.Text = "Save";
                txtcomment.Text = "";

                etype.Value = "0";

            }
            else if (e.CommandName == "delete")
            {
                htype.Value = "1";

                lblid.Text = (string)e.Item.Cells[9].Text;

                lblmessage.Text = "Are you sure to delete the comment ?";

                string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            load_comments();

        }

        protected void RadGrid2_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Label lblimg = (Label)e.Item.FindControl("lblfilename");

                string ext = "";

                if (!string.IsNullOrEmpty(lblimg.Text))
                {
                    System.Web.UI.HtmlControls.HtmlTableCell tblpdf = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("tblpdf");
                    System.Web.UI.HtmlControls.HtmlTableCell tblexl = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("tblexl");
                    System.Web.UI.HtmlControls.HtmlTableCell tblimg = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("tblimg");

                    ext = System.IO.Path.GetExtension(lblimg.Text);

                    if (ext == ".pdf")
                    {
                        tblexl.Visible = false;
                        tblpdf.Visible = true;
                        tblimg.Visible = false;
                    }
                    else if (ext == ".xls")
                    {

                        tblexl.Visible = true;
                        tblpdf.Visible = false;
                        tblimg.Visible = false;
                    }
                    else
                    {

                        tblexl.Visible = false;
                        tblpdf.Visible = false;
                        tblimg.Visible = true;
                    }


                }



            }

        }

        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "edits")
            {
                lblcommid.Text = (string)e.Item.Cells[9].Text;

                string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

                btnSave.Text = "Update";
                txtcomment.Text = (string)e.Item.Cells[8].Text;

                etype.Value = "1";

            }
            else if (e.CommandName == "delete")
            {
                htype.Value = "0";

                lblid.Text = (string)e.Item.Cells[9].Text;
                //lblcommid.Text = (string)e.Item.Cells[9].Text;

                lblmessage.Text = "Are you sure to delete the Response ?";

                string script = "function f(){$find(\"" + RadWindow2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", script, true);

            }
            load_comments();

        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

            if (e.Item is Telerik.Web.UI.GridDataItem)
            {
                Label lblimg = (Label)e.Item.FindControl("lblfilename");

                string ext = "";

                if (!string.IsNullOrEmpty(lblimg.Text))
                {
                    System.Web.UI.HtmlControls.HtmlTableCell tblpdf = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("tblpdf");
                    System.Web.UI.HtmlControls.HtmlTableCell tblexl = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("tblexl");
                    System.Web.UI.HtmlControls.HtmlTableCell tblimg = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("tblimg");

                    ext = System.IO.Path.GetExtension(lblimg.Text);

                    if (ext == ".pdf")
                    {
                        tblexl.Visible = false;
                        tblpdf.Visible = true;
                        tblimg.Visible = false;
                    }
                    else if (ext == ".xls")
                    {

                        tblexl.Visible = true;
                        tblpdf.Visible = false;
                        tblimg.Visible = false;
                    }
                    else
                    {

                        tblexl.Visible = false;
                        tblpdf.Visible = false;
                        tblimg.Visible = true;
                    }


                }



            }


        }




    }
}  