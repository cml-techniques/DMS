<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentList.aspx.cs" Inherits="CMLTechQ.DMS.CommentList" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <%--<link rel="stylesheet" href="../Assets/css/OwnStyle.css" type="text/css" />--%>
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="../Editor/tiny_mce.js"></script>
    <script type="text/javascript">
         <!--[if IE]><iframe class="cover" src="about:blank"></iframe><![endif]-->
    tinyMCE.init({
        mode: "textareas",
        plugins: 'paste',
        paste_auto_cleanup_on_paste: true,
        paste_remove_styles: true,
        paste_remove_styles_if_webkit: true,
        paste_strip_class_attributes: true,
        width: "380px",
        theme: "advanced",
        statusbar: false,
        theme_advanced_buttons1: "mylistbox,mysplitbutton,bold,italic,underline,separator,strikethrough,bullist,numlist,undo,redo,image",
        theme_advanced_buttons2: "",
        theme_advanced_buttons3: "",
        theme_advanced_toolbar_location: "bottom",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "none",
        height: "100",
        content_css: "/Editor/content.css"
    });
    </script>
</head>
<body>
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
        <asp:Label ID="lbltitle" runat="server" Text="" Style="display: none" />
        <div id="comment-view" style="position: absolute; overflow-y: auto; top: 0px; bottom: 0px; width: 100%">
            <asp:Repeater ID="rptcomment" runat="server" OnItemDataBound="rptcomment_ItemDataBound" ClientIDMode="Static">
                <HeaderTemplate></HeaderTemplate>
                <ItemTemplate>



                    <div class="contentbox" id="d<%#Container.ItemIndex %>" style="display: none;">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td style="padding: 10px; background-color: #ffffff; border-top-left-radius: 4px; border-top-right-radius: 4px;">
                                    <textarea name="Econtent<%#Container.ItemIndex %>"><%#Eval("comment") %></textarea>
                                </td>
                            </tr>
                        </table>

                        <%--  <div style="height:155px;position:absolute;" id="dvaddimgae<%#Container.ItemIndex %>" class="bgViewer"> 
                        
                    <iframe runat="server" style="width:100%;height:100%" id="frmimage"  allowtransparency="false" ></iframe> 
 
                    </div>--%>
                        <%--<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td style="padding:10px" >
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%">--%>
                        <%--<div class="action">
                                        <a href="#" id="ed<%#Container.ItemIndex %>" onclick="EditComment(<%#Eval("comm_id") %>,<%#Container.ItemIndex %>)" class="pull-left actbtn dark" style="width: 65px; margin-right: 5px;">Edit</a><a id="up<%#Container.ItemIndex %>" href="#" onclick="updateComment(<%#Eval("comm_id") %>,<%#Container.ItemIndex %>)" class="pull-left actbtn dark" style="width: 65px; margin-right: 5px; display: none">Update</a><a id="dl<%#Container.ItemIndex %>" href="#" onclick="DeleteComment(<%#Eval("comm_id") %>,<%#Container.ItemIndex %>)" class="pull-left actbtn dark" style="width: 65px; display: none; margin-right: 5px">Delete</a><a id="ei<%#Container.ItemIndex %>" href="#" onclick="EditImage(<%#Eval("comm_id") %>,<%#Container.ItemIndex %>)" class="pull-left actbtn dark" style="width: 65px; margin-right: 5px; display: none">Attach File</a><a id="ca<%#Container.ItemIndex %>" href="#" onclick="CancelComment(<%#Eval("comm_id") %>,<%#Container.ItemIndex %>)" class="pull-left actbtn dark" style="width: 65px; display: none">Cancel</a>
                                    </div>--%>
                        <%-- </td>
                            </tr>
                        </table>--%>
                    </div>
                    <div id="headering">
                        <div class="infobox pull-left">
                          <asp:Label ID="lblpage" runat="server" Text='<%#"Page : "+Eval("page_no") %>'></asp:Label><br />
                          <asp:Label ID="lblsection" runat="server" Text='<%#"Sect&nbsp;&nbsp;: " + Eval("sec_no") %>' ></asp:Label><br />
                            <asp:Label ID="lblimg" runat="server" Style="display: none" Text='<%#Eval("Image_name") %>'></asp:Label>

                        </div>
                        <div class="actbox pull-right" >
                            <div style="display: inline-block;margin-left:10px;display:none" class="pull-right" id="dvclose<%#Container.ItemIndex %>" >
                                 <input id="btnc"   type="button" value="CLOSE" class="control-general control-button-yellow push_button" style="width: 60px;color:#ffffff;" onclick="closedit(<%#Container.ItemIndex %>)" />
                                </div>
                            <div style="display: inline-block;" class="pull-right">
                                 
                                <%--<a href="#"  onclick="goViewImage(<%#Eval("comm_id") %>);" > <i class="icon-picture"></i></a>--%>
                                  <input id="btnd<%#Container.ItemIndex %>" type="button" value="DELETE" class="control-general control-button-orange push_button" style="width: 70px;color:#ffffff;" onclick="DeleteComment(<%#Eval("comm_id") %>,<%#Container.ItemIndex %>)" />
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btndelete" runat="server"  style="display:none" CssClass="control-general control-button-orange push_button" Text="DELETE" Width="100px" OnClick="btndelete_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div style="display: inline-block; margin-right: 10px;" class="pull-right">
                                <input id="btne<%#Container.ItemIndex %>" type="button" value="EDIT" class="control-general control-button-blue push_button" style="width: 70px;color:#ffffff;" onclick="getdata(<%#Eval("comm_id") %>,<%#Container.ItemIndex %>,'<%#Eval("Image_name") %>')" />
                                
                                
                            </div>
                             <div style="display: inline-block; margin-right: 10px;display:none" class="pull-right" id="dvimage<%#Container.ItemIndex %>">

                                 <input id="btnv" type="button" value="FILE" class="control-general control-button-gray push_button" style="width:60px;color:#ffffff;" onclick="Showimagewindow(<%#Eval("comm_id") %>)" />
                             </div>

                        </div>
                        <div class="clear"></div>
                    </div>


                </ItemTemplate>

            </asp:Repeater>
            <input type="file" id="myupload" style="display: none;" runat="server" onchange="GetValue();" />
            <asp:Button ID="btndummyfile" runat="server" Text="" Style="display: none;" OnClick="btndummyfile_Click" />
            <asp:Button ID="Button1" runat="server" Text="" Style="display: none;" OnClick="btndummyfile_Click" ClientIDMode="Static" />

            <asp:Button ID="btndummy1" runat="server" Text="" Style="display: none;" OnClick="btndummy1_Click" ClientIDMode="Static" />
            <asp:Button ID="btndummy2" runat="server" Text="" Style="display: none;" OnClick="btndummy2_Click" ClientIDMode="Static" />
            <asp:Button ID="btndummy3" runat="server" Text="" Style="display: none;" OnClick="btndummy3_Click" ClientIDMode="Static" />


        </div>

        <script type="text/javascript">

            function closedit(index)
            {
                var e = document.getElementById('d' + index);
                if (e) {
                    if (e.style.display == 'block') {
                        $("#btne" + index).removeClass('control-button-green').addClass('control-button-blue');
                        $("#btne" + index).val("EDIT");
                        e.style.display = 'none';
                        e.style.visibility = 'hidden';

                        document.getElementById('dvclose'+index).style.display='none';
                        document.getElementById('dvclose'+index).style.visibility='hidden';

                        document.getElementById('dvimage'+index).style.display='none';
                        document.getElementById('dvimage'+index).style.visibility='hidden';
                    }
                }
            }
            function getdata(id,index,_file) {
                var e = document.getElementById('d' + index);
                //var ir = document.getElementById('ir' + id);
                //var is = document.getElementById('is' + id);
                var ec = document.getElementById('Econtent' + index);
                //var _btn=document.getElementById('btn' + index);
                if (e) {
                    if (e.style.display == 'none') {
                        $("#btne" + index).removeClass('control-button-blue').addClass('control-button-green');
                        $("#btne" + index).val("SAVE");
                        e.style.display = 'block';

                        e.style.visibility = 'visible';
                        //ir.style.display = 'none';
                        //ir.style.visibility = 'hidden';
                        //is.style.display = 'block';
                        //is.style.visibility = 'visible';
                        //_changeActive(id);

                        //tinymce.editors[id].getBody().setAttribute('contenteditable', false);
                        var ct = tinymce.editors[index].controlManager.controls
                        for (var j in ct)
                            ct[j].setDisabled(true);

                        document.getElementById('dvclose'+index).style.display='block';
                        document.getElementById('dvclose'+index).style.visibility='visible';


                        if (_file!='')
                        {
                            document.getElementById('dvimage'+index).style.display='block';
                            document.getElementById('dvimage'+index).style.visibility='visible';

                        }

                    }
                    else {
                        $("#btne" + index).removeClass('control-button-green').addClass('control-button-blue');
                        $("#btne" + index).val("EDIT");
                        e.style.display = 'none';
                        e.style.visibility = 'hidden';
                        //is.style.display = 'none';
                        //is.style.visibility = 'hidden';
                        //ir.style.display = 'block';
                        //ir.style.visibility = 'visible';
                        

                        //_changeInActive();

                        document.getElementById('dvclose'+index).style.display='none';
                        document.getElementById('dvclose'+index).style.visibility='hidden';

                        document.getElementById('dvimage'+index).style.display='none';
                        document.getElementById('dvimage'+index).style.visibility='hidden';


                        updateComment(id,index);
                    }

                }

            }
        </script>
        <script lang="javascript">
            function UpdateStatus() {
                window.parent.UpdateStatus();
            }
        </script>
    </form>
    <script type="text/javascript">

        function Showimagewindow(_fileid) {

            var _auth1 = document.getElementById("lblprjid").innerHTML;

            var url = "ImageView?Auth1=" + _auth1 + "&Auth2=" + _fileid;
            window.open(url, "_blank", "toolbar=No, scrollbars=yes, resizable=No, top=200, left=500, width=500, height=400");
        }
        function setdis() {
            for (var i = 0; i < tinymce.editors.length; i++) {
                tinymce.editors[i].getBody().setAttribute('contenteditable', false);
            }
        }
        function AddComment() {
            var _content = tinymce.EditorManager.get('content').getContent();
            document.getElementById("hidden_content").value = _content;
            document.getElementById("hidden_page").value = document.getElementById("txtpage").value;
            document.getElementById("hidden_sec").value = document.getElementById("txtsec").value;
            document.getElementById("txtpage").value = "";
            document.getElementById("txtsec").value = "";
            tinymce.EditorManager.get('content').setContent("");
            var _btn = document.getElementById("btndummy");
            _btn.click();
        }
        function CancelComment(id, index) {

            var _btn = document.getElementById("btndummy3");
            _btn.click();

        }
        function EditImage(id, index) {
            // ShowAddImage(index);
            PopupUpload();

        }
        function GetValue() {
            var _file = document.getElementById("myupload").value;
            var i = _file.lastIndexOf("\\");
            var _filename = _file.substring(i + 1);
            document.getElementById("hfile").value = _filename;

            //alert(_filename);
            //$("#lblfileinfo").text(_filename);
            //$("#imgclear").addClass("Display:inline");

            //document.getElementById("imgclear").style.visibility = "visible";
            //document.getElementById("imgclear").style.display = "block";
        }
        function PopupUpload() {
            $("#myupload").click();
        }
        //function EditComment(id, index) {

        //    var ct = tinymce.editors[index].controlManager.controls
        //    for (var j in ct)
        //        ct[j].setDisabled(false);


        //    tinymce.editors[index].getBody().setAttribute('contenteditable', true);


        //    var ed = document.getElementById("ed" + index);

        //    ed.style.display = 'none';
        //    ed.style.visibility = 'hidden';


        //    var up = document.getElementById("up" + index);
        //    up.style.display = 'block';
        //    up.style.visibility = 'visible';

        //    var dl = document.getElementById("dl" + index);
        //    dl.style.display = 'block';
        //    dl.style.visibility = 'visible';

        //    var dl = document.getElementById("ca" + index);
        //    dl.style.display = 'block';
        //    dl.style.visibility = 'visible';

        //    var ei = document.getElementById("ei" + index);
        //    ei.style.display = 'block';
        //    ei.style.visibility = 'visible';

        //}
        function updateComment(id, index) {

            var _content = tinymce.EditorManager.get('Econtent' + index).getContent();


            document.getElementById("hidden_content").value = _content;
            document.getElementById("hidden_id").value = id;
            document.getElementById("hfile").value = id;


            $("#btndummyfile").click();

            var _btn = document.getElementById("btndummy1");
            _btn.click();


        }
        function ViewImage(id,index)
        {
            document.getElementById("hidden_id").value = id;
            var _btn = document.getElementById("btndummy2");
            //_btn.click();

        }
        function DeleteComment(id, index) {

            document.getElementById("hidden_id").value = id;
            var _btn = document.getElementById("btndummy2");
            _btn.click();

        }
        function CallBack() {
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");
            parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;
        }
        function ShowAddImage(index) {


            document.getElementById('dvaddimgae' + index).style.display = "inline";
            document.getElementById('dvaddimgae' + index).style.visibility = "visible";


        }
        function closeAddImage(index) {

            document.getElementById('dvaddimgae' + index).style.display = "none";
            document.getElementById('dvaddimgae' + index).style.visibility = "hidden";

        }
        function goViewImage(_file)
        {
            var _auth1 = document.getElementById("lblprjid").innerHTML;

            var url = "ImageView?Auth1=" + _auth1 + "&Auth2=" + _file;
            window.open(url, "_blank", "toolbar=No, scrollbars=yes, resizable=No, top=200, left=500, width=500, height=400");
        }

    </script>
</body>
</html>
