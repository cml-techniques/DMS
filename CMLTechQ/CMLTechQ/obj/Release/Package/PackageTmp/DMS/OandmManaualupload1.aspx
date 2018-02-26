<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OandmManaualupload1.aspx.cs" Inherits="CMLTechQ.DMS.OandmManaualupload1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
     <script src="../Assets/js/jquery.min.js"></script>

         <script src="../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
        <link href="../Assets/css/OwnStyle.css" rel="stylesheet" />
        <script type="text/javascript">

            function SetNoReview() {
                var _chk = document.getElementById('chknoreview').checked;


                if (_chk == true) {
                    document.getElementById('chkglobalperiod').checked = false;
                }
                else {
                    document.getElementById('chknoreview').checked = false;

                }
                // var x = document.getElementById('lst1reminder').selectedIndex
                //alert(x);
            }
             function SetCheckBox(chk, value) {
            var e = document.getElementById(chk);

            for (var i = 0; i <= document.getElementById(chk).length - 1; i = i + 1) {
                var ddlText = document.getElementById(chk).options[i].outerText;
                if (ddlText == value) {
                    document.getElementById(chk).selectedIndex = i;
                    e.selectedIndex = i;
                    break;
                }
            }

        }

        function _setdefault() {
            var _chk = document.getElementById('chkglobalperiod').checked;
            //var _lst1 = document.getElementById('time');
            var _lst1 = document.getElementById('ddl1reminder');
            var _lst2 = document.getElementById('ddl2reminder');
            var _lst3 = document.getElementById('ddl3reminder');
            //var _lst4 = document.getElementById('ddltest');

            if (_chk == true) {
                SetCheckBox('ddl1reminder', '3 Days');
                SetCheckBox('ddl2reminder', '14 Days');
                SetCheckBox('ddl3reminder', '14 Days');

                document.getElementById('chknoreview').checked = false;
               // SetCheckBox('ddltest', '14 Days');

                _lst1.disabled = true;
                _lst2.disabled = true;
                _lst3.disabled = true;

            }
            else {
                    _lst1.disabled = false;
                    _lst2.disabled = false;
                    _lst3.disabled = false;
                    
                    _lst1.selectedIndex = -1;
                    _lst2.selectedIndex = -1;
                    _lst3.selectedIndex = -1;

                    //document.getElementById("lst1reminder").selectedIndex = -1;

            }
        }

 </script>
</head>
<body style="border-right:solid 5px #45818e" class="inner fixed_background"   >
    <form id="form1" runat="server">
    <div>
                <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server" AsyncPostBackTimeout="3600" ></asp:ToolkitScriptManager>

              <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
            <%-- <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>--%>
              <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
             <asp:Label ID="lbldocFolder" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
        <%-- <asp:Label ID="lbltest" runat="server" Text="" style="display:none" ></asp:Label>--%>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
 
                <div class="divsubhead">
                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                        <ContentTemplate>

                <asp:Label ID="lblsubtitle" runat="server" Text="Upload As built Drawings > 1.3 Fan Coil Units"></asp:Label>
                    
                        </ContentTemplate>
                    </asp:UpdatePanel>

            </div>

              <div class="divContainer">
            <div style="height:60px">
            <table >
                <tr>
                    <td style="font-size:21px;width:110px;height:30px;">Select File</td>
                    <td style="position:fixed;height:30px;width:100px;padding:8px">
                    <input id="myupload" type="file" runat="server" class="multi" />
                    </td>
                </tr>
                
            </table>
            </div>
             <div class="newclass">
        <div class="divtitle">
                <table style="width:100%">
                    <tr>
                        <td style="width:15%" class="tdstyle"> Manual Title</td>
                        <td ><asp:TextBox ID="txtmnltitle" runat="server" Width="98%" ForeColor="Black"></asp:TextBox></td>
                    </tr>
                </table>
                
               
            </div>
          <div class="divtbl1">
              
                <table>
                    <tr class="trstyle">
                       <td class="tdstyle">
                           Current Status
                       </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
   
                            <asp:dropdownlist id="ddlcntstatus" runat="server" Width="200px" CssClass="ddlstyle">

                            </asp:dropdownlist>
