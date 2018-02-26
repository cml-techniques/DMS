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
    public partial class pts1 : System.Web.UI.Page      
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



                lblprjid.Text = Request.QueryString["Auth2"].ToString();
                lbluserhidden.Text = Request.QueryString["Auth1"].ToString();




                Get_User();

              



                Get_ProjectInfo();

                Load_Details();
                //ScriptManager.RegisterStartupScript(this, typeof(string), "close", "scrollheight();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "close", "hideall();", true);
            }
        }
        private void Load_Details()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _clsuser _objcls = new _clsuser();
            _objdb.DBName = "DBCML";
            _objcls.uid = lbluserid.Text;
            _objcls.project_code = lblprj.Text;

            //DataTable _dtservice = _objbll.load_service(_objcls, _objdb);
            DataTable _dtservice = _objbll.load_ProgressTreeFolder_Tbl(_objcls, _objdb);

            hcount.Value = _dtservice.Rows.Count.ToString();
            rptmmain0.DataSource = _dtservice;
            rptmmain0.DataBind();

            //ddlfolder.DataTextField = "Folder_description";
            //ddlfolder.DataValueField = "Folder_id";
            //ddlfolder.DataSource = _dtservice;
            //ddlfolder.DataBind();
            //ddlfolder.SelectedIndex = _dtservice.Rows.Count - 1;


        }
        private void Get_User()
        {
            Protection _obj = new Protection();
            string _prm = Request.QueryString["Auth1"].ToString();
            // string _prm = "am9zZS5qb3NlcGhAY21sZ3JvdXAuYWU=";
            lbluserhidden.Text = _prm;
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
        protected void rptdetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {



                HyperLink hl1 = (HyperLink)e.Item.FindControl("hl1");
                Label lbl1 = (Label)e.Item.FindControl("lbl1");
                HyperLink hl2 = (HyperLink)e.Item.FindControl("hl2");
                Label lbl2 = (Label)e.Item.FindControl("lbl2");
                HyperLink hl3 = (HyperLink)e.Item.FindControl("hl3");
                Label lbl3 = (Label)e.Item.FindControl("lbl3");
                HyperLink hl4 = (HyperLink)e.Item.FindControl("hl4");
                Label lbl4 = (Label)e.Item.FindControl("lbl4");
                HyperLink hl5 = (HyperLink)e.Item.FindControl("hl5");
                Label lbl5 = (Label)e.Item.FindControl("lbl5");
                HyperLink hl6 = (HyperLink)e.Item.FindControl("hl6");
                Label lbl6 = (Label)e.Item.FindControl("lbl6");
                HyperLink hl7 = (HyperLink)e.Item.FindControl("hl7");
                Label lbl7 = (Label)e.Item.FindControl("lbl7");
                HyperLink hl8 = (HyperLink)e.Item.FindControl("hl8");
                Label lbl8 = (Label)e.Item.FindControl("lbl8");
                HyperLink hl9 = (HyperLink)e.Item.FindControl("hl9");
                Label lbl9 = (Label)e.Item.FindControl("lbl9");
                HyperLink hl10 = (HyperLink)e.Item.FindControl("hl10");
                Label lbl10 = (Label)e.Item.FindControl("lbl10");


                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section1"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section1"]) >= 100)
                    {
                        hl1.Visible = true;
                    }
                    else
                        lbl1.Visible = true;
                }


                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section2"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section2"]) >= 100)
                        hl2.Visible = true;
                    else
                        lbl2.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section3"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section3"]) >= 100)
                        hl3.Visible = true;
                    else
                        lbl3.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section4"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section4"]) >= 100)
                        hl4.Visible = true;
                    else
                        lbl4.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section5"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section5"]) >= 100)
                        hl5.Visible = true;
                    else
                        lbl5.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section6"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section6"]) >= 100)
                        hl6.Visible = true;
                    else
                        lbl6.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section7"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section7"]) >= 100)
                        hl7.Visible = true;
                    else
                        lbl7.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section8"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section8"]) >= 100)
                        hl8.Visible = true;
                    else
                        lbl8.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section9"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section9"]) >= 100)
                        hl9.Visible = true;
                    else
                        lbl9.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section10"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section10"]) >= 100)
                        hl10.Visible = true;
                    else
                        lbl10.Visible = true;
                }
            }

        }
        protected void rptdetails1_ItemDataBound(object sender, RepeaterItemEventArgs e)    
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {



                HyperLink hl1 = (HyperLink)e.Item.FindControl("hl1");
                Label lbl1 = (Label)e.Item.FindControl("lbl1");
                HyperLink hl2 = (HyperLink)e.Item.FindControl("hl2");
                Label lbl2 = (Label)e.Item.FindControl("lbl2");
                HyperLink hl3 = (HyperLink)e.Item.FindControl("hl3");
                Label lbl3 = (Label)e.Item.FindControl("lbl3");
                HyperLink hl4 = (HyperLink)e.Item.FindControl("hl4");
                Label lbl4 = (Label)e.Item.FindControl("lbl4");
                HyperLink hl5 = (HyperLink)e.Item.FindControl("hl5");
                Label lbl5 = (Label)e.Item.FindControl("lbl5");
                HyperLink hl6 = (HyperLink)e.Item.FindControl("hl6");
                Label lbl6 = (Label)e.Item.FindControl("lbl6");
                HyperLink hl7 = (HyperLink)e.Item.FindControl("hl7");
                Label lbl7 = (Label)e.Item.FindControl("lbl7");
                HyperLink hl8 = (HyperLink)e.Item.FindControl("hl8");
                Label lbl8 = (Label)e.Item.FindControl("lbl8");
                HyperLink hl9 = (HyperLink)e.Item.FindControl("hl9");
                Label lbl9 = (Label)e.Item.FindControl("lbl9");
                HyperLink hl10 = (HyperLink)e.Item.FindControl("hl10");
                Label lbl10 = (Label)e.Item.FindControl("lbl10");


                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section1"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section1"]) >= 100)
                    {
                        hl1.Visible = true;
                    }
                    else
                        lbl1.Visible = true;
                }


                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section2"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section2"]) >= 100)
                        hl2.Visible = true;
                    else
                        lbl2.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section3"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section3"]) >= 100)
                        hl3.Visible = true;
                    else
                        lbl3.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section4"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section4"]) >= 100)
                        hl4.Visible = true;
                    else
                        lbl4.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section5"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section5"]) >= 100)
                        hl5.Visible = true;
                    else
                        lbl5.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section6"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section6"]) >= 100)
                        hl6.Visible = true;
                    else
                        lbl6.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section7"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section7"]) >= 100)
                        hl7.Visible = true;
                    else
                        lbl7.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section8"]))
                {
                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section8"]) >= 100)
                        hl8.Visible = true;
                    else
                        lbl8.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section9"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section9"]) >= 100)
                        hl9.Visible = true;
                    else
                        lbl9.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section10"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section10"]) >= 100)
                        hl10.Visible = true;
                    else
                        lbl10.Visible = true;
                }
            }

        }
        protected LiteralControl getcheckvalue()
        {

            LiteralControl _lt = new LiteralControl();
            _lt.Text = "<a><i class='icon-check'></i></a>";
            return _lt;
        }
        protected Label getlabelvalue(string setvalue)
        {
            Label _lbl = new Label();
            _lbl.Text = setvalue;
            return _lbl;
        }
        protected void rptmmain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _sys_id = (Label)e.Item.FindControl("lblsys");
                DataTable _dtdetails = new DataTable();


                BLL_Dml _objbll = new BLL_Dml();
                _clsProgressTracking _objcls = new _clsProgressTracking();
                _database _objdb = new _database();
                _objdb.DBName = "DBCML";
                _objcls.Folder_id = Convert.ToInt32(_sys_id.Text);
                _dtdetails = _objbll.Load_AllProgressTracking(_objcls, _objdb);
                Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails");
                _rptdetails.DataSource = _dtdetails;
                _rptdetails.DataBind();

            }
        }


        private bool DateValidation(string dateString)
        {
            if (string.IsNullOrEmpty(dateString)) return true;

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
        protected void btncancel1_Click(object sender, EventArgs e)
        {
            //uploadFiles();
        }


        protected void rptmmain_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rptdetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        void GetDraft_issueDate()
        {

            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clsdocument _objcls = new _clsdocument();
            _objcls.folder_id = Convert.ToInt32(hfolder.Value);

            DataTable dt = _objbll.Get_Progress_DraftIssueDate(_objcls, _objdb);

            if (dt.Rows.Count > 0)
            {
                string ss = dt.Rows[0][0].ToString();


            }





        }
        void update_progresstracking(string value)
        {


            BLL_Dml _objbll = new BLL_Dml();
            _database _objdb = new _database();
            _objdb.DBName = "DBCML";
            _clsProgressTracking _objcls = new _clsProgressTracking();
            _objcls.Progress_id = Convert.ToInt32(hprogressid.Value);
            _objcls.Folder_id = Convert.ToInt16(hfolder.Value);
            _objcls.Value = value;
            _objcls.Userid = lbluserid.Text;
            _objcls.Type = Convert.ToInt16(htype.Value);
            _objbll.Update_ProgressTracking_tbl(_objcls, _objdb);



            //Load_Details();

        }

        protected void txt12_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 12);
        }

        protected void txt11_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 11);



        }

        protected void txt7_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 7);

        }

        protected void txt6_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 6);

        }

        protected void txt5_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 5);

        }

        protected void txt4_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 4);

        }

        protected void txt3_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 3);

        }
        protected void txt2_TextChanged(object sender, EventArgs e)
        {

            UpdateChanges(sender, e, 2);

        }

        protected void txt1_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 1);

        }

        protected void UpdateChanges(object sender, EventArgs e, int cntno)
        {

            TextBox tb = ((TextBox)(sender));
            RepeaterItem rp = ((RepeaterItem)(tb.NamingContainer));
            TextBox tbv = (TextBox)rp.FindControl("txt" + cntno);

            Label lbl = (Label)rp.FindControl("lbl" + cntno);

            if (Convert.ToDouble(tbv.Text) > 100)
            {
                tbv.Text = lbl.Text;
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Maximum value:100');", true);
                return;
            }

            lbl.Text = tb.Text;

            HyperLink hl = (HyperLink)rp.FindControl("hl" + cntno);

            if (Convert.ToDecimal(tbv.Text) >= 100)
            {
                hl.Visible = true;
                lbl.Visible = false;
            }
            else
            {
                lbl.Visible = true;
                hl.Visible = false;
            }
            update_progresstracking(tbv.Text);
        }



        protected void UpdateChanges1(object sender, EventArgs e, int cntno)
        {

            TextBox tb = ((TextBox)(sender));
            RepeaterItem rp = ((RepeaterItem)(tb.NamingContainer));
            TextBox tbv = (TextBox)rp.FindControl("txt" + cntno);



            Label lbl = (Label)rp.FindControl("lbl" + cntno);


            if (cntno == 11)
            {
                if (!DateValidation(tbv.Text))
                {
                    tbv.Text = lbl.Text;
                    ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Invalid Date Format');", true);
                    return;
                }

            }

            lbl.Text = tb.Text;
            lbl.Visible = true;

            update_progresstracking(tbv.Text);


        }


        void CreateFolder()
        {


            //BLL_Dml _objbll = new BLL_Dml();
            //_database _objdb = new _database();
            //_objdb.DBName = "dbCML";

            //_clstreefolder _objcls = new _clstreefolder();

            //if (Convert.ToInt16(rbtListfolder.SelectedValue) == 1)
            //{
            //    _objcls.Parent_folder = "0";
            //}
            //else
            //    _objcls.Parent_folder = ddlfolder.SelectedValue.ToString();

            //_objcls.Folder_code = txtcode.Text;
            //_objcls.Userid = lbluserid.Text;
            //_objcls.Folder_description = txtfolder.Text;
            //_objcls.Folder_type = Convert.ToInt16(rbtListfolder.SelectedValue);
            //_objcls.Folder_possition = 0;
            //_objcls.Enabled = true;
            //_objcls.Project_code = lblprj.Text;
            //_objcls.auto = 0;

            //_objbll.Create_ProgressTreefolder(_objcls, _objdb);
            // ScriptManager.RegisterStartupScript(this, typeof(string), "close", "alert('New Folder Created!');", true);
        }

        protected void btnmain_Click(object sender, EventArgs e)
        {
            //ModalPopupExtender1.Show();
            //txtfolder.Text = "";
            //txtcode.Text = "";
            //rbtListfolder.SelectedIndex = 0;
        }

        protected void btnfolder_Click(object sender, EventArgs e)
        {
            //if (txtfolder.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(this, typeof(string), "msg", "alert('Enter folder!');", true);
            //    return;
            //}

            //if (rbtListfolder.SelectedValue == "2")
            //{

            //    if (txtcode.Text == "")
            //    {
            //        ScriptManager.RegisterStartupScript(this, typeof(string), "msg", "alert('Enter Code!');", true);
            //        return;
            //    }
            //    else if (ddlfolder.Text == "")
            //    {
            //        ScriptManager.RegisterStartupScript(this, typeof(string), "msg", "alert('Select Parent Folder!');", true);
            //        return;
            //    }

            //}

            //CreateFolder();
            //// UpdatePanel1.Update();
            ////Load_Details();
            ////if (rbtListfolder.SelectedValue == "2")  ScriptManager.RegisterStartupScript(this, typeof(string), "exp", "expand(" + ddlfolder.SelectedIndex+1 + ",1);", true);

            ////ModalPopupExtender1.Hide();
            //Response.Redirect("pts.aspx?" + Request.QueryString.ToString());

            // hparent.Value = 0;
        }

        //protected void rbtListfolder_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    txtfolder.Text = "";
        //    if (rbtListfolder.SelectedValue == "1")
        //    {
        //        trsub.Visible = false;
        //        tdcode.Visible = false;
        //        txtfolder.Width = 331;
        //        txtcode.Width = 0;
        //        lblhlp.Text = "Enter Main";

        //    }
        //    else
        //    {
        //        trsub.Visible = true;
        //        txtcode.Text = "";
        //        tdcode.Visible = true;
        //        txtfolder.Width = 297;
        //        txtcode.Width = 30;
        //        lblhlp.Text = "Enter Code and Folder";

        //    }


        //}

        protected void btndummy_Click(object sender, EventArgs e)
        {
            //  ModalPopupExtender1.Hide();

        }

        protected void bdummy_Click(object sender, EventArgs e)
        {

        }

        protected void rbtfolder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void rbtype_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
       
        protected void rptmmain0_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label _sys_id = (Label)e.Item.FindControl("lblsys");
                Label _treetype = (Label)e.Item.FindControl("lbltreetype");
                    
                DataTable _dtdetails = new DataTable();

                BLL_Dml _objbll = new BLL_Dml();
            
                _database _objdb = new _database();
                _objdb.DBName = "DBCML";


                if (_treetype.Text != "0" && _treetype.Text != "100")
                {

                    _clsProgressTracking _objcls = new _clsProgressTracking();
                    _objcls.Folder_id = Convert.ToInt32(_sys_id.Text);
                    _dtdetails = _objbll.Load_AllProgressTracking(_objcls, _objdb);
                    Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails1");
                    _rptdetails.DataSource = _dtdetails;
                    _rptdetails.DataBind();

                }
                else if (_treetype.Text == "0")
                {

                    //BLL_Dml _objbll = new BLL_Dml();
                    _clstreefolder _objcls1 = new _clstreefolder();
                    //_database _objdb = new _database();
                    //_objdb.DBName = "DBCML";
                    _objcls1.Folder_id = Convert.ToInt32(_sys_id.Text);
                    _dtdetails = _objbll.Load_AllsubFolders(_objcls1, _objdb);


                    Repeater rptmmain = (Repeater)e.Item.FindControl("rptmmain");
                    rptmmain.DataSource = _dtdetails;
                    rptmmain.DataBind();

                }





            }
        }

        protected void rptmmain0_ItemCommand(object sender, RepeaterItemEventArgs e)
        {
        }
    }
}