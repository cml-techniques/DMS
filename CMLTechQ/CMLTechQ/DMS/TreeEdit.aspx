<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeEdit.aspx.cs" Inherits="CMLTechQ.DMS.TreeEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
  
    </style>

            <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
     <script src="../Assets/js/jquery.min.js"></script>

         <script src="../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
        <link href="../Assets/css/OwnStyle.css" rel="stylesheet" />

       <script lang="javascript" type="text/javascript">
           function openFrame(_id) {
               var string = "managetreeSub.aspx?" + _id + "";
               myframe.location = string;

           }
           //function onformLoad() {
           //    $('#trfolder').hide();
           //    $('#trfolder1').hide();
           //    $('#td1').hide();

           //}
           function NodeEnable() {

               //var e = document.getElementById("ddlaction");
               //var strindex = e.options[e.selectedIndex].value;

               //$('#trfolder1').hide();

               //if (strindex == "4" || strindex == "0" )
               //{
               //    $('#trfolder').hide();
               //    $('#td1').hide();  

               //}
               //else if (strindex == "5") {
               //    $('#trfolder1').show();
               //    $('#trfolder').hide();

               //}
               //else
               //{
               //    $('#td1').hide();

               //    if (strindex == "2") {
               //        $('#td1').show();

               //    }

               //  $('#trfolder').show();

               //}
           
           }
           function GetFolderDetails(_position, _parent,_folder,_folder_desc,_level) {
               //alert(_position);

               var fdesc = _folder_desc.replace("<>", "&");

               //alert(fdesc);
               
               //alert(_folder);
               document.getElementById("hfolder").value = _folder;
               document.getElementById("hparent").value = _parent;
               document.getElementById("hpos").value = _position;
               document.getElementById("hlevel").value = _level;
               document.getElementById("hfoldername").value = fdesc;

               document.getElementById("lblfoldername").textContent = fdesc;
               




              // $("#Button3").click();
      

           }
           function RetriveDocumentDetails(_id, _pos, _index,_type) {

               //alert(_id);
               //alert(_pos);
               //alert(_index);
               document.getElementById("hdocpos").value = _pos;
               document.getElementById("hdocid").value = _id;
               document.getElementById("hdocindex").value = _index;

              
               if (_type==1)
               {
                   $("#Button1").click();
               }
               else if (_type == 2) {
                   $("#Button2").click();

               }
               else {

                   var r = confirm("Do you want to delete");
                   if (r == true) {
                       $("#Button3").click();
                   }
               }
             
           }
           function _autoAdjust() {
               //alert(msieversion());
               var div = $("#main-content1").height();
               var win = $(window).height();
               if (div < win) {
                   //if (msieversion() > 0) {
                   //    var win = $(window).height() - 40;
                   //}
                   //else {
                   //var win = $(window).height() - 50;
                   //}
                   ///$("#main-content").height(win);
                   $("#main-content1").addClass("botzero");
               }
               else {
                   $("#main-content1").addClass("botauto");
               }
               //onformLoad();
           }
        </script> 

