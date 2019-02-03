<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewManual1.aspx.cs" Inherits="CMLTechQ.DMS.ViewManual1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>O&M Manual View</title>
    <link href="../Assets/css/Layout.css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <%--<link href="../Assets/AMS/css/font-awesome.min.css" rel="stylesheet" />--%>
   <%-- <script type="text/javascript" src="http:// ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
    <script src="../Assets/jquery.min.js"></script>
    <script type="text/javascript" src="../Editor/tiny_mce.js"></script>
    <script type="text/javascript">

        <!--[if IE]><iframe class="cover" src="about:blank"></iframe><![endif]-->
    tinyMCE.init({
        mode: "textareas",
        width: "100%",
        theme: "advanced",
        statusbar: false,
        theme_advanced_buttons1: "mylistbox,mysplitbutton,bold,italic,underline,separator,strikethrough,bullist,numlist,undo,redo",
        theme_advanced_buttons2: "",
        theme_advanced_buttons3: "",
        theme_advanced_toolbar_location: "bottom",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "none",
        height: "100",
        content_css: "https://dms.cmltechniques.com/Editor/content.css"
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
            width: 560px;
            height:220px;
            z-index: 100;
            top: 50%;
            position: fixed;
            left: 30%;
            display: none;
            border: none;
        }
         .docmenu ul li {
        display: inline;
        padding: 5px 30px;
    }

    </style>
</head>
<body  style="overflow: hidden;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <input id="hidden_content" type="hidden" runat="server" />
        <input id="hidden_page" type="hidden" runat="server" />
        <input id="hidden_sec" type="hidden" runat="server" />
        <input id="hidden_id" type="hidden" runat="server" />
        <input id="hfile" type="hidden" runat="server" />
         <input id="hcount" type="hidden" runat="server"  value="0"/>
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
         <asp:Label ID="lblusername" runat="server" Text="" Style="display: none" />
        <asp:Label ID="lblprojectname" runat="server" Text="" Style="display: none" />
         <asp:Label ID="lblfoldername" runat="server" Text="" Style="display: none" />
        <iframe runat="server" id="Iframe1" class="bgViewer" allowtransparency="true"></iframe>
        <iframe runat="server" id="statusviewer" allowtransparency="false" class="fstatus"></iframe>


         <input type="hidden" id="hmenufolder" runat="server" />

        <div id="docview_area">
            <div class="pulldownbar">
                <div class="togglemenu">
                    <a href="#" title="Toggle Sidebar" data-prl-offcanvas="{target:'#offcanvas-search'}"><i class="fa fa-navicon"></i></a>
                </div>
                <%-- <div class="togglemenu">
                    <a href="#" title="Toggle Sidebar" data-prl-offcanvas="{target:'#offcanvas-top'}"><i class="fa fa-navicon"></i></a>
                </div>--%>
            </div>
            <div class="container">
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
                        <input style="font-weight: 600;" class="control-general control-button-upload push_button pull-right" type="button" value="Attached File" id="Button1" runat="server" onclick="PopupUpload();" />
                        <input type="file" id="myupload" runat="server" style="display: none;" onchange="GetValue();" />
                       

                    </div>
                     <div class="title" style="margin-top:5px;margin-bottom:0px">
                        <asp:Label ID="lblfile" Text="No File Selected" runat="server"></asp:Label>
                      <a  id="lnkremove" href="#" onclick="removeimage();" style="margin-left:10px;display:none" ><i class="icon-remove"></i></a>
                      </div>
                    <div class="clear"></div>
                    <div class="comment-box">
                        <ul class="comment">
                            <li>
                                <asp:TextBox ID="txtsec" runat="server" CssClass="control-general control-textbox" placeholder="Section Number" Width="103px" ClientIDMode="Static"></asp:TextBox>
                            </li>
                            <li>
                                <asp:TextBox ID="txtpage" runat="server" CssClass="control-general control-textbox" placeholder="Page Number" Width="103px" ClientIDMode="Static"></asp:TextBox>

                                

                            </li>
                            <li class="last-child">
                                <input style="font-weight: 600; width: 123px" class="control-general control-button-gray push_button" type="button" value="Add Comment" id="btnaddcomment" runat="server" onclick="AddComment();" />
                               <%--<asp:Button ID="btndummy1" runat="server" Text=""  style="display:none"   OnClick="btndummy1_Click" />--%>
                                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>--%>
                                         
                                        <asp:Button ID="btnsavecomment" runat="server" Style="display: none" Text="Add Comment" Width="123px" OnClick="btnsavecomment_Click" />
                                        <%--<asp:Button ID="btndummy" runat="server" Text="" style="display:none;"  OnClick="btndummy_Click" ClientIDMode="Static" />--%> 

                                   <%-- </ContentTemplate>
                                </asp:UpdatePanel>--%>
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
                                        <asp:Button ID="btnsubmit" runat="server" CssClass="control-general control-button-green push_button" Text="Submit Comments" Width="192px" OnClick="btnsubmit_Click" style="margin-bottom:3px;" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </li>
                            <li class="last-child">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btncancel" runat="server" CssClass="control-general control-button-yellow push_button" Text="Exit Without Saving" Width="192px" OnClick="btncancel_Click" style="margin-bottom:3px;" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </li>
                        </ul>
                    </div>
                     <%--<asp:Button ID="btndaddfile" runat="server" Text="" Style="display: none" OnClick="btndaddfile_Click"  ClientIDMode="Static" />--%>
                    <div class="seperator-line"></div>
                    <div id="comment-list">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <iframe runat="server" id="commentviewer" style="width: 100%; height: 100%; position: absolute; border: none;"></iframe>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <asp:Label ID="Label1" runat="server" Text="" Style="display: none"></asp:Label>
                <input type="hidden" id="Hidden1" name="hpos" runat="server" />
                <input type="hidden" id="Hidden2" name="hfolder" runat="server" />
            </div>
        </div>

        <asp:Label ID="lblid" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hpos" name="hpos" runat="server" />
        <input type="hidden" id="hfolder" name="hfolder" runat="server" />
        <%--<div class="prl-offcanvas" id="offcanvas-top" >
            <div class="prl-offcanvas-top">
                From Top
            </div>
        </div>--%>
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
        </script>
        <script type="text/javascript">

            function CallStatus() {


                //$("#RadWindow1").show();

                document.getElementById("Iframe1").style.display = "inline";
                document.getElementById("Iframe1").style.visibility = "visible";
                document.getElementById("statusviewer").style.display = "inline";
                document.getElementById("statusviewer").style.visibility = "visible";
            }
            function CallBack() {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");
                var _auth4 = document.getElementById("hmenufolder");

                parent.location.replace("Project2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent+ "&Auth5=" + _auth4.value);

            }

            function Callviewother() {
                //var _auth1 = document.getElementById("lbluseridhidden");
                //var _auth2 = document.getElementById("lblprjid");
                //var _auth3 = document.getElementById("lblfolder");
                //var url = "DocViewOther?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;
                //window.open(url, "View Document", "width=1300, height=900,resizable=1");
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


                $("#btnsavecomment").click();

                //var _btn = document.getElementById("btndummy");
                //_btn.click();


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

                location.replace("Project1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + DefNav);



            }
            function GetValue() {
                var _file = document.getElementById("myupload").value;
                var i = _file.lastIndexOf("\\");
                var _filename = _file.substring(i + 1);
                $("#lblfile").text(_filename);
                $("#lnkremove").show();
                //$("#imgclear").addClass("Display:inline");
                //document.getElementById("imgclear").style.display = "block";
            }
            function PopupUpload() {
                $("#myupload").click();
            }
            function showtreefolder() {
                //$("#btnaddtreee").click();
            }
            function removeimage() {
                document.getElementById("myupload").value = "";
                var _filename = "No File Selected";
                $("#lblfile").text(_filename);

                $("#lnkremove").hide();




            }
        </script>
    </form>
</body>
</html>