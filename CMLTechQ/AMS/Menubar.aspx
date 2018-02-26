<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menubar.aspx.cs" Inherits="CMLTechQ.AMS.Menubar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/slider.css" type="text/css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <script type="text/javascript">

        function GetMenu(id, ftype, DefNav, DefaultInner) {
            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");

            //if (ftype == 10) {
            //    parent.document.getElementById("content").src = "dmsuploads?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=11";
            //    parent.document.getElementById("navbar").src = "";
            //    parent.document.getElementById("innernav").src = "";
            //}
            //else {
            parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=0";
            parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner + "&Auth4=0";
            parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefNav;

            //}aut



            _changeActive();
        }
        function _changeActive() {
            $(function () {
                $('.recent_works1 > li').click(function () {
                    $('.recent_works1 > li').removeClass('current');
                    $(this).addClass('current');
                });
            });
        }
        function goquick() {
            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");
            parent.document.getElementById("content").src = "ManualQuickView?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;
            //parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + -1;
            //parent.document.getElementById("navbar").src = "blank.html";
            //parent.toggle();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <div id="menu-bar1">
            <div class="menu">
                    <ul class='nav'  >
                        <li class='current' ><a href="#" class="current"><i class="fa fa-database"></i><br />Asset Register</a></li>
                        <li><a href="#"><i class="fa fa-calendar"></i><br />Calendar</a></li>
                        <li><a href="#"><i class="fa fa-clipboard"></i><br />Tasks</a></li>
                        <li><a href="#"><i class="fa fa-cog"></i><br />Parts Management</a></li>
                        <li><a href="#"><i class="fa fa-usd"></i><br />Cost Analysis</a></li>
                        <li><a href="#"><i class="fa fa-users"></i><br />People</a></li>
                        <li><a href="#"><i class="fa fa-globe"></i><br />Location</a></li>

                    </ul>
                    <%--<div class="controls">
                        <a class="prev" href="#"><i class="icon-caret-left icon"></i></a>
                        <a class="next" href="#"><i class="icon-caret-right icon"></i></a>
                    </div>--%>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>


        <script src="../Assets/js/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(window).load(function () {
                jQuery('.nav').carouFredSel({
                    responsive: true,
                    width: '100%',
                    scroll: 1,
                    auto: false,
                    circular: false,
                    //infinite: false,
                    items: {
                        width: 200,
                        visible: {
                            min: 7,
                            max: 7
                        }
                    },
                    //prev: '#prev',
                    //next: '#next',
                    //prev: {
                    //    button: function () { return jQuery(this).closest('.recentwork_carousel').find('.prev'); },
                    //    key: "left"
                    //},
                    //next: {
                    //    button: function () { return jQuery(this).closest('.recentwork_carousel').find('.next'); },
                    //    key: "right"
                    //}
                });
            });
        </script>
    </form>
</body>
</html>
