using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;
using App_Properties;

namespace CMLTechQ.DMS
{
    public partial class TreeEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {

                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();
               

                //lblprj.Text = "123";
                lblfoldername.Text = "No Folder Selected";

               

                trfolder.Visible = false;
                trfolder1.Visible = false;
                trsave.Visible = false;
         
                td1.Visible = false;
                dvDocuments.Visible = false;
              

                Get_ProjectInfo();


                Populate_Tree();


                pageinfo.Text = "Manage Tree Folder"; 

            }
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
        private void Populate_Tree()
        {
            // ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('" + (string)Session["project"] + "');", true);
            mytree.Nodes.Clear();

            string querystring;

            publicCls.publicCls _obj = new publicCls.publicCls();
            _obj.Load_Tree(lblprj.Text, "nothing");
            var _service = from o in publicCls.publicCls._dtservice.AsEnumerable()
                           select o;
            string folder = "";
            foreach (var row in _service)
            {
                TreeNode _root = new TreeNode();
                _root.Text = row[2].ToString();
                _root.Value = row[0].ToString() + "#" + row[4].ToString();
                _root.SelectAction = TreeNodeSelectAction.Expand;
                folder = row[2].ToString().Replace("&", "<>");
                //_root.NavigateUrl = "javascript:openFrame('" + row[0].ToString() + "_L" + row[4].ToString() + "_N" + folder + "_P" + "0" + "_D1" + "')";
                //querystring = "Position=" + row[4].ToString() + "&Parent=0&Auth3=" + row[0].ToString() + "&Auth2=" + lblprj.Text + "&Auth1=" + lbluserhidden.Text + "&FolderDesc=" + folder + "&Level=1";
                querystring = row[4].ToString() + ",0," + row[0].ToString() + ",'" + folder + "',1";
                //_root.NavigateUrl = "javascript:openFrame('" + querystring + "')";
                _root.NavigateUrl = "javascript:GetFolderDetails(" + querystring + ");";

                if (_root.Text != "")
                    mytree.Nodes.Add(_root);
                var _package = from o in publicCls.publicCls._dtpackage.AsEnumerable()
                               where o.Field<int>(5) == Convert.ToInt32(row[0].ToString())
                               select o;

                foreach (var row1 in _package)
                {
                    //string querystring;
                    TreeNode _parent = new TreeNode();
                    _parent.Text = row1[2].ToString();
                    _parent.Value = row1[0].ToString() + "#" + row1[4].ToString();
                    _parent.SelectAction = TreeNodeSelectAction.Expand;
                    folder = row1[2].ToString().Replace("&", "<>");
                    //querystring = "Position=" + row1[4].ToString() + "&Parent=" + row[0].ToString() + "&Auth3=" + row1[0].ToString() + "&Auth2=" + lblprj.Text + "&Auth1=" + lbluserhidden.Text + "&FolderDesc=" + folder + "&Level=2";
                    querystring = row1[4].ToString() + "," + row[0].ToString() + "," + row1[0].ToString() + ",'" + folder + "',2";
                    //_parent.NavigateUrl = "javascript:openFrame('" + querystring + "')";

                    _parent.NavigateUrl = "javascript:GetFolderDetails(" + querystring + ");";
                    if (_parent.Text != "")
                        _root.ChildNodes.Add(_parent);
                    var _doctype = from o in publicCls.publicCls._dtdoctype.AsEnumerable()
                                   where o.Field<int>(5) == Convert.ToInt32(row1[0].ToString())
                                   select o;
                    foreach (var row2 in _doctype)
                    {
                        TreeNode _leaf = new TreeNode();
                        _leaf.Text = row2[2].ToString();
                        _leaf.Value = row2[0].ToString() + "#" + row2[4].ToString();
                        _leaf.SelectAction = TreeNodeSelectAction.Expand;


                        folder = row2[2].ToString().Replace("&", "<>");

                        //_leaf.NavigateUrl = "javascript:openFrame('" + row2[0].ToString() + "_L" + row2[4].ToString() + "_N" + folder + "_P" + row1[0].ToString() + "_D3" + "' )";
                        //querystring = "Position=" + row2[4].ToString() + "&Parent=" + row1[0].ToString() + "&Auth3=" + row2[0].ToString() + "&Auth2=" + lblprj.Text + "&Auth1=" + lbluserhidden.Text + "&FolderDesc=" + folder + "&Level=3";
                        querystring = row2[4].ToString() + "," + row1[0].ToString() + "," + row2[0].ToString() + ",'" + folder + "',3";
                        // _leaf.NavigateUrl = "javascript:openFrame('" + querystring + "')";
                        _leaf.NavigateUrl = "javascript:GetFolderDetails(" + querystring + ");";
                        if (_leaf.Text != "")
                            _parent.ChildNodes.Add(_leaf);
                        var Group = from o in publicCls.publicCls._dtgroup.AsEnumerable()
                                    where o.Field<int>(5) == Convert.ToInt32(row2[0].ToString())
                                    select o;
                        foreach (var row3 in Group)
                        {
                            TreeNode _group = new TreeNode();
                            _group.Text = row3[2].ToString();
                            _group.Value = row3[0].ToString() + "#" + row3[4].ToString();
                            _group.SelectAction = TreeNodeSelectAction.Expand;
                            folder = row3[2].ToString().Replace("&", "<>");
                            //querystring = "Position=" + row3[4].ToString() + "&Parent=" + row2[0].ToString() + "&Auth3=" + row3[0].ToString() + "&Auth2=" + lblprj.Text + "&Auth1=" + lbluserhidden.Text + "&FolderDesc=" + folder + "&Level=4";
                            querystring = row3[4].ToString() + "," + row2[0].ToString() + "," + row3[0].ToString() + ",'" + folder + "',4";

                            _group.NavigateUrl = "javascript:GetFolderDetails(" + querystring + ");";
                            if (_group.Text != "")
                                _leaf.ChildNodes.Add(_group);
                            var subgroup = from o in publicCls.publicCls._dtsubgroup.AsEnumerable()
                                           where o.Field<int>(5) == Convert.ToInt32(row3[0].ToString())
                                           select o;
                            foreach (var row4 in subgroup)
                            {
                                TreeNode _subgroup = new TreeNode();
                                _subgroup.Text = row4[2].ToString();
                                _subgroup.Value = row4[0].ToString() + "#" + row4[4].ToString();
                                _subgroup.SelectAction = TreeNodeSelectAction.Expand;
                                folder = row4[2].ToString().Replace("&", "<>");
                                //querystring = "position=" + row4[4].ToString() + "&Parent=" + row3[0].ToString() + "&Auth3=" + row4[0].ToString() + "&Auth2=" + lblprj.Text + "&Auth1=" + lbluserhidden.Text + "&FolderDesc=" + folder + "&Level=5";
                                querystring = row4[4].ToString() + "," + row3[0].ToString() + "," + row4[0].ToString() + ",'" + folder + "',5";
                                // _subgroup.NavigateUrl = "javascript:openFrame('" + querystring + "')";
                                _subgroup.NavigateUrl = "javascript:GetFolderDetails(" + querystring + ");";
                                if (_subgroup.Text != "")
                                    _group.ChildNodes.Add(_subgroup);
                                var subgroup1 = from o in publicCls.publicCls._dtsubgroup1.AsEnumerable()
                                                where o.Field<int>(5) == Convert.ToInt32(row4[0].ToString())
                                                select o;
                                foreach (var row5 in subgroup1)
                                {
                                    TreeNode _subgroup1 = new TreeNode();
                                    _subgroup1.Text = row5[2].ToString();
                                    _subgroup1.Value = row5[0].ToString() + "#" + row5[4].ToString();
                                    _subgroup1.SelectAction = TreeNodeSelectAction.Expand;
                                    folder = row5[2].ToString().Replace("&", "<>");

                                    //querystring = "Position=" + row5[4].ToString() + "&Parent=" + row4[0].ToString() + "&Auth3=" + row5[0].ToString() + "&Auth2=" + lblprj.Text + "&Auth1=" + lbluserhidden.Text + "&FolderDesc=" + folder + "&Level=6";
                                    querystring = row5[4].ToString() + "," + row4[0].ToString() + "," + row5[0].ToString() + ",'" + folder + "',6";
                                    // _subgroup1.NavigateUrl = "javascript:openFrame('" + querystring + "')";
                                    _subgroup1.NavigateUrl = "javascript:GetFolderDetails(" + querystring + ");";
                                    if (_subgroup1.Text != "")
                                        _subgroup.ChildNodes.Add(_subgroup1);
                                }
                            }

                        }

                    }
                }
            }
            mytree.CollapseAll();
        }


