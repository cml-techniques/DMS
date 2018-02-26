<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Navbar.aspx.cs" Inherits="CMLTechQ.CMS.Navbar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
     <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        function GetNav(id) {
            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblid");
            parent.document.getElementById("content").src = "Schedule?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + id;
            _changeActive();
        }
        function _changeActive() {
            $(function () {
                $('.nav > li').click(function () {
                    $('.nav > li').removeClass('current');
                    $(this).addClass('current');
                });
            });
        }
    </script>
</head>
<body class="inner">
    <form id="form1" runat="server">
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>
         <div id="navbar">
            <div id="nav-bar" >
                <ul class="nav">
                    <li class="item"><a href="#"><i class="icon-folder-close"></i></a></li>
                    <li class="item"><a href="#"><i class="icon-file-alt"></i></a></li>
                    <li class="item"><a href="#"><i class="icon-sort"></i></a></li>
                    <li class="item"><a href="#"><i class="icon-edit"></i></a></li>
                    <li class="item"><a href="#"><i class="icon-trash"></i></a></li>
                </ul>
            </div>
            <div class="clear"></div>
            <div id="nav-menu">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </div>

        </div>
    
    </form>
</body>
</html>
