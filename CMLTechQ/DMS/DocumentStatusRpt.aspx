﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentStatusRpt.aspx.cs" Inherits="CMLTechQ.DMS.DocumentStatusRpt" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
             <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
             <asp:Label ID="lbldocFolder" runat="server" Text="" style="display:none"></asp:Label>
         <asp:Label ID="lbltype" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
         <asp:Label ID="lbltest" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
       <input type="hidden" id="hfolderid" value="0" runat="server" />
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" HasCrystalLogo="False" HasToggleGroupTreeButton="false" ToolPanelView="None"  />
    </div>
    </form>
</body>
</html>
