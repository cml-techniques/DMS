<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dmsuploads1.aspx.cs" Inherits="CMLTechQ.DMS.dmsuploads1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
     <script src="../Assets/js/jquery.min.js"></script>

</head>
<body style="border-right:solid 5px #45818e;" class="inner fixed_background" onload="javascript:_autoAdjust();"  >
    <form id="form1" runat="server">
            <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
            <asp:Label ID="lblType" runat="server" Text="" style="display:none" ></asp:Label>
            <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
            <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none" ></asp:Label>
             <asp:Label ID="lblfcode" runat="server" Text="" style="display:none" ></asp:Label>
            <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
            <asp:Label ID="lbldocFolder" runat="server" Text="" style="display:none"></asp:Label>
        <div id="doc-container" >
            <div id="container-menu-bar">
               
                <div id="container-toggle" >
                    <a href="#" onclick="parent.toggle();"><img src="../Assets/img/expand-16.ico" alt="" /> </a> <%--<i class="icon-th"></i>--%>
                </div>
                <div id="container-menu" style="padding:3px">
                    <asp:Label ID="lblpagehead" runat="server" Text=""></asp:Label>
           <%--         <ul class="nav">
                        <li class="item"><a href="#" onclick="PageNavaigation(1)">O&M Manual</a></li>
                        <li class="item current"><a href="#">Manufacturers Information</a></li>
                        <li class="item"><a href="#" onclick="PageNavaigation(3)">As Builts Drawings</a></li>
                        <li class="item"><a href="#" onclick="PageNavaigation(4)">Test Documentation</a></li>
                    </ul>--%>
                </div>
                
            </div>
            <div id="main-content"  >
                <div class="head">
                    <h2 class="title"><asp:Label ID="pageinfo" runat="server" Text=""/></h2>
                </div>
               <div class="listcotainer">
                   <div class="listhead">
                       <h2 class="title pull-left"><asp:Label ID="lblhead" runat="server" Text=""/></h2>
                       <div class="actionbox pull-right">
                           <table style="width:100%">
                               <tr>
                                   <td>
                                       <asp:DropDownList ID="draction1" runat="server" Width="200px" CssClass="selectbox" >
                                           <asp:ListItem Text="Select Action" Value="0" Enabled="true"></asp:ListItem>
                                            <asp:ListItem Text="Upload New" Value="2" Enabled="true"></asp:ListItem>
                                       </asp:DropDownList></td>
                                   <td>
                                  <asp:Button ID="Button1" runat="server" Text="" CssClass="action" OnClick="Button1_Click" />
                                   </td>
                               </tr>
                           </table>
                       </div>
                   </div>
                   <div class="clearfix"></div>
                   <div class="listbox">
                       <asp:Repeater ID="datalist_latest" runat="server" Visible="true">
                           <HeaderTemplate>
                               <table  >
                                   <tr  >
                                       
                                       <td style="width:500px;text-align:left">Document Name</td>
                                       <td style="width:100px">Upload Date</td>
                                   </tr>
                               </table>
                           </HeaderTemplate>
                           <ItemTemplate>
                               <table >
                                   <tr class="item">
                                       <td  style="width:500px;text-align:left"><img src="../Assets/img/pdf-16.png" alt="" class="pull-left" style="margin-right:5px" />
                                           <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("DocView.aspx?ID={0}&FILE={1}", Eval("doc_id"),Eval("doc_name")) %>'><%# DataBinder.Eval(Container.DataItem, "doc_name") %>' </asp:HyperLink>
                                       </td>
                                       <td style="width:100px;">
                                           <asp:Label ID="Label4" runat="server" Text='<%#Eval("upload_date") %>'></asp:Label>
                                       </td>
                                   </tr> 
                               </table>
                           </ItemTemplate>
                       </asp:Repeater>
                   </div>
               </div>
               <div class="listcotainer">
                    <div class="listhead">
                       <h2 class="title pull-left"><asp:Label ID="lblhead1" runat="server" Text=""/></h2>
                       <div class="actionbox pull-right">
                           <table style="width:100%">
                           </table>
                       </div>
                   </div>
                   <div class="clearfix"></div>
                   <div class="listbox">
                       <asp:Repeater ID="datalist_previous" runat="server" Visible="true" >
                           <HeaderTemplate>
                               <table  >
                                   <thead>
                                        <tr  >
                                       <td style="width:500px;text-align:left">Document Name</td>
                                       <td style="width:100px">Upload Date</td>
                                   </tr>
                                   </thead>
                                   </HeaderTemplate>

                                 <ItemTemplate>
                                     <thead>
                                      <tr class="item">
                                       <td  style="width:500px;text-align:left"><img src="../Assets/img/pdf-16.png" alt="" class="pull-left" style="margin-right:5px" />
                                           <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("Docview.aspx?ID={0}&FILE={1}", Eval("doc_id"),Eval("doc_name")) %>'><%# DataBinder.Eval(Container.DataItem, "doc_name") %>' </asp:HyperLink>
                                       </td>
                                       <td style="width:100px;">
                                           <asp:Label ID="Label4" runat="server" Text='<%#Eval("upload_date") %>'></asp:Label>
                                       </td>
                                   </tr>
                                   
                               </thead>
                           </ItemTemplate>

                           <FooterTemplate>
                               </table>
                           </FooterTemplate>
                       </asp:Repeater>
                   </div>
               </div>

    </div>
    <div class="clear"></div>
            <div class="footer"></div>
        </div>
        
    
    </form>
        <script type="text/javascript">
            function _autoAdjust() {
                //alert(msieversion());
                var div = $("#main-content").height();
                var win = $(window).height();
                if (div < win) {
                    //if (msieversion() > 0) {
                    //    var win = $(window).height() - 40;
                    //}
                    //else {
                    //    var win = $(window).height() - 40;
                    //}
                    //$("#main-content").height(win);
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

                //var _auth1 = document.getElementById("lbluseridhidden");
                //var _auth2 = document.getElementById("lblprjid");
                //var _auth3 = document.getElementById("lblfolder");
                //var _auth4 = document.getElementById("lbltype");

                //if (type == 1) {

                //    parent.document.getElementById("content").src = "documentlist?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth4=" + _auth3.textContent + "&Auth5=" + id;

                //}
                //else if (type != _auth4.textContent) {

                //    parent.document.getElementById("content").src = "documentlist1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth4=" + _auth3.textContent + "&Type=" + type + "&Auth5=" + id;
                //}
                //else if (type == 4) {

                //    parent.document.getElementById("content").src = "documentlist3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth4=" + _auth3.textContent;
                //}
            }

            function openBarwindow() {
                var w = 400;
                var h = 180;
                var left = (screen.width / 2) - (w / 2);
                var top = (screen.height / 2) - (h / 2);
                window.open("UploadBarWindow.aspx", "Message", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

            }
    </script>
</body>
</html>
