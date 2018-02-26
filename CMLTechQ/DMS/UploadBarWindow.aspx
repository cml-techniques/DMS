<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadBarWindow.aspx.cs" Inherits="CMLTechQ.DMS.UploadBarWindow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <script type="text/javascript">
           function onclose() {
               window.close();
               //self.close();
           }
         </script>
</head>
<body style="background-color: #3e838c">
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div style="position:relative;width:100%;margin-left:auto;margin-right:auto">          
                   <div style="width:100%;text-align:center; height: 100%;">
                 <h2 style="color:#ffffff; font-family: 'Open Sans', sans-serif"> Uploading please wait....</h2>
            <asp:Image ID="imgload" runat="server" ImageUrl="../Assets/img/ajax-loader1.gif" />
        </div>  
        </div>
         <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000">
             </asp:Timer>
    </form>
</body>
</html>