        protected void mytree_SelectedNodeChanged(object sender, EventArgs e)
        {

            //if (mytree.SelectedNode.Depth < 2) return;
            //string _value = mytree.SelectedNode.Value.ToString();
            //lblposition.Text = _value.Substring(_value.IndexOf("#") + 1);
            //lblfolder.Text = _value.Substring(0, _value.IndexOf("#"));
            //// mytree.SelectedNode.Checked = true;
            //mytree.SelectedNode.Selected = true;
            //load_documents();

        }
        void load_documents()
        {
            if (mytree.SelectedNode.Depth < 2) return;
            BLL_Dml _objbll = new BLL_Dml();
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(hfolder.Value);
            _objcls.enabled = true;

        }
        protected void mytree_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
        {
        }
        public string _value = "";
        protected void cmdnewfolder_Click(object sender, EventArgs e)
        {

        }
        protected void cmdup_Click(object sender, EventArgs e)
        {
            Move_Document("up");

        }

        protected void cmddown_Click(object sender, EventArgs e)
        {
            //Move_Document("down");
        }

        protected void ddlaction_SelectedIndexChanged(object sender, EventArgs e)
        {
       
        }

        void UpdateDetails()
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clstreefolder _objcls = new _clstreefolder();
            int chk = 0;
            if (chkdoc.Visible == true)
            {
                if (chkdoc.Checked == true)
                    chk = 1;
                else
                    chk = 0;
            }

