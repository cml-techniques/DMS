<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentList4.aspx.cs" Inherits="CMLTechQ.DMS.DocumentList4" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/dropdown.css" rel="stylesheet" />
    <script type="text/javascript">

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
    </script>
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
    </style>
   <%-- <style type="text/css">
div.AddBorders .rgHeader,
div.AddBorders th.rgResizeCol,
div.AddBorders .rgFilterRow td,
div.AddBorders .rgRow td,
div.AddBorders .rgAltRow td,
div.AddBorders .rgEditRow td,
div.AddBorders .rgFooter td
{
	border-style:solid;
	border-color:#dddddd;
	border-width:0 0 1px 1px;
}

div.AddBorders .rgHeader:first-child,
div.AddBorders th.rgResizeCol:first-child,
div.AddBorders .rgFilterRow td:first-child,
div.AddBorders .rgRow td:first-child,
div.AddBorders .rgAltRow td:first-child,
div.AddBorders .rgEditRow td:first-child,
div.AddBorders .rgFooter td:first-child
{
	border-left-width:0;
}
  .RadGrid tr.item-style
    {
        background:#f9f9f9;
        border-color:#dddddd;
        color:#3f4141;
        letter-spacing: 0.9px;
        font-weight: normal;

    }
    .RadGrid tr.item-style1
    {
        border-color:#dddddd;
        background-color: #E8EEEF;
            color: #3f4141;
            letter-spacing: 0.9px;
            font-weight: normal;
    }
  .RadGrid
{
    border-radius: 4px;
    overflow: hidden;
    border-color:#dddddd;
    box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.1);
}   
    .RadGrid .item-style td
    {
        height: 20px;
        vertical-align: middle;
       font-family: 'Open Sans', sans-serif;
         border-color:#dddddd;
    }
        .RadGrid .header-style {
            height: 35px;
                font-size: 13px;
                border-color:#dddddd !important;
             background-color:#ffffff !important;
            background-image:none !important;    
            border-bottom-style: none !important;
             color: #3f4141;
            
           
        }
    </style>--%>
    <script type="text/javascript">
        //function GridCreated(sender, args) {
        //    var scrollArea = sender.GridDataDiv;
        //    var parent = $get("dvhead");
        //    var gridHeader = sender.GridHeaderDiv;
        //    scrollArea.style.height = parent.clientHeight -
        //      gridHeader.clientHeight + "px";
        //}
       function GridCreated1(sender, args) {
            var scrollArea = sender.GridDataDiv;
            var parent = $get("dvhead1");
            var gridHeader = sender.GridHeaderDiv;
            scrollArea.style.height = parent.clientHeight -
              gridHeader.clientHeight + "px";
        }
    </script>
