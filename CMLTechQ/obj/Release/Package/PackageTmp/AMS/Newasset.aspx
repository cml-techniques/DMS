<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Newasset.aspx.cs" Inherits="CMLTechQ.AMS.Newasset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AMS</title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <script src="../Assets/js/jquery.min.js"></script>
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/tab.css" rel="stylesheet" />

</head>
<body style="border-right: solid 5px #ffffff; border-left: solid 5px #ffffff" class="ams-body">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
        <script type="text/javascript">
            function txt_rev_DropDownExtender_pageLoad() {
                $find("txt_serv_DropDownExtender").unhover = doNothing;
                $find("txt_serv_DropDownExtender")._dropWrapperHoverBehavior_onhover();
                $find("txt_loc_DropDownExtender").unhover = doNothing;
                $find("txt_loc_DropDownExtender")._dropWrapperHoverBehavior_onhover();
            }
            function doNothing() { }
            Sys.Application.add_load(txt_rev_DropDownExtender_pageLoad);
        </script>
         <input type="hidden" id="htype" name="htype" runat="server" />
        <div id="doc-container" class="ams-body" style="left: 5px">
            <div class="head" style="height: 25px;">
                <div id="container-menu-bar" style="top: 5px; left: 5px; border-bottom: solid 5px #ffffff;">
                    <div id="container-menu">
                        <%--<ul class="nav">
                            <li class="item current"><a href="#" class="current" onclick="CallNav(0);">All Services</a></li>
                            <li class="item"><a href="#" onclick="CallNav(1);">Electrical</a></li>
                            <li class="item"><a href="#" onclick="CallNav(2);">Mechanical</a></li>
                            <li class="item"><a href="#" onclick="CallNav(3);">ELV</a></li>
                            <li class="item"><a href="#" onclick="CallNav(4);">Public Health</a></li>
                            <li class="item"><a href="#" onclick="CallNav(5);">Civil</a></li>
                            <li class="item"><a href="#" onclick="CallNav(6);">Miscellaneous</a></li>
                        </ul>--%>
                    </div>
                    <%--<div class="search">--%>
                    <%--<asp:TextBox ID="txtserch" CssClass="search" runat="server" placeholder="Search"></asp:TextBox>--%>
                    <%-- </div>--%>
                    <div class="submit">
                        <%--  <a  href="#" onclick="goquick();">Manual Quick View</a>--%>
                        <a href="javascript:history.go(-1);">Back</a>
                        <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnnav" runat="server" Text="" Style="display: none;" OnClick="btnnav_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="ams-container">
                <div class="amstitle">
                    Add New Equipment
                </div>
                <br />
                <table class="ams-body" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="amstitle coldark" style="width: 150px;">Project Ref :</td>
                        <td>
                            <asp:TextBox ID="txt_ref" runat="server" CssClass="ams-control" Width="300px"></asp:TextBox></td>
                        <td style="width: 20px;"></td>
                        <td class="amstitle coldark">Service :</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_serv" runat="server" CssClass="ams-control colwhite" Width="200px" Text="" ReadOnly="true"></asp:TextBox>
                                    <asp:Label ID="lbl_serv" runat="server" Text="0" Style="display: none"></asp:Label>
                                    <ajaxToolkit:DropDownExtender runat="server" Enabled="True" TargetControlID="txt_serv" ID="txt_serv_DropDownExtender" DropDownControlID="dropdiv_serv" HighlightBackColor="#063940" HighlightBorderColor="#063940" DropArrowBackColor="#063940"></ajaxToolkit:DropDownExtender>

                                    <div style="width: 213px; display: none;" id="dropdiv_serv">
                                        <asp:ListBox ID="listserv" runat="server" OnSelectedIndexChanged="listserv_SelectedIndexChanged" Width="213px" Height="100px" AutoPostBack="true" CssClass="myListBox1"></asp:ListBox>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td style="width: 20px;"></td>
                        <td class="amstitle coldark">Location :</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_loc" runat="server" CssClass="ams-control colwhite" Width="200px" Text="" ReadOnly="true"></asp:TextBox>
                                    <asp:Label ID="lbl_locid" runat="server" Text="0" Style="display: none"></asp:Label>
                                    <ajaxToolkit:DropDownExtender runat="server" Enabled="True" TargetControlID="txt_loc" ID="txt_loc_DropDownExtender" DropDownControlID="dropdiv_loc" HighlightBackColor="#063940" HighlightBorderColor="#063940" DropArrowBackColor="#063940"></ajaxToolkit:DropDownExtender>
                                    <div style="width: 213px; display: none;" id="dropdiv_loc">
                                        <asp:ListBox ID="listloc" runat="server" OnSelectedIndexChanged="listloc_SelectedIndexChanged" Width="213px" Height="100px" AutoPostBack="true" CssClass="myListBox1"></asp:ListBox>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btn_loc" runat="server" Text="Add/Edit" CssClass="ams-control_btn" OnClick="btn_loc_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8" style="height: 10px;"></td>
                    </tr>
                    <tr>
                        <td class="amstitle coldark" >Asset Group :</td>
                        <td>
                             <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_group" runat="server" CssClass="ams-control colwhite" Width="300px" Text="" ReadOnly="true"></asp:TextBox>
                                    <asp:Label ID="lbl_group" runat="server" Text="0" Style="display: none"></asp:Label>
                                    <ajaxToolkit:DropDownExtender runat="server" Enabled="True" TargetControlID="txt_group" ID="txt_group_DropDownExtender" DropDownControlID="dropdiv_group" HighlightBackColor="#063940" HighlightBorderColor="#063940" DropArrowBackColor="#063940"></ajaxToolkit:DropDownExtender>

                                    <div style="width: 313px; display: none;" id="dropdiv_group">
                                        <asp:ListBox ID="listgroup" runat="server" OnSelectedIndexChanged="listgroup_SelectedIndexChanged" Width="313px" Height="100px" AutoPostBack="true" CssClass="myListBox1"></asp:ListBox>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td style="width: 20px;">&nbsp;</td>
                        <td class="amstitle coldark">Asset Category :</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txt_category" runat="server" CssClass="ams-control colwhite" Width="200px" Text="" ReadOnly="true"></asp:TextBox>
                                                <asp:Label ID="lbl_cate" runat="server" Text="0" Style="display: none"></asp:Label>
                                                <ajaxToolkit:DropDownExtender runat="server" Enabled="True" TargetControlID="txt_category" ID="txt_category_DropDownExtender" DropDownControlID="dropdiv_cat" HighlightBackColor="#063940" HighlightBorderColor="#063940" DropArrowBackColor="#063940"></ajaxToolkit:DropDownExtender>

                                                <div style="width: 213px; display: none;" id="dropdiv_cat">
                                                    <asp:ListBox ID="listcat" runat="server" OnSelectedIndexChanged="listcat_SelectedIndexChanged" Width="213px" Height="100px" AutoPostBack="true" CssClass="myListBox1"></asp:ListBox>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                        </td>
                        <td style="width: 20px;">&nbsp;</td>
                        <td class="amstitle coldark"></td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    

                    

                    <tr>
                        <td colspan="8" style="height: 10px;"></td>
                    </tr>

                    

                    <tr>
                        <td colspan="8">
                            <table class="ams-body" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="amstitle coldark" style="width: 150px;">Building/Zone :</td>
                                    <td>
                                        <asp:TextBox ID="txt_bzone" runat="server" CssClass="ams-control colwhite" Width="150px"></asp:TextBox></td>
                                    <td style="width: 20px;">&nbsp;</td>
                                    <td class="amstitle coldark">Category Code :</td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txt_cate" runat="server" CssClass="ams-control colwhite" Width="150px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        
                                        
                                    </td>
                                    <td style="width: 20px">&nbsp;</td>
                                    <td class="amstitle coldark">Floor Level :</td>
                                    <td>
                                        <asp:TextBox ID="txt_flvl" runat="server" CssClass="ams-control colwhite" Width="150px"></asp:TextBox></td>
                                </tr>
                            </table>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="8" style="height: 10px;"></td>
                    </tr>
                    <tr>
                        <td class="amstitle coldark" style="width: 150px;">Description :</td>
                        <td>
                            <asp:TextBox ID="txt_descr" runat="server" CssClass="ams-control colwhite" Width="300px"></asp:TextBox></td>
                        <td style="width: 20px;"></td>
                        <td class="amstitle coldark">Vendor :</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_vendor" runat="server" CssClass="ams-control colwhite" Width="200px" Text="" ReadOnly="true"></asp:TextBox>
                                    <asp:Label ID="lbl_vendorid" runat="server" Text="0" Style="display: none"></asp:Label>
                                    <ajaxToolkit:DropDownExtender runat="server" Enabled="True" TargetControlID="txt_vendor" ID="txt_vendor_DropDownExtender" DropDownControlID="dropdiv_vendor" HighlightBackColor="#063940" HighlightBorderColor="#063940" DropArrowBackColor="#063940"></ajaxToolkit:DropDownExtender>

                                    <div style="width: 213px; display: none;" id="dropdiv_vendor">
                                        <asp:ListBox ID="listvendor" runat="server" OnSelectedIndexChanged="listvendor_SelectedIndexChanged" Width="213px" Height="100px" AutoPostBack="true" CssClass="myListBox1"></asp:ListBox>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td colspan="2">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btn_vendor" runat="server" Text="Add/Edit" CssClass="ams-control_btn" OnClick="btn_vendor_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="8" style="height: 10px;"></td>
                    </tr>
                    <tr>
                        <td class="amstitle coldark" style="width: 150px;">Model :</td>
                        <td>
                            <asp:TextBox ID="txt_model" runat="server" CssClass="ams-control colwhite" Width="300px"></asp:TextBox></td>
                        <td style="width: 20px;"></td>
                        <td class="amstitle coldark">Serial # :</td>
                        <td>
                            <asp:TextBox ID="txt_serial" runat="server" CssClass="ams-control colwhite" Width="200px"></asp:TextBox>
                        </td>
                        <td style="width: 20px;"></td>
                        <td class="amstitle coldark">Room :</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_room" runat="server" CssClass="ams-control colwhite" Width="200px" Text="" ReadOnly="true"></asp:TextBox>
                                    <asp:Label ID="lbl_roomid" runat="server" Text="0" Style="display: none"></asp:Label>
                                    <ajaxToolkit:DropDownExtender runat="server" Enabled="True" TargetControlID="txt_room" ID="txt_room_DropDownExtender" DropDownControlID="dropdiv_room" HighlightBackColor="#063940" HighlightBorderColor="#063940" DropArrowBackColor="#063940"></ajaxToolkit:DropDownExtender>

                                    <div style="width: 213px; display: none;" id="dropdiv_room">
                                        <asp:ListBox ID="listroom" runat="server" OnSelectedIndexChanged="listroom_SelectedIndexChanged" Width="213px" Height="100px" AutoPostBack="true" CssClass="myListBox1"></asp:ListBox>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btn_room" runat="server" Text="Add/Edit" CssClass="ams-control_btn" OnClick="btn_room_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <div class="seperator"></div>
                <div class="ams-body">
                    <div class="floatingBox">
                        <div class="container-fluid">
                            <ul class="tabs4">
                                <li class="bottom"><a href="#" class="current">Comments</a></li>
                                <li class="bottom"><a href="#">Costs</a></li>
                                <li class="bottom"><a href="#">Ports</a></li>
                                <li class="bottom"><a href="#">Tasks</a></li>
                                <li class="bottom"><a href="#">Details</a></li>
                                <li class="bottom"><a href="#">Vendor</a></li>
                                <li class="bottom"><a href="#">Sub-Parts</a></li>
                                <li class="bottom"><a class="last" href="#">Documents</a></li>
                            </ul>
                            <div class="clear"></div>
                            <div class="panes_">
                                <div class="pane" style="display: block;">
                                    <div>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="ams-control_white" Width="98%" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                        <div class="clear"></div>
                                    </div>

                                </div>
                                <div class="pane" style="display: none;">
                                    <p>This is SNS</p>
                                </div>
                                <div class="pane" style="display: none;">
                                    <p>This is SNS</p>
                                </div>
                                <div class="pane" style="display: none;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="ams-body">
                    <table style="float: right; margin-top: 30px;">
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnsave" runat="server" Text="Add" CssClass="ams-control_btn" OnClick="btnsave_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                </td>
                            <td>
                                <asp:Button ID="Button4" runat="server" Text="Delete" CssClass="ams-control_btn" /></td>
                            <td>
                                <asp:Button ID="Button5" runat="server" Text="Cancel" CssClass="ams-control_btn" /></td>
                            <td>
                                <asp:Button ID="Button6" runat="server" Text="Help" CssClass="ams-control_btn" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="popupDiv_vendor" class="popupbox shadow" style="width: 350px; display: none">
            <div class="pophead">Add/Edit Vendor</div>
            <div class="poparea">
                <table>
                    <tr>
                        <td style="width: 100px;">Vendor Name</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_vendor_name" CssClass="ams-control colwhite" runat="server" Width="200px"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="popfooter">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btnsave_vendor" runat="server" Text="Add" CssClass="ams-control_btn" OnClick="btnsave_vendor_Click" /></td>
                                <td>
                                    <asp:Button ID="btncancel_vendor" runat="server" Text="Close" CssClass="ams-control_btn" OnClick="btncancel_vendor_Click" /></td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <asp:Button ID="btndummy" runat="server" Text="Button" Style="display: none" />
        <ajaxToolkit:ModalPopupExtender runat="server" Enabled="True" TargetControlID="btndummy" ID="btndummy_ModalPopupExtender" PopupControlID="popupDiv_vendor" BackgroundCssClass="model-background"></ajaxToolkit:ModalPopupExtender>

        <div id="popupDiv_location" class="popupbox shadow" style="width: 350px; display: none">
            <div class="pophead">Add/Edit Vendor</div>
            <div class="poparea">
                <table>
                    <tr>
                        <td style="width: 100px;">Location Name</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_loc_name" CssClass="ams-control colwhite" runat="server" Width="200px"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="popfooter">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btnsave_location" runat="server" Text="Add" CssClass="ams-control_btn" OnClick="btnsave_location_Click" /></td>
                                <td>
                                    <asp:Button ID="btncancel_location" runat="server" Text="Close" CssClass="ams-control_btn" OnClick="btncancel_location_Click" /></td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <asp:Button ID="btndummy1" runat="server" Text="Button" Style="display: none" />
        <ajaxToolkit:ModalPopupExtender runat="server" Enabled="True" TargetControlID="btndummy1" ID="btndummy1_ModalPopupExtender" PopupControlID="popupDiv_location" BackgroundCssClass="model-background"></ajaxToolkit:ModalPopupExtender>

        <div id="popupDiv_room" class="popupbox shadow" style="width: 350px; display: none">
            <div class="pophead">Add/Edit Room</div>
            <div class="poparea">
                <table>
                    <tr>
                        <td style="width: 100px;">Room Name</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_room_name" CssClass="ams-control colwhite" runat="server" Width="200px"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="popfooter">
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btnsave_room" runat="server" Text="Add" CssClass="ams-control_btn" OnClick="btnsave_room_Click" /></td>
                                <td>
                                    <asp:Button ID="btncancel_room" runat="server" Text="Close" CssClass="ams-control_btn" OnClick="btncancel_room_Click" /></td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <asp:Button ID="btndummy2" runat="server" Text="Button" Style="display: none" />
        <ajaxToolkit:ModalPopupExtender runat="server" Enabled="True" TargetControlID="btndummy2" ID="btndummy2_ModalPopupExtender" PopupControlID="popupDiv_room" BackgroundCssClass="model-background"></ajaxToolkit:ModalPopupExtender>
        <script src="../Assets/js/jquery.tabs.min.js" type="text/javascript"></script>
        <script src="../Assets/js/custom.js" type="text/javascript"></script>
        <script type="text/javascript">
            function CallNav(id) {
                document.getElementById("htype").value = id;
                $("#btnnav").click();
                _changeActive();
            }
        </script>
    </form>
    <script src="../Assets/js/jquery.nicescroll.js"></script>
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#Data").niceScroll({ styler: "fb", cursorcolor: "#063940", cursorwidth: '10', cursorborderradius: '0px', background: '#45818e', cursorborder: '' });
            });
    </script>
</body>
</html>