            string _menu = ddlaction.SelectedItem.Value;
            int _level = Convert.ToInt32(hlevel.Value);
            string _possition = hpos.Value;
            if (_possition != "0")
            {
            }
            if (_menu == "1")//create new folder
            {
                try
                {
                    _objcls.Folder_description = txtfoldername.Text;
                    _objcls.Folder_type = _level;
                    _objcls.Folder_possition = Convert.ToInt32(_possition);
                    _objcls.Enabled = true;
                    _objcls.Project_code = lblprj.Text;
                    _objcls.Parent_folder = hparent.Value;
                    _objcls.auto = chk;
                    //_objcls.mode = "Main";
                    _objbll.Create_TreeFolderNew(_objcls, _objdb);
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('New Folder Created!');", true);

                }
                catch (Exception ex)
                {
                    //Label1.Text = ex.ToString();
                }

            }
            else if (_menu == "2")//create sub folder
            {
                // ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('"+ chk.ToString() +"');", true);
                //if (mytree.Nodes.Count == 0) return;

                _objcls.Folder_description = txtfoldername.Text;
                _objcls.Folder_type = _level + 1;
                _objcls.Folder_possition = 0;
                _objcls.Enabled = true;
                _objcls.Project_code = lblprj.Text;
                _objcls.Parent_folder = hfolder.Value;
                _objcls.auto = chk;
               // _objcls.mode = "Sub";
                _objbll.Create_TreeFolderNew(_objcls, _objdb);
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Sub Folder Created!');", true);

            }
             else if ((_menu == "3") || (_menu == "4"))//edit folder
                {
                 string Displaymsg="";

                 if (ddlaction.SelectedValue == "3")
                 {
                     _objcls.mode = "rename";
                     Displaymsg = "Folder has been Changed";

                 }
                 else
                 {
                     _objcls.mode = "delete";
                     Displaymsg = "Folder has been Deleted";
                 }

                    _objcls.Folder_id = Convert.ToInt32(hfolder.Value);

                   _objcls.Folder_description = txtfoldername.Text;
                    
                      _objbll.Edit_Tree_FolderNew(_objcls,_objdb);



                  
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('"+ Displaymsg +"');", true);


            }
            else if (_menu == "5")
            {

                if (IsNumeric(txtfolderposition.Text) == false) return;

                        _objcls.Folder_id = Convert.ToInt32(hfolder.Value);
                       _objcls.Folder_possition = Convert.ToInt32(txtfolderposition.Text);
                        _objbll.Move_Tree_Folder_New(_objcls,_objdb);
                        ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Folder has been Moved');", true);
            }
            
        }

        static bool IsNumeric(object Expression)
        {
            // Variable to collect the Return value of the TryParse method.
            bool isNum;

            // Define variable to collect out parameter of the TryParse method. If the conversion fails, the out parameter is zero.
            double retNum;

            // The TryParse method converts a string in a specified style and culture-specific format to its double-precision floating point number equivalent.
            // The TryParse method does not generate an exception if the conversion fails. If the conversion passes, True is returned. If it does not, False is returned.
            isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
            return isNum;
        }

        protected void GoAction_Click(object sender, EventArgs e)
        {

            string ss = hfolder.Value;

            dvDocuments.Visible = false;
            trsave.Visible = false;
            trfolder.Visible = false;
            trfolder1.Visible = false;
            btnupdate.Text = "Update";

            
            lblfoldername.Text = hfoldername.Value;
            if (ddlaction.SelectedValue=="0") return;
            txtfoldername.Text = "";
            txtfolderposition.Text = "";

            if (ddlaction.SelectedValue == "4") 
            {

                trfolder.Visible = false;
                trfolder1.Visible = false;
                trsave.Visible = true;
                btnupdate.Text = "Delete";
                td1.Visible = false;
            }
            else if (ddlaction.SelectedValue == "5")
            {
                trfolder1.Visible = true;
                trfolder.Visible = false;
                trsave.Visible = true;
                //load_documents1();
            }
            else if (ddlaction.SelectedValue == "6")
            {
                trfolder1.Visible = false;
                trfolder.Visible = false;
                dvDocuments.Visible = true;
                trsave.Visible = false;
               if (IsNumeric(hfolder.Value)==false) return;
                load_documents1(hfolder.Value);


            }
            else
            {
                td1.Visible = false;
                if (ddlaction.SelectedValue == "2") td1.Visible = true;
                if (ddlaction.SelectedValue == "3") txtfoldername.Text = hfoldername.Value;

                trfolder.Visible = true;
                trfolder1.Visible = false;
                trsave.Visible = true;

            }

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {


            lblfoldername.Text = hfoldername.Value;

            if (hlevel.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select the folder');", true);
                return;

            }


            if (ddlaction.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Select the action');", true);
                ddlaction.Focus();
                return;
            }
            if ((ddlaction.SelectedValue != "4") && (ddlaction.SelectedValue != "5"))
            {
                if (txtfoldername.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter the Folder Name');", true);
                    txtfoldername.Focus();
                    return;

                }
            }
            if (ddlaction.SelectedValue == "5")
            {
                if (txtfolderposition.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Enter the Folder position');", true);
                    txtfoldername.Focus();
                    return;


                }
            }
            if (ddlaction.SelectedValue == "4")
            {
                if (ChecksubFolderExits() == 1)
                {

                    ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('Cannot delete parent folder while file exits');", true);
                    txtfoldername.Focus();
                    return;
                }
            }


                UpdateDetails();
                Populate_Tree();

                trfolder.Visible = false;
                trfolder1.Visible = false;
                td1.Visible = false;
                trsave.Visible = false;
                ddlaction.SelectedIndex = 0;
                btnupdate.Text = "Update";
        }
        int ChecksubFolderExits()
        {
           
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(hfolder.Value);

               int rvalue=0;
               rvalue = _objbll.Check_SubFolderDocumentsExists(_objcls, _objdb);
            return rvalue;

        }

        void load_documents1(string folder_id)
        {
          //if (IsNumeric(hfolder.Value)==false) return;

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(folder_id);

                _objcls.enabled = true;
                DataTable dt= _objbll.load_documentNew(_objcls, _objdb);
                if (dt.Rows.Count == 0) dvDocuments.Visible = false;
                rptdocuments.DataSource = dt;
                rptdocuments.DataBind();
            
        }
        protected void rptdocuments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            //int indx = e.Item.ItemIndex;

            //Label lbldoc = e.Item.FindControl("lbldoc") as Label;
            //Label lblpos = e.Item.FindControl("lblpos") as Label;
            //lbldoc_id.Text = lbldoc.Text;
            //lblposition.Text = lblpos.Text;



            //if (e.CommandName.ToString() == "up")
            //{
            //    if (indx > 0)
            //    {
            //        Move_Document(e.CommandName);
            //        //mygrid.Rows[idx - 1].BackColor = System.Drawing.Color.LightBlue;

            //    }

            //}
            //else if (e.CommandName.ToString() == "down")
            //{

            //    if (indx < rptdocuments.Items.Count - 1 )
            //    {
            //        Move_Document(e.CommandName);
            //        //mygrid.Rows[idx + 1].BackColor = System.Drawing.Color.LightBlue;
            //    }

            //}
            //else
            //{
            //    //mygrid.Rows[idx].BackColor = System.Drawing.Color.LightBlue;
            //    BLL_Dml _objbll = new BLL_Dml();
            //    _database _objdb = new _database();
            //    _objdb.DBName = "dbCML";
            //    _clsdocument _objcls = new _clsdocument();
            //    _objcls.doc_id = Convert.ToInt32(lbldoc_id.Text);
            //    if (lbltype.Text == "10")
            //        _objbll.Delete_dms_upload(_objcls, _objdb);
            //    else
            //    {
            //        _objcls.folder_id = Convert.ToInt32(hfolder.Value);
            //        _objcls.possition = Convert.ToInt32(lblposition.Text);
            //        _objbll.Delete_DocumentNew(_objcls, _objdb);
            //    }
            //    //mygrid.DataBind();



            //}

            //if (IsNumeric(hfolder.Value)) load_documents1(hfolder.Value);



            ////string x = e.CommandArgument.ToString();
            ////string y = e.CommandName.ToString();

        }
        void Move_Document(string _move)
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(hdocid.Value);
            _objcls.folder_id = Convert.ToInt32(hfolder.Value);
            _objcls.possition = Convert.ToInt32(hdocpos.Value);
            _objcls.move = _move;
            _objbll.Move_document(_objcls, _objdb);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            if (Convert.ToInt16(hdocindex.Value )> 0)
            {
                Move_Document("up");
                //mygrid.Rows[idx - 1].BackColor = System.Drawing.Color.LightBlue;
               load_documents1(hfolder.Value);
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt16(hdocindex.Value) < rptdocuments.Items.Count - 1)
            {
                Move_Document("down");
                load_documents1(hfolder.Value);
                //mygrid.Rows[idx - 1].BackColor = System.Drawing.Color.LightBlue;

            }

        }
        protected void Button3_Click(object sender, EventArgs e)    
        {
            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "dbCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.doc_id = Convert.ToInt32(hdocid.Value);

                _objcls.folder_id = Convert.ToInt32(hfolder.Value);
                _objcls.possition = Convert.ToInt32(hdocpos.Value);
                _objbll.Delete_DocumentNew(_objcls, _objdb);

                load_documents1(hfolder.Value);

        }



    }
}