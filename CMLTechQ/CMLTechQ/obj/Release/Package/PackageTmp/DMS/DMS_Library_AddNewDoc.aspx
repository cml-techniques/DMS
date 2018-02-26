<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DMS_Library_AddNewDoc.aspx.cs" Inherits="CMLTechQ.DMS.DMS_Library_AddNewDoc" EnableEventValidation="false" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: Web Based Document Management</title>
    <meta name="author" content="CML Techniques" />

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
      <webopt:BundleReference ID="BundleReference1" runat="server" Path="~/Content/css" />

    <style type="text/css">
        .RadDropDownList_Default .rddlInner {
            /*border-color: #D4D4D4 !important;*/
            background-color: #E8EEEF!important;
            border-radius: 4px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 5px!important;
            font-size: 14px;
            font-weight: bold;
        }

        .rddlPopup_Default .rddlItemSelected {
            background: none repeat scroll 0 0 #3399FF !important;
        }

        .rddlPopup_Default .rddlItemHovered {
            background: none repeat scroll 0 0 #3399FF !important;
        }

        .RadDropDownList_Default .rddlInner {
            font-weight: 600 !important;
            color: black !important;
        }

        .RadDropDownList_Default .rddlIcon {
            margin-top: 3px!important;
            height: 20px!important;
            width: 20px!important;
        }

        .RadPicker_Default input {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
            font-size: 14px;
            font-weight: bold;
        }

        .RadPicker_Default span {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 4px!important;
            font-size: 14px;
            font-weight: bold;
        }
        .datepicker-style {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
            font-size: 14px;
            font-weight: bold;
        }

        div.RadUpload .inputs {
        }



        div.RadUpload .ruBrowse {
            background-position: 0 -30px;
            background-color: #0099CC!important;
            box-shadow: 0px 2px 0px rgba(0,51,204,1);
            color: #F9FAFA!important;
            border: 0px;
            font-weight: bold;
            padding: 0!important;
            /*height: 30px!important;*/
            border-radius: 4px;
            display: block;
            width: 100px;
            margin: 0px;
            cursor: pointer;
        }

        div.RadUpload_Default .ruFileWrap .ruButtonHover {
            background-position: 100% -30px !important;
        }


        div.RadUpload .ruFakeInput {
            border: 1px solid red !important;
            width: 20px !important;
            display: none;
        }
   div.RadUpload .ruInputs {
            margin-top: auto!important;
        }
    .RadGrid
{
    border-radius: 4px;
    overflow: hidden;
    border-color:#dddddd;
    box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.1);
} 
     .ghead{
      height: 32px ! important;
      color: #3f4141;
      font-weight:700 ! important;
        }
        .newbord {
            border-right:none !important;
        }
        .newbord1 {
            border-left:none !important;
            border-right:none !important;
        }
       .newbord2 {
             border-left:none !important;
        }
    </style>
