<%@ Page Title="" Language="C#" MasterPageFile="~/DMS/MC1.Master" AutoEventWireup="true" CodeBehind="NavWebForm1.aspx.cs" Inherits="CMLTechQ.DMS.NavWebForm1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocindex" runat="server" Text="0" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbltest" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
        <asp:Label ID="lbldocstyleId" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocstylechange" runat="server" Text="" Style="display: none"></asp:Label>
      
      <input type="hidden" id="hmenufolder" runat="server" />


        <input type="hidden" id="hdocid" name="hdocid" runat="server" />
        <asp:Label ID="lblfile" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hreview" name="hreview" runat="server" />

     
     <div id="container-menu-bar" style="left: 275px; z-index: 200;top:5px;">
            <div id="container-menu">
                <div class="toggle"><a href="#" onclick="Viewslide();">
                    <img src="../Assets/img/expand-16.ico" alt="" />
                </a></div>

                      <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

              

            </div>
            <div class="report" id="dvreport" runat="server">

                <a href="#" onclick="goProgress();" class="push_button"><i class="icon-bar-chart"></i>Reports</a>
            </div>

        </div>
        

        <div id="doc-container" style="top: 45px; overflow-x: hidden; left: 275px; z-index: 800;">
            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="imgload" runat="server" ImageUrl="../Assets/img/ajax-loader.gif" Style="top: 30%; left: 48%; position: fixed; z-index: 999" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <div id="main-content">
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <div class="head">
                            <div class="headtitle">
                                <h2 class="title">
                                    <asp:Label ID="pageinfo" runat="server" Text=""></asp:Label>
                                </h2>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="listcotainer" style="margin-bottom:0px" >
                    <div class="listhead">
                        <h2 class="title pull-left">Latest Version of O&M Manual</h2>
                        <div class="actionbox pull-right">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <telerik:RadDropDownList ID="rd_action1" runat="server" OnSelectedIndexChanged="rd_action1_SelectedIndexChanged" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Action" Width="200px" AutoPostBack="true">
                                        <Items>
                                            <telerik:DropDownListItem Text="Upload New" Value="1" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                   <div id="dvhead"  style="width:100%;" runat="server">
                        <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                            <ContentTemplate>
                          
                                    <telerik:RadGrid runat="server" ID="RadGrid1"   Width="100%" 
	OnItemCommand="RadGrid1_ItemCommand" Skin="Metro" AutoGenerateColumns="false"  OnItemDataBound="RadGrid1_ItemDataBound" HeaderStyle-CssClass="ghead" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="ghead">
        <MasterTableView  Width="100%" TableLayout="Fixed"  AutoGenerateColumns="false"  DataKeyNames="doc_id" >
            <Columns >
                   <telerik:GridTemplateColumn DataField="title" HeaderText="Document Title" ItemStyle-Width="35%" HeaderStyle-Width="35%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="left">
                 <ItemTemplate>
                     <table style="border:none;display:grid;border: none;font-size:13px; font-family: 'Open Sans', sans-serif;" cellspacing="0" cellpadding="0">
                         <tr>
                        
                          <td style="border:none;padding:0px;width:20px"> <img src="../Assets/img/pdf-16.png" alt=""/></td>
                           <td style="border:none;padding:0px;"> <a href="#" onclick="CallViewer('<%#Eval("doc_id") %>','<%#Eval("doc_name") %>','<%#Eval("Review") %>');"><%# DataBinder.Eval(Container.DataItem, "title") %></a></td>
                                
                             
                         </tr>
                     </table>
                   
                    </ItemTemplate>
                       </telerik:GridTemplateColumn>
                 <telerik:GridBoundColumn DataField="Displayversion" HeaderText="Revision" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="uploaded_by" HeaderText="Uploaded By"  ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="udate" HeaderText="Upload Date" ItemStyle-Width="10%" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                  <telerik:GridTemplateColumn DataField="comments" HeaderText="Comments"   HeaderStyle-Width="10%" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
                      <ItemTemplate>
                          <a href="#" onclick="GoComments('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>',<%# DataBinder.Eval(Container.DataItem, "comments") %>);">
                           <asp:Label ID="Label1" runat="server" Text='<%#Eval("resp") %>'></asp:Label> /
                         <asp:Label ID="Label2" runat="server" Text='<%#Eval("comments") %>'></asp:Label></a>
                      </ItemTemplate>
                     </telerik:GridTemplateColumn>
              

                <telerik:GridButtonColumn  ItemStyle-Width="30px" HeaderStyle-Width="30px"   ButtonType="ImageButton" CommandName="edits"  ImageUrl="../Assets/img/edit-8-20.png" UniqueName="editColumn" >
                  
                </telerik:GridButtonColumn>

                 <telerik:GridButtonColumn  ItemStyle-Width="30px"  ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"  HeaderStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" UniqueName="deleteColumn" >

                   </telerik:GridButtonColumn>

                <telerik:GridButtonColumn  ItemStyle-Width="30px"   ItemStyle-BorderStyle="None" HeaderStyle-Width="50px" HeaderStyle-BorderStyle="None"  ButtonType="PushButton"  CommandName="download"  ButtonCssClass="btnstyle1 style-download" >
                   </telerik:GridButtonColumn>

                  <telerik:GridBoundColumn DataField="doc_id" HeaderText="doc_id"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="doc_title" HeaderText="doc_title"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="title" HeaderText="title"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="doc_name" HeaderText="doc_name"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                  

            </Columns>

        </MasterTableView>

        
        <ClientSettings >
            <Scrolling AllowScroll="True" UseStaticHeaders="true"  ></Scrolling>
            <ClientEvents OnGridCreated="GridCreated" />
                  
        </ClientSettings>
        

    </telerik:RadGrid>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btndummyView" runat="server" Text="btndummyView" OnClick="btndummyView_Click" Style="display: none" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="listcotainer" style="margin-bottom:0px">
                    <div class="listhead">
                        <h2 class="title pull-left">Previous Versions of the O&M Manual</h2>
                        <div class="actionbox pull-right">
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <telerik:RadDropDownList ID="rd_action2" runat="server" OnSelectedIndexChanged="rd_action2_SelectedIndexChanged" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Action" Width="200px" AutoPostBack="true">
                                        <Items>
                                            <telerik:DropDownListItem Text="Download All" Value="1" />
                                            <telerik:DropDownListItem Text="Delete All" Value="2" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="dvhead1"  style="width:100%;" runat="server">
                        <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                            <ContentTemplate>
                             
                           <telerik:RadGrid runat="server" ID="RadGrid2"   Width="100%" 
	OnItemCommand="RadGrid2_ItemCommand" Skin="Metro" AutoGenerateColumns="false"  OnItemDataBound="RadGrid2_ItemDataBound" HeaderStyle-CssClass="ghead" HeaderStyle-Font-Bold="true" >
        <MasterTableView  Width="100%" TableLayout="Fixed"  AutoGenerateColumns="false"  DataKeyNames="doc_id" >
            <Columns >
                   <telerik:GridTemplateColumn DataField="title" HeaderText="Document Title" ItemStyle-Width="35%" HeaderStyle-Width="35%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="left">
                 <ItemTemplate>

                        <table style="border: none;font-size:13px" cellspacing="0" cellpadding="0">
                         <tr>
                          <td style="border:none;padding:0px;width:20px"> <img src="../Assets/img/pdf-16.png" alt="" class="pull-left" />
                             <td style="border:none;padding:0px">  <a href="#" onclick="CallViewer('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>','<%# DataBinder.Eval(Container.DataItem, "doc_name") %>');">
                          <%# DataBinder.Eval(Container.DataItem, "title") %>
