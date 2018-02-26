<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule_P123_2.aspx.cs" Inherits="CMLTechQ.CMS.P123.Schedule_P123_2" %>

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

         function CallImports() {
             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");
             parent.document.getElementById("content").src = "P123/ImportExcel?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=2";
         }
         function CallReports() {
             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");
             //parent.document.getElementById("content").src = "Reportcms?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent;//

             var id = "Reportcms?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=2";
             window.open(id,'','',true);
         }
         function CallSummary() {
             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");
             parent.document.getElementById("content").src = "P123/CASSummary_Graph?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=2";
             //var id = "Summary?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=2";
             //window.open(id, '', '', true);
         }
         function OpenPopup(_name, _id,_cat, _cas) {
             document.getElementById("hid").value = _id;
             document.getElementById("cat").value = _cat;
             document.getElementById("hcid").value = _cas;
             $('#lbltitle').text(_name);
             $('#txt_cat').val(_cat);
             $("#btnpopup").click();
         }
         function OpenPopup1(_name, _id, _cat, _cas) {
             //document.getElementById("hid").value = _id;
             //document.getElementById("cat").value = _cat;
             //$('#lbltitle').text(_name);
             //$('#txt_cat').val(_cat);
             $("#btnpopup1").click();
         }
         function Cal(id) {
             //alert(id);
             $("#btnpopup").click();
         }
         function _checked(sender, target) {
             var _chk = document.getElementById(sender).checked;
             var _txt = document.getElementById(target);
             if (_chk == true) {
                 _txt.value = "N/A";
                 _txt.disabled = true;
             }
             else {
                 _txt.value = "";
                 _txt.disabled = false;
             }
         }
    </script>
</head>
<body style="border-right:solid 5px #45818e;overflow:hidden;z-index:1" class="inner" onload="scrollheight();">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblsrv" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblcas" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblsch" runat="server" Text="" style="display:none"></asp:Label>
        <input type = "hidden" id = "hid" name = "hid" runat="server" />
        <input type = "hidden" id = "cat" name = "cat" runat="server" />
        <input type = "hidden" id = "hcid" name = "hcid" runat="server" />
        <div id="doc-container" style="top:0px;" >
             <div id="main-content">
              <div class="head">
                  <div class="headtitle">
                      <h2 class="title">Electrical > High-Medium Voltage</h2>
                  </div>
                    
                  <div class="header-menu pull-right">
                      <nav id="nav-main-menu">
                          <div class="wrapper">
                              <ul class="dropdown" id="menu-main">
                                  <li class="menu-item" id="menu-item-70">
                                      <a href="#" onclick="CallSummary();">Graphs</a>
                                  </li>
                                  <li class="menu-item" id="menu-item-62">
                                      <a href="#">Menu</a>
                                      <ul class="sub-menu">
                                          <li class="menu-item" id="Li1"><a onclick="CallReports();" href="#">Print</a></li>
                                          <li class="menu-item" id="Li2"><a href="#">Export</a></li>
                                          <li class="menu-item" id="Li3"><a href="#" onclick="CallImports();">Import</a></li>
                                      </ul>
                                  </li>
                              </ul>
                          </div>
                      </nav>
                  </div>
                </div>
                 <div id="HeaderDiv" >
                                 <table id="repeaterHead" style="width:3650px;">
                                    <tr>
                                        <td style="width:60px" align="center" rowspan="2">Item<br />No.</td>
                                        <td style="width:140px" align="center" rowspan="2">Engineers<br />Reference</td>
                                        <td align="center" colspan="4">Asset Code</td>
                                        <td style="width:200px" align="center" rowspan="2">Location</td>
                                        <td style="width:200px" align="center" rowspan="2">Fed From</td>
                                        <td style="width:250px" align="center" rowspan="2">Provides Power To</td>
                                        <td style="width:200px" align="center" rowspan="2">Substation</td>
                                        <td style="width:100px" align="center" rowspan="2">Planed Power On</td>
                                        <td align="center" colspan="13">Commissioning &amp; Testing</td>
                                        <td align="center" colspan="3">Commissioning &amp; Testing</td>
                                        <td style="width:300px" align="center" rowspan="2">Comments</td>
                                        <td style="width:100px" align="center" rowspan="2">Action By</td>
                                        <td style="width:100px" align="center" rowspan="2">Action Date</td>
                                    </tr>
                                    <tr >
                                        <td style="width:100px" align="center">Building/<br />Zone</td>
                                        <td style="width:100px" align="center">Category</td>
                                        <td style="width:100px" align="center">Floor Level</td>
                                        <td style="width:100px" align="center">Seq. No.</td>
                                        <td style="width:100px" align="center">Torque Test</td>
                                        <td style="width:100px" align="center">IR Test</td>
                                        <td style="width:100px" align="center">HI Pot Test</td>
                                        <td style="width:100px" align="center">VT Test</td>
                                        <td style="width:100px" align="center">CT Test</td>
                                        <td style="width:100px" align="center">Primary<br />Injection<br />Test</td>
                                        <td style="width:100px" align="center">Secondary<br />Injection<br />Test</td>
                                        <td style="width:100px" align="center">Ductor Test</td>
                                        <td style="width:100px" align="center">Functional Test</td>
                                        <td style="width:100px" align="center">Prot. Relay<br />Final Setting</td>
                                        <td style="width:100px" align="center">Pannel Test Progres</td>
                                        <td style="width:100px" align="center">Consultant Accepted</td>
                                        <td style="width:100px" align="center">Test Sheets Filed</td>
                                        <td style="width:100px" align="center">Cable IR HI Pot</td>
                                        <td style="width:100px" align="center">Consultant Accepted</td>
                                        <td style="width:100px" align="center">Test Sheets Filed</td>
                                    </tr>
                                </table>
                            </div>
