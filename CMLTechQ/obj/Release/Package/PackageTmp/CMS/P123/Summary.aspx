<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="CMLTechQ.CMS.Summary" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
         function getheight() {
             //var div = $("#viewer").height();
             var win = $("#doc-container").height() - 70 + "px";
             //$("#viewer").height(win);
             //document.getElementById("viewer").setAttribute("style", "width:500px;margin-top:5px;position:absolute;");
             //alert(win);
         }
    </script>
    
</head>
<body style="border-right:solid 5px #45818e;" class="inner fixed_background" onload="getheight();">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblsrv" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblcas" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblsch" runat="server" Text="" style="display:none"></asp:Label>
        <div id="doc-container">
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
                   <a class="pull-right back" href="javascript:history.go(-1)"><i  class="icon-backward"></i> Back</a>
                    </div>
                </div>
                
            </div>

             <div id="main-content">
              <div class="head">
                  <div class="headtitle">
                      <h2 class="title">
                          <asp:Label ID="lbltitle" runat="server" Text=""></asp:Label></h2>
                  </div>
                 
                  </div>
           

                      
</div>
 <div id="viewer" style="top:35px;bottom:0px;position:absolute;">
 <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"  HasCrystalLogo="False" HasToggleGroupTreeButton="false" ToolPanelView="None" BestFitPage="False" Width="100%" Height="100%"  />
 </div>

  <div class="clear"></div>
            <div class="footer"></div>
                   

      </div>
        <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="../../Assets/js/dropdown.js" type="text/javascript"></script>
        <%# Eval("Cat") %>
    <!---->
    
		 <script src="../../Assets/js/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(window).load(function () {
            jQuery('.recent_works1').carouFredSel({
                responsive: true,
                width: '100%',
                scroll: 1,
                auto: false,
                items: {
                    width: 300,
                    visible: {
                        min: 4,
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
    
    </form>
</body>
</html>
