<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OMCommentList.aspx.cs" Inherits="CMLTechQ.DMS.OMCommentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <%--<link rel="stylesheet" href="../Assets/css/OwnStyle.css" type="text/css" />--%>
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/comment_accordion.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="../Editor/tiny_mce.js"></script>
    
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
        content_css: "http://demo1.cmltechniques.com/Editor/content.css"
    });
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
        <asp:Label ID="lbltitle" runat="server" Text="" Style="display: none" />
        <div >
            <div style="height:50px;display:none;background-color:#ff6a00" id="div1" >
                This is open
            </div>
            <div  ><a href="#" onclick="click();">Click</a></div>

            <%--<div class="container">
                <div class="content">
                    <div>Sample Content</div>
                    <p>Content here....</p>
                </div>
            </div>
            <div class="accordion" id="section1">Heading<span>+</span></div>
            
            <div class="container">
                <div class="content">
                    <div>Sample Content</div>
                    <p>Content here....</p>
                </div>
            </div>
            <div class="accordion" id="section2">Heading<span>+</span></div>
           
            <div class="container">
                <div class="content">
                    <div>Sample Content</div>
                    <p>Content here....</p>
                </div>
            </div>
             <div class="accordion" id="section3">Heading<span>+</span></div>--%>
            <input type="file" id="myupload" style="display: none;" runat="server" onchange="GetValue();" />
            <%--<asp:Button ID="btndummyfile" runat="server" Text="" Style="display: none;" OnClick="btndummyfile_Click" />
            <asp:Button ID="Button1" runat="server" Text="" Style="display: none;" OnClick="btndummyfile_Click" ClientIDMode="Static" />

            <asp:Button ID="btndummy1" runat="server" Text="" Style="display: none;" OnClick="btndummy1_Click" ClientIDMode="Static" />
            <asp:Button ID="btndummy2" runat="server" Text="" Style="display: none;" OnClick="btndummy2_Click" ClientIDMode="Static" />
            <asp:Button ID="btndummy3" runat="server" Text="" Style="display: none;" OnClick="btndummy3_Click" ClientIDMode="Static" />--%>
        </div>
        <script type="text/javascript">
            function click() {
                //var e = document.getElementById('div' + id);
                //e.style.display = 'block';
                alert('yes');
            }
            function getdata(id) {
                var e = document.getElementById('d' + id);
                var ir = document.getElementById('ir' + id);
                var is = document.getElementById('is' + id);
                var ec = document.getElementById('Econtent' + id);


                if (e) {
                    if (e.style.display == 'none') {

                        e.style.display = 'block';

                        e.style.visibility = 'visible';
                        ir.style.display = 'none';
                        ir.style.visibility = 'hidden';
                        is.style.display = 'block';
                        is.style.visibility = 'visible';
                        //_changeActive(id);

                        tinymce.editors[id].getBody().setAttribute('contenteditable', false);
                        var ct = tinymce.editors[id].controlManager.controls
                        for (var j in ct)
                            ct[j].setDisabled(true);

                    }
                    else {
                        e.style.display = 'none';
                        e.style.visibility = 'hidden';
                        is.style.display = 'none';
                        is.style.visibility = 'hidden';
                        ir.style.display = 'block';
                        ir.style.visibility = 'visible';
                        //_changeInActive();
                    }

                }

            }
        </script>
        <script lang="javascript">
            function UpdateStatus() {
                window.parent.UpdateStatus();
            }

        </script>
        <script src="../Assets/js/jquery.accordion.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.accordion').accordion({ defaultOpen: 'some_id' }); //some_id section1 in demo
            });
        </script>

    </form>
</body>
</html>
