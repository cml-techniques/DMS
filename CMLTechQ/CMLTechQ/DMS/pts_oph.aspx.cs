using App_Properties;
using BusinessLogic;
using PassProtection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMLTechQ.DMS
{
    public partial class pts_oph : System.Web.UI.Page
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
            rptmmain.DataSource = _dtservice;
            rptmmain.DataBind();

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
                HyperLink hl11 = (HyperLink)e.Item.FindControl("hl11");
                Label lbl11 = (Label)e.Item.FindControl("lbl11");
                HyperLink hl12 = (HyperLink)e.Item.FindControl("hl12");
                Label lbl12 = (Label)e.Item.FindControl("lbl12");
                HyperLink hl13 = (HyperLink)e.Item.FindControl("hl13");
                Label lbl13 = (Label)e.Item.FindControl("lbl13");
                HyperLink hl14 = (HyperLink)e.Item.FindControl("hl14");
                Label lbl14 = (Label)e.Item.FindControl("lbl14");
                HyperLink hl15 = (HyperLink)e.Item.FindControl("hl15");
                Label lbl15 = (Label)e.Item.FindControl("lbl15");
                HyperLink hl16 = (HyperLink)e.Item.FindControl("hl16");
                Label lbl16 = (Label)e.Item.FindControl("lbl16");
                HyperLink hl17 = (HyperLink)e.Item.FindControl("hl17");
                Label lbl17 = (Label)e.Item.FindControl("lbl17");
                HyperLink hl18 = (HyperLink)e.Item.FindControl("hl18");
                Label lbl18 = (Label)e.Item.FindControl("lbl18");
                HyperLink hl19 = (HyperLink)e.Item.FindControl("hl19");
                Label lbl19 = (Label)e.Item.FindControl("lbl19");
                HyperLink hl20 = (HyperLink)e.Item.FindControl("hl20");
                Label lbl20 = (Label)e.Item.FindControl("lbl20");


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
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section11"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section11"]) >= 100)
                        hl11.Visible = true;
                    else
                        lbl11.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section12"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section12"]) >= 100)
                        hl12.Visible = true;
                    else
                        lbl12.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section13"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section13"]) >= 100)
                        hl13.Visible = true;
                    else
                        lbl13.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section14"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section14"]) >= 100)
                        hl14.Visible = true;
                    else
                        lbl14.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section15"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section15"]) >= 100)
                        hl15.Visible = true;
                    else
                        lbl15.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section16"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section16"]) >= 100)
                        hl16.Visible = true;
                    else
                        lbl16.Visible = true;
                }
                if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section17"]))
                {

                    if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section17"]) >= 100)
                        hl17.Visible = true;
                    else
                        lbl17.Visible = true;
                    if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section18"]))
                    {

                        if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section18"]) >= 100)
                            hl18.Visible = true;
                        else
                            lbl18.Visible = true;
                    }
                    if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section19"]))
                    {

                        if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section19"]) >= 100)
                            hl19.Visible = true;
                        else
                            lbl19.Visible = true;
                    }
                    if (!DBNull.Value.Equals(((DataRowView)e.Item.DataItem).Row["section20"]))
                    {

                        if (Convert.ToDecimal(((DataRowView)e.Item.DataItem).Row["section20"]) >= 100)
                            hl20.Visible = true;
                        else
                            lbl20.Visible = true;
                    }
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
                _dtdetails = _objbll.Load_AllProgressTracking1(_objcls, _objdb);
                Repeater _rptdetails = (Repeater)e.Item.FindControl("rptdetails");
                _rptdetails.DataSource = _dtdetails;
                _rptdetails.DataBind();

            }
        }


        private bool DateValidation(string dateString)
        {

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
            _objbll.Update_ProgressTracking_tbl1(_objcls, _objdb);



            //Load_Details();

        }
        protected void txt28_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 28);

        }

        protected void txt27_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 27);

        }

        protected void txt26_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 26);

        }

        protected void txt25_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 25);

        }

        protected void txt24_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 24);

        }
        protected void txt23_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 23);

        }

        protected void txt22_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges1(sender, e, 22);

        }
        protected void txt20_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 20);

        }
        protected void txt19_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 19);

        }
        protected void txt16_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 16);

        }
        protected void txt15_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 15);

        }
        protected void txt14_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 14);

        }
        protected void txt13_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 13);

        }


        protected void txt12_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 12);
        }

        protected void txt11_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 11);



        }
        protected void txt10_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 10);

        }
        protected void txt9_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 9);

        }
        protected void txt8_TextChanged(object sender, EventArgs e)
        {
            UpdateChanges(sender, e, 8);

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


            //if (cntno == 11)
            //{
            //    if (!DateValidation(tbv.Text))
            //    {
            //        tbv.Text = lbl.Text;
            //        ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Invalid Date Format');", true);
            //        return;
            //    }

            //}

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
        //protected void rptmmain0_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Label _sys_id = (Label)e.Item.FindControl("lblsys");
        //        DataTable _dtdetails = new DataTable();


        //        BLL_Dml _objbll = new BLL_Dml();
        //        _clstreefolder _objcls = new _clstreefolder();
        //        _database _objdb = new _database();
        //        _objdb.DBName = "DBCML";
        //        _objcls.Folder_id = Convert.ToInt32(_sys_id.Text);
        //        _dtdetails = _objbll.Load_AllsubFolders(_objcls, _objdb);


        //        Repeater rptmmain = (Repeater)e.Item.FindControl("rptmmain");
        //        rptmmain.DataSource = _dtdetails;
        //        rptmmain.DataBind();

        //    }
        //}


    }
}