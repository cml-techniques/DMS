
<%@ Page Title="" Language="C#" MasterPageFile="~/DMS/MC1.Master" AutoEventWireup="true" CodeBehind="OMUpload1.aspx.cs" Inherits="CMLTechQ.DMS.OMUpload1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .RadDropDownList_Default .rddlInner {
            /*border-color: #D4D4D4 !important;*/
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 5px!important;
            font-size: 14px;
            font-weight: bold;
        }

        .rddlPopup_Default .rddlItemSelected {
            background: none repeat scroll 0 0 #3399FF !important;
        }

        .rddlPopup_Default .rddlItemHovered {
            background: none repeat scroll 0 0 #3399FF !important;
        }

        .RadDropDownList_Default .rddlInner {
            font-weight: 600 !important;
            color: black !important;
        }

        .RadDropDownList_Default .rddlIcon {
            margin-top: 3px!important;
            height: 20px!important;
            width: 20px!important;
        }

        .RadPicker_Default input {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
            font-size: 14px;
            font-weight: bold;
        }

        .RadPicker_Default span {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 4px!important;
            font-size: 14px;
            font-weight: bold;
        }
        /*.RadInput_Default span {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 5px!important;
            font-size: 14px;
            font-weight:bold;
        }*/
        .datepicker-style {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
            font-size: 14px;
            font-weight: bold;
        }

        div.RadUpload .inputs {
        }



        div.RadUpload .ruBrowse {
            background-position: 0 -30px;
            background-color: #0099CC!important;
            box-shadow: 0px 2px 0px rgba(0,51,204,1);
            color: #F9FAFA!important;
            border: 0px;
            font-weight: bold;
            padding: 0!important;
            /*height: 30px!important;*/
            border-radius: 4px;
            display: block;
            width: 100px;
            margin: 0px;
            cursor: pointer;
        }

        div.RadUpload_Default .ruFileWrap .ruButtonHover {
            background-position: 100% -30px !important;
        }


        div.RadUpload .ruFakeInput {
            border: 1px solid red !important;
            width: 20px !important;
            display: none;
        }
    </style>