</head>
<body style="background-color: #edeff0;" onload="javascript:_autoAdjust();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocFolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbltest" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
        <asp:Label ID="lbltype" runat="server" Text="" Style="display: none" />
        <div id="doc-container" style="top: 0px; overflow-x: hidden;">
            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="imgload" runat="server" ImageUrl="../Assets/img/ajax-loader.gif" Style="top: 30%; left: 48%; position: fixed; z-index: 999" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <div id="main-content">
                <div class="head">
                    <div class="headtitle">
                        <h2 class="title">
                            <asp:Label ID="pageinfo" runat="server" Text=""></asp:Label>
                        </h2>
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
                                            <asp:LinkButton ID="lbtotal" runat="server" Text="" Width="100%"></asp:LinkButton>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </span>
                            </td>
                            <td style="width: 33%;">
                                <div class="info-title">Documents Uploaded</div>
                                <span class="info pull-right">
                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                        <ContentTemplate>
                                            <asp:LinkButton ID="lbupload" runat="server" Text="" Width="100%"></asp:LinkButton>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </span>
                            </td>
                            <td style="width: 33%;">
                                <div class="info-title">Total Upload Percentage</div>
                                <span class="info pull-right">
                                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                        <ContentTemplate>
                                            <asp:LinkButton ID="lbper" runat="server" Text="" Width="100%"></asp:LinkButton>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </span>
                            </td>
                            <td style="width: 200px">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
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


                            </td>
                            <td style="width: 200px;">
                                <%--<input id="Button1" type="button" value="Library" onclick="" class="control-general control-button-green-1 push_button" />--%>
                                <a href="#" onclick="CallLibrary();" class="control-general control-button-green-1 push_button">Library</a>
                            </td>

                        </tr>
                    </table>

                    <div class="clearfix"></div>
                </div>


                <div class="listcotainer">
                    <div id="dvhead" style="width:100%;height:100px">
    <telerik:RadGrid runat="server" ID="RadGrid1"   Width="100%"    Height="100%" 
	 OnItemCommand="RadGrid1_ItemCommand" GridLines="None" Skin="Metro" >
        <MasterTableView AutoGenerateColumns="false"  DataKeyNames="doc_id" Width="100%">
            <Columns >
               <telerik:GridBoundColumn DataField="doc_ref" HeaderText="Reference" ItemStyle-Width="10%" HeaderStyle-Width="10%" >
               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="doc_title" HeaderText="Manufacturer" ItemStyle-Width="20%" HeaderStyle-Width="20%">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="title" HeaderText="Document Title" ItemStyle-Width="40%" HeaderStyle-Width="40%">
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="udate" HeaderText="Uploaded Date"  ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="file_size" HeaderText="Size" ItemStyle-Width="10%" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="doc_id" HeaderText="doc_id" HeaderStyle-Width="0%" ItemStyle-Width="0%" >
               </telerik:GridBoundColumn>


                <telerik:GridButtonColumn HeaderStyle-Width="30px" ItemStyle-Width="30px"  ButtonType="ImageButton" CommandName="edits"  ImageUrl="../Assets/img/edit-8-20.png" >
                  
                </telerik:GridButtonColumn>
                 <telerik:GridButtonColumn HeaderStyle-Width="30px" ItemStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" >
                  
                </telerik:GridButtonColumn>

            </Columns>

        </MasterTableView>

         <%--<ItemStyle CssClass="item-style" />
        <AlternatingItemStyle CssClass="item-style1" />
          <HeaderStyle CssClass="header-style"  ForeColor="#3f4141" Font-Bold="true"/>

        <PagerStyle mode="NextPrevAndNumeric" />--%>
        
        <ClientSettings EnableRowHoverStyle="true">
            <Scrolling AllowScroll="True" UseStaticHeaders="true" SaveScrollPosition="true" FrozenColumnsCount="0"></Scrolling>
        </ClientSettings>
        

    </telerik:RadGrid>
                    </div>
                </div>
                <div class="listcotainer">
                    <div class="listhead">
                        <h2 class="title pull-left">
                            <asp:Label ID="lblold" runat="server" Text="Label"></asp:Label></h2>
                        <div class="actionbox pull-right">
                        
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
                    <div id="dvhead1" style="height:270px;width:100%">
                                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                    <ContentTemplate>
                         <telerik:RadGrid runat="server" ID="RadGrid2"   Width="100%"   Height="100%" 
	CssClass="AddBorders"  BorderColor="#cccccc" OnItemCommand="RadGrid2_ItemCommand" >
        <MasterTableView AutoGenerateColumns="false"  DataKeyNames="Sch_id" Width="100%" Height="100%">
            <Columns >
               <telerik:GridBoundColumn DataField="doc_ref" HeaderText="Reference" ItemStyle-Width="10%" HeaderStyle-Width="10%"  >
               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="doc_title" HeaderText="Manufacturer" ItemStyle-Width="20%" HeaderStyle-Width="20%">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="title" HeaderText="Document Title" ItemStyle-Width="40%" HeaderStyle-Width="40%">
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="doc_name" HeaderText="File Name" HeaderStyle-Width="20%" ItemStyle-Width="20%">
               </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="date_tobeuploaded" HeaderText="Scheduled Date" ItemStyle-Width="10%" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="Sch_id" HeaderText="Scheduled Date" ItemStyle-Width="0%" HeaderStyle-Width="0%">
               </telerik:GridBoundColumn>
                <telerik:GridButtonColumn HeaderStyle-Width="30px" ItemStyle-Width="30px"  ButtonType="ImageButton" CommandName="edits"  ImageUrl="../Assets/img/edit-8-20.png" >
                  
                </telerik:GridButtonColumn>
                 <telerik:GridButtonColumn HeaderStyle-Width="30px" ItemStyle-Width="30px"  ButtonType="ImageButton"  CommandName="delete" ImageUrl="../Assets/img/x-mark-20.png" >
                  
                </telerik:GridButtonColumn>
            </Columns>

        </MasterTableView>
                                     <ItemStyle CssClass="item-style" />
        <AlternatingItemStyle CssClass="item-style1" />
          <HeaderStyle CssClass="header-style"  ForeColor="#3f4141" Font-Bold="true"/>

 
        
        <ClientSettings>
            <Scrolling AllowScroll="True" UseStaticHeaders="true" SaveScrollPosition="true" FrozenColumnsCount="2" ScrollHeight="300px"></Scrolling>
            <ClientEvents OnGridCreated="GridCreated1" />
        </ClientSettings>
        

    </telerik:RadGrid>
   
                                        </ContentTemplate>
                                         </asp:UpdatePanel>
                    </div>
                </div>

            </div>
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            </telerik:RadWindowManager>
            <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="Document Edit !" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="370px" Height="270px" VisibleStatusbar="false">
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <div style="padding: 10px;">
                               <%-- <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>--%>
                                <table>
                                    <tr>
                                        <td><asp:Label ID="lable1" runat="server" Text="Enter Reference" ForeColor="Black"  ></asp:Label></td>
                                        <td><asp:TextBox ID="txtrefrence"  runat="server" CssClass="control-textbox-2"  ></asp:TextBox><br /></td>
                                        </tr>
                                        <tr>
                                        <td><asp:Label ID="Label2" runat="server" Text="Enter Manufacturer" ForeColor="Black"  ></asp:Label></td>
                                        <td><asp:TextBox ID="txtManufacturer" CssClass="control-textbox-2" runat="server" ></asp:TextBox><br /></td>
                                        </tr>
                                    <tr>
                                        <td><asp:Label ID="Label3" runat="server" Text="Enter Title" ForeColor="Black"  ></asp:Label></td>
                                        <td><asp:TextBox ID="txtDocumenttitle" CssClass="control-textbox-2"  runat="server" ></asp:TextBox></td>
                                    </tr>
                                        <tr id="trfile" runat="server" visible="false">
                                        <td><asp:Label ID="Label4" runat="server" Text="Enter FileName" ForeColor="Black"  ></asp:Label></td>
                                        <td><asp:TextBox ID="txtfilename"  runat="server" CssClass="control-textbox-2" ></asp:TextBox></td>
                                    </tr>
                                </table>
                                        
                                        
                                      
                                  
                                        <asp:Label ID="lbldocid" runat="server" Text="0" Style="display: none;"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text="0" Style="display: none;"></asp:Label>
                                    <%--</ContentTemplate>
                                </asp:UpdatePanel>--%>
                                <br />
                                <br />
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td><asp:Button ID="btnSave" runat="server" Text="Save" CssClass="control-general control-button-greenlight push_button" Width="100px" OnClick="btnSave_Click" /></td>
                                                <td><asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="control-general control-button-orange push_button"  Width="100px" OnClick="btnExit_Click" /></td>
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
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div style="padding: 20px;">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblmessage" ForeColor="Red" Font-Size="15px" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Text="0" Style="display: none;"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <br />
                                <br />
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
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
        <script src="../Assets/js/jquery.min.js"></script>
        <script src="../Assets/js/jquery.nicescroll.js"></script>
        <script type="text/javascript">

            function CallLibrary() {

                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");

                parent.document.getElementById("content").src = "DMS_Library_General?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=0";

            }
            function Goviewdocument(docid, docname) {
                var _auth1 = document.getElementById("lbluseridhidden");
                var _auth2 = document.getElementById("lblprjid");
                var _auth3 = document.getElementById("lblfolder");

                parent.location.replace("ViewFullDocument?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + docid + "&Auth5=" + docname);
            }
		</script>

        <script type="text/javascript">
            $(document).ready(
                function () {
                    $("html").niceScroll({ styler: "fb", cursorcolor: "#063940", cursorwidth: '10', cursorborderradius: '0px', background: '#45818e', cursorborder: '' });
                });
        </script>
    </form>
</body>
</html>