</ContentTemplate>
                            </asp:UpdatePanel>
                                            
                   </td>
                    </tr>
                    <tr class="trstyle"><td class="tdstyle">Contractor</td>
                        <td>
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                    <Asp:dropdownlist id="ddlContractor" runat="server" Width="400px" CssClass="ddlstyle"></Asp:dropdownlist>
                                    </ContentTemplate>
                                                            </asp:UpdatePanel>
                   </td>
                        <td>
                                                        <asp:UpdatePanel ID="UpdatePane8" runat="server">
                                <ContentTemplate>
                            <asp:Button ID="btnnew" runat="server" Text="New" CssClass="btnstyle" OnClick="btnnew_Click" Width="50px" />

                                    </ContentTemplate>
                                                            </asp:UpdatePanel>
                        </td>
                    </tr>
                   </table>
                <table>
                    <tr class="trstyle">
                        <td class="tdstyle">
                            Revision
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                <ContentTemplate>



                            <Asp:dropdownlist id="ddlrevision" runat="server" Width="200px" CssClass="ddlstyle"></Asp:dropdownlist>
                             </ContentTemplate>
                            </asp:UpdatePanel>

                        </td>
                        <td><asp:Button ID="btnchngstyle"  runat="server" Text="Change Style"  CssClass="btnstyle" /></td>
                    </tr>

                </table>
                <table>
                    <tr class="trstyle">
                        <td style="width:150px;font-size:20px;color:white">Review Period</td>
                        <td style="width:95px">
                            <asp:CheckBox ID="chknoreview" runat="server" Text="No Review" CssClass="chkstyle"  onclick="SetNoReview();"/>

                        </td><td>
                        <asp:CheckBox ID="chkglobalperiod" runat="server" CssClass="chkstyle"  Text="Use Global Response Period"  onclick="_setdefault();" />
                            </td>
                        <td>

                        </td>
                    </tr>
                </table>
                <table>
                    <tr class="trstyle">
                        <td class="tdstyle"> Review End Date</td>
                        <td>
                        
<asp:TextBox ID="txtreviewdate" runat="server"  Width="150px" ForeColor="Black"></asp:TextBox>
                            <asp:CalendarExtender ID="cxtrview"  runat="server" TargetControlID="txtreviewdate" PopupButtonID="btnreviewdate"></asp:CalendarExtender>
                        </td>
                        <td style="width:55px"><asp:Button ID="btnreviewdate" runat="server" text="" Width="28px"  CssClass="calenderimg"/></td>
                        <td class="tdstyle">Second Reminder </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel77" runat="server">
                                <ContentTemplate>
                                     <asp:DropDownList ID="ddl2reminder" runat="server" CssClass="ddlstyle" Height="16px" Width="87px"></asp:DropDownList>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                           
                        </td>
                    </tr>
                       <tr class="trstyle">
                        <td class="tdstyle"> First Reminder</td>
                        <td>
                               <asp:UpdatePanel ID="UpdatePanel61" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddl1reminder" runat="server" CssClass="ddlstyle" Height="16px" Width="87px">                         </asp:DropDownList>
                                    </ContentTemplate>
                                                            </asp:UpdatePanel>
                        </td>
                        <td style="width:55px">
                          </td>
                        <td class="tdstyle">Third Reminder </td>
                        <td>
                              <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                 <asp:DropDownList ID="ddl3reminder" runat="server" CssClass="ddlstyle" Height="16px" Width="87px">
                            </asp:DropDownList>
                                   </ContentTemplate>
                                    </asp:UpdatePanel>
                             
                        </td>
                    </tr>


                </table>
                <table>
                    <tr class="trstyle">

                         <td >
                                                         <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                             <asp:Button ID="btnupload"  runat="server" Text="Upload"  CssClass="btnstyle" OnClick="btnupload_Click"/>
                                    
                                  </ContentTemplate>
                                 <Triggers>
          <asp:PostBackTrigger  ControlID="btnupload" />
            </Triggers>
              </asp:UpdatePanel>
                                    </td>
                          <td>
                                                          <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                              <asp:Button ID="btncancel"  runat="server" Text="Cancel"  CssClass="btnstyle" OnClick="btncancel_Click" />
                                    </ContentTemplate>
                                                              </asp:UpdatePanel>
                                    </td>
                      <td>  <asp:CheckBox ID="chkemailnoti" runat="server"  class="chkstyle" Text="Email Notification" /></td>
                    </tr>
                </table>

                
            </div>
      
         </div>
  
             </div>
                    <asp:Button id="bb" runat="server" />

         <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="bb"  PopupControlID="Panel1"></asp:ModalPopupExtender>

         <asp:Panel ID="Panel1" runat="server" Width="600px" Height="144px" 
               style="display:grid">
             <div style="width: 550px; height:64px;">
                 <div style="background-color:#999999;opacity:0.9;height:100%; width: 550px; padding-top:30px">
                 <%--<asp:UpdatePanel ID="UpdatePanel4" runat="server">
                     <ContentTemplate>--%>
                 <table>
                     <tr>
                         <td  class="tdstyle" > Enter Name</td>
                         <td><asp:TextBox ID="txtcontracter" runat="server" Width="300px" ForeColor="Black"></asp:TextBox></td>
                    
                     <td>
                                                  <%--   <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>--%>
                         <asp:Button ID="btnAddcntr"  Width="50px" runat="server" Text="Add" OnClick="btnAddcntr_Click" CssClass="btnstyle"/>
                                  <%--  </ContentTemplate>
                                                         </asp:UpdatePanel>--%>
                                    </td>
                         <td >
                                                         <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <ContentTemplate>
                             <asp:Button ID="btnCancel1" runat="server" Text="Cancel" Width="80px" OnClick="Cancel_Click" CssClass="btnstyle" />
                                    </ContentTemplate>
                                                             </asp:UpdatePanel>

                     </td>
</tr>
                 </table>
                     </div>
                         <%--</ContentTemplate> 
                 </asp:UpdatePanel>--%>
             </div>

             </asp:Panel>

    </div>
    </form>
</body>
</html>
