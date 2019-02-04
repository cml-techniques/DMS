<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pts1.aspx.cs" Inherits="CMLTechQ.DMS.pts1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: Web Based Document Management</title>
    <meta name="author" content="CML Techniques" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%--<%: Styles.Render("~/Content/css") %>--%>
    <webopt:BundleReference ID="BundleReference1" runat="server" Path="~/Content/css" />
    <style type="text/css">
        .hcheck {
        font-size:18px;
        }
        .lbltxt {
            color:red;
            font-size:13px;

        }
        .txtrow {
            width:80px;
            height:12px;
            font-size:8px;
            text-align:center;
        }
          .txtalter {
            width:80px;
            text-align:center;
           height:15px;
        }
        .control-panel .menubar {
           display:flex;
          justify-content:space-around;
            align-items:center;

        }
          .control-panel .menubar ul.left li {
             padding: 0px!important;
        }
         .control-panel .menubar ul.left li a {
           font-size:13px;
        }
           .control-panel .menubar ul.right li {
             padding: 0px!important;
        }
            .control-panel .menubar ul.right li a {
           font-size:13px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" Style="display: none"></asp:Label>

        <asp:Label ID="lblvalue" runat="server" Text="" Style="display: none"></asp:Label>

        <input type="hidden" id="Hidden1" name="hfolder" runat="server" />
        <input type="hidden" id="hprogressid" name="hprogressid" runat="server" />
        <input type="hidden" id="htype" name="htype" runat="server" />
        <input type="hidden" id="hcount" name="hcount" runat="server" />
        <div id="docview_area">
            <div class="pulldownbar">
                <div class="togglemenu">
                    <%--<a href="#" title="Toggle Sidebar" data-prl-offcanvas="{target:'#offcanvas-search'}"><i class="fa fa-navicon"></i></a>--%>
                </div>
            </div>
            <div class="container">
                <div class="control-panel">
                    <div class="halfwidth-left">
                        <div class="menubar">
                            <ul class="left" style="display:flex;justify-content:space-around;align-items:center;width:100%;padding-left:0;">
                                <li><a href="#" class="active">Progress Tracking Sheet</a></li>
                                <li><a href="#" onclick="gostatusgraph();">Document Status Graph</a></li>
                                <li ><a href="#" onclick="gouploadsummary();">Summary of Uploads</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="halfwidth-right">
                        <div class="menubar" >
                            <ul class="right" style="display:flex;justify-content:space-around;align-items:center;width:100%;padding-left:0;" >
                                 <li><a href="#" onclick="expandall(1);">Expand</a></li>
                                <li><a href="#" onclick="expandall(2);">Collapse</a></li>
                                <li><a href="#" onclick="goprint();" >Print</a></li>
                                <li ><a style="color:#cccccc">New Item</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
                <div class="back-block">
                    <a href="#" onclick="goBack();"><i class="fa fa-angle-double-left"></i> BACK</a>
                </div>
            </div>
            <div class="clear"></div>
            <div class="container-block" style="top: 70px">
               

                <div id="HeaderDiv" onclick="HideTextMode();">
                    <table class="table-style3" style="width: 100%; table-layout: fixed" cellpadding="0" cellspacing="0">
                        <tr class="hrow">
                            <td style="width: 5%; text-align: center" valign="middle">Volume No

                            </td>
                            <td style="width: 11%; text-align: center" valign="middle">List of O&amp;M Manuals</td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 1</div>
                                <div class="title-small">Introduction / Health & Saftey</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 2</div>
                                <div class="title-small">Description of Installation</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 3</div>
                                <div class="title-small">Plant &amp; Equipment Schedules</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 4</div>
                                <div class="title-small">Operating Procedures</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 5</div>
                                <div class="title-small">Planned Manitenance & Spares</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 6</div>
                                <div class="title-small">Emergency &amp; Fault Finding Procedures</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 7</div>
                                <div class="title-small">Safety Procedures</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 8</div>
                                <div class="title-small">Manufactures Literature</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 9</div>
                                <div class="title-small">Testing &amp; Commissioning Data</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">
                                <div class="title-big">Section 10</div>
                                <div class="title-small">As-Built Drawings</div>
                            </td>
                            <td style="width: 7%; text-align: center" valign="middle">Issue Date</td>
                            <td style="width: 7%; text-align: center" valign="middle">Remarks</td>
                        </tr>
                    </table>
                </div>
                <div id="Data">

                    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>

                      <asp:Repeater ID="rptmmain0" runat="server" OnItemDataBound="rptmmain0_ItemDataBound">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                   <div id="DataDiv">
                                <div id='h1<%# Eval("Folder_Id") %>' class="rptheader" onclick="getdata1(<%# Eval("Folder_Id")  %>);">
                                    <p style="margin: 0; padding: 0px;"><a class="pull-left" style="margin-right: 10px; padding-left: 4px" href="#"><i class="icon-plus"></i></a><%# Eval("Folder_description") %> </p>
                                    <asp:Label ID="lblsys" runat="server" Text='<%# Eval("Folder_id") %>' Style="display: none"></asp:Label>
                                    <asp:Label ID="lbltreetype" runat="server" Text='<%# Eval("TreeType") %>' Style="display: none"></asp:Label>
                                </div>
                                <div id='d1<%# Eval("Folder_Id") %>' style="display: none" class="sub">

                                 <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:Repeater ID="rptdetails1" runat="server" OnItemDataBound="rptdetails1_ItemDataBound" > 
                                                <HeaderTemplate>
                                                    <table class="table-style3" cellspacing="0" border="0" style="width: 100%; font-size: 10px; table-layout: fixed">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr class="row">
                                                        <td style="width: 5%" onclick="HideTextMode();"><%# Eval("Folder_code") %></td>
                                                        <td style="width: 11%; text-align: left;" onclick="HideTextMode();"><%# Eval("Folder_description") %></td>
                                                        <td style="width: 7%;text-align:center" id='td1<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,1);">
                                                            <asp:Label ID="lbl1" Visible="false" CssClass="lbltxt"  runat="server" Text='<%# Eval("Section1") %>' />
                                                             <asp:HyperLink ID="hl1" Visible="false" runat="server" class="icon-ok hcheck"  />
                                                            <asp:TextBox ID="txt1" CssClass="txtrow" runat="server"  OnTextChanged="txt1_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%;text-align:center" id='td2<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,2);">
                                                            <asp:Label ID="lbl2" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section2") %>' />
                                                             <asp:HyperLink ID="hl2"  Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt2" runat="server" CssClass="txtrow"  OnTextChanged="txt2_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td3<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,3);">
                                                            <asp:Label ID="lbl3" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section3") %>' />
                                                             <asp:HyperLink ID="hl3" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt3" runat="server" CssClass="txtrow"  OnTextChanged="txt3_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td4<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,4);">
                                                            <asp:Label ID="lbl4" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section4") %>' />
                                                             <asp:HyperLink ID="hl4" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt4" runat="server" CssClass="txtrow"  OnTextChanged="txt4_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td5<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,5);">
                                                            <asp:Label ID="lbl5" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section5") %>' />
                                                             <asp:HyperLink ID="hl5" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt5" runat="server" CssClass="txtrow"  OnTextChanged="txt5_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td6<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,6);">
                                                            <asp:Label ID="lbl6" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section6") %>' />
                                                             <asp:HyperLink ID="hl6" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt6" runat="server" CssClass="txtrow" OnTextChanged="txt6_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td7<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,7);">
                                                            <asp:Label ID="lbl7" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section7") %>' />
                                                             <asp:HyperLink ID="hl7" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt7" runat="server" CssClass="txtrow" OnTextChanged="txt7_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td8<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,8);">
                                                            <asp:Label ID="lbl8" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section8") %>' />
                                                             <asp:HyperLink ID="hl8" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td9<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,9);">
                                                            <asp:Label ID="lbl9" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section9") %>' />
                                                             <asp:HyperLink ID="hl9" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td10<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,10);">
                                                            <asp:Label ID="lbl10" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section10") %>' />
                                                             <asp:HyperLink ID="hl10" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td11<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,11);">
                                                             <asp:Label ID="lbl11"   runat="server" Text='<%# Eval("DraftIssueDate") %>' />
                                                            <asp:TextBox ID="txt11" CssClass="txtrow" runat="server"  OnTextChanged="txt11_TextChanged" M_axLength="10" />
                                                         </td>
                                                        <td style="width: 7%" id='td12<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,12);">
                                                            <asp:Label ID="lbl12"   runat="server" Text='<%# Eval("Remarks") %>' />
                            
                                                            <asp:TextBox ID="txt12" CssClass="txtrow" runat="server" OnTextChanged="txt12_TextChanged" MaxLength="100"  />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="alter">
                                                        <td style="width: 5%" onclick="HideTextMode();"><%# Eval("Folder_code") %></td>
                                                        <td style="width: 11%; text-align: left;" onclick="HideTextMode();"><%# Eval("Folder_description") %></td>
                                                             <td style="width: 7%;text-align:center" id='td1<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,1);">
                                                            <asp:Label ID="lbl1" Visible="false" CssClass="lbltxt"  runat="server" Text='<%# Eval("Section1") %>' />
                                                             <asp:HyperLink ID="hl1" Visible="false" runat="server" class="icon-ok hcheck"  />
                                                            <asp:TextBox ID="txt1" CssClass="txtalter" runat="server"  OnTextChanged="txt1_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%;text-align:center" id='td2<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,2);">
                                                            <asp:Label ID="lbl2" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section2") %>' />
                                                             <asp:HyperLink ID="hl2"  Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt2" runat="server" CssClass="txtalter"  OnTextChanged="txt2_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td3<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,3);">
                                                            <asp:Label ID="lbl3" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section3") %>' />
                                                             <asp:HyperLink ID="hl3" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt3" runat="server" CssClass="txtalter"  OnTextChanged="txt3_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td4<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,4);">
                                                            <asp:Label ID="lbl4" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section4") %>' />
                                                             <asp:HyperLink ID="hl4" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt4" runat="server" CssClass="txtalter"  OnTextChanged="txt4_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td5<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,5);">
                                                            <asp:Label ID="lbl5" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section5") %>' />
                                                             <asp:HyperLink ID="hl5" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt5" runat="server" CssClass="txtalter"  OnTextChanged="txt5_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td6<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,6);">
                                                            <asp:Label ID="lbl6" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section6") %>' />
                                                             <asp:HyperLink ID="hl6" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt6" runat="server" CssClass="txtalter" OnTextChanged="txt6_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td7<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,7);">
                                                            <asp:Label ID="lbl7" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section7") %>' />
                                                             <asp:HyperLink ID="hl7" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt7" runat="server" CssClass="txtalter" OnTextChanged="txt7_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td8<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,8);">
                                                            <asp:Label ID="lbl8" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section8") %>' />
                                                             <asp:HyperLink ID="hl8" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td9<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,9);">
                                                            <asp:Label ID="lbl9" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section9") %>' />
                                                             <asp:HyperLink ID="hl9" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td10<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,10);">
                                                            <asp:Label ID="lbl10" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section10") %>' />
                                                             <asp:HyperLink ID="hl10" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td11<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,11);">
                                                             <asp:Label ID="lbl11"   runat="server" Text='<%# Eval("DraftIssueDate") %>' />
                                                            <asp:TextBox ID="txt11" CssClass="txtalter" runat="server"  OnTextChanged="txt11_TextChanged" M_axLength="10"  />
                                                         </td>
                                                        <td style="width: 7%" id='td12<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,12);">
                                                            <asp:Label ID="lbl12"   runat="server" Text='<%# Eval("Remarks") %>' />
                            
                                                            <asp:TextBox ID="txt12" CssClass="txtalter" runat="server" OnTextChanged="txt12_TextChanged"  />
                                                        </td>

                                                    </tr>
                                                </AlternatingItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                              <asp:Repeater ID="rptmmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound" >
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>

                            <div id="DataDiv1">
                                <div id='h<%# Eval("Folder_Id") %>' class="rptheader" onclick="getdata(<%# Eval("Folder_Id") %>);" style="padding-left:20px">
                                    <p style="margin: 0; padding: 0px;"><a class="pull-left" style="margin-right: 10px; padding-left: 4px" href="#"><i class="icon-plus"></i></a><%# Eval("Folder_description") %> </p>
                                    <asp:Label ID="lblsys" runat="server" Text='<%# Eval("Folder_id") %>' Style="display: none"></asp:Label>
                                </div>
                                <div id='d<%# Eval("Folder_Id") %>' style="display: none" class="sub">

                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:Repeater ID="rptdetails" runat="server" OnItemDataBound="rptdetails_ItemDataBound" OnItemCommand="rptdetails_ItemCommand">
                                                <HeaderTemplate>
                                                    <table class="table-style3" cellspacing="0" border="0" style="width: 100%; font-size: 10px; table-layout: fixed">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr class="row">
                                                        <td style="width: 5%" onclick="HideTextMode();"><%# Eval("Folder_code") %></td>
                                                        <td style="width: 11%; text-align: left;" onclick="HideTextMode();"><%# Eval("Folder_description") %></td>
                                                        <td style="width: 7%;text-align:center" id='td1<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,1);">
                                                            <asp:Label ID="lbl1" Visible="false" CssClass="lbltxt"  runat="server" Text='<%# Eval("Section1") %>' />
                                                             <asp:HyperLink ID="hl1" Visible="false" runat="server" class="icon-ok hcheck"  />
                                                            <asp:TextBox ID="txt1" CssClass="txtrow" runat="server"  OnTextChanged="txt1_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%;text-align:center" id='td2<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,2);">
                                                            <asp:Label ID="lbl2" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section2") %>' />
                                                             <asp:HyperLink ID="hl2"  Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt2" runat="server" CssClass="txtrow"  OnTextChanged="txt2_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td3<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,3);">
                                                            <asp:Label ID="lbl3" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section3") %>' />
                                                             <asp:HyperLink ID="hl3" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt3" runat="server" CssClass="txtrow"  OnTextChanged="txt3_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td4<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,4);">
                                                            <asp:Label ID="lbl4" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section4") %>' />
                                                             <asp:HyperLink ID="hl4" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt4" runat="server" CssClass="txtrow"  OnTextChanged="txt4_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td5<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,5);">
                                                            <asp:Label ID="lbl5" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section5") %>' />
                                                             <asp:HyperLink ID="hl5" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt5" runat="server" CssClass="txtrow"  OnTextChanged="txt5_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td6<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,6);">
                                                            <asp:Label ID="lbl6" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section6") %>' />
                                                             <asp:HyperLink ID="hl6" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt6" runat="server" CssClass="txtrow" OnTextChanged="txt6_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td7<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,7);">
                                                            <asp:Label ID="lbl7" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section7") %>' />
                                                             <asp:HyperLink ID="hl7" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt7" runat="server" CssClass="txtrow" OnTextChanged="txt7_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td8<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,8);">
                                                            <asp:Label ID="lbl8" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section8") %>' />
                                                             <asp:HyperLink ID="hl8" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td9<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,9);">
                                                            <asp:Label ID="lbl9" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section9") %>' />
                                                             <asp:HyperLink ID="hl9" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td10<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,10);">
                                                            <asp:Label ID="lbl10" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section10") %>' />
                                                             <asp:HyperLink ID="hl10" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td11<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,11);">
                                                             <asp:Label ID="lbl11"   runat="server" Text='<%# Eval("DraftIssueDate") %>' />
                                                            <asp:TextBox ID="txt11" CssClass="txtrow" runat="server"  OnTextChanged="txt11_TextChanged" M_axLength="10" />
                                                         </td>
                                                        <td style="width: 7%" id='td12<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,12);">
                                                            <asp:Label ID="lbl12"   runat="server" Text='<%# Eval("Remarks") %>' />
                            
                                                            <asp:TextBox ID="txt12" CssClass="txtrow" runat="server" OnTextChanged="txt12_TextChanged" MaxLength="100"  />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="alter">
                                                        <td style="width: 5%" onclick="HideTextMode();"><%# Eval("Folder_code") %></td>
                                                        <td style="width: 11%; text-align: left;" onclick="HideTextMode();"><%# Eval("Folder_description") %></td>
                                                             <td style="width: 7%;text-align:center" id='td1<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,1);">
                                                            <asp:Label ID="lbl1" Visible="false" CssClass="lbltxt"  runat="server" Text='<%# Eval("Section1") %>' />
                                                             <asp:HyperLink ID="hl1" Visible="false" runat="server" class="icon-ok hcheck"  />
                                                            <asp:TextBox ID="txt1" CssClass="txtalter" runat="server"  OnTextChanged="txt1_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%;text-align:center" id='td2<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,2);">
                                                            <asp:Label ID="lbl2" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section2") %>' />
                                                             <asp:HyperLink ID="hl2"  Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt2" runat="server" CssClass="txtalter"  OnTextChanged="txt2_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td3<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,3);">
                                                            <asp:Label ID="lbl3" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section3") %>' />
                                                             <asp:HyperLink ID="hl3" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt3" runat="server" CssClass="txtalter"  OnTextChanged="txt3_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td4<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,4);">
                                                            <asp:Label ID="lbl4" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section4") %>' />
                                                             <asp:HyperLink ID="hl4" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt4" runat="server" CssClass="txtalter"  OnTextChanged="txt4_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td5<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,5);">
                                                            <asp:Label ID="lbl5" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section5") %>' />
                                                             <asp:HyperLink ID="hl5" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt5" runat="server" CssClass="txtalter"  OnTextChanged="txt5_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td6<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,6);">
                                                            <asp:Label ID="lbl6" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section6") %>' />
                                                             <asp:HyperLink ID="hl6" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt6" runat="server" CssClass="txtalter" OnTextChanged="txt6_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td7<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,7);">
                                                            <asp:Label ID="lbl7" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section7") %>' />
                                                             <asp:HyperLink ID="hl7" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt7" runat="server" CssClass="txtalter" OnTextChanged="txt7_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 7%" id='td8<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,8);">
                                                            <asp:Label ID="lbl8" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section8") %>' />
                                                             <asp:HyperLink ID="hl8" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td9<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,9);">
                                                            <asp:Label ID="lbl9" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section9") %>' />
                                                             <asp:HyperLink ID="hl9" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td10<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,10);">
                                                            <asp:Label ID="lbl10" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section10") %>' />
                                                             <asp:HyperLink ID="hl10" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            
                                                        </td>
                                                        <td style="width: 7%" id='td11<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,11);">
                                                             <asp:Label ID="lbl11"   runat="server" Text='<%# Eval("DraftIssueDate") %>' />
                                                            <asp:TextBox ID="txt11" CssClass="txtalter" runat="server"  OnTextChanged="txt11_TextChanged" M_axLength="10"  />
                                                         </td>
                                                        <td style="width: 7%" id='td12<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,12);">
                                                            <asp:Label ID="lbl12"   runat="server" Text='<%# Eval("Remarks") %>' />
                            
                                                            <asp:TextBox ID="txt12" CssClass="txtalter" runat="server" OnTextChanged="txt12_TextChanged"  />
                                                        </td>

                                                    </tr>
                                                </AlternatingItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                                <%--</div>--%>
                               <%-- </div>--%>

                                    </div>
                       </div>
                                 </ItemTemplate>
                            </asp:Repeater>


                   
                    <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>
                </div>
            </div>
        </div>
                                          <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>

                                           <asp:Button ID="bdummy" runat="server" Text="" Style="background-color:transparent;border:none" /> 

                                            </ContentTemplate>
                                      </asp:UpdatePanel>

        <asp:Label ID="lblid" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hpos" name="hpos" runat="server" />
        <input type="hidden" id="hfolder" name="hfolder" runat="server" />
        <div id="offcanvas-search" class="prl-offcanvas">
            <div class="prl-offcanvas-bar">
                <div class="inner">
                    <div id="nav-bar" style="top: 5px;">


                        <ul class="topnav">
                            <li class="item"><a href="#" onclick="gocreate();" title="Create Folder"><i class="icon-folder-close"></i></a></li>
                            <li class="item"><a href="#"><i class="icon-file-alt"></i></a></li>
                            <li class="item"><a href="#" onclick="gomove(1);" title="Move Up"><i class="icon-circle-arrow-up"></i></a></li>
                            <li class="item"><a href="#" onclick="gomove(2);" title="Move Down"><i class="icon-circle-arrow-down"></i></a></li>
                            <li class="item"><a href="#"><i class="icon-edit" onclick="goedit();" title="Edit Folder"></i></a></li>
                            <li class="item"><a href="#" onclick="godelete();" title="Delete Folder"><i class="icon-trash"></i></a></li>
                        </ul>


                    </div>
                    <div class="clear"></div>
                    <div id="navbar">

                        <div id="nav-menu">

                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <asp:PlaceHolder ID="ph_nav" runat="server"></asp:PlaceHolder>

                                </ContentTemplate>

                            </asp:UpdatePanel>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <asp:Button ID="btndummy" runat="server" Text="btndummy" Style="display: none;" />
