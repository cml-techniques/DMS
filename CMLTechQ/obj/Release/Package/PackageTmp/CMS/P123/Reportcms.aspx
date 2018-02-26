<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportcms.aspx.cs" Inherits="CMLTechQ.CMS.Reportcms" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="../../Assets/css/Layout.css" type="text/css" />
    <link href="../../Assets/css/navslider.css" type="text/css" rel="stylesheet" />
    <link href="../../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../Assets/css/menustyle.css" rel="stylesheet" />
    <script src="../../Assets/js/jquery.min.js"></script>
     <script src="../../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
 
</head>
<body  >
    <form id="form1" runat="server">
    
           <asp:Label ID="lblzone" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblcat" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblfl" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblfd" runat="server" Text="" style="display:none" ></asp:Label>
        <%--<asp:Label ID="lblzero" runat="server" Text="" CssClass="hidden"></asp:Label>--%>
        <asp:Label ID="lblsch" runat="server" Text="" style="display:none"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>

         <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"  HasCrystalLogo="False" HasToggleGroupTreeButton="false" ToolPanelView="None"/>
    
       
    </form>
</body>
</html>
