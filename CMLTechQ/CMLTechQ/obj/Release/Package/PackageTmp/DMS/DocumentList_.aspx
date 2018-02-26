<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentList_.aspx.cs" Inherits="CMLTechQ.DMS.DocumentList_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
     <script src="../Assets/js/jquery.min.js"></script>
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

    </script>
</head>
<body style="border-right:solid 5px #45818e;" class="inner fixed_background" onload="javascript:_autoAdjust();"  >
    <form id="form1" runat="server">
        <div id="doc-container" >
            <div id="container-menu-bar">
               
                <div id="container-toggle" >
                    <a href="#" onclick="parent.toggle();"><img src="../Assets/img/expand-16.ico" alt="" /> </a> <%--<i class="icon-th"></i>--%>
                </div>
                <div id="container-menu">
                    <ul class="nav">
                        <li class="item current"><a href="#">O&M Manual</a></li>
                        <li class="item"><a href="#">Manufacturers Information</a></li>
                        <li class="item"><a href="#">As Builts Drawings</a></li>
                        <li class="item"><a href="#">Test Documentation</a></li>
                    </ul>
                </div>
                
            </div>
            <div id="main-content"  >
                <div class="head">
                    <h2 class="title">1.4 - Car Park Ventillation Fans</h2>
                </div>
               <div class="listcotainer">
                   <div class="listhead">
                       <h2 class="title pull-left">Latest Version of O&M Manual</h2>
                       <div class="actionbox pull-right">
                           <table style="width:100%">
                               <tr>
                                   <td>
                                       <asp:DropDownList ID="draction1" runat="server" Width="200px" CssClass="selectbox" >
                                           <asp:ListItem Text="Select Action" Value="0" Enabled="true"></asp:ListItem>
                                       </asp:DropDownList></td>
                                   <td>
                                       <asp:Button ID="Button1" runat="server" Text="" CssClass="action" />
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
                                   <thead>
                                   <tr  >

                                       <td style="width:400px;text-align:left" colspan="2">Document Title</td>
                                       <td style="width:100px">Revision</td>
                                       <td style="width:100px">Status</td>
                                       <td style="width:150px">Uploaded By</td>
                                       <td style="width:150px">Upload Date</td>
                                       <td  style="width:100px">Comments</td>
                                   </tr>
                               </thead>
                           </HeaderTemplate>
                           <ItemTemplate>
                               <tbody >
                                   <tr class="item">
                                       <td><img src="../Assets/img/pdf-16.png" alt="" class="pull-left" style="margin-right:5px" /></td>
                                       <td  style="width:400px;text-align:left">
                                           <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("DocViewOM.aspx?ID={0}&FILE={1}", Eval("doc_id"),Eval("doc_name")) %>'><%# DataBinder.Eval(Container.DataItem, "doc_name") %>' </asp:HyperLink>
                                       </td>
                                       <td style="width:100px;"> 
                                           <asp:Label ID="Label2" runat="server" Text='<%#Eval("version") %>'></asp:Label>
                                       </td>
                                       <td style="width:100px;">
                                           <asp:Label ID="Label3" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                       </td>
                                       <td style="width:150px;">
                                           <asp:Label ID="Label4" runat="server" Text='<%#Eval("uploaded_by") %>'></asp:Label>
                                       </td>
                                       <td style="width:150px;">
                                           <asp:Label ID="Label5" runat="server" Text='<%#Eval("udate") %>'></asp:Label>
                                       </td>
                                       <td style="width:100px;">
                                           <a href="#"><asp:Label ID="Label6" runat="server" Text='<%#Eval("comments") %>'></asp:Label></a> / <a href="#"><asp:Label ID="Label7" runat="server" Text='<%#Eval("comments") %>'></asp:Label></a>
                                           
                                       </td>
                                   </tr>
                                   
                               </tbody>
                           </ItemTemplate>
                           <FooterTemplate>
                               </table>
                           </FooterTemplate>
                       </asp:Repeater>
                   </div>
               </div>
               <div class="listcotainer">
                    <div class="listhead">
                       <h2 class="title pull-left">Previous Version of O&M Manual</h2>
                       <div class="actionbox pull-right">
                           <table style="width:100%">
                               <tr>
                                   <td>
                                       <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" CssClass="selectbox" >
                                           <asp:ListItem Text="Select Action" Value="0" Enabled="true"></asp:ListItem>
                                       </asp:DropDownList></td>
                                   <td>
                                       <asp:Button ID="Button2" runat="server" Text="" CssClass="action" />
                                   </td>
                               </tr>
                           </table>
                       </div>
                   </div>
                   <div class="clearfix"></div>
                   <div class="listbox">
                       <asp:Repeater ID="datalist_previous" runat="server" Visible="true">
                           <HeaderTemplate>
                               <table  >
                                   <thead>
                                        <tr  >
                                       <td style="width:400px;text-align:left">Document Title</td>
                                       <td style="width:100px">Revision</td>
                                       <td style="width:100px">Status</td>
                                       <td style="width:150px">Uploaded By</td>
                                       <td style="width:150px">Upload Date</td>
                                       <td  style="width:100px">Comments</td>
                                   </tr>
                                   </thead>
                                   </HeaderTemplate>

                                 <ItemTemplate>
                                     <thead>
                                                                  <tr class="item">
                                       <td  style="width:400px;text-align:left"><img src="../Assets/img/pdf-16.png" alt="" class="pull-left" style="margin-right:5px" />
                                           <asp:HyperLink ID="HyperLink1" runat=server NavigateUrl='<%# String.Format("Docview.aspx?ID={0}&FILE={1}", Eval("doc_id"),Eval("doc_name")) %>'><%# DataBinder.Eval(Container.DataItem, "doc_name") %>' </asp:HyperLink>
                                       </td>
                                       <td style="width:100px;"> 
                                           <asp:Label ID="Label2" runat="server" Text='<%#Eval("version") %>'></asp:Label>
                                       </td>
                                       <td style="width:100px;">
                                           <asp:Label ID="Label3" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                       </td>
                                       <td style="width:150px;">
                                           <asp:Label ID="Label4" runat="server" Text='<%#Eval("uploaded_by") %>'></asp:Label>
                                       </td>
                                       <td style="width:150px;">
                                           <asp:Label ID="Label5" runat="server" Text='<%#Eval("udate") %>'></asp:Label>
                                       </td>
                                       <td style="width:100px;">
                                           <a href="#"><asp:Label ID="Label6" runat="server" Text='<%#Eval("comments") %>'></asp:Label></a> / <a href="#"><asp:Label ID="Label7" runat="server" Text='<%#Eval("comments") %>'></asp:Label></a>
                                           
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
</body>
</html>
