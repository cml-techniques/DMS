<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraphTest.aspx.cs" Inherits="CMLTechQ.GraphTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Assets/css/Graph.css" rel="stylesheet" />
    <link href="Assets/css/03.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <div class="chart">
                <h2>CAS E1 Electrical Services. HV, MV Switchgear & RMU's Commissioning Activity Schedule</h2>
                <h3>Summary - Package Basis</h3>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </div>
        </div>
        <script src="Assets/js/jquery.min.js"></script>
        <script src="Assets/js/03.js"></script>
    </form>
</body>
</html>
