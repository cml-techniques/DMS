<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CMLTechQ.CMS.WebForm1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
        <link rel="stylesheet" href="../../Assets/css/Layout.css" type="text/css" />
    <link href="../../Assets/css/navslider.css" type="text/css" rel="stylesheet" />
    <link href="../../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../Assets/css/menustyle.css" rel="stylesheet" />
    <script src="../../Assets/js/jquery.min.js"></script>
     <script src="../../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%;height:100%;position:absolute;">
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"  HasCrystalLogo="False" HasToggleGroupTreeButton="false" ToolPanelView="None" BestFitPage="False" Width="100%" Height="100%"  />
    </div>
    </form>
</body>
</html>