</asp:Content>
   <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocstyleId" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocstylechange" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbltest" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />

           <input type="hidden" id="hmenufolder" runat="server" />


        <input type="hidden" id="hdstatus" runat="server" />
        <input type="hidden" id="hrevision" runat="server" />


        <input type="hidden" id="hreminder1" runat="server" />
        <input type="hidden" id="hreminder2" runat="server" />
        <input type="hidden" id="hreminder3" runat="server" />


                  <div id="container-menu-bar" style="left: 275px; z-index: 200">
            <div id="container-menu">
                <div class="toggle"><a href="#" onclick="Viewslide();">
                    <img src="../Assets/img/expand-16.ico" alt="" />
                </a></div>

                      <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

              

            </div>
            <div class="report" id="dvreport" runat="server">

                <a href="#" onclick="goProgress();" class="push_button"><i class="icon-bar-chart"></i>Reports</a>
            </div>

        </div>



        <div id="doc-container" style="top: 45px; overflow: hidden; left: 275px; z-index: 700;">
            <div id="main-content" style="bottom:0px">
                <div class="head">
                    <div class="headtitle">
                        <h2 class="title">
                            <asp:Label ID="pageinfo" runat="server" Text=""></asp:Label></h2>
                    </div>
                </div>
                <div class="listcotainer" >
                    <div id="Upload-container">
                        <div class="container" >
                            <div class="selection">
                                <h2 class="subtitle" style="text-align: center">O&M Manual Upload</h2>
                            </div>
                            <div class="selection">
                                <table border="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 30px;">
                                            <div class="round">1</div>
                                        </td>
                                        <td colspan="3">
                                            <span class="subtitle">Select Document</span>
                                        </td>

                                    </tr>
                                    <tr>
                                       <td style="height:25px;"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="width: 100px;">
                                           
                                            <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="pdf" Skin="Glow" MaxFileInputsCount="1">
                                                <Localization Select="Browse" />
                                            </telerik:RadAsyncUpload>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding-top: 10px;">
                                            <div class="round">2</div>
                                        </td>
                                        <td colspan="3" style="padding-top: 10px;"><span class="subtitle">Document Details</span></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td colspan="3">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>Manual Title</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="txt_doctitle" runat="server" CssClass="control-textbox-2" Width="100%"></asp:TextBox></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>Current Status</td>
                                                    <td>Contractor</td>
                                                    <td></td>
                                                    <td>Revision</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 250px;">
                                                        <telerik:RadDropDownList ID="drop_status" runat="server" Skin="Default" RenderMode="Classic" DefaultMessage="Select Status" Width="240px">
                                                            <Items>
                                                                <telerik:DropDownListItem Text="Accepted" Value="1" />
                                                                <telerik:DropDownListItem Text="Accepted With Comments" Value="2" />
                                                                <telerik:DropDownListItem Text="Rejected" Value="3" />
                                                                <telerik:DropDownListItem Text="For Review" Value="4" />
                                                                <telerik:DropDownListItem Text="Revised" Value="5" />
                                                            </Items>
                                                        </telerik:RadDropDownList>
                                                    </td>
                                                    <td style="width: 235px;">
                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                            <ContentTemplate>
                                                                <telerik:RadDropDownList ID="drop_contractor" runat="server" Skin="Default" RenderMode="Classic" DefaultMessage="Select Contrator" Width="225px"></telerik:RadDropDownList>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>

                                                    </td>
                                                    <td style="width: 110px;">
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                            <ContentTemplate>
                                                                <asp:Button ID="btnnewcntr" runat="server" Text="New" CssClass="control-general control-button-blue1 push_button" Style="width: 100px;" OnClick="btnnewcntr_Click" />
                                                                <input type="hidden" id="hcontrctor" runat="server" />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td style="width: 150px;">
                                                        <telerik:RadDropDownList ID="drop_revision" runat="server" Skin="Default" RenderMode="Classic" DefaultMessage="Select Style" Width="140px">
                                                        </telerik:RadDropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                            <ContentTemplate>
                                                                <asp:Button ID="btnchnagestyle" runat="server" Text="Style" CssClass="control-general control-button-blue1 push_button" Style="width: 100px;" OnClick="btnchnagestyle_Click" />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding-top: 10px;">
                                            <div class="round">3</div>
                                        </td>
                                        <td colspan="3" style="padding-top: 10px;"><span class="subtitle">Review Details</span></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td colspan="3">
                                            
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <table border="0">
                                                        <tr>
                                                            <td style="padding-right: 10px;">
                                                                <asp:CheckBox ID="chk_noreview" runat="server" Text="No Review" OnCheckedChanged="chk_noreview_CheckedChanged" AutoPostBack="true" /></td>
                                                            <td style="padding-right: 10px;">
                                                                <asp:CheckBox ID="chkdreview" runat="server" Text="Use Global Response Period" OnCheckedChanged="chkdreview_CheckedChanged" AutoPostBack="true" />
                                                            </td>

                                                            <td>
                                                                <asp:CheckBox ID="chkemail" runat="server" Text="No Emails" />

                                                            </td>
                                                        </tr>
                                                    </table>
                                               </ContentTemplate>
                                            </asp:UpdatePanel>


                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td colspan="3">
                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                <ContentTemplate>
                                              
                                                    <table border="0">
                                                        <tr>
                                                            <td style="width: 175px; padding-top: 10px;">Review End Date</td>
                                                            <td style="width: 175px; padding-top: 10px;">First Reminder</td>
                                                            <td style="width: 175px; padding-top: 10px;">Second Reminder</td>
                                                            <td style="width: 175px; padding-top: 10px;">Third Reminder</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Skin="Default">
                                                                    <DateInput ID="DateInput5" runat="server" DateFormat="dd/MM/yyyy"></DateInput>
                                                                </telerik:RadDatePicker>
                                                            </td>
                                                            <td>
                                                              <%--  <telerik:RadDropDownList ID="drop_rem1" runat="server" Skin="Default" RenderMode="Classic" DefaultMessage="Select" Width="150px"></telerik:RadDropDownList>
                                                                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>--%>
                                                                <telerik:RadDatePicker ID="RadDatePicker2" runat="server" Skin="Default">
                                                                    <DateInput ID="DateInput1" runat="server" DateFormat="dd/MM/yyyy"></DateInput>
                                                                </telerik:RadDatePicker>
                                                            </td>
                                                            <td>
                                                                <%--<telerik:RadDropDownList ID="drop_rem2" runat="server" Skin="Default" RenderMode="Classic" DefaultMessage="Select" Width="150px"></telerik:RadDropDownList>--%>
                                                                <telerik:RadDatePicker ID="RadDatePicker3" runat="server" Skin="Default">
                                                                    <DateInput ID="DateInput2" runat="server" DateFormat="dd/MM/yyyy"></DateInput>
                                                                </telerik:RadDatePicker>
                                                            </td>
                                                            <td>
                                                                <telerik:RadDatePicker ID="RadDatePicker4" runat="server" Skin="Default">
                                                                    <DateInput ID="DateInput3" runat="server" DateFormat="dd/MM/yyyy"></DateInput>
                                                                </telerik:RadDatePicker>
                                                                <%--<telerik:RadDropDownList ID="drop_rem3" runat="server" Skin="Default" RenderMode="Classic" DefaultMessage="Select" Width="150px"></telerik:RadDropDownList>--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                                 

                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="padding-top: 20px;" colspan="3">
                                            <table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="width: 135px">
                                                        <asp:Button ID="cmdcancel" runat="server" Text="Cancel" CssClass="control-general control-button-yellow1 push_button" OnClick="cmdcancel_Click" Width="110px" />
                                                        <asp:Button ID="btndummy" runat="server" Text="dummyUpload" Style="display: none" />
                                                    </td>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                            <ContentTemplate>
                                                                <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                                <asp:Button ID="cmdupload" runat="server" Text="Upload" CssClass="control-general control-button-greenlight push_button" Width="110px" OnClick="cmdupload_Click" />
                                                                    </telerik:RadAjaxPanel>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Silk">
                                        
                                    </telerik:RadAjaxLoadingPanel>
        </div>
        <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="Create Contrator" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="500px" Height="200px">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <div style="padding: 20px;">
                            <table style="color: #353535;">
                                <tr>
                                    <td style="width: 120px;">CONTRACTOR</td>
                                    <td style="width: 340px;">
                                        <asp:TextBox ID="txtcontractor" CssClass="control-textbox-2" Width="340px" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnContrcator" runat="server" Text="Save" CssClass="control-general control-button-blue1 push_button" OnClick="btnContrcator_Click" Width="100px" style="float:left;" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow2" runat="server" Modal="true" BorderStyle="None" Title="Select Style" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="200px">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div style="padding: 20px;">
                            <table style="color: #353535;">
                                <tr>
                                    <td style="width: 110px;">SELECT STYLE</td>
                                    <td style="width: 200px;">
                                        <telerik:RadDropDownList ID="drop_style" runat="server" Skin="Default" RenderMode="Classic" DefaultMessage="Select Style" Width="200px"></telerik:RadDropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnAddstyle" runat="server" Text="Update" CssClass="control-general control-button-blue1 push_button" OnClick="btnAddstyle_Click" Width="100px" style="float:left;" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>
        

      <%: Scripts.Render("~/bundles/scripts") %>  
       <script lang="Javascript">
           function PageNavaigation_Doc(id, type, folder) {

               var _auth1 = document.getElementById("lbluseridhidden");
               var _auth2 = document.getElementById("lblprjid");



               if (type == 1) {
                   parent.document.getElementById("content").src = "NavWebForm1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth5=" + folder;
               }
               else if (type == 2) {
                   parent.document.getElementById("content").src = "NavWebForm2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type + "&Auth5=" + folder;
               }
               else if (type == 3) {
                   parent.document.getElementById("content").src = "NavWebForm3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type + "&Auth5=" + folder;
               }
               else if (type == 4) {
                   parent.document.getElementById("content").src = "NavWebForm4?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type + "&Auth5=" + folder;
               }
               else {
                   parent.document.getElementById("content").src = "NavWebForm1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type + "&Auth5=" + folder;
               }
               //_changeActive();
           }
    </script>
       </script>          
</asp:Content>
