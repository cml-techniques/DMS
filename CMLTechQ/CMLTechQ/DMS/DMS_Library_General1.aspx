<%@ Page Title="" Language="C#" MasterPageFile="~/DMS/MC1.Master" AutoEventWireup="true" CodeBehind="DMS_Library_General1.aspx.cs" Inherits="CMLTechQ.DMS.DMS_Library_General1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .RadDropDownList_Default .rddlInner {
            /*border-color: #D4D4D4 !important;*/
            background-color: #E8EEEF!important;
            border-radius: 4px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 5px!important;
            font-size: 14px;
            font-weight: bold;
        }

        .rddlPopup_Default .rddlItemSelected {
            background: none repeat scroll 0 0 #3399FF !important;
        }

        .rddlPopup_Default .rddlItemHovered {
            background: none repeat scroll 0 0 #3399FF !important;
        }

        .RadDropDownList_Default .rddlInner {
            font-weight: 600 !important;
            color: black !important;
        }

        .RadDropDownList_Default .rddlIcon {
            margin-top: 3px!important;
            height: 20px!important;
            width: 20px!important;
        }

        .RadPicker_Default input {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
            font-size: 14px;
            font-weight: bold;
        }

        .RadPicker_Default span {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 4px!important;
            font-size: 14px;
            font-weight: bold;
        }
        .datepicker-style {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
            font-size: 14px;
            font-weight: bold;
        }

        div.RadUpload .inputs {
        }



        div.RadUpload .ruBrowse {
            /*background-position: 0 -30px;*/
            background-color: #0099CC!important;
            box-shadow: 0px 2px 0px rgba(0,51,204,1);
            color: #F9FAFA!important;
            border: 0px;
            font-weight: bold;
            padding: 0!important;
            /*height: 30px!important;*/
            border-radius: 4px;
            display: block;
            width: 100px;
            margin: 0px;
            cursor: pointer;
        }

        div.RadUpload_Default .ruFileWrap .ruButtonHover {
            background-position: 100% -30px !important;
        }


        div.RadUpload .ruFakeInput {
            border: 1px solid red !important;
            width: 20px !important;
            display: none;
        }
                div.RadUpload .ruInputs {
            margin-top: auto!important;
        }
    .RadGrid
{
    border-radius: 4px;
    overflow: hidden;
    border-color:#dddddd;
    box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.1);
} 
     .ghead{
      height: 32px ! important;
      color: #3f4141;
      font-weight:700 ! important;
        }
        .newbord {
            border-right:none !important;
        }
        .newbord1 {
            border-left:none !important;
            border-right:none !important;
        }
       .newbord2 {
             border-left:none !important;
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
        <input type="hidden" id="hfile" name="hfile" runat="server" />
        <input type="hidden" id="hdocid" name="hdocid" runat="server" />

        <input type="hidden" id="hedit" name="hedit" runat="server" value="0" />
        <asp:Label ID="lblfile" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hreview" name="hreview" runat="server" />

     <input type="hidden" id="hmenufolder" runat="server" />


     <div id="container-menu-bar" style="left: 275px; z-index: 200">
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
        

        <div id="doc-container" style="top: 45px; overflow: hidden; left: 275px; z-index: 700;bottom:5px;">

            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="imgload" runat="server" ImageUrl="../Assets/img/ajax-loader.gif" Style="top: 30%; left: 48%; position: fixed; z-index: 999" />
                </ProgressTemplate>
            </asp:UpdateProgress>

            <div id="main-content" style="bottom:5px;position:absolute">
                <div class="head">
                    <div class="headtitle" style="width:65%">
                        <h2 class="title">
                            <asp:Label ID="pageinfo" runat="server" Text="Document Library"></asp:Label>
                        </h2>
                    </div>
                    <div class="action-menu" style="width:35%;margin-top:2px">
                         <a href="#" class="control-general control-button-white-1 push_button pull-right" onclick="goBack();" ><i class="fa fa-angle-double-left"></i> BACK</a>
                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                            <ContentTemplate>
                        <asp:Button ID="btnadd" runat="server" Text="Add Document" OnClick="btnadd_Click" class="control-general control-button-white-1 push_button pull-right" />
                        <asp:Button ID="btnaddtoproject" runat="server" Text="Add To Project" OnClick="btnaddtoproject_Click" class="control-general control-button-white-1 push_button pull-right" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                    </div>
                </div>
               

                <div style="margin-top: 3px;position:absolute;bottom:5px;top:40px;">
                   <div id="dvhead"  style="width:100%;" runat="server">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

             <%-- <telerik:RadGrid runat="server" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" ID="RadGrid1" Width="100%" AutoGenerateColumns="false"  AllowFilteringByColumn="true" FilterType="CheckList" AllowPaging="true" PagerStyle-AlwaysVisible="true" AllowSorting="true" Skin="Metro" HeaderStyle-CssClass="ghead" HeaderStyle-Font-Bold="true" >
            <MasterTableView AutoGenerateColumns="False"  DataKeyNames="ITM_ID" ClientDataKeyNames="ITM_ID" TableLayout="Fixed" Width="100%" HeaderStyle-Font-Bold="true" >--%>

                      <telerik:RadGrid runat="server" ID="RadGrid1"   Width="100%" 
	OnItemCommand="RadGrid1_ItemCommand" Skin="Metro" AutoGenerateColumns="false"  OnItemDataBound="RadGrid1_ItemDataBound" HeaderStyle-CssClass="ghead" HeaderStyle-Font-Bold="true"  AllowFilteringByColumn="true" FilterType="CheckList">
        <MasterTableView  Width="100%"   AutoGenerateColumns="false"  DataKeyNames="ITM_ID"  >


                <Columns>
                    <telerik:GridTemplateColumn HeaderText="Select" HeaderStyle-Width="5%" ItemStyle-Width="5%" AllowFiltering="false" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkselect" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn UniqueName="MANF_NAME" DataField="MANF_NAME" HeaderText="Manufacturer " HeaderStyle-Width="20%" ItemStyle-Width="20%" FilterControlWidth="100%"  >
                        <FilterTemplate >
                            <telerik:RadComboBox ID="RadComboBoxMANF_NAME"  DataTextField="MANF_NAME" DataSourceID="SqlDataSource2"
                                DataValueField="MANF_NAME"   AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("MANF_NAME").CurrentFilterValue %>'
                                runat="server"  OnClientSelectedIndexChanged="ManIndexChanged" Width="100%" Skin="Metro">
                                <Items>
                                    <telerik:RadComboBoxItem Text="All" />
                                </Items>
                            </telerik:RadComboBox>
                            <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                <script type="text/javascript">
                                    function ManIndexChanged(sender, args) {
                                        var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("MANF_NAME", args.get_item().get_value(), "EqualTo");
                                    }
                                </script>
                            </telerik:RadScriptBlock>
                        </FilterTemplate>
                    </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="CONTRA_TYPE" DataField="CONTRA_TYPE" HeaderText="Type"
                        HeaderStyle-Width="25%" FilterControlWidth="25%" ItemStyle-Width="25%" >
                        <FilterTemplate>
                            <telerik:RadComboBox ID="RadComboBoxCONTRA_TYPE"  DataTextField="CONTRA_TYPE" DataSourceID="SqlDataSource3"
                                DataValueField="CONTRA_TYPE" Height="150px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("CONTRA_TYPE").CurrentFilterValue %>'
                                runat="server"  OnClientSelectedIndexChanged="TypeIndexChanged" Width="100%" Skin="Metro">
                                <Items>
                                    <telerik:RadComboBoxItem Text="All" />
                                </Items>
                            </telerik:RadComboBox>
                            <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                                <script type="text/javascript">
                                    function TypeIndexChanged(sender, args) {
                                        var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("CONTRA_TYPE", args.get_item().get_value(), "EqualTo");
                                    }
                                </script>
                            </telerik:RadScriptBlock>
                        </FilterTemplate>
                    </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn UniqueName="Model" DataField="Model" HeaderText="Model"
                        HeaderStyle-Width="15%" ItemStyle-Width="15%" >
                        <FilterTemplate>
                            <telerik:RadComboBox ID="RadComboBoxModel"  DataTextField="Model" DataSourceID="SqlDataSource4"
                                DataValueField="Model" Height="200px"  AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Model").CurrentFilterValue %>'
                                runat="server"  OnClientSelectedIndexChanged="ModelIndexChanged" Width="100%" Skin="Metro">
                                <Items>
                                    <telerik:RadComboBoxItem Text="All" />
                                </Items>
                            </telerik:RadComboBox>
                            <telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
                                <script type="text/javascript">
                                    function ModelIndexChanged(sender, args) {
                                        var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("Model", args.get_item().get_value(), "EqualTo");
                                    }
                                </script>
                            </telerik:RadScriptBlock>
                        </FilterTemplate>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn FilterDelay="200" AllowFiltering="false" Visible="false"  DataField="FILE_NAME" HeaderText="File Name" HeaderStyle-Width="0%" ItemStyle-Width="0%" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ITM_ID" HeaderText="ITM_ID"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SOURCE_NAME" AllowFiltering="false" HeaderText="SOURCE_NAME"  Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >

               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="FILE_NAME"    Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >

               </telerik:GridBoundColumn>

                <telerik:GridTemplateColumn DataField="FILE_NAME" HeaderText="File Name"  AllowFiltering="false" ItemStyle-Width="35%" HeaderStyle-Width="35%"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" >
                 <ItemTemplate>
                      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("DocView?ID={0}&FILE={1}&SOURCE={2}", 0,Eval("FILE_NAME"),2) %>'><%# DataBinder.Eval(Container.DataItem, "FILE_NAME") %> </asp:HyperLink>

                   </ItemTemplate>
                </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn DataField="title"  HeaderStyle-CssClass="newbord" HeaderText="" AllowFiltering="false" ItemStyle-Width="30px" HeaderStyle-Width="30px"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                      <asp:HyperLink ID="source_tag" runat="server" NavigateUrl='<%# Eval("SOURCE_NAME") %>' Target="_blank"><i class="fa fa-globe"></i></asp:HyperLink>

                   </ItemTemplate>
                </telerik:GridTemplateColumn>

                  <telerik:GridButtonColumn  ItemStyle-Width="30px" HeaderStyle-CssClass="newbord1" HeaderStyle-Width="30px" ItemStyle-BorderStyle="None"  ButtonType="ImageButton" CommandName="edits"  ImageUrl="../Assets/img/edit-8-20.png" >
                  
                </telerik:GridButtonColumn>

                 <telerik:GridButtonColumn  ItemStyle-Width="30px"  HeaderStyle-CssClass="newbord2"  ItemStyle-BorderStyle="None"   HeaderStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" >

                   </telerik:GridButtonColumn>

                                                            

                </Columns>
            </MasterTableView>
              <ClientSettings >
            <Scrolling AllowScroll="True" UseStaticHeaders="true"  ></Scrolling>
            <ClientEvents OnGridCreated="GridCreated" />
                  
        </ClientSettings>
        </telerik:RadGrid>


                  <input type="hidden" id="haction" name="hdocid" runat="server" value="1" />

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                 </div>
                </div>
            </div>
            <div class="clear"></div>
    
           <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="550px" Height="350px" VisibleStatusbar="false"  OnClientShow="setPopupTitle" >
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel88" runat="server">

                    <ContentTemplate>
                           <div style="padding: 10px; overflow: hidden;">
                            <div class="innerbox">
                                <div class="subbox">
                                    <table style="color: #353535;width:100%" border="0" cellspacing="0" cellpadding="5">
                                        <tr>
                                    <td style="width: 160px;">MANUFACTURER</td>
                                    <td>
                                                    <div style="display: inline-block">
                                                    
                                                    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                                                        <ContentTemplate>
                                                            <telerik:RadDropDownList ID="drop_manufaturer" runat="server" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Contrator"  Width="270px">
                                                            </telerik:RadDropDownList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                                <div style="display: inline-block;margin-left:10px;">
                                                    <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnaddnew" runat="server" Text="New" CssClass="control-general control-button-blue1 push_button"  OnClick="btnaddnew_Click" Width="100px" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>

                                 </td>
                                            <td></td>
                                 </tr>
                                 <tr>
                            <td style="width: 160px;">TYPE</td>
                            <td>
                                <asp:TextBox ID="txt_type" runat="server" CssClass="control-textbox-2" Width="250px"></asp:TextBox></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width: 160px;">MODEL NO</td>
                            <td >
                                <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txt_model" runat="server" CssClass="control-textbox-2" Width="250px" ClientIDMode="Static" ></asp:TextBox>
                                         <input id="chk_model" type="checkbox" class="checkstyle" runat="server" onclick="_chkmodel(event);" /><span class="lbl">  N/A</span>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>

                        <tr >
                                       <td style="width: 160px;">FILE NAME</td>
                                       <td style="width:100%;">
                                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="pdf" Skin="Glow" MaxFileInputsCount="1"  CssClass="ruBrowse">
                                         <Localization Select="Browse"   />
                                        </telerik:RadAsyncUpload>                                               
                            </td>
                            <td><asp:TextBox ID="txt_file" runat="server"  style="display:none" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 160px;">SOURCE</td>
                            <td >
                                <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txt_source" runat="server" CssClass="control-textbox-2" Width="250px" ClientIDMode="Static"></asp:TextBox>
                                       <input id="chk_source" type="checkbox" class="checkstyle" runat="server" onclick="_chksource(event);" /><span class="lbl">  N/A</span>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </td>
                        </tr>
                        <tr>
                            <td style="width: 160px;"></td>
                            <td >
                                <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                                        <ContentTemplate>
                                  <div class="subbox" style="margin-top: 30px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="control-general control-button-greenlight push_button" Width="100px" OnClick="btnsave_Click" />
                                         </td>
                                        <td id="td_delete" runat="server" visible="false">
                                           <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="control-general control-button-orange1 push_button" OnClick="btnconfirm_Click" OnClientClick="return confirm('Do you want to delete..?');" Width="100px" /></td>
                                        <td>
                                            <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="control-general control-button-yellow1 push_button" OnClick="btncancel_Click"  Width="100px"/>
                                        </td>
                                     
                                    </tr>
                                </table>
                                      </div>
                                              </ContentTemplate>
                    </asp:UpdatePanel>

                                   <td>
                                       <asp:Label ID="lblid" runat="server"  Style="display: none;"></asp:Label>
                                   </td>

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

           <telerik:RadWindow ID="RadWindow2" runat="server" Modal="true" BorderStyle="None" Title="Create MANUFACTURER" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="750px" Height="150px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <div style="padding:10px">
                        <table style="color:#353535;">
                            <tr>
                                <td style="width:150px;">ENTER MANUFACTURER</td>
                                <td>
                                    <asp:TextBox ID="txtManufacturer" CssClass="control-textbox-2" Width="300px" runat="server"></asp:TextBox></td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnmanu" runat="server" Text="Add" CssClass="control-general control-button-greenlight push_button" OnClick="btnmanu_Click" Width="100px" /></td>
                                            <td>
                                                <asp:Button ID="btncancelm" runat="server" Text="Cancel" CssClass="control-general control-button-yellow1 push_button" OnClick="btncancelm_Click" Width="100px" /></td>
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

           <telerik:RadWindow ID="RadWindow3" runat="server" Modal="true" BorderStyle="None" Title="Confirmation Required!" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="200px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div style="padding: 20px;">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
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



         <telerik:RadWindow ID="RadWindow4" runat="server" Modal="true" BorderStyle="None" Title="Message!" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="200px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div style="padding: 20px;">
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblmsgs" ForeColor="Red" Font-Size="15px" runat="server" Text="" ></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text="0" Style="display: none;"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td style="width:100px"></td>
                                            <td>
                                                <asp:Button ID="btnok" runat="server" Text="Ok" CssClass="control-general control-button-greenlight push_button" OnClick="btnok_Click" Width="100px" /></td>
                                            <td>
                                               
                                        </tr>
                                    </table>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>

        </telerik:RadWindow>


 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_DBCMLConnectionString %>" SelectCommand="Load_dms_library_general" SelectCommandType="StoredProcedure" >

    </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:DB_DBCMLConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand=" SELECT DISTINCT [MANF_NAME]  FROM MANUFACTURER_TBL_GENERAL A JOIN DMS_LIBRARY_GENERAL B ON A.Manf_id=B.Man_id"
        runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:DB_DBCMLConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT CONTRA_TYPE FROM DMS_LIBRARY_GENERAL"
        runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:DB_DBCMLConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT MODEL FROM DMS_LIBRARY_GENERAL"
        runat="server"></asp:SqlDataSource>

            <script src="../Assets/js/jquery.min.js"></script>
        <%: Scripts.Render("~/bundles/scripts") %>
        <script type="text/javascript">
            function goBack() {
               
                var _auth1 = document.getElementById("<%=lbluseridhidden.ClientID %>");
                var _auth2 = document.getElementById("<%=lblprjid.ClientID %>");
                var _auth3 = document.getElementById("<%=lblfolder.ClientID %>");
                var _auth4 = document.getElementById("<%=hmenufolder.ClientID %>");


                parent.document.getElementById("content").src = "NavWebForm2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth5=" + +_auth4.value;
            }

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

                    parent.document.getElementById("content").src = "NavWebForm2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth4=" + _auth3.textContent + "&Type=" + type + "&Auth5=" + id;
                }
            }
            function _chkmodel(event) {
                var checkbox = event.target;
                var _model = document.getElementById("<%=txt_model.ClientID %>");
                if (checkbox.checked) {
                    _model.value = "N/A";
                }
                else {
                    _model.value = "";
                }
            }
            function _chksource(event) {
                //var _chk = document.getElementById("chk_source");
                //var _source = document.getElementById("txt_source");
                //if (_chk.checked == true)
                //    _source.value = "N/A"
                //else
                //    _source.value = "";

                var checkbox = event.target;
                var _source = document.getElementById("<%=txt_source.ClientID %>");
                if (checkbox.checked) {
                    _source.value = "N/A";
                }
                else {
                    _source.value = "";
                }
            }
            function Viewdoc(_id) {
                var url = "ViewSourceDocument?Auth1=" + _id;
                window.open(url, '', '', true);

            }

            function setPopupTitle(sender) {
                var hfValue = $telerik.$('input[id$="dialogTitle"]', sender.get_contentElement()).val();
                if (hfValue) {
                    sender.set_title(hfValue);
                }
                else {

                    if (document.getElementById("<%=haction.ClientID %>").value == "1") {
                        sender.set_title("Add Document");
                    }
                    else {
                        sender.set_title("Edit Document");
                    }
                }
            }
            function GridCreated(sender, args) {


                //$("#dvpane2").show();

                var div = $("#<%=dvhead.ClientID %>").height(); 
                var win = $(window).height();


                var sh = (win - 100)

                $("#<%=dvhead.ClientID %>").height(sh);

                var dght = $("#<%=dvhead.ClientID %>").height();


                var scrollArea = sender.GridDataDiv;
                var gridHeader = sender.GridHeaderDiv;
                var parent = $get("<%=dvhead.ClientID %>");

                var dataHeight = sender.get_masterTableView().get_element().clientHeight;
                var hvalue;


                //alert(dataHeight);

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
            function PageNavaigation_Doc(id, type, folder) {

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
                                parent.document.getElementById("content").src = "NavWebForm1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type + "&Auth5=" + folder;
                            }
                            //_changeActive();
            }
            function goProgress() {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var url = "pts?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
                parent.location.replace(url);
            }
        </script>
</asp:Content>
