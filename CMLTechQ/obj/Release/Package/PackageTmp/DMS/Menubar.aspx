<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menubar.aspx.cs" Inherits="CMLTechQ.DMS.Menubar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: Web Based Document Management</title>
    <meta name="author" content="CML Techniques" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%: Styles.Render("~/Content/css") %>
</head>
<body class="inner">
    <form id="form1" runat="server">
              <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>
        

        
        <div id="menu-bar">
            <div class="menu" style="right:5px">
                <div class="recentwork_carousel  style2" >
                     <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    <div class="controls">
                        <a class="prev" href="#" ><i class="icon-caret-left icon"></i></a>
                        <a class="next" href="#" ><i class="icon-caret-right icon"></i></a>
                    </div>
                </div>
            </div>
            <%--<div class="report" id="dvreport" runat="server">
               <a href="#" onclick="goquick();" title="Manual Quick View" ><i class="icon-time"></i></a>
            </div>--%>
        </div>
        <script src="//code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
    
    <%--<script src="../Assets/js/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
		 <script src="../Assets/js/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>
    
    </form>
    <script async type="text/javascript">
        jQuery(window).load(function () {
            jQuery('.recent_works1').carouFredSel({
                responsive: true,
                width: '100%',
                scroll: 1,
                auto: false,
                circular: false,
                //infinite: false,
                items: {
                    width: 200,
                    visible: {
                        min: 5,
                        max: 10
                    }
                },
                //prev: '#prev',
                //next: '#next',
                prev: {
                    button: function () { return jQuery(this).closest('.recentwork_carousel').find('.prev'); },
                    key: "left"
                },
                next: {
                    button: function () { return jQuery(this).closest('.recentwork_carousel').find('.next'); },
                    key: "right"
                }
            });
        });
    </script>
    <script async type="text/javascript">

        function GetMenu(id, ftype, DefNav, DefaultInner,_type) {
            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");

            //if (ftype == 10) {
            //    parent.document.getElementById("content").src = "dmsuploads?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=11";
            //    parent.document.getElementById("navbar").src = "";
            //    parent.document.getElementById("innernav").src = "";
            //}
            //else {
            parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=0";
           
            parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefNav;


            if (_type == 1) {
                parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner + "&Auth4=0";
            }
            else if (_type == 2) {
                parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner ;
            }
            else if (_type == 3) {
                parent.document.getElementById("content").src = "DocumentList2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner;
            }
            else if (_type == 4) {
                parent.document.getElementById("content").src = "DocumentList3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner;
            }


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
        //function goquick() {
        //    var _auth1 = document.getElementById("lbluserhidden");
        //    var _auth2 = document.getElementById("lblprjid");
        //    parent.document.getElementById("content").src = "ManualQuickView?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;
        //    //parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + -1;
        //    //parent.document.getElementById("navbar").src = "blank.html";
        //    //parent.toggle();
        //}
    </script>
</body>
</html>
