<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OMView.aspx.cs" Inherits="CMLTechQ.DMS.OMView" ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
     <link rel="stylesheet" href="../Assets/css/content1.css" type="text/css" />
    <link rel="stylesheet" href="../Assets/css/OwnStyle.css" type="text/css" />
    
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="../Editor/tiny_mce.js"></script>
    <style type="text/css">

    </style>
  
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
<body style="border-right:solid 5px #45818e;z-index:-2" class="inner fixed_background" >
    <form id="form1" runat="server" >
        &nbsp;<asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server" AsyncPostBackTimeout="3600"></asp:ToolkitScriptManager>
        <input id="hidden_content" type="hidden" runat="server" />
         <input id="hidden_page" type="hidden" runat="server" />
         <input id="hidden_sec" type="hidden" runat="server" />
        <input id="hidden_id" type="hidden" runat="server" />
        <input id="hfile" type="hidden" runat="server" />
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
          <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
          <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
          <asp:Label ID="lbldocid" runat="server" Text="" style="display:none"></asp:Label>
         <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
         <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
        <asp:Label ID="lblprojectname" runat="server" Text="" style="display:none"/>
        <div id="doc-container" >
            <div id="info-bar">
                <div class="head">
                    <div class="headtitle" style="width:65%">
                        <table style="width:100%;height:100%">
                            <tr>
                                <td  ><h2 class="title" style="line-height:normal"><asp:Label ID="fileinfo" runat="server" Text=""></asp:Label></h2></td>
                                <td style="text-align:right;width:35%"><asp:Label ID="lblstatus" runat="server" Text="" CssClass="subtitle" Style="font-size:10px;color:#FF0000"></asp:Label></td>
                            </tr>
                        </table>    
                    </div>
                    <div class="back pull-right">
                        <a class="actbtn" href="#" onclick="CallStatus();"><i  class="icon-file"></i> Change Status</a>
                        <a class="actbtn" href="#" onclick="Callviewother();" ><i  class="icon-folder-open"></i> View Another Document</a>
                        <a class="actbtn" href="#" onclick="CallBack();" ><i  class="icon-backward"></i> Back</a>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div id="docview-area">
              

               <iframe runat="server" id="Iframe1" class="bgViewer" allowtransparency="true"></iframe> 

                <iframe runat="server" id="documentviewer" class="viewer"  style="z-index:-1;" ></iframe>          
                              
               <iframe runat="server" id="statusviewer"  allowtransparency="false" class="fstatus" ></iframe> 
                
                         
                       
            </div> 
            <div id="comment-area">
                  
              <div style="height:150px;padding:5px;">
                   
                                <div style="height:100px;width:100%;" id="dvtextarea">
                                   
                                 <textarea name="content" style="position:absolute;left:0px;right:0px;" placeholder="Page No."></textarea>
                                    
                                </div>
                
                    <div class="action" id="dvaction" >
                        <a href="#" onclick="PopupUpload();" class="pull-right actbtn" style="border-left:solid 1px black;" >Attach File</a>
 
                    </div>
                  <div class="action" style="height:35px;padding:0px 1px;">
                    <%--  <div style="position:relative;float:left">--%>
                      <table style="width:100%">
                          <tr>
                              <td style="width:30%"> <input  class="txtbox center" type="text" placeholder="Section Number.." value="" id="txtsec" runat="server" /></td>
                              <td style="width:5%"></td>
                              <td style="width:30%"><input  type="text" class="txtbox center" placeholder="Page Number..." value="" id="txtpage" runat="server"  /></td>
                              <td style="width:5%"></td>
                              <td style="width:30%"> 
                                  <input style="font-weight:600" class="txtbox center" type="button"  value="Add Comment" id="btnaddcomment" runat="server"  onclick="AddComment();" />
                               
                              </td>
                          </tr>
                      </table>

                
 
                           <div style="position:relative;text-align:left;margin-top:3px;width:100%" >

                        <input type="file" id="myupload" style="display:none;" runat="server" onchange="GetValue();" />

                       <asp:Button ID="btndummy1" runat="server" Text=""  style="display:none"   OnClick="btndummy1_Click" />

                     </div>

                       
                      <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btndummy" runat="server" Text="" style="display:none;"  OnClick="btndummy_Click" ClientIDMode="Static" />
                            </ContentTemplate>
                        </asp:UpdatePanel>

                            
                        
                    </div>
                   <div style="position:relative;text-align:left;margin-top:3px;width:100%;" >
                       <table>
                           <tr>
                                                     <td><img  id="imgclear" src="../Assets/img/delete_.png"  onclick="goclearfile();" style="display:none;height:15px;" /></td>
                                  <td><asp:Label ID="lblfileinfo" runat="server" Text="No Files(s) selected" CssClass="fileinfo" style="font-size: 13px;text-decoration: underline;color:#073763;font-weight:600"></asp:Label></td>
                                 
                                      </tr>
                           </table>


                

              </div>
                    <div id="dvline"></div>
                <div id="comment-list">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <iframe runat="server" id="commentviewer" class="viewer" ></iframe>  
                        </ContentTemplate>
                    </asp:UpdatePanel>
                   
                </div>

                   
                </div>

            

        <div class="clearfix"></div>
        <div class="footer"></div>
    </div>
        <script type="text/javascript">

            function ShowAddImage() {


                document.getElementById("dvaddimgae").style.display = "inline";
                document.getElementById("dvaddimgae").style.visibility = "visible";


            }
            function closeAddImage() {

                document.getElementById("dvaddimgae").style.display = "none";
                document.getElementById("dvaddimgae").style.visibility = "hidden";

            }


            function getdata(id) {
                var e = document.getElementById('d' + id);
                if (e) {
                    if (e.style.display == 'none') {
                        e.style.display = 'block';
                        e.style.visibility = 'visible';
                        //_changeActive(id);
                    }
                    else {
                        e.style.display = 'none';
                        e.style.visibility = 'hidden';
                        //_changeInActive();
                    }

                }

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
            function CallStatus() {

                document.getElementById("Iframe1").style.display = "inline";
                document.getElementById("Iframe1").style.visibility = "visible";

                document.getElementById("statusviewer").style.display = "inline";
                document.getElementById("statusviewer").style.visibility = "visible";


            }
            function SetstatusText() {
                document.getElementById("lblstatus").innerHTML = "Status update : Accepted with Comments";
                CloseStatus();

            }
            function RemoveStatusText() {
                document.getElementById("lblstatus").innerHTML = "";
                CloseStatus();
            }
            function GetValue() {
                var _file = document.getElementById("myupload").value;
                var i = _file.lastIndexOf("\\");
                var _filename = _file.substring(i + 1);
                $("#lblfileinfo").text(_filename);
                $("#imgclear").addClass("Display:inline");

                document.getElementById("imgclear").style.visibility = "visible";
                document.getElementById("imgclear").style.display = "block";
            }
            function PopupUpload() {
                $("#myupload").click();
            }
            function goclearfile() {
                document.getElementById("myupload").value = "";
                $("#lblfileinfo").text("No Files(s) selected");

                document.getElementById("imgclear").style.visibility = "hidden";
                document.getElementById("imgclear").style.display = "none";
                document.getElementById("hfile").value = "";


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

                $("#btndummy1").click();

                var _btn = document.getElementById("btndummy");
                _btn.click();
            }
            function CallBack() {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");
                parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;
            }

            function Callviewother() {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");



                var url = "DocViewOther?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;



                window.open(url, "View Document", "width=1300, height=900,resizable=1");

            }
        </script>
    </form>
</body>
</html>
