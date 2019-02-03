<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocument.aspx.cs" Inherits="CMLTechQ.DMS.ViewDocument" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Assets/css/Layout.css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../AMS/css/font-awesome.min.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="../Editor/tiny_mce.js"></script>

    <script src="../Assets/js/jquery.min.js"></script>

    <script type="text/javascript">

        <!--[if IE]><iframe class="cover" src="about:blank"></iframe><![endif]-->
    tinyMCE.init({
        mode: "textareas",
        width: "100%",
        theme: "advanced",
        statusbar: false,
        theme_advanced_buttons1: "mylistbox,mysplitbutton,bold,italic,underline,separator,strikethrough,bullist,numlist,undo,redo,image",
        theme_advanced_buttons2: "",
        theme_advanced_buttons3: "",
        theme_advanced_toolbar_location: "bottom",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "none",
        height: "100",
        content_css: "http://dms.cmltechniques.com/Editor/content.css"
    });

    </script>

    <style type="text/css">
        .bgViewer {
            height: 100%;
            width: 100%;
            position: fixed;
            border: none;
            z-index: 99;
            background-color: #000;
            display: none;
            filter: alpha(opacity=40);
            opacity: 0.7;
        }

        .fstatus {
            width: 533px;
            height: 65px;
            z-index: 100;
            top: 50%;
            position: fixed;
            left: 30%;
            display: none;
            border: none;
        }
    </style>
