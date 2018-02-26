﻿
<%@ Page Title="" Language="C#" MasterPageFile="~/DMS/MC1.Master" AutoEventWireup="true" CodeBehind="DocumentUpload2.aspx.cs" Inherits="CMLTechQ.DMS.DocumentUpload2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        div.RadUpload .ruInputs {
            margin-top: -28px!important;
            z-index: 999!important;
            position: relative;
        }

        div.RadUpload .ruProgress ul li {
            background-color: rgba(0,51,204,1);
        }

        div.RadUpload .ruFileWrap span {
            font-size: 14px!important;
            color: #353535;
            width: 60%;
        }

        div.RadUpload .ruRemove {
            display: inline-block;
            font-size: 14px;
            background-color: #f00;
            padding: 0px!important;
            padding-left: 5px!important;
            padding-right: 5px!important;
            text-decoration: none!important;
            color: #f5f5f5;
        }

        div.RadUpload .ruBrowse {
            background-position: 0 -30px;
            background-color: #0099CC!important;
            box-shadow: 0px 2px 0px rgba(0,51,204,1);
            color: #F9FAFA!important;
            border: 0px;
            font-weight: bold;
            padding: 0!important;
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lbldocFolder" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lbltest" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
                <asp:Label ID="lbldocstyleId" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lbldocstylechange" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lblschid" runat="server" Text="0" Style="display: none"></asp:Label>
                <asp:Label ID="lbltype" runat="server" Text="0" Style="display: none"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>




  <input type="hidden" id="hmenufolder" runat="server" />



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

        

        <div id="doc-container" style="top: 45px; overflow-x: hidden; left: 275px;position:absolute;bottom:0px;z-index:700">
            <div id="main-content" style="bottom: 0px;">
                <div id="info-bar" style="position:absolute;">
                    <div class="head">
                        <div class="headtitle">
                            <h2 class="title">
                                <asp:Label ID="pageinfo" runat="server" Text=""></asp:Label></h2>
                        </div>
                        <div class="action-menu ">
                            <a href="javascript:history.go(-1);" class="control-general control-button-white-1 push_button pull-right"><i class="fa fa-angle-double-left"></i>BACK</a>
                        </div>
                    </div>
                </div>
                <div class="listcotainer" style="position:absolute;top:50px;bottom:0px;right:5px;left:0px">
                    <div class="floatingBox">
                        <div class="container-fluid">
                            <ul class="tabs3">
                                <li><a class="control-general control-button-green-1" href="#">Multi-Uploads</a></li>
                                <li><a class="control-general control-button-green-1" href="#">Scheduled Uploads</a></li>

                            </ul>
                            <div class="clear"></div>

                            <div class="panes_">
                                <div class="pane" style="display: block;">
                                    <div class="upload-area">
                                        <div class="dropzone">
                                            DROP FILES HERE
                                        </div>
                                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                            <ContentTemplate>
                                                <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                    <asp:Button ID="btnupload_doc" runat="server" Text="Upload All" CssClass="control-general control-button-blue1 push_button" Style="margin-left: 110px; position: relative; height: 28px!important;" Width="100px" OnClick="btnupload_doc_Click" />
                                                </telerik:RadAjaxPanel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" InputSize="30" UploadedFilesRendering="BelowFileInput" MultipleFileSelection="Automatic" Skin="Silk" DropZones=".dropzone" AllowedFileExtensions="pdf">
                                            <Localization Select="Browse" />
                                        </telerik:RadAsyncUpload>
                                    </div>
                                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Silk">
                                    </telerik:RadAjaxLoadingPanel>
                                    <div class="clear"></div>
                                </div>

                                <div class="pane" style="display: none;">
                                    <div id="docschedule_area">

                                        <%--<iframe runat="server" id="ScheduleUpload" class="docview"></iframe>--%>
                                        <div class="Scheduledup-area">
                                            <div class="dropzone" id="zone1">
                                                DROP FILES HERE
                                            </div>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                        <asp:Button ID="btnupload_sch" runat="server" Text="Upload All" CssClass="control-general control-button-blue1 push_button" Style="margin-left: 110px; position: relative; height: 28px!important;" Width="100px" OnClick="btnupload_sch_Click" />
                                                    </telerik:RadAjaxPanel>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <telerik:RadAsyncUpload ID="RadAsyncUpload2" runat="server" InputSize="30" UploadedFilesRendering="BelowFileInput" MultipleFileSelection="Automatic" Skin="Silk" DropZones="#zone1" AllowedFileExtensions="pdf">
                                                <Localization Select="Browse" />
                                            </telerik:RadAsyncUpload>
                                        </div>
                                        <div class="scheduledlst-area">
                                            <div class="scheduledoc_con">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <asp:ListView ID="lvshowSchedule" runat="server" DataKeyNames="Sch_id" >
                                                            <ItemTemplate>
                                                                <tr id="itm_tr" runat="server" class="row">
                                                                    <td style="width: 40%; word-wrap: break-word">
                                                                        <asp:Label ID="lblschtitle" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                                                    </td>
                                                                    <td style="width: 40%">
                                                                        <asp:Label ID="lblschdocname" runat="server" Text='<%# Eval("doc_name") %>'></asp:Label>
                                                                        </td>
                                                                    <td style="width: 20%; text-align: right">
                                                                        <asp:Label ID="sch_idLabel" runat="server" Text='<%# Eval("Sch_id") %>' Style="display: none" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                           <%-- <AlternatingItemTemplate>
                                                                <tr id="itm_tr" runat="server" class="alter">
                                                                    <td style="width: 40%; word-wrap: break-word">
                                                                        <asp:Label ID="lblschtitle" runat="server" Text='<%# Eval("doc_title") %>'></asp:Label>
                                                                    </td>
                                                                    <td style="width: 40%"><%# Eval("doc_name") %></td>
                                                                    <td style="width: 20%; text-align: right">
                                                                        <asp:Label ID="sch_idLabel" runat="server" Text='<%# Eval("Sch_id") %>' Style="display: none" />
                                                                    </td>
                                                                </tr>
                                                            </AlternatingItemTemplate>--%>

                                                            <LayoutTemplate>

                                                                <table id="itemPlaceholderContainer" runat="server" class="table-style2" style="width: 100%; table-layout: fixed" cellspacing="0" border="0">
                                                                    <tr id="itm_tr" runat="server" class="hrow">
                                                                        <td style="width: 40%">Document Title</td>
                                                                        <td style="width: 40%">File Name</td>
                                                                        <td style="width: 20%"></td>
                                                                    </tr>
                                                                    <tr id="itemPlaceholder" runat="server"></tr>
                                                                </table>

                                                            </LayoutTemplate>
                                                            <EmptyDataTemplate>
                                                                <table id="itemPlaceholderContainer" runat="server" class="table-style2" style="width: 100%; table-layout: fixed" cellspacing="0" border="0">
                                                                    <tr id="itm_tr" runat="server" class="hrow">
                                                                        <td style="width: 40%">Document Title</td>
                                                                        <td style="width: 40%">File Name</td>
                                                                        <td style="width: 20%"></td>
                                                                    </tr>
                                                                    <tr class="row">
                                                                        <td colspan="3">No Schedule available for upload</td>
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
                        </div>

                    </div>

                </div>

                <div class="clear"></div>

            </div>
        </div>
        <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="File Upload" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="600px" Height="300px">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <div style="padding: 10px;">
                            <p style="color:#353535;">The following file(s) not scheduled</p>
                            <asp:GridView ID="error_list" runat="server" ShowHeader="false" AutoGenerateColumns="false" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                <Columns>
                                    <asp:BoundField DataField="FileName" />
                                </Columns>
                                <EditRowStyle BackColor="#999999"></EditRowStyle>

                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                            </asp:GridView>
                        </div>
                        <div style="padding: 10px;">
                            <asp:Button ID="btnno" runat="server" Text="Ok" CssClass="control-general control-button-orange1 push_button" OnClick="btnno_Click" Width="100px" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>
        
       
    <%: Scripts.Render("~/bundles/scripts") %>
    <script type="text/javascript">
        function PageNavaigation_Doc(id, type, folder) {

            var _auth1 = document.getElementById("<%=lbluseridhidden.ClientID %>");
             var _auth2 = document.getElementById("<%=lblprjid.ClientID %>");



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

        </asp:Content>
