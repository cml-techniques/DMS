<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Head.aspx.cs" Inherits="CMLTechQ.AMS.Head" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function CallHome() {
            var _auth1 = document.getElementById("lbluserhidden");
            parent.location.replace("../CMLT?Auth1=" + _auth1.textContent);
        }
        function CallSearch() {
            var _searchstring = document.getElementById("zoom_query");
            parent.document.getElementById("content").src = "Script/Search?zoom_query=" + _searchstring.value;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lbluserhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <div class="wrapper row1">
            <div id="header">
                <div class="module-name" >CML Techniques - Asset Management System</div>
                <div id="header-nav1">
                    <ul class="nav">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Messages</a></li>
                        <li><a href="#">Settings</a></li>
                        <li><a href="#">Log Off</a></li>
                    </ul>
                </div>
                <p class="title">
                <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
            </div>
        </div>

    </form>
</body>
</html>
