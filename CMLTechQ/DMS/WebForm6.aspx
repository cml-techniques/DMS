<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="CMLTechQ.DMS.WebForm6" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
         <webopt:BundleReference ID="BundleReference1" runat="server" Path="~/Content/css" />
      <link rel="stylesheet" href="../Assets/css/Navigation1.css" />
       <style type="text/css">
        .RadDropDownList_Default .rddlInner {
            /*border-color: #D4D4D4 !important;*/
            background-color: #E8EEEF!important;
            border-radius: 4px !important;
            background-image: none !important;
            border: 1px solid #dddddd!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
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
   .RadGrid
{
    border-radius: 4px;
    overflow: hidden;
    border-color:#dddddd;
    box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.1);
} 
     .lbledit {
            color:#000;
            font-size:14px;
            margin-right:10px;
         }
   .ghead{
      height: 24px;
      color: #3f4141;
        }
   .itemstyle {

      height: 20px;
      color: #3f4141;

           }
           .tabs3 li {
	 padding: 0px !important; text-indent: 0px; float: right; list-style-type: none !important;margin-top:0px;margin-right:5px;
}
.tabs3 a {
	margin: 0px; padding: 0px 10px; text-align: center;  text-transform: none; font-size: 13px; font-weight: bold; text-decoration: none; display: block; position: relative;width:80px;
}
.tabs3 a {
	 font-size: 13px;font-family: 'Open Sans', sans-serif;
}
.tabs3 li {
}
 .tabs3 a:hover {
	/*background-color:#00CC66;color: #f9fafa !important;*/
    background-color:transparent;color: #353535 !important;
}
.tabs3 .current {
	/*background-color:#00CC66;color: #f9fafa !important;*/
    /*background-color:#ffffff;color: #f00 !important;*/
     background-color:#A9A9A9 ! important;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocFolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbltest" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
        <asp:Label ID="lbltype" runat="server" Text="1" Style="display: none" />
     
        
        <div id="navtree1">
            <div id="dvtree1">
                <div class="side-navbar-wrapper1" id="dvnav1">
                   <asp:PlaceHolder ID="ph_mainNav" runat="server"></asp:PlaceHolder>
                </div>
            </div>

        </div>

        <div id="container-menu-bar" style="left: 275px; z-index: -1">
            <div id="container-menu">
                <div class="toggle"><a href="#" onclick="Viewslide();">
                    <img src="../Assets/img/expand-16.ico" alt="" />
                </a></div>

                <%--<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>--%>
                 <ul class='nav'>
                     <li class='item'><a class='current' href='#' onclick="Godocuments(1);">O&M Manual</a></li>
                     <li class='item'><a href='#' onclick="Godocuments(2);">Manufacture Information</a></li>
                     <li class='item'><a href='#' onclick="Godocuments(3);">Record Drawings</a></li>
                     <li class='item current'><a href='#' onclick="Godocuments(4);">Test Documentation</a></li>
                 </ul>

            </div>
            <div class="report" id="dvreport" runat="server">

                <a href="#" class="push_button"><i class="icon-bar-chart"></i> Reports</a>
            </div>

        </div>

        <%--<div style="position:absolute;top:0px;height:40px;left:275px;right:5px;background-color:olive">
             <span style="margin:0px 5px;"> <a href="javascript:void(0);" data-action="toggleMenu" onclick="goc();" title="Full Screen"><i class="fa fa-bars" style="font-size:18px"></i></a> </span>
           </div>--%>
        <div id="doc-container" style="top: 45px; overflow-x: hidden; left: 275px; z-index: 800;">

            <div id="main-content">
                <div class="head">
                    <div class="headtitle">
                        <h2 class="title">
                            <asp:Label ID="pageinfo" runat="server" Text=""></asp:Label>
                        </h2>
                    </div>
                                            <div class="action-menu" style="width:30%;margin-top:-4px">

                               <ul class="tabs3">
                                   
                                <li><a  id="schedule" class="control-general control-button-white-1 push_button pull-right" href="#" onclick="changetype(2);">Scheduled</a></li>
                                <li><a  id="upload" class="control-general control-button-white-1 push_button pull-right current" href="#" onclick="changetype(1);">Uploaded</a></li>
                                
                                

                            </ul>
                   
                    </div>
                </div>
                <div id="infobar">
                    <table cellspacing="0" border="0" style="width: 100%;">
                        <tr style="height: 100%">
                            <td style="width: 33%;">
                                <div class="info-title">Documents Scheduled</div>

                                <span class="info pull-right">
                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </span>
                            </td>
                            <td style="width: 33%;">
                                <div class="info-title">Documents Uploaded</div>
                                <span class="info pull-right">
                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lbupload" runat="server" Text="" ></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </span>
                            </td>
                            <td style="width: 33%;">
                                <div class="info-title">Total Upload Percentage</div>
                                <span class="info pull-right">
                                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lbper" runat="server" Text="" ></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </span>
                            </td>
                        
                        </tr>
                    </table>

                    <div class="clearfix"></div>
                </div>



               <div class="listcotainer" style="margin-bottom:0px;">
                    <div class="floatingBox">
                        <div class="container-fluid">

                            <div class="clear"></div>

                            <div class="panes_">

               <div class="pane" style="display: block;" id="dvpane1" runat="server">

                <div class="listcotainer" style="margin-bottom:0px;">

                  <div class="listhead">
                        <h2 class="title pull-left">
                            <asp:Label ID="Label1" runat="server" Text="To be Uploaded"></asp:Label></h2>
                        <div class="actionbox pull-right">
                              <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                    <ContentTemplate>
                                        <telerik:RadDropDownList ID="rd_action2" runat="server" OnSelectedIndexChanged="rd_action2_SelectedIndexChanged" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Action" Width="200px" AutoPostBack="true">
                                            <Items>
                                                <telerik:DropDownListItem Text="New Schedule" Value="1" />
                                                <telerik:DropDownListItem Text="Delete All" Value="2" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                                            </div>
                      <div class="clearfix"></div>
               


                  <div id="dvhead1"  style="width:100%;">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                             
          <telerik:RadGrid runat="server" ID="RadGrid2"   Width="100%" 
	OnItemCommand="RadGrid2_ItemCommand" Skin="Metro" AutoGenerateColumns="false" ItemStyle-CssClass="itemstyle" HeaderStyle-CssClass="ghead" HeaderStyle-Font-Bold="true" OnItemDataBound="RadGrid2_ItemDataBound">
        <MasterTableView  Width="100%" TableLayout="Fixed"  AutoGenerateColumns="false"  DataKeyNames="Sch_id"  >
            <Columns >
                <telerik:GridBoundColumn DataField="doc_ref" HeaderText="Engineers Reference" ItemStyle-Width="20%" HeaderStyle-Width="20%"  >
               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="title" HeaderText="File Name" ItemStyle-Width="65%" HeaderStyle-Width="65%">
               </telerik:GridBoundColumn>
               
             
                 <telerik:GridBoundColumn DataField="date_tobeuploaded" HeaderText="Scheduled Date" ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                  <telerik:GridButtonColumn  ItemStyle-Width="0%"    HeaderStyle-Width="0%"  Visible="false" >
                   </telerik:GridButtonColumn>
                 <telerik:GridBoundColumn DataField="Sch_id" HeaderText="Sch_id" HeaderStyle-Width="0%" ItemStyle-Width="0%"  Display="false" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>

            <telerik:GridButtonColumn  ItemStyle-Width="30px" HeaderStyle-Width="30px"   ButtonType="ImageButton" CommandName="edits"  ImageUrl="../Assets/img/edit-8-20.png" UniqueName="editColumn" >
                  
                </telerik:GridButtonColumn>
                 <telerik:GridButtonColumn  ItemStyle-Width="30px"  ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"  HeaderStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" UniqueName="deleteColumn" >
                   </telerik:GridButtonColumn>
               
               
            </Columns>

        </MasterTableView>

        
        <ClientSettings>
            <Scrolling AllowScroll="True" UseStaticHeaders="true" ></Scrolling>
            <ClientEvents OnGridCreated="GridCreated1" />
        </ClientSettings>
        

    </telerik:RadGrid>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>
                   </div>
                                 <div class="pane" style="display: none;" id="dvpane2" runat="server">

                <div class="listcotainer" style="margin-bottom:0px;">
                    <div class="listhead">
                        <h2 class="title pull-left">
                            <asp:Label ID="lblold" runat="server" Text="Uploaded Documents"></asp:Label></h2>
                        <div class="actionbox pull-right">

                             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                         <telerik:RadDropDownList ID="rd_action1" runat="server" OnSelectedIndexChanged="rd_action1_SelectedIndexChanged" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Action" Width="200px" AutoPostBack="true">
                                            <Items>
                                                <telerik:DropDownListItem Text="Upload New" Value="1" />
                                                <telerik:DropDownListItem Text="Download All" Value="2" />
                                                <telerik:DropDownListItem Text="Delete All" Value="3" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        </ContentTemplate>
                                 </asp:UpdatePanel>

                                  
                        </div>
                    </div>
                    <div class="clearfix"></div>
                   <div id="dvhead"  style="width:100%;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <telerik:RadGrid runat="server" ID="RadGrid1"   Width="100%" 
	OnItemCommand="RadGrid1_ItemCommand" Skin="Metro" AutoGenerateColumns="false"  OnItemDataBound="RadGrid1_ItemDataBound" HeaderStyle-CssClass="ghead" HeaderStyle-Font-Bold="true" > 
        <MasterTableView  Width="100%" TableLayout="Fixed"  AutoGenerateColumns="false"  DataKeyNames="doc_id"  >
            <Columns >

                                <telerik:GridTemplateColumn ItemStyle-Width="30%" HeaderStyle-Width="30%" HeaderText="Engineers Reference">
                   <ItemTemplate>
                       <table style="border:none;display:grid;border: none;" cellspacing="0" cellpadding="0">
                         <tr>
                          <td style="border:none;padding:0px;width:20px">
                      <img src="../Assets/img/pdf-16.png" alt="" class="pull-left" style="margin-right: 5px" /> </td>
                        <td style="border:none;padding:0px;">                        
                     <a href="#" onclick="Goviewdocument('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>','<%# DataBinder.Eval(Container.DataItem, "doc_name") %>');">
                       <%# DataBinder.Eval(Container.DataItem, "doc_ref") %> </a>
                             </td>
                             </tr>
                           </table>
                   </ItemTemplate>
                </telerik:GridTemplateColumn>
                 <telerik:GridBoundColumn DataField="title" HeaderText="File Name" ItemStyle-Width="40%" HeaderStyle-Width="40%"  HeaderStyle-HorizontalAlign="left">
                </telerik:GridBoundColumn>

               <telerik:GridBoundColumn DataField="udate" HeaderText="Uploaded Date"  ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="file_size" HeaderText="Size" ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="doc_id" HeaderText="doc_id" HeaderStyle-Width="0%" ItemStyle-Width="0%"  Display="false" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="doc_name" HeaderText="doc_name" HeaderStyle-Width="0%" ItemStyle-Width="0%" Display="false" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="doc_ref" HeaderText="doc_ref" HeaderStyle-Width="0%" ItemStyle-Width="0%" Display="false" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="Type" HeaderText="Type" HeaderStyle-Width="0%" ItemStyle-Width="0%" Display="false" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" >
               </telerik:GridBoundColumn>


                <telerik:GridButtonColumn  ItemStyle-Width="30px" HeaderStyle-Width="30px"   ButtonType="ImageButton" CommandName="edits"  ImageUrl="../Assets/img/edit-8-20.png"  UniqueName="editColumn">
                  
                </telerik:GridButtonColumn>
                 <telerik:GridButtonColumn  ItemStyle-Width="30px"  ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None"  HeaderStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" UniqueName="deleteColumn" >
                   </telerik:GridButtonColumn>
                <telerik:GridButtonColumn  ItemStyle-Width="30px"   ItemStyle-BorderStyle="None" HeaderStyle-Width="50px" HeaderStyle-BorderStyle="None"  ButtonType="PushButton"  CommandName="download"  ButtonCssClass="btnstyle1 style-download"  UniqueName="downloadcolumn" >
                   </telerik:GridButtonColumn>
            </Columns>

        </MasterTableView>

        
        <ClientSettings >
            <Scrolling AllowScroll="True" UseStaticHeaders="true"  ></Scrolling>
            <ClientEvents OnGridCreated="GridCreated" />
                  
        </ClientSettings>
        

    </telerik:RadGrid>

                           

                                 <input type="hidden" id="hfile" value="" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>


                </div>
                                     </div>
                                </div>
                            </div>
                        </div>
                   

            </div>
 <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            </telerik:RadWindowManager>
             <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="Edit Details" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="600px" Height="250px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div style="padding: 10px; overflow: hidden;">
                            <div class="subheader">
                                <table style="color: #353535;width:100%" border="0" cellspacing="0" cellpadding="5">
                                       <tr>
                                        <td style="width: 100px;">REFERENCE</td>
                                        <td >
                                            <asp:TextBox ID="txtrefrence" runat="server" CssClass="control-textbox-2" Width="350px"></asp:TextBox>
                                        </td>
                                    </tr>
                                        <tr style="display:none">
                                        <td style="width: 100px;"> TITLE</td>
                                        <td >
                                            <asp:TextBox ID="txtDocumenttitle" runat="server" CssClass="control-textbox-2" Width="350px"></asp:TextBox>
                                        </td>
                                    </tr>

                                   <tr>
                                        <td style="width: 100px;">FILE NAME</td>
                                        <td >
                                            <asp:TextBox ID="txtfilename" runat="server" CssClass="control-textbox-2" Width="350px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="innerbox">
                                <div class="subbox">
                                    <table style="color: #353535;" border="0" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td style="width: 100px;">
                                                 <asp:TextBox ID="txtdocid" runat="server" Text="0" Style="display: none;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <div class="subbox" style="margin-top: 50px">
                                                    <table>
                                                        <tr>
                                                            <td><asp:Button ID="btnSave" runat="server" Text="Update" CssClass="control-general control-button-greenlight push_button" Width="100px" OnClick="btnSave_Click" /></td>
                                                            <td><asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="control-general control-button-orange1 push_button" OnClick="btnconfirm_Click" OnClientClick="return confirm('Do you want to delete..?');" Width="100px" /></td>
                                                            <td><asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="control-general control-button-yellow1 push_button"  Width="100px" OnClick="btnExit_Click" /></td>
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
             <telerik:RadWindow ID="RadWindow2" runat="server" Modal="true" BorderStyle="None" Title="Confirmation Required!" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="180px" VisibleStatusbar="false">
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div style="padding: 20px;">
                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblmessage" ForeColor="Red" Font-Size="15px" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="lbldocid" runat="server" Text="0" Style="display: none;"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <br />
                                <br />
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td><asp:Button ID="btnconfirm" runat="server" Text="Yes" CssClass="control-general control-button-greenlight push_button" OnClick="btnconfirm_Click" Width="100px" /></td>
                                                <td><asp:Button ID="btnno" runat="server" Text="No" CssClass="control-general control-button-orange push_button" OnClick="btnno_Click" Width="100px" /></td>
                                            </tr>
                                        </table>
                                        
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>

            </telerik:RadWindow>
            <div class="clear"></div>
        </div>
            </div>
        <asp:Button ID="btndummy" runat="server" Text="Yes"  OnClick="btndummy_Click" Width="100px" />
                     <%: Scripts.Render("~/bundles/scripts") %>
        <script type="text/javascript">
            function Goviewdocument(docid, docname) {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");

                parent.location.replace("ViewFullDocument?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + docid + "&Auth5=" + docname);
            }

            function GridCreated(sender, args) {
                $("#dvpane2").show();

                var win = $(window).height();
                var sh = (win - 140);

                var scrollArea = sender.GridDataDiv;
                var gridHeader = sender.GridHeaderDiv;

                //var pheight = sh - $("#dvhead").height();
                var hparent = sh; //+ pheight

                $("#dvhead").height(hparent);

                // $("#dvhead1").addClass("cps");


                var scrollArea = sender.GridDataDiv;
                var gridHeader = sender.GridHeaderDiv;
                var parent = $get("dvhead");

                var dataHeight = sender.get_masterTableView().get_element().clientHeight;
                var dght = $("#dvhead").height();
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
                grid = $find("<%= RadGrid1.ClientID %>");
                //grid1.get_element().style.height = sheight + "px";

                grid.GridDataDiv.style.height = hvalue + "px";
                grid.repaint();

                if (document.getElementById("lbltype").textContent != "1") {
                    $("#dvpane2").hide();

                    $("#upload").removeClass("current");
                    $("#schedule").addClass("current");

                }

            }


            function GridCreated1(sender, args) {

                $("#dvpane1").show();

                var win = $(window).height();
                var sh = (win - 140);

                var scrollArea = sender.GridDataDiv;
                var gridHeader = sender.GridHeaderDiv;

                //var pheight = sh - $("#dvhead").height();
                var hparent = sh; //+ pheight

                $("#dvhead1").height(hparent);

                // $("#dvhead1").addClass("cps");


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

                 if (document.getElementById("lbltype").textContent == "1") {
                     $("#dvpane1").hide();

                     $("#upload").addClass("current");
                     $("#schedule").removeClass("current");


                 }

             }
             function ondownload() {
                 $("#btndummy").click();
             }
             function changetype(_type) {

                 document.getElementById("lbltype").textContent = _type;
             }
             function Godocuments(_type) {

                 var _auth1 = document.getElementById("lbluseridhidden");
                 var _auth2 = document.getElementById("lblprjid");

                 var _auth3 = document.getElementById("lblfolder");
                 //var _auth4 = document.getElementById("lbltype");

                 if (_type == 1) {
                     parent.document.getElementById("content").src = "WebForm3.aspx?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + 4;
                 }
                 else if (_type == 2) {
                     parent.document.getElementById("content").src = "WebForm4.aspx?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + 4;
                 }
                 else if (_type == 3) {
                     parent.document.getElementById("content").src = "WebForm5.aspx?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + 4;
                 }
                 else if (_type == 4) {
                     parent.document.getElementById("content").src = "WebForm6.aspx?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + 4;
                 }
             }
             function Viewslide() {



                 var $e = $("#navtree1");


                 if (!$e.is(':hidden')) {

                     $("#doc-container").css("left", "5px");
                     $("#container-menu-bar").css("left", "5px");


                     // alert('hideedn');


                 }
                 else {


                     $("#doc-container").css("left", "275px");
                     $("#container-menu-bar").css("left", "275px");

                     //alert('show');
                 }

                 $("#navtree1").animate({ width: 'toggle' }, 350);





             }
             $(function () {


                 $("li.tier-two-menu-item").hover(function () {


                     var $container = $(this),
                        $list = $container.find("ul")

                     var offset = $container.offset();
                     var offset1 = $list.offset();
                     var offset3 = $container.parent().offset();

                     var offset2 = $list.height();




                     if ((offset.top + offset2) > $(window).height()) {

                         //$list.css("margin-top", -offset.top);
                         //$list.css("top", -offset.top+15);
                         $list.css("top", -offset.top);


                         $list.css("max-height", $(window).height() - ($container.height() * 2));



                         $list.niceScroll({ styler: "fb", cursorcolor: "#c0c0c0", cursorwidth: '10', cursorborderradius: '0px', background: 'transparent', cursorborder: '', horizrailenabled: false, railalign: 'right' });
                         $list.getNiceScroll().eq(0).setScrollLeft(($list).getNiceScroll().eq(0).page.maxw);


                     }


                 });

                 $("li.tier-three-menu-item").hover(function () {

                     var $container = $(this);

                     var parentht = $container.parent().outerHeight();

                     $container.parent().scrollTop(event.clientY + $container.height() - ($container.height() * 3))
                     //$container.parent().scrollTop(event.clientY -$container.height() + ($container.height()*2))

                 });



             });
		</script>

    </form>
</body>
</html>
