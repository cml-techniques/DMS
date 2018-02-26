 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageFileUpload.aspx.cs" Inherits="CMLTechQ.DMS.ImageFileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
        <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
        <link href="../Assets/css/OwnStyle.css" rel="stylesheet" />
    <title></title>
         <script type="text/javascript">
             //function ShowAddImage() {
             //    var _auth3 = document.getElementById("lblindex").innerText;
             //    window.parent.ShowAddImage(_auth3);

             //}
             function closeAddImage() {
                 var _auth3 = document.getElementById("lblindex").innerText;
                 window.parent.closeAddImage(_auth3);
             }
         </script>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
          <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblindex" runat="server" Text="" style="display:none"></asp:Label>
    <div>
         <table style="padding:35px 0px">
                           <tr>
                               <td>
                                    <input type="file" id="file1" class="multi" runat="server" />
                               </td>
                               <td>
                                    <%--<input class="actbtn light w70" type="button"  value="Add" id="Button1" runat="server" style="line-height:17px" onclick="closeAddImage();" />--%>
                                   <asp:Button ID="btnadd" runat="server" Text="Save"  Width="62px" CssClass="actbtn light" OnClick="btnadd_Click" />
                               </td>
                                <td> 
                                    <%--<input class="actbtn light w70" type="button"  value="Exit" id="Button2" runat="server" style="line-height:17px" onclick="closeAddImage();" />--%>
                                    <asp:Button ID="btnexit" runat="server" Width="62px" Text="Exit" OnClientClick="closeAddImage();" CssClass="actbtn light" />
                                </td>
                           </tr>
                       </table>
                      
    
    </div>
    </form>

</body>
</html>
