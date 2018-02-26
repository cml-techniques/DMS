<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthLogin.aspx.cs" Inherits="CMLTechQ.AuthLogin" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: User Login</title>
    <meta name="author" content="CML Techniques" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%--<%: Styles.Render("~/Content/css") %>--%>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <script type = "text/javascript" >
        function changeHashOnLoad() {
            window.location.href += "#";
            setTimeout("changeHashAgain()", "50");
        }

        function changeHashAgain() {
            window.location.href += "1";
        }

        var storedHash = window.location.hash;
        window.setInterval(function () {
            if (window.location.hash != storedHash) {
                window.location.hash = storedHash;
            }
        }, 50);

      
</script>
    <script type="text/javascript">

        function load_css_async(filename) {


            var cb = function () {
                var l = document.createElement('link'); l.rel = 'stylesheet';
                l.href = filename;
                var h = document.getElementsByTagName('head')[0]; h.parentNode.insertBefore(l, h);
            };
            var raf = requestAnimationFrame || mozRequestAnimationFrame ||
                webkitRequestAnimationFrame || msRequestAnimationFrame;
            if (raf) raf(cb);
            else window.addEventListener('load', cb);


        }
        
    </script>
    <%--<%: Styles.RenderFormat("<script type=\"text/javascript\">load_css_async('{0}')</script>", "~/Content/css") %>--%>
</head>
<body class="login" onload="changeHashOnLoad();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="wrapper row1">
            <div id="header">
                <div id="header-nav">
                    <ul>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div id="login-info"></div>
                <div class="logo"></div>
            </div>
        </div>
        <div class="wrapper row2">
            <div id="container">
                <h1>CML TECHNIQUES</h1>
                <h2 class="_300">Web Based Document Management</h2>
                <div id="login-box">
                    <p style="text-align: left; margin: 0px 6px 3px; color: #353535;"><i class="icon-info-sign blue"></i>Please enter your login details below</p>
                    <div class="login-box">
                        <span class="block input-icon input-icon-right">
                            <asp:TextBox ID="txt_uid" runat="server" CssClass="form-control" placeholder="User ID" Style="background-color: #ffffff!important;"></asp:TextBox><i class="icon-user"></i>
                        </span>
                        <span class="block input-icon input-icon-right" style="margin-top: 2px;">
                            <asp:TextBox ID="txt_pwd" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" Style="background-color: #ffffff!important;"></asp:TextBox><i class="icon-lock"></i>
                        </span>





                        <div class="clearfix" style="padding-left: 3px;">
                            <table style="width: 340px; margin: 0 auto;" border="0">
                                <tr>
                                    <td style="width: 100px">

                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="width-35 pull-left btn btn-primary" OnClick="btnlogin_Click" CausesValidation="false" Style="display: none;" />
                                                <button class="width-35 btn btn-primary" type="button" onclick="Click_Login();">Login</button>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </td>
                                    <td style="width: 100px">
                                        <button class="width-35 btn btn-primary" type="button" onclick="forgotPop()">Forgot?</button>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                                         <asp:Button ID="btnforgotpwd" runat="server" Text="Forgot?" CssClass="width-35 pull-left btn btn-primary" OnClick="btnforgotpwd_Click" style="display:none;"  />
                                       </ContentTemplate>
                                            </asp:UpdatePanel>
                                    </td>
                                    <td style="vertical-align: middle; text-align: right; width: 140px; padding-right: 5px;">
                                        <label class="inline">
                                            <input class="ace" type="checkbox" id="rememberme" runat="server" /><span class="lbl">  Remember me</span>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                                <ProgressTemplate>
                                    <asp:Image ID="imgload" runat="server" ImageUrl="Assets/img/ajax-loader.gif" Width="43" Height="11" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
          </telerik:RadWindowManager>
          <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="Email Password" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro"  VisibleStatusbar="false" Height="150px"   Width="490px" >
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div style="padding: 10px 0px">
                                 <table style="width:100%;color:#353535;" cellspacing="0" cellpadding="0">
                                      
                                      <tr>
                                    <td style="height:5px"></td>
                                 </tr>
                                <tr>
                                    <td style="color:black;">  User Id &nbsp; </td>
                                    <td>
                                   <asp:TextBox ID="txtforgot" CssClass="control-textbox-2" Width="400px" runat="server"></asp:TextBox>
                                    </td>

                                </tr>
                                      <tr>
                                    <td style="height:10px"></td>
                                 </tr>
                                     <tr>
                                         <td></td>
                                    <td >
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnemailpwd" runat="server" OnClick="btnemailpwd_Click" Text="Email Password" CssClass="control-general control-button-green push_button" Width="125px" />
                                                </td>
                                                <td>
                                                <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="control-general control-button-yellow1 push_button" OnClick="btncancel_Click" Width="125px" />

                                                </td>
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
       <input id="clientTime" type="hidden" value="" runat="server"/>
        <input id="clientIp" type="hidden" value="" runat="server"/>
    </form>
    <script async type="text/javascript">
        function call_home(id) {
            location.replace("CMLT?Auth1=" + id);
        }
        function call_redirect(id, _pid, _value) {
            location.replace("DMS/Project?Auth1=" + id + "&Auth2=" + _pid + "&Auth3=" + _value);
        }
        function Click_Login() {
            var btn = document.getElementById("btnlogin");
            btn.click();
        }
        function forgotPop() {
            var btn = document.getElementById("btnforgotpwd");
            btn.click();
        }
        function getClientTimeZone() {
            var d = new Date();
            document.getElementById("clientTime").value = d.format("dd/MM/yyyy hh:mm:ss tt");;
            var ip = '<%=Request.ServerVariables["REMOTE_ADDR"]%>';
            document.getElementById('clientIp').value = ip;
        }
        getClientTimeZone();
    </script>

</body>
</html>