</head>
<body style="border-right:solid 5px #45818e" class="inner fixed_background" onload="javascript:_autoAdjust();">
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600" ></asp:ScriptManager>
                <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"/>

        <input type = "hidden" id = "hfolder" name = "hfolder" runat="server" />
        <input type = "hidden" id = "hfoldername" name = "hfoldername" runat="server" />
        <input type = "hidden" id = "hpos" name = "hpos" runat="server" />
        <input type = "hidden" id = "hlevel" name = "hlevel" runat="server" />
        <input type = "hidden" id = "hparent" name = "hparent" runat="server" />

        <input type = "hidden" id = "hdocpos" name = "hdocpos" runat="server" />
        <input type = "hidden" id = "hdocid" name = "hdocid" runat="server" />
        <input type = "hidden" id = "hdocindex" name = "hdocindex" runat="server" />



         <div id="doc-container" >


             <div id="main-content"  >
                 <div id="info-bar">
                <div class="head">
                    <div class="headtitle">
                        <h2 class="title"><asp:Label ID="pageinfo" runat="server" Text=""></asp:Label></h2>
                    </div>
                    <div class="back pull-right">
                         <a class="back" href="javascript:history.go(-1);"><i  class="icon-backward"></i> Back</a>
                    </div>
                </div>
                     </div>
                </div>
             
             <div id="main-content1" style="top:0px;">
   

               <div  class="dvtree" style="top:0px;">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>                       
                    <asp:TreeView ID="mytree" runat="server" Width="300px" 
                            onselectednodechanged="mytree_SelectedNodeChanged" Font-Names="Verdana" 
                            Font-Size="Small"                        ShowLines="True" NodeWrap="True" 
                            AutoGenerateDataBindings="False" EnableClientScript="true" ForeColor="Black" CssClass="trees">
                        <SelectedNodeStyle BackColor="red" />
                       
                    </asp:TreeView>
                            
                        
                    </ContentTemplate>
                        </asp:UpdatePanel>
                    &nbsp;</div>

              
               <div class="dvdoc">
                                           <div class="dvsubhead" >
                    <asp:Label ID="Label1" runat="server" Text=" Folder Details"  CssClass="title" ></asp:Label>
                       </div>

                   <div class="divContainers">

                       <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                           <ContentTemplate>


                        <table class="tblDocdet">
                            <tr>
                                <td class="tddocstyle">
                                    Folder :</td>
                                <td style="text-align:left">
                                    <asp:Label ID="lblfoldername" runat="server" CssClass="lbldocdet"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="tddocstyle">
                                     Select Action
                                    </td>
                                <td>
                                    <table>
                                        <tr>
                                <td style="text-align:left">
                                   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>--%>

                                    
                                    <asp:DropDownList ID="ddlaction" runat="server" cssClass="controlstyle combostyle" Width="200px" OnSelectedIndexChanged="ddlaction_SelectedIndexChanged"  AutoPostBack="false">
                                <asp:ListItem Value="0">--Select Action--</asp:ListItem>
                                <asp:ListItem Value="1">Create Folder</asp:ListItem>
                                <asp:ListItem Value="2">Create Sub Folder</asp:ListItem>
                                <asp:ListItem Value="3">Rename Folder</asp:ListItem>
                                <asp:ListItem Value="4">Delete Folder</asp:ListItem>
                                 <asp:ListItem Value="5">Move Folder</asp:ListItem>
                                <asp:ListItem Value="6">Manage Documents</asp:ListItem>
                                <%--<asp:ListItem Value="4">Edit Document</asp:ListItem>--%>
                                               </asp:DropDownList>
                                               <%-- </ContentTemplate>

                                    </asp:UpdatePanel>--%>
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>

                                                 
<asp:Button ID="GoAction" runat="server"  Text="Go"  CssClass="controlstyle actstyle" OnClick="GoAction_Click" />
                                                           </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
    
                                        </tr>
                                    </table>
                                    
                                    
                                </td>

                            </tr>
                            <tr id="trfolder" runat="server">
                              <td class="tddocstyle">
                                    Enter the Name :</td>
                             <td style="text-align:left">

                                       <table>
                                     <tr>
                                         <td> <asp:TextBox ID="txtfoldername" runat="server" CssClass="controlstyle textstyle" Width="200px"></asp:TextBox></td>
                                         <td id="td1" runat="server"><asp:CheckBox ID="chkdoc" runat="server" Text="Create Default Folders" CssClass="controlstyle"  /></td>
                                     </tr>
                                 </table>
                                
                                </td>

                            </tr>
                            <tr id="trfolder1" runat="server">
                              <td class="tddocstyle">
                                    Enter Position</td>
                             <td style="text-align:left">

                                       <asp:TextBox ID="txtfolderposition" runat="server" CssClass="controlstyle textstyle" Width="200px"></asp:TextBox>
                                
                                </td>

                            </tr>
                            <tr id="trsave" runat="server" >
                                <td style="text-align:left">
                                    </td>
                                <td style="text-align:left">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>

                                    
                                   <asp:Button ID="btnupdate" runat="server"  Text="Update"  CssClass="controlstyle actstyle" OnClick="btnupdate_Click" />
                                                </ContentTemplate>
                                    </asp:UpdatePanel>

                                </td>

                            </tr>
                        </table>


                               </ContentTemplate>
                           </asp:UpdatePanel>

                       <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                           <ContentTemplate>


                
                  <div  id="dvDocuments"  runat="server" >
                     <div class="dvsubhead" >
                    <asp:Label ID="Label2" runat="server" Text=" Document Details"   CssClass="title"></asp:Label>
                    </div>
                                         <asp:Repeater ID="rptdocuments" runat="server" Visible="true" OnItemCommand="rptdocuments_ItemCommand">
                                        <HeaderTemplate>
                                            <table id="tbldoc">
                                                <tr class="item">
                                                    <td style="width:600px">Document Title</td>
                                                    <td style="width:400px">Uploaded By</td>
                                                    <td style="width:10px"></td>
                                                    <td style="width:10px"></td>
                                                    <td style="width:10px"></td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table id="tbldoc1">
                                                <tr class="item">
                                                    <td style="width:600px;color:#073763"><%# DataBinder.Eval(Container.DataItem, "title") %></td>
                                                    <td style="width:400px"><%# DataBinder.Eval(Container.DataItem, "uid") %></td>

                                                    <td style="width:10px">

                                       <a href="#" onclick="RetriveDocumentDetails('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>','<%# DataBinder.Eval(Container.DataItem, "possition") %>',<%#DataBinder.Eval(Container, "ItemIndex", "")%>,1)";><i class="icon-arrow-up"></i></a>

                                                     <%--<asp:ImageButton ID="img1" ImageUrl="~/Assets/img/up_.jpg" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "doc_id") %>'  CommandName="up"  />--%>
                                                    </td>
                                                    <td style="width:10px">
                                                        <a href="#" onclick="RetriveDocumentDetails('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>','<%# DataBinder.Eval(Container.DataItem, "possition") %>',<%#DataBinder.Eval(Container, "ItemIndex", "")%>,2)";><i class="icon-arrow-down"></i></a>
                                                        <%-- <asp:ImageButton ID="ImageButton1" ImageUrl="~/Assets/img/down_.jpg" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "doc_id") %>'  CommandName="down" /> --%>

                                                    </td>
                                                    <td style="width:10px"> 
                                                        
                                                        <a href="#"  onclick="RetriveDocumentDetails('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>','<%# DataBinder.Eval(Container.DataItem, "possition") %>','<%#DataBinder.Eval(Container, "ItemIndex", "")%>',3)";><i class="icon-remove"></i></a>
                                                        
                                                     <%--   <asp:ImageButton ID="ImageButton2" ImageUrl="~/Assets/img/delete_.jpg" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "doc_id") %>'  CommandName="del" OnClientClick="return confirm('Do you want to delete');" /> --%> 

                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>
    </div>

                               <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"  Style="display:none" />
                               <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click"  Style="display:none"/>
                               <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" Style="display:none" />


                                                          </ContentTemplate>
                       </asp:UpdatePanel>

               </div>

              </div>
             </div>
        </div>
    </form>
</body>
</html>