</div>
             
             <div id="Data" onscroll="Onscrollfnction();">
                 <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                     <ContentTemplate>
                          <asp:Repeater ID="rptmmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound">
                        <HeaderTemplate>
                           
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div id="DataDiv">
                            <div id='h<%#Container.ItemIndex %>' class="rptheader" style="width:3640px;" onclick="getdata(<%#Container.ItemIndex %>);">
                                        <p style="margin:0;padding:0"><a class="pull-left" style="margin-right:10px;padding-top:6px;" href="#" ><i class="icon-plus"></i></a><%# Eval("Sys_name") %><button class="btn-cas" type="button" onclick="OpenPopup('<%# Eval("Sys_name") %>','<%# Eval("Sys_id") %>','<%# Eval("Cat") %>','0');" ></button> </p>
                                <asp:Label ID="lblsys" runat="server" Text='<%# Eval("Sys_id") %>' style="display:none"></asp:Label>
                                    </div>
                            <div id='d<%#Container.ItemIndex %>' style="display:none" class="sub">
                                        <asp:Repeater ID="rptdetails" runat="server">
                                            <HeaderTemplate>
                                                <table id="repeaterTable" style="width:3650px;">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="rrow">
                                                    <td style="width:10px;text-align:center;background-color:#76a5af;">
                                                                                                                       <%--<a href="#" onclick="OpenPopup();"><i class="icon-plus-sign"></i></a>--%>
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                            <ContentTemplate>
                                                                <a href="#" onclick="OpenPopup('<%# Eval("Sys_name") %>','<%# Eval("Sys_id") %>','<%# Eval("Cat") %>','<%# Eval("Position") %>');"><i class="icon-plus-sign"></i></a>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                                
                                                                                                                  
                                                    </td>
                                                    <td style="width:48px;text-align:center"></td>
                                                    <td style="width:140px;text-align:center" onclick="OpenPopup1('<%# Eval("Sys_name") %>','<%# Eval("Sys_id") %>','<%# Eval("Cat") %>','0');"><%# Eval("E_b_ref") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("B_Z") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Cat") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("F_Lvl") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Seq_No") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("Loc") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("F_from") %></td>
                                                    <td style="width:250px;text-align:center"><%# Eval("P_P_to") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("Substation") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Pwr_on") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test3") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test4") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test5") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test6") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test7") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test11") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test12") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test13") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Per_com1") %> %</td>
                                                    <td style="width:100px;text-align:center"><%# Eval("accept1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("filed1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test14") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("accept2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("filed2") %></td>
                                                    <td style="width:300px;text-align:center"><%# Eval("Comm") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Act_by") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Act_Date") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                 <tr class="arow">
                                                    <td style="width:10px;text-align:center;background-color:#073763;">
                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                            <ContentTemplate >
                                                                <a href="#" onclick="OpenPopup('<%# Eval("Sys_name") %>','<%# Eval("Sys_id") %>','<%# Eval("Cat") %>','<%# Eval("Position") %>');"><i class="icon-plus-sign"></i></a>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td style="width:48px;text-align:center"></td>
                                                    <td style="width:140px;text-align:center"><%# Eval("E_b_ref") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("B_Z") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Cat") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("F_Lvl") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Seq_No") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("Loc") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("F_from") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("P_P_to") %></td>
                                                    <td style="width:200px;text-align:center"><%# Eval("Substation") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Pwr_on") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test2") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test3") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test4") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test5") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test6") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test7") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test11") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test12") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test13") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("Per_com1") %> %</td>
                                                    <td style="width:100px;text-align:center"><%# Eval("accept1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("filed1") %></td>
                                                    <td style="width:100px;text-align:center"><%# Eval("test14") %></td>
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
                     </ContentTemplate>
                 </asp:UpdatePanel>
                   
                </div>
             
    <div class="clear"></div>
            <div class="footer"></div>
