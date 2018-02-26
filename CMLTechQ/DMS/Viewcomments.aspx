<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Viewcomments.aspx.cs" Inherits="CMLTechQ.DMS.Viewcomments" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
        <webopt:BundleReference ID="BundleReference1" runat="server" Path="~/Content/css" />
 <style type="text/css">
    #main-content a:hover {
        color: #ff9667;
    }

    #main-content a:visited {
        color: #353535;
    }
    .RadGrid
{
    border-radius: 4px;
    overflow: hidden;
    border-color:#dddddd;
    box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.1);
} 
     .ghead{
      height: 24px;
      color: #3f4141;
        }

 </style>
</head>
<body onload="SetHide(0);" style="background-color: #edeff0;">
    <form id="form1" runat="server">
                <%--<asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>--%>
             <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
             <asp:Label ID="lblfile" runat="server" Text="" style="display:none"/>
         <asp:Label ID="lbldocid" runat="server" Text="0" Style="display: none"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <input type="hidden" id="hdivdis" runat="server" value="0" />
      <%--  <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600" ></ajaxToolkit:ToolkitScriptManager>--%>

        <div id="doc-container" style="top: 0px; overflow-x: hidden;">
             <div id="main-content">

              <div class="head">
                            <div class="headtitle">
                                <h2 class="title">
                                    <asp:Label ID="pageinfo" runat="server" Text="Comments Review Page"></asp:Label>
                                </h2>
                            </div>
                   <div class="action-menu ">
                        
                        <a href="#" onclick="BacktoDocument();" class="control-general control-button-white-1 push_button pull-right"><i class="fa fa-angle-double-left"></i> BACK</a>
                        <a href="#" onclick="GoPrint();" class="control-general control-button-white-1 push_button pull-right"><i class="icon-print"></i> PRINT</a>
                    </div>
                        </div>
                 
              <div class="listcotainer">
                      <div class="listhead">
                        <h2 class="title pull-left">CML Responded Comments
                             <a class="pull-left" style="margin-right: 10px; padding-left: 4px" href="#" onclick="getResponseData();"><i  id="iadd" class="icon-plus"></i></a>
                          </h2>
                     </div>
                      <div class="clearfix"></div>
                    <div id="dvhead"  style="width:100%;">
                      <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                           <ContentTemplate>

                                 <telerik:RadGrid runat="server" ID="RadGrid1"   Width="100%" 
	OnItemCommand="RadGrid1_ItemCommand" Skin="Metro" AutoGenerateColumns="false"  OnItemDataBound="RadGrid1_ItemDataBound" HeaderStyle-CssClass="ghead" HeaderStyle-Font-Bold="true">
        <MasterTableView  Width="100%" TableLayout="Fixed"  AutoGenerateColumns="false"  DataKeyNames="comm_id" >
            <Columns >
                 
                 <telerik:GridBoundColumn DataField="sec_no" HeaderText="Sec" ItemStyle-Width="6%" HeaderStyle-Width="6%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="page_no" HeaderText="Page" ItemStyle-Width="5%" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
              
               <telerik:GridBoundColumn DataField="comment" HeaderText="Comment"  Visible="false" HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Justify">
               </telerik:GridBoundColumn>
                  <telerik:GridTemplateColumn DataField="Comment" HeaderText="Comment" ItemStyle-Width="36%" HeaderStyle-Width="36%" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
                 <ItemTemplate>
                     <asp:Label ID="lblcomment" runat="server"   Text='<%#Eval("Comment") %>' ></asp:Label>
                     <asp:Label ID="lblfilename" runat="server"  style="display:none" Text='<%#Eval("image_name") %>' ></asp:Label>
                     <table id="tbl" runat="server" style="border:none">
                         <tr style="border:none">
                             <td id="tblimg" runat="server" visible="false">
                                 <a  href="#"   onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
   
                                      <i class="fa fa-file-image-o"></i>
                         
                                    </a>

                             </td>
                               <td id="tblexl" runat="server" visible="false">
                                 <a  href="#"   onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                       
                                 <i class="fa fa-file-excel-o"></i>
                         
                                    </a>

                             </td>
                                  <td id="tblpdf" runat="server" visible="false">
                                 <a  href="#"   onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                       
                                 <i class="fa fa-file-pdf-o"></i>
                         
                                    </a>

                             </td>
                         </tr>

                     </table>
                    </ItemTemplate>
                       </telerik:GridTemplateColumn>

                 <telerik:GridBoundColumn DataField="up_user" HeaderText="Comment By"  ItemStyle-Width="11%" HeaderStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="com_date" HeaderText="Date" ItemStyle-Width="9%" HeaderStyle-Width="9%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="resp" HeaderText="CML Response" ItemStyle-Width="33%" HeaderStyle-Width="33%" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left">
               </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="comm_id" HeaderText="comm_id"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>

                <telerik:GridButtonColumn  ItemStyle-Width="30px" HeaderStyle-Width="30px"   ButtonType="ImageButton" CommandName="edits"  ImageUrl="../Assets/img/edit-8-20.png" >
                  
                </telerik:GridButtonColumn>

                 <telerik:GridButtonColumn  ItemStyle-Width="30px"  ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"  HeaderStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" >

                   </telerik:GridButtonColumn>

              

            </Columns>

        </MasterTableView>

        
        <ClientSettings >
            <Scrolling AllowScroll="True" UseStaticHeaders="true"  ></Scrolling>
            <ClientEvents OnGridCreated="GridCreated" />
                  
        </ClientSettings>
        

    </telerik:RadGrid>
                               
    <%--  <asp:ListView ID="lvcomments" runat="server" DataKeyNames="comm_id" style="width:100%;" onitemcanceling="lvcomments_ItemCanceling" onitemediting="lvcomments_ItemEditing" OnItemCommand="lvcomments_ItemCommand" OnItemUpdating="lvcomments_ItemUpdating" OnItemDeleting="lvcomments_ItemDeleting" OnItemDataBound="lvcomments_ItemDataBound">
                                                    <ItemTemplate>
                                                         <tr id="itm_tr" runat="server" class="row">

                                                     <td style="width:6%;text-align:center;word-wrap:break-word"><%# Eval("sec_no") %></td>
                                                    <td style="width:5%;text-align:center">
                                                        <a href="#" onclick="OpenPdf('<%# Eval("page_no") %>')"><%# Eval("page_no") %></a>

                                                    </td>
                                                    <td style="width:24%;text-align:left;word-wrap:break-word"><%# Eval("comment") %></td>
                                                     <td style="width:12%;text-align:left;word-wrap:break-word" >
                                                         <a href="#" onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                                                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("image_name") %>' ></asp:Label></a>
                                                        </td>
                                                    <td style="width:11%;text-align:left;word-wrap:break-word"><%# Eval("up_user") %></td>
                                                    <td style="width:9%;text-align:center"><%# Eval("com_date") %></td>
                                                    <td style="width:33%;text-align:left;word-wrap: break-word"><%# Eval("resp") %></td>
                                                    <td style="width: 28px; padding: 0px; text-align: center;">
                                                    
                                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="" CssClass="btnstyle1 style-edit"   />
                                                       </td>
                                                     <td style="width: 28px; padding: 0px; text-align: center;">
                                                        <asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="" CssClass="btnstyle1 style-delete"   />
                                                     </td>
                                                    <td style="width: 0px; padding: 0px; text-align: center;">
                                                         <asp:Label ID="lblcomm_id" runat="server" Text='<%# Eval("comm_id") %>' style="display:none" />
                                                      </td>

                                                      </tr>

                                                    </ItemTemplate>
                    <AlternatingItemTemplate>
                                                                                <tr id="itm_tr" runat="server" class="alter">

                                                     <td style="width:6%;text-align:center;word-wrap:break-word"><%# Eval("sec_no") %></td>
                                                    <td style="width:5%;text-align:center">
                                                        <a href="#" onclick="OpenPdf('<%# Eval("page_no") %>')"><%# Eval("page_no") %></a>

                                                    </td>
                                                    <td style="width:24%;text-align:left;word-wrap:break-word"><%# Eval("comment") %></td>
                                                     <td style="width:12%;text-align:left;word-wrap:break-word" >
                                                         <a href="#" onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                                                       <asp:Label ID="Label6" runat="server" Text='<%#Eval("image_name") %>' ></asp:Label></a>
                                                        </td>
                                                    <td style="width:11%;text-align:left;word-wrap:break-word"><%# Eval("up_user") %></td>
                                                    <td style="width:9%;text-align:center"><%# Eval("com_date") %></td>
                                                    <td style="width:33%;text-align:left;word-wrap: break-word"><%# Eval("resp") %></td>
                                                    <td style="width: 28px; padding: 0px; text-align: center;">
                                                    
                                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="" CssClass="btnstyle1 style-edit"   />
                                                       </td>
                                                     <td style="width: 28px; padding: 0px; text-align: center;">
                                                        <asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="" CssClass="btnstyle1 style-delete"   />
                                                     </td>
                                                    <td style="width: 0px; padding: 0px; text-align: center;">
                                                         <asp:Label ID="lblcomm_id" runat="server" Text='<%# Eval("comm_id") %>' style="display:none" />
                                                      </td>

                                                      </tr>
                    </AlternatingItemTemplate>

                                                    
                                                    <LayoutTemplate >
                                                      
                                                              <table id="itemPlaceholderContainer" runat="server" class="table-style2" cellspacing="0" border="0" style="width:100%;table-layout: fixed;"  >
                                                                        <tr id="itm_tr" runat="server" class="hrow">
                                                   <td style="width:6%;text-align:center;word-wrap:break-word">Sec.</td>
                                                   <td style="width:5%;text-align:center">Page</td>
                                                   <td style="width:24%;text-align:left">Comment</td>
                                                   <td style="width:12%;text-align:left">Attachments</td>
                                                   <td style="width:11%;text-align:left">Commnt. By</td>
                                                   <td style="width:9%;text-align:center">Date</td>
                                                   <td style="width:33%;text-align:left;">CML Response</td>
                                                   <td style="width: 28px; padding: 0px; text-align: center;"></td>
                                                   <td style="width: 28px; padding: 0px; text-align: center;"></td>
                                                   <td style="width: 0px; padding: 0px; text-align: center;"></td>
                                       </tr>
                                       <tr id="itemPlaceholder" runat="server"></tr>
                                       </table>
  
                                                    </LayoutTemplate>
                                   <EmptyDataTemplate>
                                       <table cellspacing="0" border="0" style="width:100%;table-layout: fixed;" class="table-style2">
                                                                        <tr id="itm_tr" runat="server" class="hrow" >
                                                   <td style="width:6%;text-align:center">Sec.</td>
                                                   <td style="width:5%;text-align:center">Page</td>
                                                   <td style="width:24%;text-align:left;word-wrap:break-word">Comment</td>
                                                    <td style="width:12%;text-align:left;word-wrap:break-word"></td>
                                                   <td style="width:11%;text-align:left;word-wrap:break-word">Commnt. By</td>
                                                   <td style="width:9%;text-align:center">Date</td>
                                                   <td style="width:33%;text-align:left;word-wrap:break-word">CML Response</td>
                                                    <td style="width: 28px; padding: 0px; text-align: center;"></td>
                                                   <td style="width: 28px; padding: 0px; text-align: center;"></td>
                                                    <td style="width: 0px; padding: 0px; text-align: center;"></td>
                                                    </tr>
                                                    <tr class="row" >
                                                    <td colspan="10">No Comments available</td>
                                                    </tr>
                                                    </table>
                                   </EmptyDataTemplate>
                                                    <EditItemTemplate>
                                                        <tr class="row" >
                                                         <td style="width:6%;text-align:center"><%# Eval("sec_no") %></td>
                                                    <td style="width:5%;text-align:center"><%# Eval("page_no") %></td>
                                                    <td style="width:24%;text-align:left;word-wrap:break-word"><%# Eval("comment") %></td>
                                                     <td style="width:12%;text-align:left;word-wrap:break-word;">
                                                         <a href="#"   onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                                                       <asp:Label ID="Label6" runat="server" Text='<%#Eval("image_name") %>' ></asp:Label></a>
                                                        </td>
                                                     </td>
                                                    <td style="width:11%;text-align:left;word-wrap:break-word"><%# Eval("up_user") %></td>
                                                   <td style="width:9%;text-align:center"><%# Eval("com_date") %></td>
                                                    <td style="width:33%;text-align:left;word-wrap:break-word" id="txtid" runat="server">
                                                                       
                                                        <asp:TextBox ID="txtresp" runat="server" Text='<%# Eval("resp") %>' Width="100%"    TextMode="MultiLine"  Height='<%# (Eval("resp").ToString().Length/34)*20%>' ></asp:TextBox>
                                                    
                                </td>
                                                   <td style="width: 28px; padding: 0px; text-align: center;">
                                                   <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="" CssClass="btnstyle1 style-update" />
                                                   </td>
                                                   <td style="width: 28px; padding: 0px; text-align: center;">
                                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="" CssClass="btnstyle1 style-cancel"  />
                                                   </td>
                                                   <td style="width: 0px; padding: 0px; text-align: center;">
                                                   <asp:Label ID="lblcomm_id" runat="server" Text='<%# Eval("comm_id") %>' style="display:none" />
                                                    </td>
                                                             
                                                 
                                                                
                                                                
                                                           
                    </tr>
                </EditItemTemplate>
               
            </asp:ListView>--%>

                                   
                               <input type="hidden" id="etype" runat="server" value="0" />
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                </div>
               
        
                 
              <div class="listcotainer">
                    <div class="listhead">
                        <h2 class="title pull-left">Awaiting CML Response</h2>
                        </div>              
                         <div class="clearfix"></div>
                    <div id="dvhead1"  style="width:100%;">
                        <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                            <ContentTemplate>

                                 <telerik:RadGrid runat="server" ID="RadGrid2"   Width="100%" 
	OnItemCommand="RadGrid2_ItemCommand" Skin="Metro" AutoGenerateColumns="false"  OnItemDataBound="RadGrid2_ItemDataBound" HeaderStyle-CssClass="ghead" HeaderStyle-Font-Bold="true">
        <MasterTableView  Width="100%" TableLayout="Fixed"  AutoGenerateColumns="false"  DataKeyNames="comm_id" >
            <Columns >
                 
                 <telerik:GridBoundColumn DataField="sec_no" HeaderText="Sec" ItemStyle-Width="6%" HeaderStyle-Width="6%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="page_no" HeaderText="Page" ItemStyle-Width="5%" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
              
               <telerik:GridBoundColumn DataField="comment" HeaderText="Comment"  Visible="false" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left">
               </telerik:GridBoundColumn>
                 
                  <telerik:GridTemplateColumn DataField="Comment" HeaderText="Comment" ItemStyle-Width="36%" HeaderStyle-Width="36%" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
                 <ItemTemplate>
                     <asp:Label ID="lblcomment" runat="server"   Text='<%#Eval("Comment") %>' ></asp:Label>
                     <asp:Label ID="lblfilename" runat="server"  style="display:none" Text='<%#Eval("image_name") %>' ></asp:Label>
                     <table id="tbl" runat="server" style="border:none">
                         <tr style="border:none">
                             <td id="tblimg" runat="server" visible="false">
                                 <a  href="#"   onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
   
                                      <i class="fa fa-file-image-o"></i>
                         
                                    </a>

                             </td>
                               <td id="tblexl" runat="server" visible="false">
                                 <a  href="#"   onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                       
                                 <i class="fa fa-file-excel-o"></i>
                         
                                    </a>

                             </td>
                                  <td id="tblpdf" runat="server" visible="false">
                                 <a  href="#"   onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                       
                                 <i class="fa fa-file-pdf-o"></i>
                         
                                    </a>

                             </td>
                         </tr>

                     </table>
                    </ItemTemplate>
                       </telerik:GridTemplateColumn>

                 <telerik:GridBoundColumn DataField="up_user" HeaderText="Comment By"  ItemStyle-Width="11%" HeaderStyle-Width="11%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="com_date" HeaderText="Date" ItemStyle-Width="9%" HeaderStyle-Width="9%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="comm_id1" HeaderText="CML Response" ItemStyle-Width="33%" HeaderStyle-Width="33%" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left">
               </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="comm_id" HeaderText="comm_id"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>

                <telerik:GridButtonColumn  ItemStyle-Width="30px" HeaderStyle-Width="30px"   ButtonType="ImageButton" CommandName="add"  ImageUrl="../Assets/img/edit-8-20.png" >
                  
                </telerik:GridButtonColumn>

                 <telerik:GridButtonColumn  ItemStyle-Width="30px"  ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"  HeaderStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" >

                   </telerik:GridButtonColumn>

              

            </Columns>

        </MasterTableView>

        
        <ClientSettings >
            <Scrolling AllowScroll="True" UseStaticHeaders="true"  ></Scrolling>
            <ClientEvents OnGridCreated="GridCreated1" />
                  
        </ClientSettings>
        

    </telerik:RadGrid>

                               <%-- <asp:ListView ID="comm_list_wait" runat="server" Style="width: 100%;" OnItemCommand="comm_list_wait_ItemCommand" OnItemDeleting="comm_list_wait_ItemDeleting" >
                                                                                    <ItemTemplate>
                                                         <tr id="itm_tr" runat="server" class="row">

                                                     <td style="width:6%;text-align:center"><%# Eval("sec_no") %></td>
                                                    <td style="width:5%;text-align:center">
                                   <a href="#" onclick="OpenPdf('<%# Eval("page_no") %>')"><%# Eval("page_no") %></a></td>
                                                    <td style="width:24%;text-align:left;word-wrap:break-word"><%# Eval("comment") %></td>

                                                      <td style="width:12%;text-align:left;word-wrap:break-word">
                                                         <a href="#" onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                                                       <asp:Label ID="Label6" runat="server" Text='<%#Eval("image_name") %>' ></asp:Label></a>
                                                        </td>
                                                    <td style="width:11%;text-align:left;word-wrap:break-word"><%# Eval("up_user") %></td>
                                                    <td style="width:9%;text-align:center"><%# Eval("com_date") %></td>
                                                    <td style="width:33%;text-align:left">
                                                       
                                                    </td>
                                                     <td style="width: 28px; padding: 0px; text-align: center;">
                                                        <asp:Button ID="btnadd" runat="server" CommandName="Add" Text="" CssClass="btnstyle1 style-add" ToolTip="Add Response" ForeColor="Black"  />
                                                     </td>
                                                    <td style="width: 28px; padding: 0px; text-align: center;">
                                                         <asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="" CssClass="btnstyle1 style-delete" ToolTip="Delete Comment"  />
                                                        
                                                      </td>
                                                     <td style="width: 0px; padding: 0px; text-align: center;">
                                                          <asp:Label ID="lblcomm_id" runat="server" Text='<%# Eval("comm_id") %>' style="display:none" />
                                                     </td>


                                                      </tr>

                                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr id="itm_tr" runat="server" class="alter">

                                                     <td style="width:6%;text-align:center"><%# Eval("sec_no") %></td>
                                                    <td style="width:5%;text-align:center"><a href="#" onclick="OpenPdf('<%# Eval("page_no") %>')"><%# Eval("page_no") %></a></td>
                                                    <td style="width:24%;text-align:left;word-wrap:break-word"><%# Eval("comment") %></td>
                                                      <td style="width:12%;text-align:left;word-wrap:break-word">
                                                         <a href="#" onclick="Showimagewindow('<%# DataBinder.Eval(Container.DataItem, "comm_id") %>');">
                                                       <asp:Label ID="Label6" runat="server" Text='<%#Eval("image_name") %>' ></asp:Label></a>
                                                        </td>
                                                    <td style="width:11%;text-align:left;word-wrap:break-word"><%# Eval("up_user") %></td>
                                                    <td style="width:9%;text-align:center"><%# Eval("com_date") %></td>
                                                    <td style="width:33%;text-align:left">
                                                       
                                                    </td>
                                                     <td style="width: 28px; padding: 0px; text-align: center;">
                                                        <asp:Button ID="btnadd" runat="server" CommandName="Add" Text="" CssClass="btnstyle1 style-add" ToolTip="Add Response" ForeColor="Black"  />
                                                     </td>
                                                    <td style="width: 28px; padding: 0px; text-align: center;">
                                                         <asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="" CssClass="btnstyle1 style-delete" ToolTip="Delete Comment"  />
                                                        
                                                      </td>
                                                     <td style="width: 0px; padding: 0px; text-align: center;">
                                                          <asp:Label ID="lblcomm_id" runat="server" Text='<%# Eval("comm_id") %>' style="display:none" />
                                                     </td>


                                                      </tr>

                                    </AlternatingItemTemplate>

                                                    
                                                    <LayoutTemplate >
                                                                    <table id="itemPlaceholderContainer" runat="server" class="table-style2" cellspacing="0" border="0" style="width:100%;table-layout: fixed"  >
                                                                        <tr id="itm_tr" runat="server" class="hrow" >
                                                   <td style="width:6%;text-align:center">Sec.</td>
                                                   <td style="width:5%;text-align:center">Page</td>
                                                   <td style="width:24%;text-align:left">Comment</td>
                                                   <td style="width:12%;text-align:left">Attachments</td>
                                                   <td style="width:11%;text-align:left">Commnt. By</td>
                                                   <td style="width:9%;text-align:center">Date</td>
                                                   <td style="width:33%;text-align:left">CML Response</td>
                                                   <td style="width: 28px; padding: 0px; text-align: center;"></td>
                                                   <td style="width: 28px; padding: 0px; text-align: center;"></td>
                                                    <td style="width:0px; padding: 0px; text-align: center;"></td>
                                       </tr>
                                       <tr id="itemPlaceholder" runat="server"></tr>
                                       </table>
  
                                                    </LayoutTemplate>
                                   <EmptyDataTemplate>
                                       <table cellspacing="0" border="0" style="width:100%;table-layout: fixed" class="table-style2"  >
                                                                        <tr id="itm_tr" runat="server" class="hrow" >
                                                   <td style="width:6%;text-align:center">Sec.</td>
                                                   <td style="width:5%;text-align:center">Page</td>
                                                   <td style="width:24%;text-align:left">Comment</td>
                                                    <td style="width:12%;text-align:left">Attachment</td>
                                                   <td style="width:11%;text-align:left">Commnt. By</td>
                                                   <td style="width:9%;text-align:center">Date</td>
                                                   <td style="width:33%;text-align:left">CML Response</td>
                                                   <td style="width: 28px; padding: 0px; text-align: center;"></td>
                                                    <td style="width:28px; padding: 0px; text-align: center;"></td>
                                                    <td style="width: 0px; padding: 0px; text-align: center;"></td>
                                                    </tr>
                                                    <tr class="row" >
                                                    <td colspan="10">No Comments available</td>
                                                    </tr>
                                                    </table>
                                   </EmptyDataTemplate>
               
                                </asp:ListView>--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                      </div>
                  </div>

           </div>
        
         </div>  

            </div>
                 
                 <div class="clear"></div>
            <div class="footer"></div>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            </telerik:RadWindowManager>
            <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="750px" Height="400px" VisibleStatusbar="false" OnClientShow="setPopupTitle">
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div style="padding: 10px;color: #353535">
                                <table>
                                    <tr>
                                        <td style="width:150px"> ENTER RESPONSE</td>
                                        <td style="margin:20px"><asp:TextBox ID="txtcomment"  runat="server" Width="500px" Height="220px" TextMode="MultiLine" CssClass="control-textbox-2"  ></asp:TextBox><br /></td>
                                        </tr>
                                </table>
                                <br />
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <table style="margin-top:20px">
                                            <tr>
                                               <td style="width:150px"></td>
                                                <td><asp:Button ID="btnSave" runat="server" Text="Save" CssClass="control-general control-button-greenlight push_button" Width="100px" OnClick="btnSave_Click" /></td>
                                                <td><asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="control-general control-button-orange push_button"  Width="100px" OnClick="btnExit_Click" /></td>
                                                <td>
                                                    <asp:Label ID="lblcommid" runat="server" Text="0" Style="display: none;"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>

            </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow2" runat="server" Modal="true" BorderStyle="None" Title="Confirmation Required!" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="200px" VisibleStatusbar="false">
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <div style="padding: 20px;">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblmessage" ForeColor="Red" Font-Size="15px" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="lblid" runat="server" Text="0" Style="display: none;"></asp:Label>
                                        <input type="hidden" id="htype" runat="server" value="0" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <br />
                                <br />
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td><asp:Button ID="btnconfirm" runat="server" Text="Yes" CssClass="control-general control-button-greenlight push_button" OnClick="btnconfirm_Click" Width="100px" /></td>
                                                <td><asp:Button ID="btnno" runat="server" Text="No" CssClass="control-general control-button-orange1 push_button" OnClick="btnno_Click" Width="100px" /></td>
                                            </tr>
                                        </table>
                                        
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>

            </telerik:RadWindow>
    </form>
    
       <%: Scripts.Render("~/bundles/scripts") %>
      <script type="text/javascript">
          function getResponseData() {


              var e = document.getElementById("dvhead");

              if (e) {

                  if (e.style.display == 'none') {
                      e.style.visibility = "visible";
                      e.style.display = "block";

                      jQuery("#iadd").removeClass('icon-plus').addClass('icon-minus');

                      setdiv(1);

                      document.getElementById("hdivdis").value = "1";


                  }
                  else {

                      e.style.visibility = "hidden";
                      e.style.display = "none";
                      jQuery("#iadd").removeClass('icon-minus').addClass('icon-plus');

                      setdiv(2);

                      document.getElementById("hdivdis").value = "0";


                  }
              }
              else {
                  alert('n')
              }


          }

          function GoPrint() {
              var id = document.getElementById("lbldocid").innerText;
              var prj = document.getElementById("lblprjid").innerText;
              window.open("Reports?Auth1=" + id + "&Auth2=" + prj, 'O&M Review Comment Details', 'left=150,top=150,width=1024,height=800,menubar=1,toolbar=0,scrollbars=1,status=0');
          }
          function BacktoDocument() {
              var _auth1 = document.getElementById("lbluseridhidden");
              var _auth2 = document.getElementById("lblprjid");
              var _auth3 = document.getElementById("lblfolder");
              parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;
          }
          function OpenPdf(_search) {
              var _file = document.getElementById("lblfile");
              var _path = "http://demo1.cmltechniques.com/DMS/Documents/123/" + _file.textContent + "#search=" + _search;
              window.open(_path, '', 'left=150,top=150,width=1024,height=800,menubar=1,toolbar=0,scrollbars=1,status=1');
          }

          function Showimagewindow(_fileid) {

              var _auth1 = document.getElementById("lblprjid").innerHTML;

              var url = "ImageView?Auth1=" + _auth1 + "&Auth2=" + _fileid;
              window.open(url, "_blank", "toolbar=No, scrollbars=yes, resizable=No");
          }
          function setdiv(type) {



              var div = $("#dvhead").height();
              var win = $(window).height();

              if (type == 1) {
                  nw = (win - 180) - div
              }
              else {
                  nw = (win - 180);
              }


              $("#dvhead1").height(nw);

              var div1 = $("#dvhead1").height();



              var grid;
              grid = $find("<%= RadGrid2.ClientID %>");



              var scrollArea = grid.GridDataDiv;
              var gridHeader = grid.GridHeaderDiv;
              var parent = $get("dvhead1");

              var dataHeight = grid.get_masterTableView().get_element().clientHeight;
              var hvalue;


              if (dataHeight + gridHeader.clientHeight <= div1) {
                  //scrollArea.style.height = dataHeight + "px";
                  $("#dvhead1").height(dataHeight + gridHeader.clientHeight);
                  hvalue = dataHeight;
              }
              else {

                  hvalue = parent.clientHeight - gridHeader.clientHeight;

              }


              grid.GridDataDiv.style.height = hvalue + "px";
              grid.repaint();
          }
          function GridCreated(sender, args) {

              SetHide(1);

              var div = $("#dvhead").height();
              var win = $(window).height();



              var sh = (win / 3);

              $("#dvhead").height(sh);

              var dght = $("#dvhead").height();


              var scrollArea = sender.GridDataDiv;
              var gridHeader = sender.GridHeaderDiv;
              var parent = $get("dvhead");

              var dataHeight = sender.get_masterTableView().get_element().clientHeight;
              var hvalue;


              if (dataHeight + gridHeader.clientHeight <= dght) {
                  //scrollArea.style.height = dataHeight + "px";
                  $("#dvhead").height(dataHeight + gridHeader.clientHeight);
                  hvalue = dataHeight;
              }
              else {

                  hvalue = parent.clientHeight - gridHeader.clientHeight;

              }
              var grid;
              grid = $find("<%= RadGrid1.ClientID %>");
              //grid1.get_element().style.height = sheight + "px";

              grid.GridDataDiv.style.height = hvalue + "px";
              grid.repaint();

              var hdis = document.getElementById("hdivdis").value;
              if (hdis == "0") {
                  SetHide(0);
              }
          }


          function GridCreated1(sender, args) {

              var win = $(window).height();
              //var sh = (win);

              var scrollArea = sender.GridDataDiv;
              var gridHeader = sender.GridHeaderDiv;

              var hparent = $("#dvhead").height();
              var pheight = 0;

              var hdis = document.getElementById("hdivdis").value;


              if (hdis == "0") {
                  pheight = (win - 180);
                  //alert('none');
              }
              else {
                  // pheight = (win / 3) - hparent;
                  pheight = (win - 180) - hparent;
                  //alert('ys');

              }

              //alert(win);
              //alert(hparent);
              //alert(pheight);

              $("#dvhead1").height(pheight);


              var scrollArea = sender.GridDataDiv;
              var gridHeader = sender.GridHeaderDiv;
              var parent = $get("dvhead1");

              var dataHeight = sender.get_masterTableView().get_element().clientHeight;
              var dght = $("#dvhead1").height();
              var hvalue;


              if (dataHeight + gridHeader.clientHeight <= dght) {
                  //scrollArea.style.height = dataHeight + "px";
                  $("#dvhead1").height(dataHeight + gridHeader.clientHeight);
                  hvalue = dataHeight;
              }
              else {

                  hvalue = parent.clientHeight - gridHeader.clientHeight;

              }
              var grid;
              grid = $find("<%= RadGrid2.ClientID %>");
            //grid1.get_element().style.height = sheight + "px";

            grid.GridDataDiv.style.height = hvalue + "px";
            grid.repaint();

        }
        function SetHide(type) {

            if (type == 1) {
                $("#dvhead").show();
            }
            else {
                $("#dvhead").hide();
            }
        }
        function setPopupTitle(sender) {
            var hfValue = $telerik.$('input[id$="dialogTitle"]', sender.get_contentElement()).val();
            if (hfValue) {
                sender.set_title(hfValue);
            }
            else {

                if (document.getElementById("etype").value == 1) {
                    sender.set_title("Edit Response !");
                }
                else {
                    sender.set_title("Add Response !");
                }
            }
        }
    </script>
</body>
</html>
