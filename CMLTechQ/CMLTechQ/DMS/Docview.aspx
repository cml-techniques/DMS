<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Docview.aspx.cs" Inherits="CMLTechQ.DMS.Docview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../AMS/css/font-awesome.min.css" rel="stylesheet" />

    <%--<script src="../Assets/js/jquery.min.js"></script>--%>
</head>
<body style="overflow: hidden">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600"></asp:ScriptManager>
        <asp:Label ID="lbldocId" runat="server" Text="" Style="display: none"></asp:Label>
        <div id="doc-container" style="top: 0px; overflow: hidden;">
            <div id="main-content">
                <%-- <div id="container-menu">
                    <ul class="nav">
                        <li class="item "><a ><asp:Label ID="fileinfo" runat="server" Text=""></asp:Label></a></li>
                    </ul>
                    <a class="pull-right back" href="javascript:history.go(-1);"><i  class="icon-backward"></i> Back</a>
                </div>--%>
                <div class="head">
                    <div class="headtitle">
                        <h2 class="title">
                            <asp:Label ID="fileinfo" runat="server" Text=""></asp:Label>
                        </h2>
                    </div>
                    <div class="action-menu ">
                        <a href="javascript:history.go(-1);" class="control-general control-button-white-1 push_button pull-right" ><i class="fa fa-angle-double-left"></i>BACK</a>
                    </div>
                </div>
            </div>
            <%--<div id="main-content" >--%>
            <div id="viewer" style="top: 40px; bottom: 0px; left: 0px; right: 0px; position: absolute;">
                <iframe src="" runat="server" id="documentviewer" style="border: 0; height: 100%; width: 100%; position: relative"></iframe>
            </div>
            <%--</div>--%>
            <div class="clear"></div>
        </div>
    </form>
</body>
</html>
