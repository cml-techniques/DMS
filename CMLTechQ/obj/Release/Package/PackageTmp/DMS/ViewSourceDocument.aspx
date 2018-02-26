<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSourceDocument.aspx.cs" Inherits="CMLTechQ.DMS.ViewSourceDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body style="border-right:solid 5px #45818e;">
    <form id="form1" runat="server">   
         <div id="viewer" style="top:5px;bottom:0px;left:0px;right:0px;position :absolute;">
               <iframe src="#" runat="server" id="documentviewer" style="border:0;height:100%;width:100%;position:relative"></iframe>
             </div>
    </form>
</body>
</html>
