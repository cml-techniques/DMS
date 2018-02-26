<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InnerNav.aspx.cs" Inherits="CMLTechQ.CMS.InnerNav" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/slider.css" type="text/css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        function PageNavaigation(id,ser_id) {

            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");

            parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id

            parent.document.getElementById("content").src = "Schedule?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + ser_id;

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
        <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbldocFolder" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
         <div id="container-menu-bar">
               
                <div id="container-toggle" >
                    <a href="#" onclick="parent.toggle();"><img src="../Assets/img/expand-16.ico" alt="" /> </a> <%--<i class="icon-th"></i>--%>
                </div>
                <div id="container-menu">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </div>
                
            </div>
    
    </form>
</body>
</html>