</head>
<body style="overflow: hidden;" onload="_autoAdjust();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <input id="hidden_content" type="hidden" runat="server" />
        <input id="hidden_page" type="hidden" runat="server" />
        <input id="hidden_sec" type="hidden" runat="server" />
        <input id="hidden_id" type="hidden" runat="server" />
        <input id="hfile" type="hidden" runat="server" />
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
        <asp:Label ID="lblprojectname" runat="server" Text="" Style="display: none" />
        <div id="docview_area">
            <div class="pulldownbar">
                <div class="togglemenu">
                    <a href="#" title="Toggle Sidebar" data-prl-offcanvas="{target:'#offcanvas-search'}"><i class="fa fa-navicon"></i></a>
                </div>
            </div>
            <div class="container">
                <iframe runat="server" id="Iframe1" class="bgViewer" allowtransparency="true"></iframe>
                <iframe runat="server" id="statusviewer" allowtransparency="false" class="fstatus"></iframe>

                <div class="docpanel">
                    <iframe runat="server" id="documentviewer" class="pdf-viwer"></iframe>
                </div>
                <div class="commentpanel">
                    <div class="title">
                        <asp:Label ID="lbl_doctitle" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="docmenu">
                        <ul>
                            <li><a href="#" onclick="CallStatus();">STATUS</a></li>
                            <li><a href="#" onclick="Callviewother();">DOCUMENTS</a></li>
                            <li><a href="#" onclick="CallBack();">BACK</a></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                    <div>
                        <textarea name="content" style="position: absolute; left: 0px; right: 0px;" placeholder="Comment"></textarea>
                    </div>
                    <div class="clear"></div>
                    <div class="comment-box">
                        <ul class="comment">
                            <li>
                                <asp:TextBox ID="txtsec" runat="server" CssClass="control-general control-textbox" placeholder="Section Number" Width="103px"></asp:TextBox>
                            </li>
                            <li>
                                <asp:TextBox ID="txtpage" runat="server" CssClass="control-general control-textbox" placeholder="Page Number" Width="103px"></asp:TextBox>

                                <input style="font-weight: 600; width: 75px" class="control-general control-button-gray push_button" type="button" value="File" id="Button1" runat="server" onclick="PopupUpload();" />
                                <input type="file" id="myupload" style="display: none;" runat="server" onchange="GetValue();" />
                                <asp:Button ID="btndaddfile" runat="server" Text="" Style="display: none" OnClick="btndaddfile_Click" />

                            </li>
                            <li class="last-child">
                                <input style="font-weight: 600; width: 123px" class="control-general control-button-gray push_button" type="button" value="Add Comment" id="btnaddcomment" runat="server" onclick="AddComment();" />

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnsavecomment" runat="server" Style="display: none" Text="Add Comment" Width="123px" OnClick="btnsavecomment_Click" ClientIDMode="Static" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                    <div class="seperator-line"></div>
                    <div class="comment-box">
                        <ul class="comment">
                            <li>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnsubmit" runat="server" CssClass="control-general control-button-green push_button" Text="Submit Comments" Width="192px" OnClick="btnsubmit_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </li>
                            <li class="last-child">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btncancel" runat="server" CssClass="control-general control-button-yellow push_button" Text="Exit Without Saving" Width="192px" OnClick="btncancel_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </li>
                        </ul>
                    </div>
                    <div class="seperator-line"></div>
                    <%--<div id="comment-list">--%>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <iframe runat="server" id="commentviewer" class="viewer"></iframe>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--  </div>--%>
                </div>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnaddtreee" runat="server" Text="Add tree" OnClick="btnaddtreee_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Label ID="lblid" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hpos" name="hpos" runat="server" />
        <input type="hidden" id="hfolder" name="hfolder" runat="server" />
        <div id="offcanvas-search" class="prl-offcanvas">
            <div class="prl-offcanvas-bar">
                <div class="inner">
                    <div id="nav-bar" style="top: 5px;">


                        <ul class="topnav">
                            <li class="item"><a href="#" onclick="gocreate();" title="Create Folder"><i class="icon-folder-close"></i></a></li>
                            <li class="item"><a href="#"><i class="icon-file-alt"></i></a></li>
                            <li class="item"><a href="#" onclick="gomove(1);" title="Move Up"><i class="icon-circle-arrow-up"></i></a></li>
                            <li class="item"><a href="#" onclick="gomove(2);" title="Move Down"><i class="icon-circle-arrow-down"></i></a></li>
                            <li class="item"><a href="#"><i class="icon-edit" onclick="goedit();" title="Edit Folder"></i></a></li>
                            <li class="item"><a href="#" onclick="godelete();" title="Delete Folder"><i class="icon-trash"></i></a></li>
                        </ul>


                    </div>
                    <div class="clear"></div>
                    <div id="navbar">

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
    </form>

    <script src="../Assets/js/plugins.js"></script>

    <script type="text/javascript">
        function _autoAdjust() {
            //alert(msieversion());
            var div = $("#navbar").height();
            var win = $(window).height();
            if (div < win) {
                $("#navbar").addClass("bot5");
            }
            else {
                $("#navbar").addClass("botauto");
            }
        }

        function CallStatus() {
            document.getElementById("Iframe1").style.display = "inline";
            document.getElementById("Iframe1").style.visibility = "visible";
            document.getElementById("statusviewer").style.display = "inline";
            document.getElementById("statusviewer").style.visibility = "visible";
        }
        function CallBack() {
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");

            location.replace("Project?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent);

        }

        function Callviewother() {
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");
            var url = "DocViewOther?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;
            window.open(url, "View Document", "width=1300, height=900,resizable=1");
        }
        function UpdateStatus() {
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");

            RemoveStatusText();

            parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;

        }

        function CloseStatus() {

            document.getElementById("statusviewer").style.display = "none";
            document.getElementById("statusviewer").style.visibility = "hidden";


            document.getElementById("Iframe1").style.display = "none";
            document.getElementById("Iframe1").style.visibility = "hidden";


        }
        function SetstatusText() {
            //document.getElementById("lblstatus").innerHTML = "Status update : Accepted with Comments";
            CloseStatus();

        }
        function RemoveStatusText() {
            //document.getElementById("lblstatus").innerHTML = "";
            CloseStatus();
        }

        function AddComment() {

            var _content = tinymce.EditorManager.get('content').getContent();

            if (document.getElementById("txtsec").value == "") {
                alert('Enter Section Number');
                return;
            }

            else if (document.getElementById("txtpage").value == "") {
                alert('Enter Page Number');
                return;
            }

            else if (_content == "") {
                alert('Enter Comment')
                return;
            }

            document.getElementById("hidden_content").value = _content;
            document.getElementById("hidden_page").value = document.getElementById("txtpage").value;
            document.getElementById("hidden_sec").value = document.getElementById("txtsec").value;

            var _file = document.getElementById("myupload").value;
            var i = _file.lastIndexOf("\\");
            var _filename = _file.substring(i + 1);
            document.getElementById("hfile").value = _filename;


            document.getElementById("txtpage").value = "";
            document.getElementById("txtsec").value = "";
            tinymce.EditorManager.get('content').setContent("");

            $("#btndaddfile").click();

            $("#btnsavecomment").click();


        }
        function GetNav(id, _pos, DefNav) {
            //alert(_desc);
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblid");


            document.getElementById("hfolder").value = id;
            document.getElementById("hpos").value = _pos;


            //var a = document.getElementById('pnlpop');
            //if (a) {
            //    a.style = "display:none";
            //    a.style.visibility = "hidden";
            //}

            //var b = document.getElementById('pnldel');
            //if (b) {
            //    b.style = "display:none";
            //    b.style.visibility = "hidden";
            //}

            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");

            location.replace("Project?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefNav);



        }
        function GetValue() {
            var _file = document.getElementById("myupload").value;
            var i = _file.lastIndexOf("\\");
            var _filename = _file.substring(i + 1);
            //$("#lblfileinfo").text(_filename);
            //$("#imgclear").addClass("Display:inline");
            //document.getElementById("imgclear").style.display = "block";
        }
        function PopupUpload() {
            $("#myupload").click();
        }
        function showtreefolder() {
            //$("#btnaddtreee").click();
        }
    </script>
    <%--<script src="../Assets/offcanvas/uikit.min.js"></script>
    <script src="../Assets/offcanvas/docs.js"></script>
    --%>
</body>
</html>
