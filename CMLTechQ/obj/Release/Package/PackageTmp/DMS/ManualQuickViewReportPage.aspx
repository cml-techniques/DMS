<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManualQuickViewReportPage.aspx.cs" Inherits="CMLTechQ.DMS.ManualQuickViewReportPage" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
       <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
     <script src="../Assets/js/jquery.min.js"></script>

         <script src="../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
        <link href="../Assets/css/OwnStyle.css" rel="stylesheet" />
       <script type="text/javascript">
           function _autoAdjust() {
               //alert(msieversion());
               var div = $("#main-content").height();
               var win = $(window).height();
               if (div < win) {
                   //if (msieversion() > 0) {
                   //    var win = $(window).height() - 40;
                   //}
                   //else {
                   //var win = $(window).height() - 50;
                   //}
                   ///$("#main-content").height(win);
                   $("#main-content").addClass("botzero");
               }
               else {
                   $(" #main-content").addClass("botauto");
               }
           }

    </script>
</head>
<body style="border-right:solid 5px #45818e" >
    <form id="form1" runat="server">
                        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
             <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>

         <div >
             <div id="viewer" style="top:0px;bottom:0px;position:absolute;">
      <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" HasCrystalLogo="False" HasToggleGroupTreeButton="false" ToolPanelView="None"  />
                 </div>

    </div>
    </form>
</body>
</html>