<div id="popup" class="model-popup" style="display:none;height:400px;width:700px;" >
                <div class="header">
                    <p class="title">
                        <asp:Label ID="lbltitle" runat="server" Text=""></asp:Label></p>
                    <div class="pull-right">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="btnclosepopup" runat="server" OnClick="btnclosepopup_Click" CssClass="close" ><i class="icon-remove-sign"></i></asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>
                    
                    
                </div>
                <div class="popcontent">
                    <table>
                        <tr>
                            <td style="width:200px;">Engineers Reference</td>
                            <td style="width:500px;">
                                <asp:TextBox ID="txt_eref" runat="server" CssClass="text-control" Width="500px" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Building/ Zone</td>
                            <td><asp:TextBox ID="txt_bz" runat="server" CssClass="text-control" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Category</td>
                            <td><asp:TextBox ID="txt_cat" runat="server" CssClass="text-control" Width="200px" ReadOnly="true"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Floor Level</td>
                            <td>
                                <table style="border:none;" cellpadding="0" cellspacing="0" >
                                    <tr>
                                        <td ><asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="drflvl" runat="server" CssClass="text-control" Width="210px"></asp:DropDownList>                                    
                                    </ContentTemplate>
                                </asp:UpdatePanel></td>
                                        <td style="padding-left:5px;">
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="Button3" runat="server" Text="New" CssClass="btn-action" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td>Location</td>
                            <td><asp:TextBox ID="txt_loc" runat="server" CssClass="text-control" Width="500px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Fed From</td>
                            <td><asp:TextBox ID="txt_ff" runat="server" CssClass="text-control" Width="500px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Provides Power To</td>
                            <td><asp:TextBox ID="txt_ppto" runat="server" CssClass="text-control" Width="500px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Substation</td>
                            <td><asp:TextBox ID="txt_ss" runat="server" CssClass="text-control" Width="500px"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>
    <div class="popcontent">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn-action" OnClick="btnsave_Click" /><asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn-action" OnClick="btnclosepopup_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    
                <div>
                    
                </div>
            </div>
        <asp:Button ID="btnpopup" runat="server" Text="" style="display:none" />

        <ajaxToolkit:ModalPopupExtender runat="server"  Enabled="True" TargetControlID="btnpopup" ID="btnpopup_ModalPopupExtender" PopupControlID="popup" BackgroundCssClass="model-background"  ></ajaxToolkit:ModalPopupExtender>
              
            <div id="popup1" class="model-popup" style="height:475px;width:1000px;display:none" >
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                <ContentTemplate>   
                <div class="header">
                    <p class="title">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label></p>
                    <div class="pull-right">
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="btnclosepopup1" runat="server" OnClick="btnclosepopup1_Click" CssClass="close" ><i class="icon-remove-sign"></i></asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>
                    
                    
                </div>
                <div class="popcontent">
                    <table style="font-size:x-small;width:100%" border="0" cellpadding="3" cellspacing="0"  >
                
                <tr >
                <td width="200px">
                    PLANNED POWER ON</td>
                    <td style="width:90px">N/A
                       <input id="chk_2pwron" type="checkbox" style="vertical-align:middle"   onclick="_checked('chk_2pwron', '_2pwron')" runat="server"/></td>
                <td width="75px">
                <asp:TextBox ID="_2pwron" runat="server" Width="75px"></asp:TextBox>
                      
                </td>
                    <td width="200px">
                       <%-- <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                            <ContentTemplate>--%>
