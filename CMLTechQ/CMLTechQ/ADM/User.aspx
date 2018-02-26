<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="CMLTechQ.ADM.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Assets/css/style.css" type="text/css" />
    <%--<link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />--%>
    <link href="Assets/css/accordin.css" rel="stylesheet" />
    <script type="text/javascript">
        function CallManagement(id) {
            var _auth = document.getElementById("lbluserhidden");
            if (id == 1) {
                parent.location.replace("../CMLT?Auth1=" + _auth.textContent);
            }
        }
        function check(id) {
            alert('yes');
        }
    </script>
</head>
<body >
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none" ></asp:Label>
                <asp:Label ID="lbluserid" runat="server" Text="" style="display:none" ></asp:Label>
        <div class="head clearfix">
      <h1>CML Techniques</h1>
      <ul>
        <li><a href="#" onclick="CallManagement(1);">Home</a></li>
        <li><a href="#">Management</a></li>
        <li><a href="#">Messages</a></li>
        <li><a href="#">Help</a></li>
      </ul>
    </div>
    <div class="wrapper">
      <div class="new-form">
        <div class="form-head">
          <h2>User Management - New User</h2>
        </div>
        <div class="form-nav">
        <ul>
        <li  class="button"><a href="index.html">New</a></li>
            <li class="button"><a href="edit.html">Edit</a></li>
        </ul>
        </div>
        <div class="form-entry">
          <div>
            <label for="name">Name</label>
              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <label for="email">Email</label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="textcontrol"></asp:TextBox>
            <label for="company">Company</label>            
              <asp:DropDownList ID="drcompany" runat="server">
              </asp:DropDownList>
            <label for="position">Position</label>
             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

            <label for="group">Group</label>
              <asp:DropDownList ID="drusergroup" runat="server">
                  <asp:ListItem Text="Group..." Value="0" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="Admin" Value="1" ></asp:ListItem>
                  <asp:ListItem Text="Standard" Value="2" ></asp:ListItem>
                  <asp:ListItem Text="View Only" Value="3" ></asp:ListItem>
              </asp:DropDownList>
            <label for="modules">Modules</label>
              <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                  <ContentTemplate>
                      <asp:TextBox ID="txtmodule" runat="server" CssClass="textcontrol"></asp:TextBox>
                      <ajaxToolkit:DropDownExtender runat="server" Enabled="True" TargetControlID="txtmodule" ID="txtmodule_DropDownExtender" DropDownControlID="modules"  ></ajaxToolkit:DropDownExtender>
                  </ContentTemplate>
              </asp:UpdatePanel>
              
              <%--<asp:DropDownList ID="drmodule" runat="server">
                  <asp:ListItem Text="Modules..." Value="0" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="CMS" Value="1" ></asp:ListItem>
                  <asp:ListItem Text="DMS" Value="2" ></asp:ListItem>
                  <asp:ListItem Text="AMS" Value="3" ></asp:ListItem>
                  <asp:ListItem Text="SNS" Value="3" ></asp:ListItem>
              </asp:DropDownList>--%>
              
              <input type="submit" value="Save" />
            <input type="submit" value="Cancel" id="last-sub" />
          </div>
          
        </div>
          <div id="modules" style="width:320px;background-color:#0094ff;">
              <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                  <ContentTemplate>
                      <asp:CheckBoxList ID="chkmodules" runat="server" AutoPostBack="true" OnSelectedIndexChanged="chkmodules_SelectedIndexChanged" >
                  <asp:ListItem Text="CMS" Value="1" ></asp:ListItem>
                  <asp:ListItem Text="DMS" Value="2" ></asp:ListItem>
                  <asp:ListItem Text="AMS" Value="3" ></asp:ListItem>
                  <asp:ListItem Text="SNS" Value="3" ></asp:ListItem>
              </asp:CheckBoxList>
                  </ContentTemplate>
              </asp:UpdatePanel>
              
              <%--<div>
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                      <ContentTemplate>
                          <asp:Button ID="Button1" runat="server" Text="Ok" />
                      </ContentTemplate>
                  </asp:UpdatePanel>
              </div>--%>
          </div>
        <div class="proj-select">
          <h3>Select Projects</h3>
          <%--<div class="accordion" rel="1">
              <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
          </div>--%>
            <div style="overflow-y:auto;overflow-x:hidden;height:350px;" >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                         <asp:Repeater ID="rptmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound">
                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate>

                        <div id="DataDiv" class="accordion" rel="1">
                            <div id='h<%#Container.ItemIndex %>' class="rptheader"  >
                                <table>
                                    <tr>
                                        <td><asp:CheckBox ID="chkmain" runat="server" CssClass="mycheck" OnCheckedChanged="chkmain_CheckedChanged" AutoPostBack="true" /></td>
                                        <td class='region-class' onclick="getdata(<%#Container.ItemIndex %>);" ><%# Eval("Region") %><asp:Label ID="lblregion" runat="server" Text='<%# Eval("Region") %>' style="display:none"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                            <div id='d<%#Container.ItemIndex %>' style="display:none" class="sub accordion-inner">
                                        <asp:Repeater ID="rptdetails" runat="server">
                                            <HeaderTemplate>
                                                <table id="repeaterTable">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="chkrow" runat="server" CssClass="mycheck" /></td>
                                                    <td class='prj-class'><%# Eval("Prj_Name") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            
                                            <FooterTemplate>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
</div>
                        <div class="checkbottom"></div>
                    </ItemTemplate>
                </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
               
            </div>
        </div>     
  </div>
  </div>
        <script type="text/javascript" src="Assets/js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="Assets/js/shortcodes.js"></script>
        <script type="text/javascript">
            function toggle() {
                $('.accordion .accordion-title Label').click(function () {
                    //alert('clicked');
                    if ($(this).parent().next().is(':hidden')) {
                        $(this).parent().parent().find('.accordion-title').removeClass('active').next().slideUp(200);
                        $(this).parent().toggleClass('active').next().slideDown(200);
                    }
                    return false;
                });
            }
            function toggle() {
                $('.accordion .accordion-title Label').click(function () {
                    //alert('clicked');
                    if ($(this).parent().next().is(':hidden')) {
                        $(this).parent().parent().find('.accordion-title').removeClass('active').next().slideUp(200);
                        $(this).parent().toggleClass('active').next().slideDown(200);
                    }
                    return false;
                });
            }
            //function getdata(id) {
            //    var e = document.getElementById('R' + id);
            //    if ($('#R' + id).next().is(':hidden')) {
            //        $('.accordion').find('.accordion-title').removeClass('active').next().slideUp(200);
            //        $('#R' + id).toggleClass('active').next().slideDown(200);

            //    }
            //}
            function getdata(id) {
                var e = document.getElementById('d' + id);
                $('.accordion').each(function () {
                    var acc = $(this).attr("rel") * 2;
                    $(this).find('.accordion-inner:nth-child(' + acc + ')').hide();
                });
                //if ($('#d' + id).next().is(':hidden')) {
                    //        $('.accordion').find('.accordion-title').removeClass('active').next().slideUp(200);
                            //$('#d' + id).toggleClass('active').next().slideDown(200);

                    //    }
                //if (e) {
                            if (e.style.display == 'none') {
                                //$("d" + id).toggleClass('active').next().slideDown(200);
                        e.style.display = 'block';
                        e.style.visibility = 'visible';
                        //_changeActive(id);
                        ////_changeActive();
                    }
                    else {
                        e.style.display = 'none';
                        e.style.visibility = 'hidden';
                        //_changeInActive();
                        //_changeInActive(id);
                    }

                //}

            }
        </script>
    </form>
</body>
</html>
