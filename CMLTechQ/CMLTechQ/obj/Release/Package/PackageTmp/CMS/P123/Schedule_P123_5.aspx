<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule_P123_5.aspx.cs" Inherits="CMLTechQ.CMS.P123.Schedule_P123_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../../Assets/css/Layout.css" type="text/css" />
    <link href="../../Assets/css/navslider.css" type="text/css" rel="stylesheet" />
    <link href="../../Assets/css/font-awesome.min.css" rel="stylesheet" />
     <script src="../../Assets/js/jquery.min.js"></script>
   
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
             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");
             parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id;
         }
    </script>
</head>
<body style="border-right:solid 5px #45818e;overflow:hidden;z-index:1" class="inner" onload="scrollheight();" >
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblsrv" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblcas" runat="server" Text="" style="display:none"></asp:Label>
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
                    
                </div>
                
            </div>
             <div id="main-content" >
              <div class="head">
                    <h2 class="title">Electrical > Low Voltage</h2>
                </div>
                 <div id="HeaderDiv" style="width:2870px;" >
                                 <table id="repeaterHead" style="width:2870px;">
                                    <tr>
                                        <td style="width:60px" align="center" rowspan="2">Item<br />No.</td>
                                        <td style="width:140px" align="center" rowspan="2">Engineers<br />Reference</td>
                                        <td align="center" colspan="4">Asset Code</td>
                                        <td style="width:200px" align="center" rowspan="2">Location</td>
                                        <td style="width:200px" align="center" rowspan="2">System Controlled/ Monitored</td>
                                        <td style="width:200px" align="center" rowspan="2">Fed From</td>
                                        <td style="width:100px" align="center" rowspan="2">Total No. of Points</td>
                                        <td style="width:100px" align="center" rowspan="2">No. Devices red&#39;d calibration</td>
                                        <td align="center" colspan="9">Commissioning &amp; Testing</td>
                                        <td style="width:300px" align="center" rowspan="2">Comments</td>
                                        <td style="width:100px" align="center" rowspan="2">Action By</td>
                                        <td style="width:100px" align="center" rowspan="2">Action Date</td>
                                    </tr>
                                    <tr >
                                        <td style="width:100px" align="center">Building/<br />Zone</td>
                                        <td style="width:100px" align="center">Category</td>
                                        <td style="width:100px" align="center">Floor Level</td>
                                        <td style="width:100px" align="center">Seq. No.</td>
                                        <td style="width:100px" align="center">Continuity/ IR Tested</td>
                                        <td style="width:100px" align="center">Point to Point Tested</td>
                                        <td style="width:100px" align="center">Calibration/ Func. Tested</td>
                                        <td style="width:100px" align="center">Consultant Accepted</td>
                                        <td style="width:100px" align="center">Test Sheets Filed</td>
                                        <td style="width:100px" align="center">Seq. of OP Tested</td>
                                        <td style="width:100px" align="center">Graphics/ Head End Tested</td>
                                        <td style="width:100px" align="center">Consultant Accepted</td>
                                        <td style="width:100px" align="center">Test Sheets Filed</td>
                                    </tr>
                                </table>
                            </div>
</div>
             
             <div id="Data" onscroll="Onscrollfnction();">
                   
                    <asp:Repeater ID="rptmmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound">
                        <HeaderTemplate>
                           
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div id="DataDiv">
                            <div id='h<%#Container.ItemIndex %>' class="rptheader" style="width:2860px;" onclick="getdata(<%#Container.ItemIndex %>);">
                                        <p style="margin:0;padding:0"><a class="pull-left" style="margin-right:10px;" href="#" ><i class="icon-plus"></i></a><%# Eval("Sys_name") %> </p>
                                <asp:Label ID="lblsys" runat="server" Text='<%# Eval("Sys_id") %>' style="display:none"></asp:Label>
                                    </div>
                            <div id='d<%#Container.ItemIndex %>' style="display:none" class="sub">
                                        <asp:Repeater ID="rptdetails" runat="server">
                                            <HeaderTemplate>
                                                <table id="repeaterTable" style="width:2870px;">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="rrow">
                                                    <td style="width:10px;text-align:center;background-color:#76a5af;"></td>
                                                    <td style="width:48px;text-align:center"></td>
                                                    <td style="width:140px;text-align:center"><%# Eval("E_b_ref") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("B_Z") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Cat") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("F_Lvl") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Seq_No") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("Loc") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("P_P_to") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("F_from") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("devices2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("devices1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test3") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("accept1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("filed1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test4") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test5") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("accept2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("filed2") %></td>
                                                    <td style="width:300px;text-align:center"><%# Eval("Comm") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Act_by") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Act_Date") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                 <tr class="arow">
                                                    <td style="width:10px;text-align:center;background-color:#073763;"></td>
                                                    <td style="width:48px;text-align:center"></td>
                                                    <td style="width:140px;text-align:center"><%# Eval("E_b_ref") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("B_Z") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Cat") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("F_Lvl") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Seq_No") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("Loc") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("P_P_to") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("F_from") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("devices2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("devices1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test3") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("accept1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("filed1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test4") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test5") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("accept2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("filed2") %></td>
                                                    <td style="width:300px;text-align:center"><%# Eval("Comm") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Act_by") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Act_Date") %></td>
                                                </tr>
                                            </AlternatingItemTemplate>
                                            <FooterTemplate>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
</div>
                        </ItemTemplate>
 </asp:Repeater>
                </div>
             
    <div class="clear"></div>
            <div class="footer"></div>
        </div>
    <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
    
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
