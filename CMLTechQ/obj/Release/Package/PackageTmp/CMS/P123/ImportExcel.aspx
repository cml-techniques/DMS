<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportExcel.aspx.cs" Inherits="CMLTechQ.CMS.ImportExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
        <link rel="stylesheet" href="../../Assets/css/Layout.css" type="text/css" />
    <link href="../../Assets/css/navslider.css" type="text/css" rel="stylesheet" />
    <link href="../../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../Assets/css/menustyle.css" rel="stylesheet" />
    <script src="../../Assets/js/jquery.min.js"></script>
     <script src="../../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
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
        function ResizeWidth() {
            var height = $(window).height() - 40;
            //var width = $(window).width()- $("#main-content").width();
            $("#main-content").height(height);
            //$("#main-content").width(width);
        }
    </script>
    	<script type="text/javascript">
    	    window.onload = function () {
    	        ResizeWidth();
    	    }
    	    window.onresize = function () {
    	        ResizeWidth();
    	    }
	</script>
     <script type="text/javascript">
         function getdata(id) {
             var e = document.getElementById('d' + id);
             if (e) {
                 if (e.style.display == 'none') {
                     e.style.display = 'block';
                     e.style.visibility = 'visible';
                     //_changeActive(id);
                     _changeActive();
                 }
                 else {
                     e.style.display = 'none';
                     e.style.visibility = 'hidden';
                     //_changeInActive();
                     _changeInActive(id);
                 }

             }
             scrollheight();

         }
         function _changeActive(id) {
             $(function () {
                 $('.rptheader').click(function () {
                     jQuery(this).find('i').removeClass('icon-plus').addClass('icon-minus');
                     //jQuery(this).find('i').addClass('icon-minus');
                     //jQuery(this).find('i').toggleClass('icon-minus icon-plus');
                 });
             });
         }
         function _changeInActive() {
             $(function () {
                 $('.rptheader').click(function () {
                     jQuery(this).find('i').removeClass('icon-minus').addClass('icon-plus');
                 });
             });
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
             var div = document.getElementById('dgraph');

             //alert(div.scrollHeight);
             //var div1 = document.getElementById('HeaderDiv');
             //if (div.scrollHeight > div.clientHeight) {
             //    div1.setAttribute("style", "border-right:17px solid #45818e");
             //}
             //else
             //    div1.setAttribute("style", "border-right:none");
         }

         function GetNav(id) {
             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");
             parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id;
         }
    </script>
</head>
<body style="border-right:solid 5px #45818e;overflow:hidden;z-index:1" class="inner" >
    <form id="form1" runat="server">
                            <asp:Label ID="lbsvr" runat="server" Text="" style="display:none"></asp:Label>
                    <asp:Label ID="lbsch" runat="server" Text="" ></asp:Label>
                    <asp:Label ID="lbprj" runat="server" Text="" ></asp:Label>
         <asp:Label ID="lbluserhidden" runat="server" Text="" ></asp:Label>

        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblsch" runat="server" Text="" style="display:none"></asp:Label>
        
          <div id="doc-container" >
<div id="container-menu-bar">
               
                <div id="container-toggle" >
                    <a href="#" onclick="parent.toggle();"><img src="../../Assets/img/expand-16.ico" alt="" /> </a> <%--<i class="icon-th"></i>--%>
                </div>
                <div id="container-menu">
                    <div class="recentwork_carousel  style2">
                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                        <div class="controls">
                        <a class="prev" href="#" ><i class="icon-caret-left icon"></i></a>
                        <a class="next" href="#" ><i class="icon-caret-right icon"></i></a>
                    </div>
                    </div>
                    <%--<ul class="nav">
                        <li class="item current"><a href="#">Electrical</a></li>
                        <li class="item"><a href="#">Extra-Low Voltage</a></li>
                        <li class="item"><a href="#">Mechanical</a></li>
                        <li class="item"><a href="#">Public Health</a></li>
                        <li class="item"><a href="#">Miscellaneous</a></li>
                    </ul>--%>
                    <div style="padding-top:7px">
                       <a class="pull-right back;" style="padding-top:8px" href="javascript:history.go(-1)"><i  class="icon-backward"></i> Back</a>
                        </div>
                    
                </div>
                
            </div>

                <div id="main-content">
              <div class="head">
                  <div class="headtitle">
                      <h2 class="title">
                          <asp:Label ID="lbltitle" runat="server" Text=""></asp:Label></h2>
                  </div>
                                   <%-- <div style="padding-top:7px;text-align:right;color:white">
                    <a onclick="javascript:history.back();" href="#" style="color:white">Back </a>--%>


                  </div>

                   <table>
            <tr>
                <td style="width:100px;vertical-align:top">
                    &nbsp;</td>
                <td >

                </td>
            </tr>
            <tr>
                <td  style="width:200px;vertical-align:top">
                    Select Excel Document</td>
                <td style="height:100px;vertical-align:top">
                    <input type="file" id="myupload" class="multi" runat="server" /></td>
            </tr>
            <tr>
                <td >
                    </td>
                <td >
                    <asp:Button ID="btnupload" runat="server" Text="Upload" 
                        onclick="btnupload_Click" />
                </td>
            </tr>
        </table>
   

                </div>

              </div>
                         


    </form>
</body>
</html>