<input id="myupload" type="file" class="multi" runat="server" />
                           <%-- </ContentTemplate>--%>
                            <%--<Triggers>
                                <asp:AsyncPostBackTrigger ControlID="myupload" />
                            </Triggers>--%>
                       <%-- </asp:UpdatePanel>--%>
                        
                        &nbsp;</td>
                    <td style="width:90px">
                        &nbsp;</td>
                    <td width="75px">
                        &nbsp;</td>
                <td width="200px">
                </td>
                    <td style="width:90px">
                        &nbsp;</td>
                <td width="75px"></td>
                </tr>
                
                    <tr style="background-color:#092443;color:White" >
                        <td colspan="9"  align="center">
                            PANEL / EQUIPMENT TESTING</td>
                    </tr>
                
                    <tr id="tr1" runat="server">
                        <td >
                            TORQUE TEST</td>
                        <td class="tdstyle1">N/A
                        <input id="chk_2tor" type="checkbox" style="vertical-align:middle" runat="server" value="N/A" onclick="_checked('chk_2tor', '_2tor')"/>
                           </td>
                        <td >
                            <asp:TextBox ID="_2tor" runat="server" Width="75px" 
                                ></asp:TextBox>
                           
                        </td>
                        <td >
                            IR TEST</td>
                        <td class="tdstyle2">N/A
                            <input id="chk_2ir" type="checkbox" style="vertical-align:middle"  runat="server" value="n/a" onclick="_checked('chk_2ir', '_2ir')"/>
                            </td>
                        <td >
                            <asp:TextBox ID="_2ir" runat="server" Width="75px"></asp:TextBox>
                           
                        </td>
                        <td >
                            HI POT TEST</td>
                        <td class="tdstyle3">N/A
                            <input id="chk_2hi" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2hi', '_2hi')"/>
                            </td>
                        <td >
                            <asp:TextBox ID="_2hi" runat="server" Width="75px"></asp:TextBox>
                           
                        </td>
                    </tr>
                    <tr id="tr2" runat="server">
                        <td >
                            VT TEST</td>
                        <td class="tdstyle3">N/A
                            <input id="chk_2vt" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2vt', '_2vt')"/>
                            </td>
                        <td>
                            <asp:TextBox ID="_2vt" runat="server" Width="75px"></asp:TextBox>
                            
                        </td>
                        <td >
                            CT TEST</td>
                        <td class="tdstyle2">N/A
                             <input id="chk_2ct" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2ct', '_2ct')"/>
                            </td>
                        <td >
                            <asp:TextBox ID="_2ct" runat="server" Width="75px"></asp:TextBox>
                           
                        </td>
                        <td >
                            PRIMARY INJECTION TEST</td>
                        <td class="tdstyle3">N/A
                            <input id="chk_2pi" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2pi', '_2pi')"/>
                            </td>
                        <td >
                            <asp:TextBox ID="_2pi" runat="server" Width="75px"></asp:TextBox>
                           
                        </td>
                    </tr>
                    <tr id="tr3" runat="server">
                        <td >
                            SECONDARY INJECTION TEST</td>
                        <td class="tdstyle3">N/A
                            <input id="chk_2si" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2si', '_2si')"/>
                            </td>
                        <td >
                            <asp:TextBox ID="_2si" runat="server" Width="75px"></asp:TextBox>
                            
                        </td>
                        <td >
                            DUCTOR TEST</td>
                        <td class="tdstyle2">N/A
                            <input id="chk_2cr" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2cr', '_2cr')"/>
                            </td>
                        <td >
                            <asp:TextBox ID="_2cr" runat="server" Width="75px"></asp:TextBox>
                           
                        </td>
                        <td >
                            FUNCTIONAL TEST</td>
                        <td class="tdstyle3">N/A
                            <input id="chk_2fn" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2fn', '_2fn')"/>
                            </td>
                        <td >
                            <asp:TextBox ID="_2fn" runat="server" Width="75px"></asp:TextBox>
                           
                        </td>
                    </tr>
                    <tr id="tr4" runat="server">
                        <td >
                            PROTECTIVE RELAY FINAL TEST</td>
                        <td class="tdstyle3">N/A
                            <input id="chk_2pr" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2pr', '_2pr')"/>                           </td>
                        <td >
                            <asp:TextBox ID="_2pr" runat="server" Width="75px"></asp:TextBox>
                           
                        </td>
                        <td >
                            &nbsp;</td>
                        <td class="tdstyle2">
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td class="tdstyle3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                        <caption>
                            N/A
                            <input id="chk_2accept1" type="checkbox" style="vertical-align:middle"  runat="server"  onclick="_checked('chk_2accept1', '_2accept1')"/>
                            </td>
                            <tr>
                                <td>
                                    <asp:TextBox ID="_2accept1" runat="server" Width="75px"></asp:TextBox>
                                </td>
                                <td>TEST SHEETS FILED</td>
                                <td class="tdstyle2">N/A
                                    <input id="chk_2filed1"  type="checkbox" style="vertical-align:middle" runat="server"  onclick="_checked('chk_2filed1', '_2filed1')"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="_2filed1" runat="server" Width="75px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td class="tdstyle3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr style="background-color:#092443;color:White">
                                <td align="center" colspan="9">22/11KV TEST</td>
                            </tr>
                            <tr id="tr7" runat="server">
                                <td>CABLE IR AND HI POT</td>
                                <td class="tdstyle3">N/A
                                    <input id="chk_2cable" type="checkbox" style="vertical-align:middle"   onclick="_checked('chk_2cable', '_2cable')" runat="server"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="_2cable" runat="server" Width="75px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td class="tdstyle2">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td class="tdstyle3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>CONSULTANT ACCEPTED</td>
                                <td class="tdstyle3">N/A
                                    <input id="chk_2accept2" type="checkbox" style="vertical-align:middle"   onclick="_checked('chk_2accept2', '_2accept2')" runat="server"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="_2accept2" runat="server" Width="75px"></asp:TextBox>
                                </td>
                                <td>TEST SHEETS FILED</td>
                                <td class="tdstyle2">N/A
                                    <input id="chk_2filed2" type="checkbox" style="vertical-align:middle"   onclick="_checked('chk_2filed2', '_2filed2')" runat="server"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="_2filed2" runat="server" Width="75px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td class="tdstyle3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>ACTION BY&nbsp;</td>
                                <td class="tdstyle3">N/A
                                    <input id="chk_2actby" type="checkbox" style="vertical-align:middle"   onclick="_checked('chk_2actby', '_2actby')" runat="server"/>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="_2actby" runat="server" Width="250px"></asp:TextBox>
                                </td>
                                <td class="tdstyle2">&nbsp;</td>
                                <td>COMMENTS</td>
                                <td colspan="3" rowspan="2">
                                    <asp:TextBox ID="_2commts" runat="server" Height="50px" TextMode="MultiLine" Width="97%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>ACTION DATE</td>
                                <td class="tdstyle3">N/A
                                    <input id="chk_2actdt" type="checkbox" style="vertical-align:middle"   onclick="_checked('chk_2actdt', '_2actdt')" runat="server"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="_2actdt" runat="server" Width="75px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td class="tdstyle2">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="tdstyle3">&nbsp;</td>
                                <td align="right"></td>
                                <td align="left"></td>
                                <td align="left" class="tdstyle2">&nbsp;</td>
                                <td align="right">&nbsp;</td>
                                <td></td>
                                <td class="tdstyle3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </caption>
                
                </table>
                </div>
    <div class="popcontent">
        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
            <ContentTemplate>
                <asp:Button ID="Button2" runat="server" Text="Save" CssClass="btn-action" OnClick="btnsave_Click" /><asp:Button ID="btncancel1" runat="server" Text="Cancel" CssClass="btn-action" OnClick="btncancel1_Click" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btncancel1" />
            </Triggers>
        </asp:UpdatePanel>
            
                </div>
         </ContentTemplate>
            </asp:UpdatePanel>
                <div>
                    
                </div>
            </div>
           
           
                     <asp:Button ID="btnpopup1" runat="server" Text="" style="display:none" />

        <ajaxToolkit:ModalPopupExtender runat="server"  Enabled="True" TargetControlID="btnpopup1" ID="btnpopup1_ModalPopupExtender" PopupControlID="popup1" BackgroundCssClass="model-background"  ></ajaxToolkit:ModalPopupExtender>
            
       
        </div>
        <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="../../Assets/js/dropdown.js" type="text/javascript"></script>
    <%--<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>--%>
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
