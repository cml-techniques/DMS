<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleUpload.aspx.cs" Inherits="CMLTechQ.DMS.ScheduleUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link rel="stylesheet" href="../Assets/css/OwnStyle.css" type="text/css" />

    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/tab.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Assets/css/fileupload.css" type="text/css" />
    <script src="../Assets/js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600"></ajaxToolkit:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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

                <asp:Label ID="lbltitle" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lblref" runat="server" Text="" Style="display: none"></asp:Label>



            </ContentTemplate>
        </asp:UpdatePanel>
        <input type="hidden" value="0" id="hfilecount" runat="server" />

        <div class="Scheduledup-area">

            <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" AllowedFileTypes="pdf" MaximumNumberOfFiles="50" Width="100%" OnUploadComplete="AjaxFileUpload1_UploadComplete" OnUploadCompleteAll="AjaxFileUpload1_UploadCompleteAll" OnClientUploadComplete="uploadComplete" OnClientUploadCompleteAll="Completeall" OnClientUploadError="uploadError" />

        </div>
        <div class="ScheduleCount">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <table style="position: absolute; height: 100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Scheduled :" CssClass="dvcounthead" />
                            </td>
                            <td>
                                <asp:Label ID="lblfcount" runat="server" Text="0" CssClass="dvcounthead"></asp:Label>
                            </td>
                            <td style="width: 80px"></td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Uploaded :" CssClass="dvcounthead"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblucount" runat="server" Text="0" CssClass="dvcounthead"></asp:Label>
                            </td>
                            <td style="width: 80px"></td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Pending :" CssClass="dvcounthead"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblpcount" runat="server" Text="0" CssClass="dvcounthead"></asp:Label>
                            </td>
                        </tr>
                    </table>


                </ContentTemplate>
            </asp:UpdatePanel>




        </div>
       <%-- <div class="dvschhead">
            <asp:Label ID="Label1" runat="server" Text="Scheduled Documents" CssClass="dvlblhead"></asp:Label>
        </div>--%>


        <div class="scheduledlst-area">
            <div class="scheduledoc_con">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:ListView ID="lvshowSchedule" runat="server" DataKeyNames="Sch_id" OnSelectedIndexChanged="lvshowSchedule_SelectedIndexChanged" OnItemDataBound="lvshowSchedule_ItemDataBound">
                            <ItemTemplate>
                                <tr id="itm_tr" runat="server" class="row">
                                    <td style="width: 40%; word-wrap: break-word">
                                        <asp:Label ID="lblschtitle" runat="server" Text='<%# Eval("doc_title") %>'></asp:Label>
                                    </td>
                                    <td style="width: 40%"><%# Eval("doc_name") %></td>
                                    <td style="width: 20%; text-align: right">
                                        <asp:Label ID="sch_idLabel" runat="server" Text='<%# Eval("Sch_id") %>' Style="display: none" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr id="itm_tr" runat="server" class="alter">
                                    <td style="width: 40%; word-wrap: break-word">
                                        <asp:Label ID="lblschtitle" runat="server" Text='<%# Eval("doc_title") %>'></asp:Label>
                                    </td>
                                    <td style="width: 40%"><%# Eval("doc_name") %></td>
                                    <td style="width: 20%; text-align: right">
                                        <asp:Label ID="sch_idLabel" runat="server" Text='<%# Eval("Sch_id") %>' Style="display: none" />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>

                            <LayoutTemplate>

                                <table id="itemPlaceholderContainer" runat="server" class="table-style1" style="width: 100%; table-layout: fixed">
                                    <tr id="itm_tr" runat="server" class="hrow">
                                        <td style="width: 40%">Document Title</td>
                                        <td style="width: 40%">File Name</td>
                                        <td style="width: 20%"></td>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server"></tr>
                                </table>

                            </LayoutTemplate>
                            <EmptyDataTemplate>
                                <table id="itemPlaceholderContainer" runat="server" class="table-style1" style="width: 100%; table-layout: fixed">
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



        <div style="display: none">
            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <asp:Button ID="cmduploadall" runat="server" Text="dummyupload" Style="display: none" OnClick="cmduploadall_Click" />
                    <%-- <asp:Button ID="cmdupload" runat="server" Text="dummyupload" Style="display: none" OnClick="cmdupload_Click" />--%>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="button2" runat="server" Text="clearlist" Style="display: none" />
        </div>



    </form>
    <script type="text/javascript">
        function uploadComplete(sender) {
            //$get("lblMesg").innerHTML = "File Uploaded Successfully";
            ////$("#cmdupload").click();
            //// clearContents();
        }
        function Completeall(sender) {

            $("#cmduploadall").click();
        }

        function uploadError(sender) {
            alert('Uplaod Error Occured.Please Try again');
            clear();
        }
        function BacktoDocument() {
            window.parent.BacktoDocument();
        }
        function clear() {

            $("#button2").click();
        }

    </script>
    <script src="../Assets/js/jquery.min.js"></script>
    <script src="../Assets/js/jquery.nicescroll.js"></script>
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("html").niceScroll({ styler: "fb", cursorcolor: "#063940", cursorwidth: '10', cursorborderradius: '0px', background: '#45818e', cursorborder: '' });
            });
    </script>
</body>
</html>
