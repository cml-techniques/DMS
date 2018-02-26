<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OandmManaualupload.aspx.cs" Inherits="CMLTechQ.DMS.OandmManaualupload" %>
<%@ Register Assembly="com.flajaxian.FileUploader" Namespace="com.flajaxian" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
        <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />

     <script src="../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>

        <script type="text/javascript">
            function _setdefault() {
                var _chk = document.getElementById('chkremind').checked;
                var _txt1 = document.getElementById('time');
                var _txt2 = document.getElementById('remind1');
                var _txt3 = document.getElementById('remind2');
                var _txt4 = document.getElementById('remind3');
                if (_chk == true) {
                    _txt1.value = "30";
                    _txt2.value = "10";
                    _txt3.value = "15";
                    _txt4.value = "20";
                    _txt1.disabled = true;
                    _txt2.disabled = true;
                    _txt3.disabled = true;
                    _txt4.disabled = true;
                }
                else {
                    _txt1.value = "";
                    _txt2.value = "";
                    _txt3.value = "";
                    _txt4.value = "";
                    _txt1.disabled = false;
                    _txt2.disabled = false;
                    _txt3.disabled = false;
                    _txt4.disabled = false;
                }
            }
            </script>
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600"></asp:ScriptManager>
            <div id="container-menu-bar">
               
                <div id="container-toggle" >
                    <a href="#"><i class="icon-th"></i></a>
                </div>
                <div id="container-menu">
                    <ul class="nav">
                        <li class="item "><a ><asp:Label ID="fileinfo" runat="server" Text=""></asp:Label></a></li>
                    </ul>
                    
                </div>
                <a class="pull-right back" href="javascript:history.go(-1)"><i  class="icon-backward"></i></a>
            </div>

    <div>
         <asp:Label ID="lblprj" runat="server" Text="" style="display:none"/>
         <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"/>
         <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
        <asp:Label ID="lblServid" runat="server" Text="" style="display:none"/>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"/>
        <br />
       
        <table style="width:50%;margin-left:auto;margin-right:auto">
           
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">
                                    <asp:Label ID="manufctr0" runat="server">Contractor</asp:Label>
                                </td>
                <td>                                
                                    <asp:DropDownList ID="drpContractor" runat="server" Width="300px">
                                    </asp:DropDownList>                                   
                                            <asp:Button ID="cmdnew" runat="server" Font-Names="Arial" Font-Size="X-Small" 
                                                ForeColor="Red" onclick="cmdnew_Click" Text="New" Width="40px" />
                                      
                                    <asp:Panel ID="Panel1" runat="server">
                                        <asp:TextBox ID="txtnewContractor" runat="server"  ForeColor="Black"                                Width="280px" ></asp:TextBox>
                                        <asp:Button ID="cmdadd" runat="server" Font-Names="Arial" Font-Size="X-Small" ForeColor="Red" onclick="cmdadd_Click" Text="Add" Width="40px" />
                    </asp:Panel>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>

              
                <td class="auto-style24">
                    
                                    Select File</td>
                <td>                                  
                 <input id="myupload" type="file" class="multi" runat="server" />
                </td>
                <td>&nbsp;</td>

               
            </tr>
            <tr>
                <td class="auto-style24">
                                    &nbsp;</td>
                <td>                                
                                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td>
                                    <table style="width:100%;">
                                        <tr>
                                            <td >Time Limit ()</td>
                                            <td><asp:TextBox ID="time" runat="server" ForeColor="Black"
                                                    Font-Names="Arial,Helvetica,sans-serif" Font-Size="X-Small" 
                                                     Width="38px">0</asp:TextBox>
                                            </td>
                                            <td >Days</td>
                                            <td >Second Reminder after</td>
                                            <td >
                                                <asp:TextBox ID="remind2" runat="server" ForeColor="Black"
                                                    Font-Names="Arial,Helvetica,sans-serif" Font-Size="X-Small" 
                                                     Width="38px">0</asp:TextBox></td>
                                            <td>Days</td>
                                        </tr>
                                        <tr>
                                            <td >First Reminder after</td>
                                            <td >
                                                <asp:TextBox ID="remind1" runat="server" ForeColor="Black"
                 
                                                     Width="38px">0</asp:TextBox></td>
                                            <td >Days</td>
                                            <td >Third Reminder after</td>
                                            <td >
                                                <asp:TextBox ID="remind3" runat="server" ForeColor="Black"
                                                    Font-Names="Arial,Helvetica,sans-serif" Font-Size="X-Small" 
                                                     Width="38px">0</asp:TextBox></td>
                                            <td>Days</td>
                                        </tr>
                                        </table>
                                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >&nbsp;</td>
                <td>
<input id="chkremind" type="checkbox" onclick="_setdefault();"  style="width:20px;margin-left:auto; margin-right:auto;vertical-align:bottom"/>Use Global Settings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input id="emailNotification1" type="checkbox" runat="server" style="width:20px;vertical-align:bottom"/>Email Notification
                                            </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td>

                                            <asp:Button ID="cmdupload" runat="server"  
                                                Font-Names="Arial,Helvetica,sans-serif" Font-Size="X-Small" ForeColor="Red" 
                                                 Text="Upload" Width="100px" OnClick="cmdupload_Click" />
                                            <asp:Button ID="cancel" runat="server" Font-Names="Arial,Helvetica,sans-serif" 
                                                Font-Size="X-Small" ForeColor="Red"  Text="Cancel" />

                                                
                                        
                                    
                                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
    <p>

    <p>
&nbsp;</p>

</body>
</html>
