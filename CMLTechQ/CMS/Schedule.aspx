<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="CMLTechQ.CMS.Schedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/navslider.css" type="text/css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
     <script src="../Assets/js/jquery.min.js"></script>
   
    <script type="text/javascript">
        function _autoAdjust() {
            //alert(msieversion());
            var div = $("#main-content").height();
            var win = $(window).height();
            if (div < win) {
                //if (msieversion() > 0) {
                //    var win = $(window).height() - 40;<a href="Schedule.aspx">Schedule.aspx</a>
                //}
                //else {
                //    var win = $(window).height() - 40;
                //}
                //$("#main-content").height(win);
                $("#main-content").addClass("botzero");
            }
            else {
                $("#main-content").addClass("botauto");
            }
        }
    </script>
     <script type="text/javascript">
         function getdata(id) {
             var e = document.getElementById('d' + id);
             if (e) {
                 if (e.style.display != 'block') {
                     $(this).parent().fadeOut();
                     e.style.display = 'block';
                     e.style.visibility = 'visible';
                 }
                 else {
                     e.style.display = 'none';
                     e.style.visibility = 'hidden';
                 }
             }
             scrollheight();
         }
         //function fixHeader() {
         //    var t = document.getElementById("repeaterHead");
         //    var thead = t.getElementsByTagName("thead")[0];
         //    var t1 = t.cloneNode(false);
         //    t1.appendChild(thead);
         //    tableHeader.appendChild(t1)
         //}
         //window.onload = fixHeader();
         function Onscrollfnction() {
             var div = document.getElementById('Data');
             var div2 = document.getElementById('HeaderDiv');
             //var div3 = document.getElementById('HeaderTable');
             //****** Scrolling HeaderDiv along with DataDiv 
             //$("#HeaderDiv").css({
             //    'position': ''
             //});
             div2.scrollLeft = div.scrollLeft;
             //$("#HeaderDiv").css({
             //    'position': 'fixed'
             //});

             //div2.scrollTop = 0;
             //div3.scrollLeft = div.scrollLeft;
             return false;
         }
         function scrollheight() {
             var div = document.getElementById('Data');
             var div1 = document.getElementById('HeaderDiv');
             if (div.scrollHeight > div.clientHeight) {
                 div1.setAttribute("style", "border-right:17px solid #45818e");
             }
             else
                 div1.setAttribute("style", "border-right:none");
         }
      
         function GetNav(id) {
             var _auth1=document.getElementById("lbluserhidden");
             var _auth2=document.getElementById("lblprjid");
             parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id;
         }
    </script>
    <%--<script src="../Assets/js/jquery.nicescroll.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        $("html").niceScroll();
    });
  </script>--%>
</head>
<body style="border-right:solid 5px #45818e;overflow:hidden;z-index:1" class="inner" onload="javascript:_autoAdjust();">
    <form id="form1" runat="server">
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblsrv" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblcas" runat="server" Text="" style="display:none"></asp:Label>
 
        <div id="doc-container" style="top:0px;" >
             <div id="main-content">
              <%--<div class="head">
                  <div class="headtitle">
                      <h2 class="title"></h2>
                  </div>--%>
<%--                    
                  <div class="header-menu pull-right">
                      <nav id="nav-main-menu">

                      </nav>
                  </div>--%>
                </div>
                 </div>
            <%--/div>--%>
       
    </form>
</body>
</html>
