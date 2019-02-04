<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DMS_Library.aspx.cs" Inherits="CMLTechQ.DMS.DMS_Library" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../AMS/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/dropdown.css" rel="stylesheet" />

</head>
<body onload="javascript:_autoAdjust();">

    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocindex" runat="server" Text="0" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbltest" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
        <asp:Label ID="lbldocstyleId" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocstylechange" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hfile" name="hfile" runat="server" />
        <input type="hidden" id="hdocid" name="hdocid" runat="server" />
        <asp:Label ID="lblfile" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hreview" name="hreview" runat="server" />

        <div id="doc-container" style="top: 0px; overflow-x: hidden;">
            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="imgload" runat="server" ImageUrl="../Assets/img/ajax-loader.gif" Style="top: 30%; left: 48%; position: fixed; z-index: 999" />
                </ProgressTemplate>
            </asp:UpdateProgress>

            <div id="main-content">
                <div class="head">
                    <div class="headtitle">
                        <h2 class="title">
                            <asp:Label ID="pageinfo" runat="server" Text="Electrical Manufacturer Literature Library > 2.2 Low Voltage Distribution Selection"></asp:Label>
                        </h2>
                    </div>
                    <div class="action-menu ">
                        <a href="#" onclick="CallLibrary();" class="control-general control-button-white-1 push_button pull-right">View Library</a>
                    </div>
                </div>
                <div style="margin-top: 3px;">
                    <table class="table-style2" style="width: 100%; table-layout: fixed" border="0" cellspacing="0">
                        <tr class="hrow">
                            <td style="text-align: center; width: 54px;">Ref</td>
                            <td style="text-align: left; width: 154px;">Manufacturer </td>
                            <td style="text-align: left; width: 194px;">Type </td>
                            <td style="text-align: left; width: 134px;">Model</td>
                            <td style="text-align: left; width: 294px;">File Name</td>
                            <td style="width: 30px; text-align: center; padding: 0px; font-size: 6px; font-weight: normal"></td>
                            <td style="width: 30px; text-align: center; padding: 0px; font-size: 6px; font-weight: normal"></td>
                            <td style="width: 30px; text-align: center; padding: 0px; font-size: 6px; font-weight: normal"></td>

                        </tr>
                        <tr class="frow">
                            <td style="text-align: center; width: 54px;">
                                <input id="filter1" type="hidden" runat="server" />
                                <input id="filter2" type="hidden" runat="server" />
                                <input id="filter3" type="hidden" runat="server" />
                                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnfilter" runat="server" Text="" Style="display: none" OnClick="btnfilter_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td style="text-align: left; width: 154px;">
                                <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                    <ContentTemplate>
                                        <div id="dd1" class="wrapper-dropdown-3" tabindex="1" style="width: 100%;">
                                            <asp:PlaceHolder ID="ph_filter1" runat="server"></asp:PlaceHolder>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnfilter" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td style="text-align: left; width: 194px;">
                                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                    <ContentTemplate>
                                        <div id="dd2" class="wrapper-dropdown-3" tabindex="1" style="width: 100%;">
                                            <asp:PlaceHolder ID="ph_filter2" runat="server"></asp:PlaceHolder>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnfilter" />
                                    </Triggers>
                                </asp:UpdatePanel>

                            </td>
                            <td style="text-align: left; width: 134px;">
                                <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                    <ContentTemplate>
                                        <div id="dd3" class="wrapper-dropdown-3" tabindex="1" style="width: 100%;">
                                            <asp:PlaceHolder ID="ph_filter3" runat="server"></asp:PlaceHolder>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnfilter" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td style="text-align: left; width: 294px;"></td>
                            <td style="width: 30px; text-align: center; padding: 0px; font-size: 6px; font-weight: normal"></td>
                            <td style="width: 30px; text-align: center; padding: 0px; font-size: 6px; font-weight: normal"></td>
                            <td style="width: 30px; text-align: center; padding: 0px; font-size: 6px; font-weight: normal"></td>

                        </tr>
                    </table>
                </div>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <asp:Repeater ID="rptdetails" runat="server" OnItemDataBound="rptdetails_ItemDataBound">
                                <HeaderTemplate>
                                    <table id="repeaterTable1" class="table-style2" style="width: 100%; table-layout: fixed" border="0" cellspacing="0">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="row">
                                        <td style="text-align: center; width: 54px;"></td>
                                        <td style="text-align: left; width: 154px;"><%# Eval("MANF_NAME") %> </td>
                                        <td style="text-align: left; width: 194px;"><%# Eval("CONTRA_TYPE") %> </td>
                                        <td style="text-align: left; width: 134px;"><%# Eval("MODEL") %></td>
                                        <td style="text-align: left; width: 294px;">
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("DocView?ID={0}&FILE={1}&SOURCE={2}",Eval("ITM_ID"),Eval("FILE_NAME"),2) %>'><%# DataBinder.Eval(Container.DataItem, "FILE_NAME") %> </asp:HyperLink>
                                        </td>
                                        <td style="width: 30px; text-align: center; font-size: 18px; padding: 0px;">
                                            <asp:HyperLink ID="source_tag" runat="server" NavigateUrl='<%# Eval("SOURCE_NAME") %>' Target="_blank"><i class="fa fa-globe"></i></asp:HyperLink>
                                        </td>
                                        <td style="width: 30px; padding: 0px; text-align: center; font-size: 18px" id='td1<%#Container.ItemIndex %>'>
                                            <a href="#" id='lnk<%#Container.ItemIndex %>' onclick="goedit(<%# Eval("ITM_ID") %>,<%# Eval("MAN_ID") %>);"><i class="fa fa-pencil-square-o"></i></a></td>
                                        <td style="width: 30px; padding: 0px; text-align: center; font-size: 18px">
                                            <a href="#" onclick="godelete(<%# Eval("ITM_ID") %>);"><i class="fa fa-trash-o"></i></a>
                                            <asp:Label ID="lblsource" Style="display: none" runat="server" Text='<%# Eval("SOURCE_NAME") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="alter">
                                        <td style="text-align: center; width: 54px;"></td>
                                        <td style="text-align: left; width: 154px;"><%# Eval("MANF_NAME") %> </td>
                                        <td style="text-align: left; width: 194px;"><%# Eval("CONTRA_TYPE") %> </td>
                                        <td style="text-align: left; width: 134px;"><%# Eval("MODEL") %></td>
                                        <td style="text-align: left; width: 294px;">
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("DocView?ID={0}&FILE={1}&SOURCE={2}", 0,Eval("FILE_NAME"),2) %>'><%# DataBinder.Eval(Container.DataItem, "FILE_NAME") %> </asp:HyperLink>
                                        </td>
                                        <td style="width: 30px; text-align: center; font-size: 18px; padding: 0px;">
                                            <asp:HyperLink ID="source_tag" runat="server" NavigateUrl='<%# Eval("SOURCE_NAME") %>' Target="_blank"><i class="fa fa-globe"></i></asp:HyperLink>
                                        </td>
                                        <td style="width: 30px; padding: 0px; text-align: center; font-size: 18px" id='td1<%#Container.ItemIndex %>'>
                                            <a href="#" id='lnk<%#Container.ItemIndex %>' onclick="goedit(<%# Eval("ITM_ID") %>,<%# Eval("MAN_ID") %>);"><i class="fa fa-pencil-square-o"></i></a></td>
                                        <td style="width: 30px; padding: 0px; text-align: center; font-size: 18px">
                                            <a href="#" onclick="godelete(<%# Eval("ITM_ID") %>);"><i class="fa fa-trash-o"></i></a>
                                            <asp:Label ID="lblsource" Style="display: none" runat="server" Text='<%# Eval("SOURCE_NAME") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>

            <div class="clear"></div>
        </div>

        <script src="../Assets/js/jquery.min.js"></script>
        <script type="text/javascript">
            function DropDown(el) {
                this.dd = el;
                this.placeholder = this.dd.children('span');
                this.opts = this.dd.find('ul.dropdown > li');
                this.val = '';
                this.index = -1;
                this.initEvents();

            }
            DropDown.prototype = {
                initEvents: function () {
                    var obj = this;

                    obj.dd.on('click', function (event) {
                        $(this).toggleClass('active');
                        return false;
                    });

                    obj.opts.on('click', function () {
                        var opt = $(this);
                        obj.val = opt.text();
                        obj.index = opt.index();
                        //obj.index = opt.index();
                        //obj.placeholder.text(obj.val);
                        obj.placeholder.text(obj.val.substr(obj.val.indexOf("_id") + 3));



                        var _did = obj.dd.attr('id');
                        if (_did == "dd1") document.getElementById("filter1").value = obj.val.substr(obj.val.indexOf("_id") + 3);
                        else if (_did == "dd2") document.getElementById("filter2").value = obj.val.substr(obj.val.indexOf("_id") + 3);
                        else if (_did == "dd3") document.getElementById("filter3").value = obj.val.substr(obj.val.indexOf("_id") + 3);
                            CallFilter1();
                    });
                },
                getValue: function () {
                    return this.val;
                },
                getIndex: function () {
                    return this.index;
                }

            }
            function CallFilter1() {
                $("#btnfilter").click();
            }
            $(function () {

                var dd1 = new DropDown($('#dd1'));
                var dd2 = new DropDown($('#dd2'));
                var dd3 = new DropDown($('#dd3'));
                var dd = new DropDown($('#dd'));

                $(document).click(function () {
                    // all dropdowns
                    $('.wrapper-dropdown-3').removeClass('active');
                });

            });
            function CallLibrary() {
                parent.document.getElementById("content").src = "DMS_Library_General";
            }
            //function RetriveDocumentDetails(id, status, contactor, mtitle, revision) {
            //     document.getElementById('txt_doctitle').value = mtitle;
            //     document.getElementById('txtdocid').value = id;
            //     SetCheckBox('drcontractor', contactor)
            //     SetCheckBox('drstatus', status)
            //     SetCheckBox('dr_revision', revision)
            //     //GetListIndex(revision);

            //     $('#btndummy1').click();
            // }

            //function SetNoReview() {
            //    var _chk = document.getElementById('chknoreview').checked;


            //    if (_chk == true) {
            //        document.getElementById('chkglobalperiod').checked = false;
            //    }
            //    else {
            //        document.getElementById('chknoreview').checked = false;

            //    }
            //}
            //function godownload(_id, type) {


            //    document.getElementById("hdocid").value = _id;


            //    if (type == 1) {
            //        $('#btndownload').click();
            //    }
            //    else {
            //        $('#btndownload1').click();
            //    }


            //}
            function GoComments(_id, _comment) {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                //var _auth3 = document.getElementById("lblfolder");

                //if (_comment > 0) {
                parent.document.getElementById("content").src = "Viewcomments?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _id;
                //}

            }
            function CallLibrary() {

                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");

                parent.document.getElementById("content").src = "DMS_Library_General?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=0";

            }
            //function godelete(_id) {

            //    //var vconfm = confirm("Do you want to delete");
            //    //if (vconfm == true) {
            //    document.getElementById("txtdocid").value = _id;
            //    $('#btndelete').click();
            //    //}


            //}
            function _autoAdjust() {
                //alert(msieversion());
                var div = $("#main-content").height();
                var win = $(window).height();
                if (div < win) {
                    //if (msieversion() > 0) {
                    //    var win = $(window).height() - 40;
                    //}
                    //else {
                    //var win = $(window).height() - 50;
                    //}
                    ///$("#main-content").height(win);
                    $("#main-content").addClass("botzero");
                }
                else {
                    $("#main-content").addClass("botauto");
                }
            }
            function msieversion() {
                var ua = window.navigator.userAgent
                var msie = ua.indexOf("MSIE")

                if (msie > 0)      // If Internet Explorer, return version number
                    return parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)))
                else                 // If another browser, return 0
                    return 0

            }
            function PageNavaigation(id, type) {

                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");

                if (type != 1) {

                    parent.document.getElementById("content").src = "documentlist1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth4=" + _auth3.textContent + "&Type=" + type + "&Auth5=" + id;
                }
            }

            //function SetCheckBox(chk, value) {
            //    var e = document.getElementById(chk);

            //    for (var i = 0; i <= document.getElementById(chk).length - 1; i = i + 1) {
            //        var ddlText = document.getElementById(chk).options[i].outerText;
            //        if (ddlText == value) {
            //            document.getElementById(chk).selectedIndex = i;
            //            e.selectedIndex = i;
            //            break;
            //        }
            //    }

            //}
            function CallViewer(_id, _file, _review) {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");



                document.getElementById("hfile").value = _file;
                document.getElementById("hreview").value = _review;
                document.getElementById("hdocid").value = _id;
                $("#btndummyView").click();
                parent.toggle();
            }
        </script>
        <script src="../Assets/js/jquery.nicescroll.js"></script>
        <script type="text/javascript">
            $(document).ready(
                function () {
                    $("html").niceScroll({ styler: "fb", cursorcolor: "#063940", cursorwidth: '10', cursorborderradius: '0px', background: '#45818e', cursorborder: '' });
                });
        </script>
    </form>
</body>
</html>
