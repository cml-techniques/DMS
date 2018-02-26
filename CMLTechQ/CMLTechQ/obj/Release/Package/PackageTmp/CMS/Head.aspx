<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Head.aspx.cs" Inherits="CMLTechQ.CMS.Head" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function CallHome() {
            var _auth1=document.getElementById("lbluserhidden");
            parent.location.replace("../CMLT?Auth1=" + _auth1.textContent);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>
        <div class="wrapper row1">
            <div id="header">
                <div id="header-nav">
                    <ul>
                        <li><a href="#" onclick="CallHome();">Home</a></li>
                        <li><a href="#">Management</a></li>
                        <li><a href="#">Help</a></li>
                    </ul>
                </div>
                <div id="login-info">
                    <%--<p>Administrator [admin@cmlinternational.net]</p>
                    <span class="time">8:14:56</span>
                    <span class="date" style="color:#ccc">Tuesday 10 September 2013</span>--%>
                   
                    <label class="block clearfix">
                    <span class="block input-icon input-icon-left">
                   
                    <input class="search-control" type="text" placeholder="search" value="" id="Text1" runat="server" /><i class="icon-search" style="color:#073763"></i>
                        </span>
                        </label>
                    <div class="options pull-right">
                        <a href="#"><i class="icon-envelope"></i></a>
                         <a href="#"><i class="icon-power-off"></i></a>
                    </div>
                </div>
                <div class="inner-logo"></div>
                <p class="title">
                    <asp:Label ID="lblprjinfo" runat="server" Text=""></asp:Label></p>
                <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
            </div>
        </div>
    
    </form>
</body>
</html>
