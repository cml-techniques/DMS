<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFullDocument.aspx.cs" Inherits="CMLTechQ.DMS.ViewFullDocument" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>O&M Manual View</title>
    <link href="../Assets/css/Layout.css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
  <%--  <link href="../Assets/AMS/css/font-awesome.min.css" rel="stylesheet" />--%>
    <style type="text/css">
.pulldownbar .togglemenuright {
    display: inline;
    float: right;
    padding:2px 0px 5px;
}
.pulldownbar .titles{
    display:inline-block;
    height:40px;
    margin-top:3px;
    margin-left:10px;
    font-size: 14px;
}
.pulldownbar .togglemenuright a {
    color: #ffffff;
    font-size: 14px;
}
#docview_area .pulldownbar {
    display: inline-block;
    padding:1px 0px;
}
element {
    padding: 3px 0px;
}
.pulldownbar .title {
    display: inline-block;
    padding:7px 0px;
    font-size: 14px;
    vertical-align: middle;
}

    </style>
</head>
<body  style="overflow: hidden;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <input id="hfolder" type="hidden" runat="server" />
        <input id="hpos" type="hidden" runat="server" />
        
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
   
        
        <div id="docview_area">
            <div class="pulldownbar" style="height:33px">
                <div class="togglemenu" style="padding:6px 5px">
                    <a href="#" title="Toggle Sidebar" data-prl-offcanvas="{target:'#offcanvas-search'}"><i class="fa fa-navicon"></i></a> 
                </div>
                 <div class="title">
                     <asp:Label ID="lbl_doctitle" runat="server" Text="" ></asp:Label>
                </div>
               <div class="togglemenuright">
                   <a href="#" onclick="CallBack();" class="control-general control-button-white push_button pull-right"><i class="icon-backward"></i> BACK</a>
               </div>
            </div>
            <div class="container" style="top:38px">
                <div class="docpanel" style="right:5px;">
                    <iframe runat="server" id="documentviewer" class="pdf-viwer"></iframe>
                </div>
            </div>
        </div>

        <asp:Label ID="lblid" runat="server" Text="" Style="display: none"></asp:Label>
        <div id="offcanvas-search" class="prl-offcanvas">
            <div class="prl-offcanvas-bar">
                <div class="inner">
                    <div id="nav-bar" style="top: 5px;">


                        <ul class="topnav">
                            <li class="item"><a href="#" onclick="gocreate();" title="Create Folder"><i class="fa fa-folder"></i></a></li>
                            <li class="item"><a href="#" style="font-size: 16px"><i class="fa fa-file-o"></i></a></li>
                            <li class="item"><a href="#" onclick="gomove(1);" title="Move Up"><i class="fa fa-arrow-circle-up"></i></a></li>
                            <li class="item"><a href="#" onclick="gomove(2);" title="Move Down"><i class="fa fa-arrow-circle-down"></i></a></li>
                            <li class="item"><a href="#" onclick="goedit();"><i class="fa fa-edit" title="Edit Folder"></i></a></li>
                            <li class="item"><a href="#" onclick="godelete();" title="Delete Folder"><i class="fa fa-trash-o"></i></a></li>
                        </ul>


                    </div>
                    <div class="clear"></div>
                    <div id="navbar" style="top: 40px;">

                        <div id="nav-menu">

                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <asp:PlaceHolder ID="ph_nav" runat="server"></asp:PlaceHolder>

                                </ContentTemplate>

                            </asp:UpdatePanel>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">

            function CallBack() {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");

                location.replace("Project?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent);

            }
        </script>
    </form>
</body>
</html>
