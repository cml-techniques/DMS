<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Navbar.aspx.cs" Inherits="CMLTechQ.DMS.Navbar" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: Web Based Document Management</title>
    <meta name="author" content="CML Techniques" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
   <webopt:BundleReference ID="BundleReference1" runat="server" Path="~/Content/css" />

<style type="text/css">
    body {
    font-size: 13px;
    font-family: 'Open Sans', sans-serif;
    color: #353535;
    overflow:hidden;
}
        .tdselection {
        width:100%;
        padding:0px;
        color: #353535;
           font-size: 15px;
        }
    .lbltext {
    font-size: 14px;
    font-family: 'Open Sans', sans-serif;
    }
    
    #nav-menu li.item a,   
    #nav-menu li.item.current a{           
        width: initial!important; 
        padding: 5px 2px;           
    }
     #nav-menu li.item:hover {       
         width: initial!important;   
     }
</style>
</head>
<body class="inner" onload="_autoAdjust(); checkpermission();">
    <form id="form1" runat="server">


        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" Style="display: none"></asp:Label>


        <input type="hidden" id="htype" name="htype" runat="server" />
        <input type="hidden" id="hfoldername" name="hfoldername" runat="server" />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="nav-bar">
            <ul class="topnav">
                <li class="item"><a id="acreate" href="#" onclick="gocreate();" title="Create Folder"><i class="fa fa-folder"></i></a></li>
                <li class="item"><a id="adocument" class="sp" href="#" onclick="goDocument();" title ="Move Document" style="font-size:16px"><i class="fa fa-file-o"></i></a></li>
                <li class="item"><a id="amoveup" class="sp" href="#" onclick="gomove();" title="Move Up"><i class="fa fa-arrow-circle-up"></i></a></li>
                <li class="item"><a id="amovedown" href="#" onclick="gomove();" title="Move Down"><i class="fa fa-arrow-circle-down"></i></a></li>
                <li class="item"><a id="aedit" href="#" onclick="goedit();" ><i class="fa fa-edit" title="Edit Folder"></i></a></li>
                <li class="item"><a id="adelete" href="#" onclick="godelete();" title="Delete Folder"><i class="fa fa-trash-o"></i></a></li>
            </ul>


        </div>
        <div class="clear"></div>
       
        <div id="navbar" style="bottom:5px;overflow-x:hidden;">
            <div id="nav-menu">


                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>


                            <input type="hidden" id="hfolder" name="hfolder" runat="server" />
                            <%--<input type="hidden" id="hfoldercode" name="hfoldercode" runat="server" />--%>


            </div>
        </div>


        <asp:UpdatePanel ID="updatepanel2" runat="server">
            <ContentTemplate>
                 <asp:Button ID="btncreate" runat="server" Text="create" OnClick="btncreate_Click" Style="display: none" />
                   <asp:Button ID="btnmove" runat="server" Text="Move" OnClick="btnmove_Click" Style="display: none" />  
                 <asp:Button ID="btnfdelete" runat="server" Text="Delete" OnClick="btnfdelete_Click" Style="display: none" /> 
                 <asp:Button ID="btngodoc" runat="server" Text="create" OnClick="btngodoc_Click" Style="display: none" /> 
            </ContentTemplate>
              
        </asp:UpdatePanel>
          <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
          </telerik:RadWindowManager>
          <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="Folder" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro"  VisibleStatusbar="false" Height="200px"  OnClientShow="setPopupTitle" Width="270px" >
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div style="padding: 10px 0px">
                                 <table style="width:100%" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="tdselection"  align="center">
                                     
                                     <asp:RadioButtonList ID="rbtfolder" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Table" AutoPostBack="true" OnSelectedIndexChanged="rbtfolder_SelectedIndexChanged">
                                                    <asp:ListItem Text="Parent" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Folder" Value="2" Selected="True"></asp:ListItem>
                                                </asp:RadioButtonList>
                          
                                    </td>
                                </tr>
                                     <tr>
                                         <td style="height:10px;"></td>
                                     </tr>
                                <tr>
                                    <td style="width:100%">
                                        <asp:Label ID="lblfolderhead" Text="Enter Code and Folder" runat="server" CssClass="lbltext"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:100%">
                                        <table style="width:92%" cellspacing="1" cellpadding="0">
                                            <tr>
                                                <td id="tdcode" runat="server">
                                                    <asp:TextBox ID="txtcode"  CssClass="control-textbox-2" Width="18px" runat="server" MaxLength="3" ></asp:TextBox>
                                                </td>
                                                 <td id="tdname" runat="server" style="width:100%">
                                                      <asp:TextBox ID="txtfolder" CssClass="control-textbox-2"  Width="100%" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                                    
                                                    
                                                </td>
                                            </tr>
                                      <tr>
                                    <td style="height:10px"></td>
                                 </tr>
                                <tr>
                                    <td style="width:100%;text-align:center">

                                        <asp:Button ID="btncreatefolder" runat="server" OnClick="btncreatefolder_Click" Text="CREATE" CssClass="control-general control-button-green push_button" Width="110px" />
                                        <asp:Button ID="btnclose" runat="server" OnClick="btnclose_Click" Text="CLOSE" CssClass="control-general control-button-yellow push_button" Width="110px" />
                                    </td>    
                                </tr>

                            </table>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>

            </telerik:RadWindow>
         <telerik:RadWindow ID="RadWindow2"  runat="server" Modal="true" BorderStyle="None" Title="Move folder !" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro"  VisibleStatusbar="false" AutoSizeBehaviors="HeightProportional" AutoSize="true"  Width="270px"  >
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div style="padding: 10px;">
                                 <table style="width:100%" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="tdselection"  align="center">                                       
                                     <asp:RadioButtonList ID="rblmove" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Table" AutoPostBack="true" OnSelectedIndexChanged="rblmove_SelectedIndexChanged">
                                                    <asp:ListItem Text="Parent" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Folder" Value="2" Selected="True"></asp:ListItem>
                                                </asp:RadioButtonList>
                          
                                    </td>
                                </tr>
                                    <tr>
                                    <td style="height:10px"></td>
                                 </tr>
                                                    <tr>
                                                        <td style="width:100%">
        <telerik:RadListBox ID="rdlmenu" CssClass="RadListBox1" runat="server" Width="100%" 
            SelectionMode="Multiple"   AllowReorder="true" AutoPostBackOnReorder="true" EnableDragAndDrop="true"  Skin="Office2010Blue">
        </telerik:RadListBox>
                                                             </td>
                                                    </tr>
                                                          <tr>
                                    <td style="height:10px"></td>
                                </tr>
                                     <tr>
                                         <td style="width:100%">

                                              <asp:Button ID="btnupdate" runat="server" Text="UPDATE" CssClass="control-general control-button-green" OnClick="btnupdate_Click" Width="110px"   />
                                              <asp:Button ID="btnmoveclose" runat="server" OnClick="btnmoveclose_Click" Text="CLOSE" CssClass="control-general control-button-yellow push_button" Width="110px" />
                                         </td>
                                     </tr>
                                                    </table>

                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>

            </telerik:RadWindow>
         <telerik:RadWindow ID="RadWindow3"  runat="server" Modal="true" BorderStyle="None" Title="Delete folder !" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro"  VisibleStatusbar="false" Height="210px"  Width="275px"  >
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div style="padding: 10px;">
                                   <table style="width:100%" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="tdselection"  align="center">
                                     <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                         <ContentTemplate>
                                               <asp:RadioButtonList ID="rbldelete" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Table" AutoPostBack="true">
                                                    <asp:ListItem Text="Parent" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Folder" Value="2" Selected="True"></asp:ListItem>
                                                </asp:RadioButtonList>
                                         </ContentTemplate>
                                     </asp:UpdatePanel>

                          
                                    </td>
                                </tr>
                                       <tr>
                                    <td style="height:10px"></td></tr>
                                <tr>
                                    <td style="width:100%;">
                <asp:Label ID="Label3" Text="Cannot delete while parent folder exists? Do you want to continue anyway.?" CssClass="lbltext" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="height:5px"></td>
                                 </tr>
                                <tr>
                                  <td style="width:100%;text-align:center">
                                          <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                         <ContentTemplate>
                                   <table >
                                                    <tr>
                                                        <td>

                                                            <asp:Button ID="btndelyes" runat="server" Text="YES" CssClass="control-general control-button-green push_button" Width="110px" OnClick="btndelyes_Click" />

                                                        </td>
                                                        <td>
                                                          
                                                            <asp:Button ID="btndelno" runat="server" Text="NO" CssClass="control-general control-button-yellow1 push_button" Width="110px" OnClick="btndelno_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                             </ContentTemplate>
                                              </asp:UpdatePanel>
                                  </td>
                                </tr>
                                 <tr>
                                    <td style="height:10px"></td>
                                </tr>
                            </table>

                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>

            </telerik:RadWindow>

         <telerik:RadWindow ID="RadWindow4"  runat="server" Modal="true" BorderStyle="None" Title="Move Document !" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro"  VisibleStatusbar="false" AutoSizeBehaviors="HeightProportional" AutoSize="true"  Width="270px"  >
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <div style="padding: 10px;">
                                 <table style="width:100%;" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="tdselection"  align="center"> 
                                       
                                     <asp:RadioButtonList ID="rbld" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Table" AutoPostBack="true" OnSelectedIndexChanged="rbld_SelectedIndexChanged">
                                                    <asp:ListItem Text="MI" Value="2" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="RD" Value="3" ></asp:ListItem>
                                                   <asp:ListItem Text="TD" Value="4"></asp:ListItem>
                                                </asp:RadioButtonList>
                                           
                          
                                    </td>
                                </tr>
                                    <tr>
                                    <td style="height:10px"></td>
                                 </tr>
                                                    <tr>
                                                        <td style="width:100%;">
                                                             <div style="max-height:380px;overflow-y:auto;overflow-x:hidden"    >
        <telerik:RadListBox ID="rbmd" CssClass="RadListBox1" runat="server" Width="100%" 
            SelectionMode="Multiple"   AllowReorder="true" AutoPostBackOnReorder="true" EnableDragAndDrop="true"  Skin="Office2010Blue">
        </telerik:RadListBox>
                                                                 </div>
                                                             </td>
                                                    </tr>
                                                          <tr>
                                    <td style="height:10px"></td>
                                </tr>
                                     <tr>
                                         <td style="width:100%">

                                              <asp:Button ID="btnmovedupdate" runat="server" Text="UPDATE" CssClass="control-general control-button-green" OnClick="btnmovedupdate_Click" Width="110px"   />
                                              <asp:Button ID="btnmovedclose" runat="server" OnClick="btnmovedclose_Click" Text="CLOSE" CssClass="control-general control-button-yellow push_button" Width="110px" />
                                         </td>
                                     </tr>
                                                    </table>

                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>

            </telerik:RadWindow>

          <script src="../Assets/js/jquery.min.js"></script>
          <script src="../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>

          <script type="text/javascript">

              //window.onload = function () {
                
              //}

              function movetoNext(current, nextFieldID) {
                  if (current.value.length >= current.maxLength) {
                      $('#txtfolder').focus();
                      $('#txtfolder').select();
                     
                  }
              }

              function setPopupTitle(sender) {
                  var hfValue = $telerik.$('input[id$="dialogTitle"]', sender.get_contentElement()).val();
                  if (hfValue) {
                      sender.set_title(hfValue);
                  }
                  else {

                      if (document.getElementById("htype").value == 1) {
                          sender.set_title("Create Folder");
                      }
                      else {
                          sender.set_title("Edit Folder");
                      }
                  }
              }

            function loadmenu(_type) {
                var _auth1 = document.getElementById("lbluserhidden");
                var _auth2 = document.getElementById("lblprjid");

                //if (_type == 1) {
                //    var _auth3 = document.getElementById("lblid").textContent;
                //}
                //else
                    var _auth3 = "0";

                    parent.document.getElementById("menubar").src = "Menubar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3;

                    refreshdefaultmenu();
            }

            function loadnavmenu() {

                var _auth1 = document.getElementById("lbluserhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblid").textContent;

                parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3 + "&Auth4=0";
                
            }

            function disable(id) {

            }
            function GetNav(id, _pos, DefaultInner,_type) {
                //alert(_desc);
                var _auth1 = document.getElementById("lbluserhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblid");


                document.getElementById("hfolder").value = id;


                //alert(id);
                //alert(DefaultInner);

                parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id;
                //parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner + "&Auth4=" + id;



                if (_type == 1) {
                    parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner + "&Auth4=0";
                }
                else if (_type == 2) {
                    parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner;
                }
                else if (_type == 3) {
                    parent.document.getElementById("content").src = "DocumentList2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner;
                }
                else if (_type == 4) {
                    parent.document.getElementById("content").src = "DocumentList3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefaultInner;
                }






                _changeActive();


            }
            function goclose(pnl) {

                document.getElementById(pnl).style.display = 'None';

            }

            function gomove(_type) {
                var _auth1 = document.getElementById("lbluserid");
                if (_auth1.textContent.endsWith("@cmlgroup.ae")) {
                    $("#btnmove").click();
                }
            }

            function _changeActive() {
                $(function () {
                    $('.nav > li').click(function () {
                        $('.nav > li').removeClass('current');
                        $(this).addClass('current');
                    });
                });


            }

            function gocreate() {

                var _auth1 = document.getElementById("lbluserid");
                if (_auth1.textContent.endsWith("@cmlgroup.ae")) {
                    document.getElementById("htype").value = "1";
                    $("#btncreate").click();

                }
            }
            function godelete() {
                var _auth1 = document.getElementById("lbluserid");
                if (_auth1.textContent.endsWith("@cmlgroup.ae")) {
                    document.getElementById("htype").value = "3";
                    $("#btnfdelete").click();
                }
            }
            function goedit() {

                var _auth1 = document.getElementById("lbluserid");
                if (_auth1.textContent.endsWith("@cmlgroup.ae")) {
                    document.getElementById("htype").value = "2";
                    $("#btncreate").click();
                }


            }
            function goDocument() {
                var _auth1 = document.getElementById("lbluserid");
                if (_auth1.textContent.endsWith("@cmlgroup.ae")) {
                    $("#btngodoc").click();

                }
            }
            function _autoAdjust() {
                //alert(msieversion());
                var div = $("#navbar").height();
                var win = $(window).height();
                if (div < win) {
                    $("#navbar").addClass("bot5");
                }
                else {
                    $("#navbar").addClass("botauto");
                }
            }
            function checkpermission() {
                var _auth1 = document.getElementById("lbluserid");
                if (!_auth1.textContent.endsWith("@cmlgroup.ae")) {

                    //$("#nav-bar").css("background-color", "black");
                   
                    $("#acreate").css("cursor", "not-allowed");
                    $("#adocument").css("cursor", "not-allowed");
                    $("#amoveup").css("cursor", "not-allowed");
                    $("#amovedown").css("cursor", "not-allowed");
                    $("#adelete").css("cursor", "not-allowed");
                    $("#aedit").css("cursor", "not-allowed");
                }

            }
            function refreshdefaultmenu() {

                var _auth1 = document.getElementById("lbluserhidden");
                var _auth2 = document.getElementById("lblprjid");

                parent.location("Project?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent);


            }
 
            function refreshdefaultnav(id,folder,_type) {

                var _auth1 = document.getElementById("lbluserhidden");
                var _auth2 = document.getElementById("lblprjid");

                parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id;

               if (_type == "1") {
                    parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + folder;
                }
                else if (_type == "2") {
                    parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + folder;
                }
                else if (_type == "3") {
                    parent.document.getElementById("content").src = "DocumentList2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + folder;
                }
                else if (_type == "4")
                    parent.document.getElementById("content").src = "DocumentList3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + folder;

            }

            function DocumentNavaigation_Doc(id,folder, _type) {

                var _auth1 = document.getElementById("lbluserhidden");
                var _auth2 = document.getElementById("lblprjid");


                alert(id);
                alert(folder);

                parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" +_type;

                if (_type == "1") {
                    parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + folder;
                }
                else if (_type == "2") {
                    parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + folder;
                }
                else if (_type == "3") {
                    parent.document.getElementById("content").src = "DocumentList2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + folder;
                }
                else if (_type == "4")
                    parent.document.getElementById("content").src = "DocumentList3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + folder;
            }

        </script>
        <script src="../Assets/js/jquery.min.js"></script>
        <script src="../Assets/js/jquery.nicescroll.js"></script>
        <script type="text/javascript">
            $(document).ready(
      function () {

          $("#navbar").niceScroll({ styler: "fb", cursorcolor: "#c0c0c0", cursorwidth: '10', cursorborderradius: '0px', background: 'transparent', cursorborder: '', horizrailenabled: false,railalign:'left'});
          $("#navbar").getNiceScroll().eq(0).setScrollLeft($("#navbar").getNiceScroll().eq(0).page.maxw);
      }

    );
        </script>
    </form>
</body>
</html>
