<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetRegister.aspx.cs" Inherits="CMLTechQ.AMS.AssetRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/slider.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link rel="stylesheet" href="../Assets/css/OwnStyle.css" type="text/css" />
    <link href="../Assets/css/navslider.css" type="text/css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/menustyle.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
    <script src="../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
</head>
<body style="border-right: solid 5px #ffffff; overflow: hidden; z-index: 1; background-color: #ffffff;" onload="scrollheight();hideall();">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" Style="display: none"></asp:Label>

        <asp:Label ID="lblvalue" runat="server" Text="" Style="display: none"></asp:Label>

        <input type="hidden" id="hfolder" name="hfolder" runat="server" />
        <%-- <input type="hidden" id="hparent" name="hparent"  value="0" runat="server" />
        <input type="hidden" id="hindex" name="hindex" runat="server" />--%>
        <input type="hidden" id="hprogressid" name="hprogressid" runat="server" />
        <input type="hidden" id="htype" name="htype" runat="server" />
        <input type="hidden" id="hcount" name="hcount" runat="server" />


        <div id="doc-container" style="top: 5px; left: 5px; background-color: #fff;">
            <div id="main-content" style="background-color: #ffffff;">
                <div class="head" style="height: 25px;">
                    <div id="container-menu-bar" style="top: 5px; left: 5px; border-bottom: solid 5px #ffffff;">

                        <div id="container-menu">
                            <ul class="nav">
                                <li class="item current"><a href="#" class="current" onclick="CallNav(0);">All Services</a></li>
                                <li class="item"><a href="#" onclick="CallNav(1);">Electrical</a></li>
                                <li class="item"><a href="#" onclick="CallNav(2);">Mechanical</a></li>
                                <li class="item"><a href="#" onclick="CallNav(3);">ELV</a></li>
                                <li class="item"><a href="#" onclick="CallNav(4);">Public Health</a></li>
                                <li class="item"><a href="#" onclick="CallNav(5);">Civil</a></li>
                                <li class="item"><a href="#" onclick="CallNav(6);">Miscellaneous</a></li>
                            </ul>
                        </div>
                        <%--<div class="search">--%>
                        <asp:TextBox ID="txtserch" CssClass="search" runat="server" placeholder="Search"></asp:TextBox>
                        <%-- </div>--%>
                        <div class="submit">
                            <%--  <a  href="#" onclick="goquick();">Manual Quick View</a>--%>
                            <a href="Newasset">Add</a>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnnav" runat="server" Text="" Style="display: none;" OnClick="btnnav_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                <div id="HeaderDiv" onclick="HideTextMode();">
                    <table class="repeaterHead1" style="width: 3000px;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 150px; text-align: center" rowspan="2">Project Reference</td>
                            <td style="width: 200px; text-align: center" rowspan="2">Service</td>
                            <td style="text-align: center; width: 400px;" colspan="4">Asset Code</td>
                            <td style="text-align: center; width: 150px" rowspan="2">Asset Number</td>
                            <td style="text-align: center; width: 150px" rowspan="2">Manufacturer</td>
                            <td style="text-align: center; width: 150px" rowspan="2">Model Reference</td>
                            <td style="text-align: center; width: 100px" rowspan="2">Serial No.</td>
                            <td style="text-align: center; width: 100px" rowspan="2">Room No.<br />
                                Ref.</td>
                            <td style="text-align: center; width: 100px" rowspan="2">Barcode</td>
                            <td style="text-align: center; width: 100px" rowspan="2">Commissioned Date</td>
                            <td style="text-align: center; width: 100px" rowspan="2">Warranty Expiry Date</td>
                            <td style="text-align: center; width: 100px" rowspan="2">Depreciation %</td>
                            <td style="text-align: center; width: 200px" rowspan="2">Local Supplier/ Contractor Name</td>
                            <td style="text-align: center; width: 300px;" colspan="3">Electrical Details</td>
                            <td style="text-align: center; width: 200px;" colspan="2">Mechanical Details</td>
                            <td style="text-align: center; width: 200px;" colspan="2">Civil Details</td>
                            <td style="text-align: center; width: 300px" rowspan="2">Comment Connected to Asset</td>
                        </tr>
                        <tr>
                            <td style="width: 100px; text-align: center">Building/Zone</td>
                            <td style="width: 100px; text-align: center">Category</td>
                            <td style="width: 100px; text-align: center">Floor Level</td>
                            <td style="width: 100px; text-align: center">Seq.No</td>
                            <td style="width: 100px; text-align: center">Phase</td>
                            <td style="width: 100px; text-align: center">Voltage</td>
                            <td style="width: 100px; text-align: center">Amps</td>
                            <td style="width: 100px; text-align: center">Working Temp.</td>
                            <td style="width: 100px; text-align: center">RPM</td>
                            <td style="width: 100px; text-align: center">Built Up Area</td>
                            <td style="width: 100px; text-align: center">Area Occuppied</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="Data" style="top: 88px;" onscroll="Onscrollfnction();">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Repeater ID="rptmmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>

                                <div id="DataDiv">
                                    <div id='h<%#Container.ItemIndex %>' class="rptheader1" style="width: 3000px; height: 20px; padding: 5px 0px" onclick="getdata(<%#Container.ItemIndex %>);">
                                        <p style="margin: 0; padding: 0px;"><a class="pull-left" style="margin-right: 10px; padding-left: 4px" href="#"><i class="fa fa-plus"></i></a><%# Eval("ASSET") %> </p>
                                        <asp:Label ID="lblsrv" runat="server" Text='<%# Eval("SER_ID") %>' Style="display: none"></asp:Label>
                                    </div>
                                    <div id='d<%#Container.ItemIndex %>' style="display: none" class="sub">

                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <asp:Repeater ID="rptdetails" runat="server" OnItemDataBound="rptdetails_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table style="width: 3000px" border="0" cellspacing="0" cellpadding="0">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblasset" runat="server" Text='<%# Eval("AMS_REG_ID") %>' Style="display: none"></asp:Label>
                                                                <asp:Repeater ID="rptinner1" runat="server" OnItemDataBound="rptinner1_ItemDataBound">
                                                                    <HeaderTemplate>
                                                                        <table id="repeaterTable1" class="repeaterTable_style1" style="width: 3000px" border="0" cellpadding="0" cellspacing="0">
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <tr class="rrow" >
                                                                            <td id="h1<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>" style="width: 30px; text-align: center"  ><a href="#" id="expbtn" runat="server"  ><i class="fa fa-plus-square-o" onclick="inner_getdata(<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>);"></i></a>
                                                                            </td>
                                                                            <td style="width: 110px; padding: 5px;"><%# Eval("PROJECT_REF") %></td>
                                                                            <td style="width: 189px; padding: 5px;"><%# Eval("ASSET") %></td>
                                                                            <td style="width: 90px; padding: 5px; text-align: center"><%# Eval("BZONE") %></td>
                                                                            <td style="width: 90px; padding: 5px; text-align: center"><%# Eval("CAT") %></td>
                                                                            <td style="width: 90px; padding: 5px; text-align: center"><%# Eval("FLEVEL") %></td>
                                                                            <td style="width: 90px; padding: 5px; text-align: center"><%# Eval("SEQ_NO") %></td>
                                                                            <td style="width: 140px; padding: 5px; text-align: center"><%# Eval("ASSET_NO") %></td>
                                                                            <td style="width: 150px"></td>
                                                                            <td style="width: 150px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 200px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 100px"></td>
                                                                            <td style="width: 300px">
                                                                                <asp:Label ID="lblhaschild" runat="server" Text='<%# Eval("HAS_CHILD") %>' Style="display: none"></asp:Label></td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                </asp:Repeater>
                                                                <div id='I<%#Container.ItemIndex %>' style="display:none"  class="sub">
                                                                    <asp:Repeater ID="rptinner2" runat="server">
                                                                        <HeaderTemplate>
                                                                            <table id="repeaterTable1" class="repeaterTable_style1" style="width: 3000px" border="0" cellpadding="0" cellspacing="0">
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <tr class="rrow1">
                                                                                <td style="width: 30px;"></td>
                                                                                <td style="width: 110px; padding: 5px;"><%# Eval("PROJECT_REF") %></td>
                                                                                <td style="width: 189px; padding: 5px;"><%# Eval("ASSET") %></td>
                                                                                <td style="width: 90px; padding: 5px; text-align: center"><%# Eval("BZONE") %></td>
                                                                                <td style="width: 90px; padding: 5px; text-align: center"><%# Eval("CAT") %></td>
                                                                                <td style="width: 90px; padding: 5px; text-align: center"><%# Eval("FLEVEL") %></td>
                                                                                <td style="width: 90px; padding: 5px; text-align: center"><%# Eval("SEQ_NO") %></td>
                                                                                <td style="width: 140px; padding: 5px; text-align: center"><%# Eval("ASSET_NO") %></td>
                                                                                <td style="width: 150px"></td>
                                                                                <td style="width: 150px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 200px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 100px"></td>
                                                                                <td style="width: 300px"></td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            </table>
                                                                        </FooterTemplate>
                                                                    </asp:Repeater>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="imgload" runat="server" ImageUrl="../Assets/img/ajax-loader.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>



            <div class="clear"></div>
            <div class="footer"></div>



        </div>
        <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>




    </form>
    <script type="text/javascript">

        function CallNav(id) {
            document.getElementById("htype").value = id;
            $("#btnnav").click();
            _changeActive();
        }

        function HideTextMode() {
            showlabel();
            hideall();
        }


        function gos(_id, _folder, _type) {

            HideTextMode();

            document.getElementById("hprogressid").value = _id;
            document.getElementById("hfolder").value = _folder;
            document.getElementById("htype").value = _type;



            $('#td' + _type + _folder).find('span').hide();
            $('#td' + _type + _folder).find('img').hide();



            $('#td' + _type + _folder).find('input').show();
            //$('#td' + _type + _folder).find('input').
            $('#td' + _type + _folder).find('input').select();



        }
        function hideall() {
            $('#row td input').hide();
        }
        function showlabel() {

            $('#row td span').show();
            $('#row td img').show();

        }
    </script>
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

        function CheckNumerOnly(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        function expandall(type) {
            var hcount = document.getElementById("hcount").value;
            for (var i = 0; i <= hcount; i++) {
                expand(i, type);
            }
            scrollheight();
            HideTextMode();
        }
        function expand(i, type) {
            var e = document.getElementById('d' + i);
            if (e) {
                if (type == 1) {
                    if (e.style.display == 'none') {
                        e.style.display = 'block';
                        e.style.visibility = 'visible';
                        jQuery('#h' + i).find('i').removeClass('icon-plus').addClass('icon-minus');
                    }
                }
                else {
                    if (e.style.display != 'none') {
                        e.style.display = 'none';
                        e.style.visibility = 'hidden';
                        jQuery('#h' + i).find('i').removeClass('icon-minus').addClass('icon-plus');
                    }
                }
            }
        }

        function goprint() {

            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");
            var url = "ProgressTrackReport?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent;
            window.open(url, '', '', true);
        }

        function getdata(id) {
            var e = document.getElementById('d' + id);
            if (e) {
                if (e.style.display == 'none') {
                    e.style.display = 'block';
                    e.style.visibility = 'visible';
                    // _changeActive(id);
                    // _changeActive();
                    jQuery('#h' + id).find('i').removeClass('fa fa-plus').addClass('fa fa-minus');
                }
                else {
                    e.style.display = 'none';
                    e.style.visibility = 'hidden';
                    jQuery('#h' + id).find('i').removeClass('fa fa-minus').addClass('fa fa-plus');
                    // _changeInActive();
                    // _changeInActive(id);
                }

            }
            HideTextMode();
            scrollheight();

        }
        function inner_getdata(id) {
            var e = document.getElementById('I' + id);
            if (e) {
                if (e.style.display == 'none') {
                    e.style.display = 'block';
                    e.style.visibility = 'visible';
                    // _changeActive(id);
                    // _changeActive();
                    // jQuery('#h' + id).find('i').removeClass('icon-plus').addClass('icon-minus');
                }
                else {
                    e.style.display = 'none';
                    e.style.visibility = 'hidden';
                    //jQuery('#h' + id).find('i').removeClass('icon-minus').addClass('icon-plus');
                    // _changeInActive();
                    // _changeInActive(id);
                }

            }
            //HideTextMode();
            //scrollheight();

        }
        function setheightdefault() {

            var div1 = document.getElementById('HeaderDiv');
            div1.setAttribute("style", "border-right:none");


        }
        function _changeActive() {
            $(function () {
                $('.nav > li').click(function () {
                    $('.nav > li').removeClass('current');
                    $(this).addClass('current');
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
            var div = document.getElementById('Data');
            var div1 = document.getElementById('HeaderDiv');
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

        function showCalendar(sender, args) {
            var processingControl = $get(sender._button.id); // Getting the control which triggered the calendar.
            sender._popupDiv.parentElement.style.top = processingControl.offsetTop + processingControl.height + 'px';
            sender._popupDiv.parentElement.style.left = processingControl.offsetLeft + 'px';

            var positionTop = (processingControl.height + processingControl.offsetTop) - 85;
            var positionLeft = processingControl.offsetLeft;
            var processingParent;
            var continueLoop = false;

            do {
                // If the control has parents continue loop.
                if (processingControl.offsetParent != null) {
                    processingParent = processingControl.offsetParent;
                    positionTop += processingParent.offsetTop;
                    positionLeft += processingParent.offsetLeft;
                    processingControl = processingParent;
                    continueLoop = true;
                }
                else {
                    continueLoop = false;
                }
            } while (continueLoop);

            //alert(sender._popupDiv.parentElement.style.top);
            sender._popupDiv.parentElement.style.top = positionTop + 'px';
            sender._popupDiv.parentElement.style.left = positionLeft + 'px';
        }

        function goclose(pnl) {
            //alert('closing');

            $("#btndummy1").click();

            //document.getElementById(pnl).style.display = 'None';

        }
    </script>
    <script src="../Assets/js/jquery.nicescroll.js"></script>
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#Data").niceScroll({ styler: "fb", cursorcolor: "#063940", cursorwidth: '10', cursorborderradius: '0px', background: '#45818e', cursorborder: '' });
            });
    </script>
</body>
</html>
