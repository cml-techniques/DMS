<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_manual.aspx.cs" Inherits="CMLTechQ.DMS.view_manual" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>View Documents</title>
    <meta charset="utf-8"/>

	<link rel="stylesheet" href="../Assets/css/StyleView.css" type="text/css" />
	<script src="../Assets/js/jquery.min.js"></script>
    <%--<script src="../Assets/js/ckeditor.js"></script>--%>
    <link rel="stylesheet" href="../Assets/css/font-awesome.min.css" />

	<script lang="javascript">
		function ResizeWidth() {
		    var height = $(window).height() - 40;
		    var width = $(window).width() - $("#dvComments").width()-50;
		    $("#dvViewManual").height(height);
		    $("#dvViewManual").width(width);
		}
		function editModeEnable() {
		    var type = document.getElementById("TextBox1").value;

		    document.getElementById("txtcomments").value = type;
		    document.getElementById("btnadd").value = "Update";

		    var pageno = document.getElementById("lblPage").innerText;
		    var secNo = document.getElementById("lblSection").innerText;
		    
		   document.getElementById("txtpageno").value = pageno;
		   document.getElementById("txtsectionNo").value = secNo;

		    <%Session["type"] = "111";%>
		    var session_value='<%=Session["type"]%>'; 
 
            alert(session_value); 

           
		   
		   EditComments(1);
		}
		function EditComments(type) {

		    if (type == 1) {
		        document.getElementById("tdViewComment").style.display = 'none';

		    var height = $("#dvCommentGrid").height() + $("#tdViewComment").height()
		    //var width = $(window).width() - $("#dvComments").width() - 50;

		    $("#dvCommentGrid").height(height);

		}


		    if ($("#dvCommentGrid").height() > $("#gvComment").height()) {
		        $("#dvCommentGrid").height($("#gvComment").height());

		    }

		}
	</script>
       
	<style type="text/css">
	</style>
	<script type="text/javascript">
	    window.onload = function () {
			ResizeWidth();
		}
		window.onresize = function () {
		    ResizeWidth();
		}
	</script>

</head>
<body >
	<form id="form1" runat="server">
         <input type="hidden" id="commentid" runat="server"  value="0" />
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600"></asp:ScriptManager>


		<div id="dvRightHead">
		<%--	<a href="javascript:history.go(-1);">
            <i class="icon-fast-backward"></i>--%>
                <input type="button" value="Back"  id="btnback" onclick="javascript: history.back(-1);" />
		</div>
        
        
        <div id="dvViewMain">

		<div id="dvViewManual">
				<iframe id="myframe" runat="server" ></iframe>
		</div>

		<div id="dvComments">
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">
				<ContentTemplate>

               <table style="width:100%;background-color:black">
<tr>
	<td class="colorblack">

        <table >
            <tr>
                <td >
                    <input type="text" id="txtpageno" placeholder="Page No" runat="server"  class="PageNoStyle"   />
                </td>
                <td>
<input type="text" id="txtsectionNo" placeholder="Sect No" runat="server" class="PageNoStyle" />
                </td>

            </tr>
        </table>  
        </td>
</tr>
 </table>

                <asp:TextBox ID="txtcomments" runat="server" TextMode="MultiLine" Width="98%" Height="90px"></asp:TextBox>

              <br />
              <table style="width:100%">
                  <tr>
                      <td class="CenterBlack">
<asp:Button ID="btnadd" runat="server" OnClick="btnadd_Click" Text="Add" Width="65px" />
                      </td>
                  </tr>
              </table>
               
            <table  id="tdViewComment" runat="server"  style="width:100%;" visible="false">
                  <tr>
                      <td style="background-color:gray;color:white">
P:<asp:Label ID="lblPage" Text="" runat="server" CssClass="Head2"></asp:Label> &nbsp;>>&nbsp;
                          Sec:
<asp:Label ID="lblSection" Text="" runat="server" CssClass="Header"></asp:Label>
                      </td>  
                  </tr>
                  <tr>
                      <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="75px" Width="99%" CssClass="viewtextcomment" Enabled="false" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                      </td>

                  </tr>
                  <tr>
                      <td>
                             <table>
                              <tr>
                                  <td>
                                      &nbsp;<asp:Button ID="neWeDIT" runat="server" Text="Edit" OnClick="neWeDIT_Click" />
                                  </td>
                                  <td>
<%--<input type="button" id="btnDelete"   runat="server" value="Delete" onclick="EditComments(1);" />--%>
                                        &nbsp;<asp:Button ID="newdelete" runat="server" Text="Delete" OnClick="newdelete_Click"  />
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
              </table>

            <div id="dvCommentGrid" runat="server">
                          <asp:GridView ID="gvComment" runat="server" AutoGenerateColumns="false"  Font-Names="Verdana" Font-Size="X-Small" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" HeaderStyle-CssClass="Header"  CellPadding="3"  GridLines="None" HorizontalAlign="Left"  OnRowCommand="gvComment_RowCommand" OnRowDataBound="gvComment_RowDataBound" RowStyle-Wrap="true" OnSelectedIndexChanged="gvComment_SelectedIndexChanged"   >
							  <Columns>
                                   <asp:ButtonField ButtonType="Image" ImageUrl="~/Assets/img/minus.gif"  CommandName="Deletes"/>
<%--                                  <asp:TemplateField HeaderText="ss">
                                      <ItemTemplate>
                                         <a> <i class="icon-edit-sign"></i></a>
                                      </ItemTemplate>
                                  </asp:TemplateField>--%>
            <asp:TemplateField > 
            <ItemTemplate> 
            <%# Container.DataItemIndex + 1 %> :>
            </ItemTemplate> 
            <ItemStyle HorizontalAlign="Right" /> 
     </asp:TemplateField>

<asp:BoundField  DataField="Comment" ItemStyle-CssClass="gvstyle" >

                                   <ItemStyle CssClass="gvstyle" />
                                   </asp:BoundField>

 <asp:TemplateField> 
            <ItemTemplate> 
                <asp:Label ID="lbl" Text=' <%#  "P:"+ Eval("Page") +">> Sec:" + Eval("sec") %>'  runat="server" Width="130px"></asp:Label>
                </ItemTemplate>
     </asp:TemplateField>            
                                  <asp:ButtonField ButtonType="Image" ImageUrl="~/Assets/img/pdf-16.png"  CommandName="View"/>
                                  <asp:BoundField  DataField="page" />
								  <asp:BoundField  DataField="sec" />
                                   <asp:BoundField DataField="ID"/>
							  </Columns>
						      <HeaderStyle CssClass="Header" />
                              <RowStyle Wrap="True" />
						  </asp:GridView>
						 
                </div>

				</ContentTemplate>
			   </asp:UpdatePanel>
		</div>

            </div>
         
	</form> 
    <p>
&nbsp;</p>
</body>
</html>

