<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Head.aspx.cs" Inherits="CMLTechQ.DMS.Head" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: Web Based Document Management</title>
    <meta name="author" content="CML Techniques" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%: Styles.Render("~/Content/css") %>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lbluserhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <div class="wrapper">
            <div id="innerheader">
                <div id="header-nav">
                    <ul>
                        <li><a href="#" onclick="CallHome();">Home</a></li>
                        <li><a href="#">Management</a></li>
                        <li><a href="#">Help</a></li>
                    </ul>
                </div>
                <div id="login-info">
                    <ul class="logininfo">
                        <li>
                            <label class="block clearfix">
                                <span class="block input-icon input-icon-left">

                                    <input class="search-control" type="text" placeholder="search" name="zoom_query" id="zoom_query" onkeydown="switchmode(event);" /><a href="#" class="input-icon-left" style="color: #353535"><i class="icon-search" style="color: #353535"></i></a><%--onclick="CallSearch();"--%>
                                </span>
                            </label>
                        </li>
                        <li><a href="#"><i class="icon-envelope"></i></a></li>
                        <li><a href="#" onclick="CallLogoff();"><i class="icon-power-off"></i></a></li>
                    </ul>
                    <%--<p>Administrator [admin@cmlinternational.net]</p>
                    <span class="time">8:14:56</span>
                    <span class="date" style="color:#ccc">Tuesday 10 September 2013</span>--%>
                    <%--<div class="search-box" style="width:260px">
                       
                   <%-- <div class="clear"></div>--%>
                    <%-- </div>--%>
                    <%--<div class="options pull-right" style="float:right;width:70px" >
                        <a href="#"><i class="icon-envelope"></i></a>
                         <a href="#"><i class="icon-power-off"></i></a>
                    </div>--%>
                </div>
                <div class="inner-logo"></div>
                <p class="title">
                    <asp:Label ID="lblprjinfo" runat="server" Text=""></asp:Label></p>
                <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
            </div>
        </div>
    </form>
    <script async type="text/javascript">
        function CallHome() {
            var _auth1 = document.getElementById("lbluserhidden");
            parent.location.replace("../CMLT?Auth1=" + _auth1.textContent);
        }
        function CallSearch() {
            var _searchstring = document.getElementById("zoom_query");
            parent.document.getElementById("content").src = "Script/Search?zoom_query=" + _searchstring.value;
        }
        function switchmode(evt) {
            if (evt.keyCode == 13) {
                CallSearch();
            }
        }
        function CallLogoff() {
            var _auth1 = document.getElementById("lbluserhidden");
            parent.location.replace("../AuthLogin.aspx");
        }
    </script>
</body>
</html>