</head>
<body onload="javascript:_autoAdjust();">
    <form id="form1" runat="server" enctype="multipart/form-data">
        <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release"></asp:ScriptManager>
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

            <input type="hidden" id="haction" name="hdocid" runat="server" value="1" />

        <input type="hidden" id="hedit" name="hedit" runat="server" value="0" />
        <asp:Label ID="lblfile" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hreview" name="hreview" runat="server" />
        <div id="doc-container" style="top: 0px; overflow-x: hidden;">
            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="imgload" runat="server" ImageUrl="../Assets/img/ajax-loader.gif" Style="top: 30%; left: 48%; position: fixed; z-index: 999" />
                </ProgressTemplate>
            </asp:UpdateProgress>

          
            </div>
            <div class="clear"></div>
    
           <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="550px" Height="350px" VisibleStatusbar="false"  OnClientShow="setPopupTitle" OnClientClose="OnClientclose"  >
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel88" runat="server">

                    <ContentTemplate>
                           <div style="padding: 10px; overflow: hidden;">
                            <div class="innerbox">
                                <div class="subbox">
                                    <table style="color: #353535;width:100%" border="0" cellspacing="0" cellpadding="5">
                                        <tr>
                                    <td style="width: 160px;">MANUFACTURER</td>
                                    <td>
                                                    <div style="display: inline-block">
                                                    
                                                    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                                                        <ContentTemplate>
                                                            <telerik:RadDropDownList ID="drop_manufaturer" runat="server" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Manufacturer"  Width="270px" DropDownHeight="300px"  >
                                                            </telerik:RadDropDownList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div style="display: inline-block;margin-left:10px;">
                                                    <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnaddnew" runat="server" Text="New" CssClass="control-general control-button-blue1 push_button"  OnClick="btnaddnew_Click" Width="100px"  />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>

                                 </td>
                                            <td></td>
                                 </tr>
                                 <tr>
                            <td style="width: 160px;">TYPE</td>
                            <td>
                                <asp:TextBox ID="txt_type" runat="server" CssClass="control-textbox-2" Width="250px"></asp:TextBox></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 160px;">MODEL NO</td>
                            <td >
                                <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txt_model" runat="server" CssClass="control-textbox-2" Width="250px" ClientIDMode="Static" ></asp:TextBox>
                                         <input id="chk_model" type="checkbox" class="checkstyle" runat="server" onclick="_chkmodel(event);" /><span class="lbl">  N/A</span>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>

                        <tr >
                                       <td style="width: 160px;">FILE NAME</td>
                                       <td style="width:100%;">
                                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="pdf" Skin="Glow" MaxFileInputsCount="1"  CssClass="ruBrowse">
                                         <Localization Select="Browse"   />
                                        </telerik:RadAsyncUpload>                                               
                            </td>
                            <td><asp:TextBox ID="txt_file" runat="server"  style="display:none" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px;">SOURCE</td>
                            <td >
                                <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txt_source" runat="server" CssClass="control-textbox-2" Width="250px" ClientIDMode="Static"></asp:TextBox>
                                       <input id="chk_source" type="checkbox" class="checkstyle" runat="server" onclick="_chksource(event);" /><span class="lbl">  N/A</span>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </td>
                        </tr>
                        <tr>
                            <td style="width: 160px;"></td>
                            <td >
                                <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                                        <ContentTemplate>
                                  <div class="subbox" style="margin-top: 30px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="control-general control-button-greenlight push_button" Width="100px" OnClick="btnsave_Click" />
                                         </td>
                                         <td>
                                            <asp:Button ID="btnsaveExit" runat="server" Text="Save&Exit" CssClass="control-general control-button-greenlight push_button" Width="100px" OnClick="btnsaveExit_Click"  OnClientClick="CallLibrary();"  />
                                         </td>
                                        <td id="td_delete" runat="server" visible="false">
                                           <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="control-general control-button-orange1 push_button" OnClick="btnconfirm_Click" OnClientClick="return confirm('Do you want to delete..?');" Width="100px" /></td>
                                        <td>
                                            <asp:Button ID="btncancel" runat="server" Text="Exit" CssClass="control-general control-button-yellow1 push_button"   Width="100px" OnClientClick="CallLibrary();"  />
                                        </td>
                                     
                                    </tr>
                                </table>
                                      </div>
                                              </ContentTemplate>
                    </asp:UpdatePanel>

                                   <td>
                                       <asp:Label ID="lblid" runat="server"  Style="display: none;"></asp:Label>
                                   </td>

                            </td>
                       
                        </tr>
                                        </table>
                                    </div>
                                  </div>
                               </div>    
                          
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
               </telerik:RadWindow>

           <telerik:RadWindow ID="RadWindow2" runat="server" Modal="true" BorderStyle="None" Title="Create MANUFACTURER" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="750px" Height="150px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <div style="padding:10px">
                        <table style="color:#353535;">
                            <tr>
                                <td style="width:150px;">ENTER MANUFACTURER</td>
                                <td>
                                    <asp:TextBox ID="txtManufacturer" CssClass="control-textbox-2" Width="300px" runat="server"></asp:TextBox></td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnmanu" runat="server" Text="Add" CssClass="control-general control-button-greenlight push_button" OnClick="btnmanu_Click" Width="100px"  /></td>
                                            <td>
                                                <asp:Button ID="btncancelm" runat="server" Text="Cancel" CssClass="control-general control-button-yellow1 push_button" OnClick="btncancelm_Click" Width="100px"  /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>

           <telerik:RadWindow ID="RadWindow3" runat="server" Modal="true" BorderStyle="None" Title="Confirmation Required!" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="200px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div style="padding: 20px;">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblmessage" ForeColor="Red" Font-Size="15px" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lbldocid" runat="server" Text="0" Style="display: none;"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnconfirm" runat="server" Text="Yes" CssClass="control-general control-button-greenlight push_button" OnClick="btnconfirm_Click" Width="100px" /></td>
                                            <td>
                                                <asp:Button ID="btnno" runat="server" Text="No" CssClass="control-general control-button-orange1 push_button" OnClick="btnno_Click" Width="100px" /></td>
                                        </tr>
                                    </table>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>



         <telerik:RadWindow ID="RadWindow4" runat="server" Modal="true" BorderStyle="None" Title="Message!" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="200px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div style="padding: 20px;">
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblmsgs" ForeColor="Red" Font-Size="15px" runat="server" Text="" ></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text="0" Style="display: none;"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td style="width:100px"></td>
                                            <td>
                                                <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="control-general control-button-greenlight push_button" OnClick="btnok_Click" Width="100px" /></td>
                                            <td>
                                               
                                        </tr>
                                    </table>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>


            <script src="../Assets/js/jquery.min.js"></script>
        <%: Scripts.Render("~/bundles/scripts") %>
        <script type="text/javascript">
            function goBack() {
                //var _auth1 = document.getElementById("lbluseridhidden");
                //var _auth2 = document.getElementById("lblprjid");
                //var _auth3 = document.getElementById("lblfolder");
                //parent.document.getElementById("content").src = "DMS_Library?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;

                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");

                parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;
            }

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
            function _chkmodel(event) {
                var checkbox = event.target;
                var _model = document.getElementById("txt_model");
                if (checkbox.checked) {
                    _model.value = "N/A";
                }
                else {
                    _model.value = "";
                }
            }
            function _chksource(event) {
                //var _chk = document.getElementById("chk_source");
                //var _source = document.getElementById("txt_source");
                //if (_chk.checked == true)
                //    _source.value = "N/A"
                //else
                //    _source.value = "";

                var checkbox = event.target;
                var _source = document.getElementById("txt_source");
                if (checkbox.checked) {
                    _source.value = "N/A";
                }
                else {
                    _source.value = "";
                }
            }
            function Viewdoc(_id) {
                var url = "ViewSourceDocument?Auth1=" + _id;
                window.open(url, '', '', true);

            }

            function setPopupTitle(sender) {
                var hfValue = $telerik.$('input[id$="dialogTitle"]', sender.get_contentElement()).val();
                if (hfValue) {
                    sender.set_title(hfValue);
                }
                else {

                    if (document.getElementById("haction").value == "1") {
                        sender.set_title("Add Document");
                    }
                    else {
                        sender.set_title("Edit Document");
                    }
                }
            }


            function CallLibrary() {

                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");
                var _auth4 = document.getElementById("lbluserid");
                    parent.document.getElementById("content").src = "DMS_Library_General?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=0";
            }
            function OnClientclose() {
                CallLibrary();
            }
        </script>
    </form>
</body>
</html>
