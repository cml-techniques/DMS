<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiUpload.aspx.cs" Inherits="CMLTechQ.DMS.MultiUpload" %>

<%@ Register assembly="com.flajaxian.FileUploader" namespace="com.flajaxian" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="../Assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        function onClientUploadComplete(sender, e) {
            var id = e.get_fileId();
            alert(id);
        }
        function getupload() {
            
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600"></ajaxToolkit:ToolkitScriptManager>
    <div>
        <%--<input type="file" id="files" name="files" multiple />--%>
        <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" AllowedFileTypes="jpg,jpeg,png,gif,pdf" MaximumNumberOfFiles="10" Width="500px" OnUploadComplete="AjaxFileUpload1_UploadComplete" ClientIDMode="Static" OnLoad="AjaxFileUpload1_Load" OnDataBinding="AjaxFileUpload1_DataBinding1" OnUploadStart="AjaxFileUpload1_UploadStart" />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"  />
    </div>
        <cc1:FileUploader ID="FileUploader1" runat="server" RequestAsPostBack="true" IsDebug="true" 
           OnFileReceived="FileUploader1_FileReceived" >
          <Adapters>
          </Adapters>
        </cc1:FileUploader>
        <a href="#" onclick="getupload()">Click</a>
    </form>
</body>
</html>
