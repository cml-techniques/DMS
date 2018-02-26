<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentUpload.aspx.cs" Inherits="CMLTechQ.DMS.DocumentUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link rel="stylesheet" href="../Assets/css/fileupload.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/tab.css" rel="stylesheet" />
     <script src="../Assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        function PopupUpload() {
            $("#btndummy3").click();
        }
        function GetValue() {
            var _file = document.getElementById("myupload").value;
            var i = _file.lastIndexOf("\\");
            var _filename = _file.substring(i + 1);
            var _fileext = _filename.substr(_filename.lastIndexOf('.') + 1);
            if (_fileext != 'xls') {
                alert("Invalid File");
            }
            else {
                $("#lblfileinfo").text(_filename);
            }
        }
        function uploadComplete(sender) {
            $get("lblMesg").innerHTML = "File Uploaded Successfully";
            //$find("pop").hide();
            $("#btnreload").click();
            clearContents();
        }


        function uploadError(sender) {
            $get("lblMesg").innerHTML = "File upload failed.";
            clearContents();
        }


        function clearContents() {
            var span = $get("AjaxFileUpload1");
            var txts = span.getElementsByTagName("input");
            for (var i = 0; i < txts.length; i++) {
                if (txts[i].type == "text") {
                    txts[i].value = "";
                }
            }
        }
        function CheckFile() {
            var span = $get("AjaxFileUpload1");
            var txts = span.getElementsByTagName("input");
            for (var i = 0; i < txts.length; i++) {
                if (txts[i].type == "text") {
                    alert(txts[i].value);
                }
            }
        }
    </script>
</head>
<body style="border-right:solid 5px #45818e" class="inner">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600" ></ajaxToolkit:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbldocFolder" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbltest" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
        <asp:Label ID="lbldocstyleId" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbldocstylechange" runat="server" Text="" style="display:none"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <div id="doc-container" >
            <div id="main-content" style="bottom:0px;">
                <div id="info-bar">
                    <div class="head">
                        <div class="headtitle">
                            <h2 class="title"><asp:Label ID="pageinfo" runat="server" Text=""></asp:Label></h2>
                        </div>
                        <div class="back pull-right">
                            <a class="back" href="javascript:history.go(-1);"><i  class="icon-backward"></i> Back</a>
                        </div>
                    </div>
                </div>

                
                <div class="listcotainer">
                    <div class="floatingBox">
                        <div class="container-fluid">
                            <ul class="tabs3">
                                <li><a class="current" href="#">Multi Upload</a></li>
                                <li><a href="#">Manual Upload</a></li>
                            </ul>
                            <div class="clear"></div>
                            <div class="panes_">
                                <div class="pane" style="display: block;">
                                   
                                            <div class="upload-area">
                                                <%--<div class="pophead">Multiple Upload</div>
                                                <div class="poparea" style="height:300px;">--%>
                                                    <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" AllowedFileTypes="pdf" MaximumNumberOfFiles="50" Width="400px" OnUploadComplete="AjaxFileUpload1_UploadComplete" OnUploadCompleteAll="AjaxFileUpload1_UploadCompleteAll" OnClientUploadComplete="uploadComplete"   />
                                                    <asp:Label ID="lblMesg" runat="server" Text="" style="color:red"></asp:Label>
                                                <%--</div>--%>
                                            </div>
                                            <div class="schedule-area">
                                                <div class="doc_con">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <asp:ListView ID="upload_doc" runat="server" DataKeyNames="doc_id" onitemcanceling="upload_doc_ItemCanceling" onitemediting="upload_doc_ItemEditing" style="width:100%;" OnItemCommand="upload_doc_ItemCommand" OnItemUpdating="upload_doc_ItemUpdating" OnItemDeleting="upload_doc_ItemDeleting">
                                                    <ItemTemplate>
                                                        <tr id="itm_tr" runat="server" class="row">
                                                            <td style="width:40%"><%# Eval("title") %></td>
                                                            <td style="width:40%"><%# Eval("doc_name") %></td>
                                                            <td style="width:20%;text-align:right">
                                                                <asp:Label ID="doc_idLabel" runat="server" Text='<%# Eval("doc_id") %>' style="display:none" />
                                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="" CssClass="btnstyle1 style-edit"   /><asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="" CssClass="btnstyle1 style-delete"   />
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr id="itm_tr" runat="server" class="alter" >
                                                            <td style="width:40%"><%# Eval("title") %></td>
                                                            <td style="width:40%"><%# Eval("doc_name") %></td>
                                                            <td style="width:20%;text-align:right">
                                                                <asp:Label ID="doc_idLabel" runat="server" Text='<%# Eval("doc_id") %>' style="display:none" />
                                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="" CssClass="btnstyle1 style-edit"   /><asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="" CssClass="btnstyle1 style-delete"   />
                                                            </td>
                                                        </tr>
                                                    </AlternatingItemTemplate>
                                                    
                                                    <LayoutTemplate >
                                                       
                                                                    <table id="itemPlaceholderContainer" runat="server" class="table-style1" style="width:100%"  >
                                                                        <tr id="itm_tr" runat="server" class="hrow">
                                                                            <td style="width:40%">Document Title</td>
                                                                            <td style="width:40%">File Name</td>
                                                                            <td style="width:20%"></td>
                                                                        </tr>
                                                                        <tr id="itemPlaceholder" runat="server"></tr>
                                                                    </table>
                                                               
                                                    </LayoutTemplate>
                                                    <EditItemTemplate>
                                                        <tr class="erow" >
                                                            <td style="width:40%">
                                                                <asp:TextBox ID="txttitle" runat="server" Text='<%# Eval("title") %>' Width="100%" ></asp:TextBox></td>
                                                            <td style="width:40%"><%# Eval("doc_name") %></td>
                                                            <td style="width:20%;text-align:right">
                                                                <asp:Label ID="doc_idLabel" runat="server" Text='<%# Eval("doc_id") %>' style="display:none" />
                                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="" CssClass="btnstyle1 style-update" />
                                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="" CssClass="btnstyle1 style-cancel"  />
                                                            </td>
                    </tr>
                </EditItemTemplate>
               
            </asp:ListView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                
                                            </div>
                                            
                                            </div>
                                    <div class="doc_action">
                                                <table>
                                                <tr>
                                                    <td style="padding-left:15px;">
                                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                            <ContentTemplate>
                                                                <asp:Button ID="cmdupload" runat="server" Text="Save" CssClass="controlstyle actstyle" OnClick="cmdupload_Click"  />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                            </div>
                                   
                                </div>
                                <div class="pane" style="display: none;">
                                    <div class="content-box">
                                        <div class="selection">
                                            
                                        </div>
                                        <div class="selection">
                                            
                                        </div>
                                        <div class="bottom-fix">
                    <table>
                                                <tr>
                                                    <td style="width:100px;"></td>
                                                    <td >
                                                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                            <ContentTemplate>
                                                                
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="clear"></div>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnreload" runat="server" Text="" style="display:none" OnClick="btnreload_Click" ClientIDMode="Static" />
                </ContentTemplate>
            </asp:UpdatePanel>
           
            <div class="footer"></div>
        </div>
        
        <script src="../Assets/js/jquery.tabs.min.js" type="text/javascript"></script>
        <script src="../Assets/js/custom.js" type="text/javascript"></script>
    
    </form>
</body>
</html>