<%--        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btndummy" PopupControlID="pnlpop"></asp:ModalPopupExtender>

        <asp:Panel ID="pnlpop" runat="server" Style="display: none; background: #cccccc;" Width="350px">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <table class="tblpopoup1" style="width: 100%; background-color: #3e838c">
                        <tr>
                            <td class="poptext">
                                <asp:Label ID="lblpnlhead" Text="Create Package" runat="server"></asp:Label></td>
                            <td><a href="#" onclick="goclose();"><i style="color: white" class="icon-remove-sign pull-right icon liclose"></i></a></td>

                        </tr>
                    </table>

                    <table class="tblpopoup1" style="background-color: #76a5af; width: 100%">
                        <tr>
                            <td style="width: 100%">

                                <asp:RadioButtonList ID="rbtListfolder" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbtListfolder_SelectedIndexChanged" align="center" CssClass="radioButtonList" RepeatLayout="Table" RepeatColumns="2" Width="50%">
                                    <asp:ListItem Text="Main" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Folder" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>

                            </td>
                        </tr>

                    </table>

                    <table class="tblpopoup" style="width: 100%; background-color: #3e838c">
                        <tr id="trsub" runat="server" visible="false">
                            <td style="padding: 5px">
                                <table cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Select Main"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlfolder" runat="server" Width="335px" AutoPostBack="true" Height="23px"></asp:DropDownList></td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left; padding: 5px" class="poptext">
                                <asp:Label ID="lblhlp" Text="Enter Main" runat="server" /></td>
                        </tr>
                        <tr>
                            <td style="padding: 5px">
                                <table cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td id="tdcode" runat="server" visible="false">
                                            <asp:TextBox ID="txtcode" Width="0px" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="txtfolder" Width="330px" runat="server"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="tblbuttons">
                                    <tr>
                                        <td>

                                            <asp:Button ID="btnfolder" runat="server" Text="Create" CssClass="controlstyle actstyle" OnClick="btnfolder_Click" Height="21px" />

                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>

                    </table>

                </ContentTemplate>
            </asp:UpdatePanel>

        </asp:Panel>--%>

                     <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" BorderStyle="None" Title="Create Package" EnableShadow="true" Behaviors="Minimize, Maximize, Close, Move" Skin="Metro" Width="650px" Height="300px" VisibleStatusbar="false">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="padding: 10px; overflow: hidden;">
                            <div class="subheader">
                                <table style="color: #353535;" border="0" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="rbtype" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Table" AutoPostBack="true" OnSelectedIndexChanged="rbtype_SelectedIndexChanged">
                                               <asp:ListItem Text="Main" Value="1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Folder" Value="2"></asp:ListItem>
                                                </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
                         </telerik:RadWindow>

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <asp:Button ID="btndummy2" runat="server" Text="" Style="background-color: transparent; border: none" />
                <asp:Button ID="btndummy1" runat="server" Text="btndummy1" OnClick="btndummy_Click" Style="display: none" />

                <%--                                             <asp:Button ID="btnmain" Text="New main" runat="server" Height="100%" BackColor="Black" ForeColor="White" BorderStyle="None" OnClientClick="Showpopoup();" />--%>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
    <%: Scripts.Render("~/bundles/scripts") %>
    <script src="../Assets/js/plugins.js"></script>
    <script type="text/javascript">

        function HideTextMode() {
            showlabel();
            hideall();

        }


        function gos(_id, _folder, _type) {
            HideTextMode();

            var _auth1 = document.getElementById("lbluserid");
            if (_auth1.textContent.endsWith("@cmlgroup.ae")) {




                if (_type == 8 || _type == 9 || _type == 10) return;

                document.getElementById("hprogressid").value = _id;
                document.getElementById("hfolder").value = _folder;
                document.getElementById("htype").value = _type;



                $('#td' + _type + _folder).find('span').hide();
                $('#td' + _type + _folder).find('A').hide();





                $('#td' + _type + _folder).find('input').show();
                //$('#td' + _type + _folder).find('input').
                $('#td' + _type + _folder).find('input').select();

            }

        }
        function hideall() {
            $('.row td input').hide();
            $('.alter td input').hide();
        }
        function showlabel() {

            $('.row td span').show();
            $('.row td A').show();
            $('.alter td span').show();
            $('.alter td A').show();

        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            scrollheight();
        });

        function CheckNumerOnly(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        function expandall(type) {
            var hcount = document.getElementById("hcount").value;
            for (var i = 0; i <= hcount; i++) {
                expand(i, type);
            }
            scrollheight();
            HideTextMode();
        }
        function expand(i, type) {
            var e = document.getElementById('d' + i);
            if (e) {
                if (type == 1) {
                    if (e.style.display == 'none') {
                        e.style.display = 'block';
                        e.style.visibility = 'visible';
                        jQuery('#h' + i).find('i').removeClass('icon-plus').addClass('icon-minus');
                    }
                }
                else {
                    if (e.style.display != 'none') {
                        e.style.display = 'none';
                        e.style.visibility = 'hidden';
                        jQuery('#h' + i).find('i').removeClass('icon-minus').addClass('icon-plus');
                    }
                }
            }
        }

        function goprint() {

            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");
            var url = "ProgressTrackReport?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
            window.open(url, '', '', true);
        }

        function getdata(id) {
            var e = document.getElementById('d' + id);

            if (e) {
                if (e.style.display == 'none') {
                    e.style.display = 'block';
                    e.style.visibility = 'visible';
                    // _changeActive(id);
                    // _changeActive();rptheader
                    jQuery('#h' + id).find('i').removeClass('icon-plus').addClass('icon-minus');
                    jQuery('#h' + id).removeClass('rptheader').addClass('rptheader-select');
                }
                else {
                    e.style.display = 'none';
                    e.style.visibility = 'hidden';
                    jQuery('#h' + id).find('i').removeClass('icon-minus').addClass('icon-plus');
                    jQuery('#h' + id).removeClass('rptheader-select').addClass('rptheader');
                    // _changeInActive();
                    // _changeInActive(id);
                }

            }
            HideTextMode();
            scrollheight();

        }
        function getdata1(id) {
            var e = document.getElementById('d1' + id);

            if (e) {
                if (e.style.display == 'none') {
                    e.style.display = 'block';
                    e.style.visibility = 'visible';
                    // _changeActive(id);
                    // _changeActive();rptheader
                    jQuery('#h1' + id).find('i').removeClass('icon-plus').addClass('icon-minus');
                    jQuery('#h1' + id).removeClass('rptheader').addClass('rptheader-select');
                }
                else {
                    e.style.display = 'none';
                    e.style.visibility = 'hidden';
                    jQuery('#h1' + id).find('i').removeClass('icon-minus').addClass('icon-plus');
                    jQuery('#h1' + id).removeClass('rptheader-select').addClass('rptheader');
                    // _changeInActive();
                    // _changeInActive(id);
                }

            }
            HideTextMode();
            scrollheight();

        }
        function setheightdefault() {

            var div1 = document.getElementById('HeaderDiv');
            div1.setAttribute("style", "border-right:none");

        }
        function Onscrollfnction() {
            var div = document.getElementById('Data');
            var div2 = document.getElementById('HeaderDiv');
            //var div3 = document.getElementById('HeaderTable');
            //****** Scrolling HeaderDiv along with DataDiv 
            //$("#HeaderDiv").css({
            //    'position': ''
            //});
            div2.scrollLeft = div.scrollLeft;
            //$("#HeaderDiv").css({
            //    'position': 'fixed'
            //});

            //div2.scrollTop = 0;
            //div3.scrollLeft = div.scrollLeft;
            return false;
        }
        function scrollheight() {
            var div = document.getElementById('Data');
            var div1 = document.getElementById('HeaderDiv');
            if (div.scrollHeight > div.clientHeight) {
                div1.setAttribute("style", "border-right:17px solid #8A97A0");
            }
            else
                div1.setAttribute("style", "border-right:none");
        }
        function GetNav(id) {
            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");
            parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id;

        }

        function showCalendar(sender, args) {
            var processingControl = $get(sender._button.id); // Getting the control which triggered the calendar.
            sender._popupDiv.parentElement.style.top = processingControl.offsetTop + processingControl.height + 'px';
            sender._popupDiv.parentElement.style.left = processingControl.offsetLeft + 'px';

            var positionTop = (processingControl.height + processingControl.offsetTop) - 85;
            var positionLeft = processingControl.offsetLeft;
            var processingParent;
            var continueLoop = false;

            do {
                // If the control has parents continue loop.
                if (processingControl.offsetParent != null) {
                    processingParent = processingControl.offsetParent;
                    positionTop += processingParent.offsetTop;
                    positionLeft += processingParent.offsetLeft;
                    processingControl = processingParent;
                    continueLoop = true;
                }
                else {
                    continueLoop = false;
                }
            } while (continueLoop);

            //alert(sender._popupDiv.parentElement.style.top);
            sender._popupDiv.parentElement.style.top = positionTop + 'px';
            sender._popupDiv.parentElement.style.left = positionLeft + 'px';
        }

        function ChangeCalendarView(sender, args) {
            sender._switchMode("years", true);
        }

        function goclose(pnl) {

            //document.getElementById("txtfolder").value = "";
            //document.getElementById("txtcode").value = "";
            $find("ModalPopupExtender1").hide();

        }
        function Showpopoup() {

            $("#btndummy").click();

        }
        function goBack() {
            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");

            if (_auth2.textContent == 33 || _auth2.textContent == 51 || _auth2.textContent == 57 || _auth2.textContent == 76) {
                location.replace("Project2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent);
            }
            else
                location.replace("Project?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent);

        }
        function gostatusgraph() {

            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");

            var url = "DocumentStatusGraph?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
            parent.location.replace(url);
        }
        function gouploadsummary() {

            var _auth1 = document.getElementById("lbluserhidden");
            var _auth2 = document.getElementById("lblprjid");

            var url = "UploadSummary?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
            parent.location.replace(url);
        }

    </script>

</body>
</html>
