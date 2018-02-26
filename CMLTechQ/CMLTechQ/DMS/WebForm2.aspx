<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="CMLTechQ.DMS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="../Assets/js/jquery.min.js"></script>
    <script src="../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
    <script type="text/javascript">

        function zom(type) {
             
            //window.parent.document.body.style.zoom


        //    if (navigator.userAgent.indexOf('Firefox') != -1 && parseFloat(navigator.userAgent.substring(navigator.userAgent.indexOf('Firefox') + 8)) >= 3.6) {

        //       // alert('mozilla');

        //        var a = document.getElementById("hid").value;

        //        if (type == 1) {
        //            a = parseFloat(a) + 0.1;

        //        }
        //        else {
        //            a = parseFloat(a) - 0.1;
        //        }

        //        $('body').css('-moz-transform', 'scale(' + a + ')');
        //        $('body').css('-moz-transform-origin', '0 0');


        //        document.getElementById("hid").value = a;

        //    }
        //    else {
        //        //alert('othet browse');


        //        var b = document.getElementById("hot").value;

        //        if (type == 1) {
        //            b = parseFloat(b) + 10;

        //        }
        //        else {
        //            b = parseFloat(b) - 10;
        //        }


        //        $('body').css('zoom', ' ' + b + '%');

        //        document.getElementById("hot").value = b;
        //    }

            
            }

        function onclose() {
            window.close();
        }
    </script>
     
</head>
<body style="background-color:olive">
    <form id="form1" runat="server">
    <div>
        <input type="hidden" id="hid" value="1" />
         <input type="hidden" id="hot" value="100" />
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div style="position:relative;width:500px;margin-left:auto;margin-right:auto">          
                   <div style="width:100%;text-align:center; height: 165px;">
                 <h1 style="color:#ffffff"> Loading Please wait....</h1>
            <asp:Image ID="imgload" runat="server" ImageUrl="../Assets/img/ajax-loader1.gif" />
        </div>  
              <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000">
             </asp:Timer>

        </div>

                   

      <%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <asp:Image ID="Image1" runat="server" ImageUrl="~/Assets/img/logo.jpg" />
                <br /><br />
                        <asp:Button runat="server" Text="+" ID="btn"  OnClientClick="zom(1);"/>&nbsp;&nbsp;
         <asp:Button runat="server" Text="-" ID="Button1"  OnClientClick="zom(2);"/>
                </ContentTemplate>
            </asp:UpdatePanel>--%>
    
    </div>
    </form>
</body>
</html>
