<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentSchedule.aspx.cs" Inherits="CMLTechQ.DMS.DocumentSchedule" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: Web Based Document Management</title>
    <meta name="author" content="CML Techniques" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%--<%: Styles.Render("~/Content/css") %>--%>
    <webopt:BundleReference ID="BundleReference1" runat="server" Path="~/Content/css" />

</head>
<body class="inner">
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocFolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbltest" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
        <asp:Label ID="lbldocstyleId" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocstylechange" runat="server" Text="" Style="display: none"></asp:Label>
        <input id="hidden_text" type="hidden" runat="server" />
        <input id="hidden_id" type="hidden" runat="server" />
        <div id="doc-container">
            <div id="main-content" style="bottom: 0px;">
                <div id="info-bar">
                    <div class="head">
                        <div class="headtitle">
                            <h2 class="title">
                                <asp:Label ID="pageinfo" runat="server" Text=""></asp:Label></h2>
                        </div>
                        <div class="action-menu ">
                            <a href="#" onclick="BacktoDocument();" class="control-general control-button-white-1 push_button pull-right"><i class="fa fa-angle-double-left"></i>BACK</a>
                        </div>
                    </div>
                </div>


                <div class="listcotainer">
                    <div class="floatingBox">
                        <div class="container-fluid">
                            <ul class="tabs3">
                                <li><a class="control-general control-button-green-1" href="#">Create Schedule</a></li>
                                <li><a class="control-general control-button-green-1" href="#">Upload Schedule</a></li>
                            </ul>
                            <div class="clear"></div>
                            <div class="panes_">
                                <div class="pane" style="display: block;">
                                    <div id="Upload-container" style="top: 50px;">
                                        <div class="container">
                                            <div class="selection">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <table border="0" cellpadding="0" cellspacing="5">
                                                            <tr>
                                                                <td style="width: 100px;">Reference</td>
                                                                <td style="width: 200px;">
                                                                    <asp:TextBox ID="txt_ref" CssClass="control-textbox-2" runat="server" Width="200px"></asp:TextBox></td>
                                                                <td style="width: 300px;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100px;">Manufacturer</td>
                                                                <td style="width: 200px;">
                                                                    <telerik:RadDropDownList ID="drop_manufacturer" runat="server" Skin="Default" RenderMode="Classic" DefaultMessage="Select Manufacturer" Width="220px"></telerik:RadDropDownList>
                                                                </td>
                                                                <td style="width: 300px;">
                                                                    <asp:Button ID="btnnew" runat="server" Text="New" CssClass="control-general control-button-blue1 push_button" OnClick="btnnew_Click" Width="100px" Style="height: 28px!important; float: left;" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Document Title</td>
                                                                <td colspan="2">
                                                                    <asp:TextBox ID="txttitle" CssClass="control-textbox-2" runat="server" Width="500px"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>File Name</td>
                                                                <td colspan="2">
                                                                    <asp:TextBox ID="txtfilename" CssClass="control-textbox-2" runat="server" Width="500px"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td colspan="2">*File extension not required.</td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                                                        <asp:Button ID="btnadd" runat="server" Text="Add To Basket " CssClass="control-general control-button-yellow1 push_button" OnClick="btnadd_Click" Width="110px" />
                                                                                            </telerik:RadAjaxPanel>
                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                            </td>
                                                                            <td style="padding-left: 10px;">
                                                                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                                                        <asp:Button ID="btnsave" runat="server" Text="Save Schedule" CssClass="control-general control-button-orange1 push_button" OnClick="btnsave_Click" Width="110px" />
                                                                                            </telerik:RadAjaxPanel>
                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                            </td>
                                                                        </tr>
                                                                    </table>

                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="selection" style="top:230px; bottom: 40px; position: absolute; overflow-x: hidden; overflow-y: auto; left: 5px; right: 5px;">

                                                <div>
                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ListView ID="doc_list" runat="server" DataKeyNames="SCH_ITM_ID" Style="width: 100%;" OnItemCommand="doc_list_ItemCommand" OnItemDeleting="doc_list_ItemDeleting">
                                                                <ItemTemplate>
                                                                    <tr id="itm_tr" runat="server" class="row">
                                                                        <td style="width: 100px; text-align: left"><%#Eval("REF_NO") %></td>
                                                                        <td style="width: 250px; text-align: left"><%#Eval("PARTY_NAME") %></td>
                                                                        <td style="width: 250px; text-align: left; word-wrap: break-word">
                                                                            <asp:Label ID="lbltitle" runat="server" Text='<%#Eval("DOCUMENT_TITLE") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width: 250px; text-align: left"><%#Eval("FILE_NAME") %></td>
                                                                        <td style="width: 25px;">
                                                                            <asp:Label ID="doc_idLabel" runat="server" Text='<%# Eval("SCH_ITM_ID") %>' Style="display: none" />
                                                                            <asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="" CssClass="btnstyle1 style-delete" />
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <LayoutTemplate>
                                                                    <table id="itemPlaceholderContainer" runat="server" class="table-style2" cellspacing="0" border="0" style="width: 100%; table-layout: fixed">
                                                                        <tr id="itm_tr" runat="server" class="hrow">
                                                                            <td style="width: 100px; text-align: left">Reference</td>
                                                                            <td style="width: 250px; text-align: left">Manufacturer</td>
                                                                            <td style="width: 250px; text-align: left">Document Title</td>
                                                                            <td style="width: 250px; text-align: left">File Name</td>
                                                                            <td style="width: 25px"></td>
                                                                        </tr>
                                                                        <tr id="itemPlaceholder" runat="server"></tr>
                                                                    </table>
                                                                </LayoutTemplate>
                                                                <EmptyDataTemplate>
                                                                    <table cellspacing="0" border="0" style="width: 100%; table-layout: fixed" class="table-style2">
                                                                        <tr id="itm_tr" runat="server" class="hrow">
                                                                            <td style="width: 100px; text-align: left">Reference</td>
                                                                            <td style="width: 250px; text-align: left">Manufacturer</td>
                                                                            <td style="width: 250px; text-align: left">Document Title</td>
                                                                            <td style="width: 250px; text-align: left">File Name</td>
                                                                            <td style="width: 25px"></td>
                                                                        </tr>
                                                                        <tr class="row">
                                                                            <td colspan="5">Schedule basket is empty</td>
                                                                        </tr>
                                                                    </table>
                                                                </EmptyDataTemplate>
                                                            </asp:ListView>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="pane" style="display: none;">
                                    <div class="upload-area">
                                        <%--<ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" AllowedFileTypes="xls" MaximumNumberOfFiles="1" Width="100%" OnUploadComplete="AjaxFileUpload1_UploadComplete" OnUploadCompleteAll="AjaxFileUpload1_UploadCompleteAll" OnClientUploadComplete="uploadComplete"  />
                                                    <asp:Label ID="lblMesg" runat="server" Text="" style="color:red"></asp:Label>--%>


                                        <div class="dropzone">
                                            DROP FILES HERE
                                        </div>
                                        <asp:UpdatePanel ID="UpdatePanel9" runat="server" >
                                            <ContentTemplate>
                                                <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                <asp:Button ID="btnupload_schedule" runat="server" Text="Upload All" OnClick="btnupload_schedule_Click" CssClass="control-general control-button-blue1 push_button" Style="margin-left: 110px; position: relative; height: 28px!important;" Width="100px" />
                                                    </telerik:RadAjaxPanel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" InputSize="30" UploadedFilesRendering="BelowFileInput" MultipleFileSelection="Automatic" Skin="Silk" DropZones=".dropzone" AllowedFileExtensions="xls">
                                            <Localization Select="Browse" />
                                        </telerik:RadAsyncUpload>

                                    </div>
                                    <%--<div>
                                        
                                    </div>--%>
                                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Silk">
                                        
                                    </telerik:RadAjaxLoadingPanel>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="clear"></div>
            <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="Create Manufacturer" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="500px" Height="200px">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div style="padding: 20px;">
                            <table style="color: #353535;">
                                <tr>
                                    <td style="width: 150px;">MANUFACTURER</td>
                                    <td style="width: 310px;">
                                        <asp:TextBox ID="txt_man" CssClass="control-textbox-2" Width="310px" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnmanu" runat="server" Text="Save" CssClass="control-general control-button-blue1 push_button" OnClick="btnmanu_Click" Width="100px" style="float:left;" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        </div>
    </form>
      <%: Scripts.Render("~/bundles/scripts") %>
      <script type="text/javascript">
          function BacktoDocument() {
              var _auth1 = document.getElementById("lbluseridhidden");
              var _auth2 = document.getElementById("lblprjid");
              var _auth3 = document.getElementById("lblfolder");
              parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=0";
          }
          </script>
</body>
</html>