</a>
                                 </td>
                         </tr>
                     </table>

                    </ItemTemplate>
                       </telerik:GridTemplateColumn>
                 <telerik:GridBoundColumn DataField="Displayversion" HeaderText="Revision" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="uploaded_by" HeaderText="Uploaded By"  ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="udate" HeaderText="Upload Date" ItemStyle-Width="10%" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                  <telerik:GridTemplateColumn DataField="comments" HeaderText="Comments"   HeaderStyle-Width="10%" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
                      <ItemTemplate>
                          <a href="#" onclick="GoComments('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>',<%# DataBinder.Eval(Container.DataItem, "comments") %>);">
                           <asp:Label ID="Label3" runat="server" Text='<%#Eval("resp") %>'></asp:Label> /
                         <asp:Label ID="Label4" runat="server" Text='<%#Eval("comments") %>'></asp:Label></a>
                      </ItemTemplate>
                     </telerik:GridTemplateColumn>
              

                
                <telerik:GridButtonColumn  ItemStyle-Width="30px" HeaderStyle-Width="30px"   ButtonType="ImageButton" CommandName="edits"  ImageUrl="../Assets/img/edit-8-20.png" UniqueName="editColumn" >
                  
                </telerik:GridButtonColumn>

                 <telerik:GridButtonColumn  ItemStyle-Width="30px"  ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"  HeaderStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" UniqueName="deleteColumn" >

                   </telerik:GridButtonColumn>

                <telerik:GridButtonColumn  ItemStyle-Width="30px"   ItemStyle-BorderStyle="None" HeaderStyle-Width="50px" HeaderStyle-BorderStyle="None"  ButtonType="PushButton"  CommandName="download"  ButtonCssClass="btnstyle1 style-download" >
                   </telerik:GridButtonColumn>

                  <telerik:GridBoundColumn DataField="doc_id" HeaderText="doc_id"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >

               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="doc_title" HeaderText="doc_title"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="title" HeaderText="title"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="doc_name" HeaderText="doc_name"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                  

            </Columns>

        </MasterTableView>

        
        <ClientSettings >
            <Scrolling AllowScroll="True" UseStaticHeaders="true"  ></Scrolling>
            <ClientEvents OnGridCreated="GridCreated1" />
                  
        </ClientSettings>
        

    </telerik:RadGrid>
                                  <input type="hidden" id="hfile" value="" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>


            <div class="clear"></div>
        </div>
         <asp:Button ID="btndummy" runat="server" Text="Yes"  OnClick="btndummy_Click" Width="100px" style="display:none" />
         <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            </telerik:RadWindowManager>
        <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="Edit Document" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="900px" Height="350px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <div style="padding: 10px; overflow: hidden;">
                            <div class="subheader">
                                <table style="color: #353535;" border="0" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td style="width: 150px;">MANUAL TITLE</td>
                                        <td style="width: 650px">
                                            <asp:TextBox ID="txt_doctitle" runat="server" CssClass="control-textbox-2" Width="100%"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="innerbox">
                                <div class="subbox">
                                    <table style="color: #353535;" border="0" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td style="width: 150px">CURRENT STATUS</td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                                    <ContentTemplate>
                                                        <telerik:RadDropDownList ID="rd_editstatus" runat="server" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Status" Width="200px">
                                                            <Items>
                                                                <telerik:DropDownListItem Text="Accepted" Value="1" />
                                                                <telerik:DropDownListItem Text="Accepted with Comments" Value="2" />
                                                                <telerik:DropDownListItem Text="Rejected" Value="3" />
                                                                <telerik:DropDownListItem Text="For Review" Value="4" />
                                                                <telerik:DropDownListItem Text="Revised" Value="5" />
                                                            </Items>
                                                        </telerik:RadDropDownList>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 150px">CONTRATOR</td>
                                            <td>
                                                <div style="display: inline-block">
                                                    <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                                        <ContentTemplate>
                                                            <telerik:RadDropDownList ID="rd_editcontractor" runat="server" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Contrator" Width="200px">
                                                            </telerik:RadDropDownList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div style="display: inline-block;margin-left:10px;">
                                                    <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnaddcont" runat="server" Text="New" CssClass="control-general control-button-blue1 push_button" OnClick="btnaddcont_Click" Width="100px" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 150px">REVISION</td>
                                            <td>
                                                <div style="display: inline-block">
                                                    <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                                                        <ContentTemplate>
                                                            <telerik:RadDropDownList ID="rd_editstyle" runat="server" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Style" Width="200px">
                                                            </telerik:RadDropDownList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div style="display: inline-block;margin-left:10px;">
                                                    <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnChangeStyle" runat="server" Text="New Style" CssClass="control-general control-button-blue1 push_button" OnClick="btnChangeStyle_Click" Width="100px" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div class="subbox" style="margin-top: 50px">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="cmdUpdate" runat="server" Text="Update" CssClass="control-general control-button-greenlight push_button" OnClick="cmdUpdate_Click" Width="100px" /></td>
                                                            <td>
                                                                <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="control-general control-button-orange1 push_button" OnClick="btndelete_Click" OnClientClick="return confirm('Do you want to delete..?');" Width="100px" /></td>
                                                            <td>
                                                                <asp:Button ID="cmdcancel" runat="server" Text="Cancel" CssClass="control-general control-button-yellow1 push_button" OnClick="cmdcancel_Click" Width="100px" />
                                                               
                                                            </td>
                                                             <td>
                                                                <input type="hidden" id="hindex" name="hindex" runat="server"  value="0"/>
                                                                  <asp:TextBox ID="txtdocid" runat="server" Text="" Style="display: none"></asp:TextBox>
                                                                </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                        </div>
                   </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
        </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow2" runat="server" Modal="true" BorderStyle="None" Title="Edit Document" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="600px" Height="150px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <table style="color:#353535;">
                            <tr>
                                <td style="width:120px;">
                                    <p class="Popsubtitle">SELECT STYLE</p>
                                </td>
                                <td>
                                    <telerik:RadDropDownList ID="rd_style" runat="server" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Status" Width="200px">
                                                          
                                                        </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btnAddcntr" runat="server" Text="Update" OnClick="btnAddcntr_Click" CssClass="control-general control-button-greenlight push_button" Width="100px" />
                                </td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnCancel1" runat="server" Text="Cancel" OnClick="btnCancel1_Click" CssClass="control-general control-button-yellow1 push_button" Width="100px" />
                                </td>
                               
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow3" runat="server" Modal="true" BorderStyle="None" Title="Create Contractor" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="800px" Height="150px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <div style="padding:10px">
                        <table style="color:#353535;">
                            <tr>
                                <td style="width:120px;">ENTER CONTRACTOR</td>
                                <td>
                                    <asp:TextBox ID="txtcontractor" CssClass="control-textbox-2" Width="400px" runat="server"></asp:TextBox></td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnContrcator" runat="server" Text="Add" CssClass="control-general control-button-greenlight push_button" OnClick="btnContrcator_Click" Width="100px" /></td>
                                            <td>
                                                <asp:Button ID="btncancelc" runat="server" Text="Cancel" CssClass="control-general control-button-yellow1 push_button" OnClick="btncancelc_Click" Width="100px" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow4" runat="server" Modal="true" BorderStyle="None" Title="Confirmation Required!" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="200px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div style="padding: 20px;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblmessage" ForeColor="Red" Font-Size="15px" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lbldocid" runat="server" Text="0" Style="display: none;"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnconfirm" runat="server" Text="Yes" CssClass="control-general control-button-greenlight push_button" OnClick="btnconfirm_Click" Width="100px" /></td>
                                            <td>
                                                <asp:Button ID="btnno" runat="server" Text="No" CssClass="control-general control-button-orange1 push_button" OnClick="btnno_Click" Width="100px" /></td>
                                        </tr>
                                    </table>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>

    <%: Scripts.Render("~/bundles/scripts") %>
    <script async type="text/javascript">
        //function RetriveDocumentDetails(id, status, contactor, mtitle, revision) {
        //     document.getElementById('txt_doctitle').value = mtitle;
        //     document.getElementById('txtdocid').value = id;
        //     SetCheckBox('drcontractor', contactor)
        //     SetCheckBox('drstatus', status)
        //     SetCheckBox('dr_revision', revision)
        //     //GetListIndex(revision);

        //     $('#btndummy1').click();
        // }

        //function SetNoReview() {
        //    var _chk = document.getElementById('chknoreview').checked;


        //    if (_chk == true) {
        //        document.getElementById('chkglobalperiod').checked = false;
        //    }
        //    else {
        //        document.getElementById('chknoreview').checked = false;

        //    }
        //}
        //function godownload(_id, type) {


        //    document.getElementById("hdocid").value = _id;


        //    if (type == 1) {
        //        $('#btndownload').click();
        //    }
        //    else {
        //        $('#btndownload1').click();
        //    }


        //}
        function goProgress() {
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var url = "pts1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
            parent.location.replace(url);
            //parent.document.getElementById("content").src = "ProgressTrackingSheet?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;
            //parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + -1;
            //parent.toggle();
        }
        function GoComments(_id, _comment) {
            var _auth1 = document.getElementById("<%=lbluseridhidden.ClientID %>");
            var _auth2 = document.getElementById("<%=lblprjid.ClientID %>");
            var _auth3 = document.getElementById("<%=lblfolder.ClientID %>");
            var _auth4 = document.getElementById("<%=hmenufolder.ClientID %>");

            //if (_comment > 0) {
            parent.document.getElementById("content").src = "Viewcomments1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + _id+ "&Auth5=" + _auth4.value;
            //}

        }
        //function godelete(_id) {

        //    //var vconfm = confirm("Do you want to delete");
        //    //if (vconfm == true) {
        //    document.getElementById("txtdocid").value = _id;
        //    $('#btndelete').click();
        //    //}


        //}
        function _autoAdjust() {
            //alert(msieversion());
            var div = $("#main-content").height();
            var win = $(window).height();
            if (div < win) {
                //if (msieversion() > 0) {
                //    var win = $(window).height() - 40;
                //}
                //else {
                //var win = $(window).height() - 50;
                //}
                ///$("#main-content").height(win);
                $("#main-content").addClass("botzero");
            }
            else {
                $("#main-content").addClass("botauto");
            }
        }
        function msieversion() {
            var ua = window.navigator.userAgent
            var msie = ua.indexOf("MSIE")

            if (msie > 0)      // If Internet Explorer, return version number
                return parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)))
            else                 // If another browser, return 0
                return 0

        }
        function PageNavaigation(id, type) {

            var _auth1 = document.getElementById("<%=lbluseridhidden.ClientID %>");
            var _auth2 = document.getElementById("<%=lblprjid.ClientID %>");
            var _auth3 = document.getElementById("<%=lblfolder.ClientID %>");

            if (type != 1) {

                parent.document.getElementById("content").src = "documentlist1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth4=" + _auth3.textContent + "&Type=" + type + "&Auth5=" + id;
            }
        }

        //function SetCheckBox(chk, value) {
        //    var e = document.getElementById(chk);

        //    for (var i = 0; i <= document.getElementById(chk).length - 1; i = i + 1) {
        //        var ddlText = document.getElementById(chk).options[i].outerText;
        //        if (ddlText == value) {
        //            document.getElementById(chk).selectedIndex = i;
        //            e.selectedIndex = i;
        //            break;
        //        }
        //    }

        //}
        function CallViewer(_id, _file, _review) {
            var _auth1 = document.getElementById("<%=lbluseridhidden.ClientID %>");
            var _auth2 = document.getElementById("<%=lblprjid.ClientID %>");
            var _auth3 = document.getElementById("<%=lblfolder.ClientID %>");


            document.getElementById("<%=hfile.ClientID %>").value = _file;
            document.getElementById("<%=hreview.ClientID %>").value = _review;
            document.getElementById("<%=hdocid.ClientID %>").value = _id;
            $("#<%=btndummyView.ClientID %>").click();

    </script>
    <script type="text/javascript">

        function GridCreated(sender, args) {

            var div = $("#<%=dvhead.ClientID %>").height();
            var win = $(window).height();


            var sh = (win / 3);

            $("#<%=dvhead.ClientID %>").height(sh);

            var dght = $("#<%=dvhead.ClientID %>").height();


            var scrollArea = sender.GridDataDiv;
            var gridHeader = sender.GridHeaderDiv;
            var parent = $get("<%=dvhead.ClientID %>");

            var dataHeight = sender.get_masterTableView().get_element().clientHeight;
            var hvalue;


            if (dataHeight + gridHeader.clientHeight <= dght) {
                //scrollArea.style.height = dataHeight + "px";
                $("#<%=dvhead.ClientID %>").height(dataHeight + gridHeader.clientHeight);
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

        }


        function GridCreated1(sender, args) {

            var win = $(window).height();
            var sh = (win / 3);

            var scrollArea = sender.GridDataDiv;
            var gridHeader = sender.GridHeaderDiv;

            var pheight = sh - $("#<%=dvhead.ClientID %>").height();
            var hparent = sh + pheight

            //hparent = 302;

            $("#<%=dvhead1.ClientID %>").height(hparent);






            var scrollArea = sender.GridDataDiv;
            var gridHeader = sender.GridHeaderDiv;
            var parent = $get("<%=dvhead1.ClientID %>");

            var dataHeight = sender.get_masterTableView().get_element().clientHeight;
            var dght = $("#<%=dvhead1.ClientID %>").height();
            var hvalue;


            if (dataHeight + gridHeader.clientHeight <= dght) {
                //scrollArea.style.height = dataHeight + "px";
                $("#<%=dvhead1.ClientID %>").height(dataHeight + gridHeader.clientHeight);
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
        function ondownload() {
            $("#<%=btndummy.ClientID %>").click();
        }
        function PageNavaigation_Doc(id, type,folder) {

            var _auth1 = document.getElementById("<%=lbluseridhidden.ClientID %>");
            var _auth2 = document.getElementById("<%=lblprjid.ClientID %>");



            if (type == 1) {
                parent.document.getElementById("content").src = "NavWebForm1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth5=" + folder;
            }
            else if (type == 2) {
                parent.document.getElementById("content").src = "NavWebForm2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type + "&Auth5=" + folder;
            }
            else if (type == 3) {
                parent.document.getElementById("content").src = "NavWebForm3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type + "&Auth5=" + folder;
            }
            else if (type == 4) {
                parent.document.getElementById("content").src = "NavWebForm4?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type + "&Auth5=" + folder;
            }
            else {
                parent.document.getElementById("content").src = "NavWebForm1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type+ "&Auth5=" + folder;
            }
            //_changeActive();
        }
        //function _changeActive() {
        //    $(function () {
        //        $('.nav > li').click(function () {
        //            $('.nav > li').removeClass('current');
        //            $(this).addClass('current');
        //        });
        //    });
        //}
    </script>
</asp:Content>