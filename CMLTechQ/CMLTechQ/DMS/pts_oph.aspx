<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pts_oph.aspx.cs" Inherits="CMLTechQ.DMS.pts_oph" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        .table-style3 tr.hrow {
            height: 30px!important;
        }
            .table-style3 tr.hrow td {
                border-bottom: none !important;
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
<body style="overflow:hidden">
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
                                <li class="last"><a href="#" onclick="gouploadsummary();">Summary of Uploads</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="halfwidth-right">
                        <div class="menubar">
                            <ul class="right" style="display:flex;justify-content:space-around;align-items:center;width:100%;padding-left:0;">
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
               

                <div id="HeaderDiv" onclick="HideTextMode();" >
                    <table class="table-style3" style="width:3775px;table-layout: fixed" cellpadding="0" cellspacing="0">
                        <tr class="hrow">
                            <td style="width: 100px; text-align: center;" valign="middle" rowspan="3">Volume No

                            </td>
                            <td style="width: 200px; text-align: center" valign="middle" rowspan="3">List of O&amp;M Manuals</td>
                            <td style="width: 100px; text-align: center" valign="middle" rowspan="3">Supplier/ Contractor</td>
                            <td style="width: 125px; text-align: center;border-left:none" valign="middle">
                                <div class="title-big">Section 1</div>
                            </td>
                            <td style="width: 125px; text-align: center;height:10px" valign="middle">
                                <div class="title-big">Section 2</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 3</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 4</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 5</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 6</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 7</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 8</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 9</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 10</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 11</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 12</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 13</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 14</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 15</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 16</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 17</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 18</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 19</div>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                <div class="title-big">Section 20</div>
                            </td>
                              <td style="width: 125px; text-align: center" valign="middle" rowspan="2">Total %

                            </td>
                             <td style="text-align: center;width: 300px" valign="middle" colspan="3" rowspan="2">Date Submitted

                            </td>
                              <td style="text-align: center;width: 300px" valign="middle" colspan="3" rowspan="2">Comments Received Status

                            </td>
                            <td style="width: 150px; text-align: center" valign="middle" rowspan="3">Remarks</td>
                          
                            </tr>
                      <tr class="hrow" style="height:15px;">
                            <td style="width: 125px; text-align: center;border-left:none!Important;border-radius:0px !important" valign="middle">
                                About the Project
                               <%-- <div class="title-small" style="text-align:center"></div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle">
                                Change Control
                              <%--  <div class="title-small"></div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Emergency Escalation Procedure
                               <%-- <div class="title-small">Emergency Escalation Procedure</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Emergency Information
                                <%--<div class="title-small">Emergency Information</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Emergency Equipment Locations
                              <%--  <div class="title-small">Emergency Equipment Locations</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                System Purpose and Design
                               <%-- <div class="title-small">System Purpose and Design</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Contractual and Legal Information
                                <%--<div class="title-small">Contractual and Legal Information</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center"  valign="middle" >
                                Description
                               <%-- <div class="title-small">Description</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Equipment Schedules and Asset Registers
                                <%--<div class="title-small">Equipment Schedules and Asset Registers</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Operating Instructions and Procedures
                                <%--<div class="title-small">Operating Instructions and Procedures</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Operating Manuals and Literature
                                <%--<div class="title-small">Operating Manuals and Literature</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Maintenance Procedures
                                <%--<div class="title-small">Maintenance Procedures</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Spare and Replacement Parts
                                <%--<div class="title-small">Spare and Replacement Parts</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Disposal Instruction
                                <%--<div class="title-small">Disposal Instruction</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Testing and Commissioning Data
                                <%--<div class="title-small">Testing and Commissioning Data</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Modifications
                                <%--<div class="title-small">Modifications</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                As Built Drawings
                                <%--<div class="title-small">As Built Drawings</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Manufacturer and Supplier Literature
                                <%--<div class="title-small">Manufacturer and Supplier Literature</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Product Guarantees and Warrantees
                                <%--<div class="title-small">Product Guarantees and Warrantees</div>--%>
                            </td>
                            <td style="width: 125px; text-align: center" valign="middle" >
                                Cross Referencing Index
                                <%--<div class="title-small">Cross Referencing Index</div>--%>
                            </td>

                            </tr>
                       <tr class="hrow" style="border-left:none!Important" >
                                 <td style="width: 125px; text-align: center;border-left:none!Important;border-radius:0px !important" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>
                                <td style="width: 125px; text-align: center" valign="middle" >
                            </td>

                             <td style="width: 100px; text-align: center" valign="middle">Rev:00

                            </td>
                             <td style="width: 100px; text-align: center" valign="middle">Final

                            </td>
                            <td style="width: 100px; text-align: center" valign="middle">Handover Issued

                            </td>
                              <td style="width: 100px; text-align: center" valign="middle">Rev:00

                            </td>
                             <td style="width: 100px; text-align: center" valign="middle">Final

                            </td>
                            <td style="width: 100px; text-align: center" valign="middle">Handover Issued

                            </td>
                           
                        </tr>
                        
                    </table>
                </div>
                <div id="Data"   onscroll="Onscrollfunction();" style="top:95px";>


                              <asp:Repeater ID="rptmmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound" >
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>

                            <div id="DataDiv" style="width:4120px;">
                                <div id='h<%#Container.ItemIndex %>' class="rptheader" onclick="getdata(<%#Container.ItemIndex %>);">
                                    <p style="margin: 0; padding: 0px;"><a class="pull-left" style="margin-right: 10px; padding-left: 4px" href="#"><i class="icon-plus"></i></a><%# Eval("Folder_description") %> </p>
                                    <asp:Label ID="lblsys" runat="server" Text='<%# Eval("Folder_id") %>' Style="display: none"></asp:Label>
                                </div>
                                <div id='d<%#Container.ItemIndex %>' style="display: none" class="sub">

                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:Repeater ID="rptdetails" runat="server" OnItemDataBound="rptdetails_ItemDataBound" OnItemCommand="rptdetails_ItemCommand">
                                                <HeaderTemplate>
                                                    <table class="table-style3" cellspacing="0" cellpadding"0" border="0" style="width: 3775px; font-size: 10px;table-layout: fixed">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr class="row">
                                                        <td style="width: 100px" onclick="HideTextMode();"><%# Eval("Folder_code") %></td>
                                                        <td style="width: 200px; text-align: left;" onclick="HideTextMode();"><%# Eval("Folder_description") %></td>
                                                        <td style="width: 100px;"></td>
                                                        <td style="width: 125px;text-align:center" id='td1<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,1);">
                                                            <asp:Label ID="lbl1" Visible="false" CssClass="lbltxt"  runat="server" Text='<%# Eval("Section1") %>' />
                                                             <asp:HyperLink ID="hl1" Visible="false" runat="server" class="icon-ok hcheck"  />
                                                            <asp:TextBox ID="txt1" CssClass="txtrow" runat="server"  OnTextChanged="txt1_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px;text-align:center" id='td2<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,2);">
                                                            <asp:Label ID="lbl2" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section2") %>' />
                                                             <asp:HyperLink ID="hl2"  Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt2" runat="server" CssClass="txtrow"  OnTextChanged="txt2_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td3<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,3);">
                                                            <asp:Label ID="lbl3" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section3") %>' />
                                                             <asp:HyperLink ID="hl3" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt3" runat="server" CssClass="txtrow"  OnTextChanged="txt3_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td4<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,4);">
                                                            <asp:Label ID="lbl4" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section4") %>' />
                                                             <asp:HyperLink ID="hl4" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt4" runat="server" CssClass="txtrow"  OnTextChanged="txt4_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td5<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,5);">
                                                            <asp:Label ID="lbl5" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section5") %>' />
                                                             <asp:HyperLink ID="hl5" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt5" runat="server" CssClass="txtrow"  OnTextChanged="txt5_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td6<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,6);">
                                                            <asp:Label ID="lbl6" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section6") %>' />
                                                             <asp:HyperLink ID="hl6" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt6" runat="server" CssClass="txtrow" OnTextChanged="txt6_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td7<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,7);">
                                                            <asp:Label ID="lbl7" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section7") %>' />
                                                             <asp:HyperLink ID="hl7" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt7" runat="server" CssClass="txtrow" OnTextChanged="txt7_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td8<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,8);">
                                                            <asp:Label ID="lbl8" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section8") %>' />
                                                             <asp:HyperLink ID="hl8" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt8" CssClass="txtrow" runat="server"  OnTextChanged="txt8_TextChanged" M_axLength="10" />
                                                        </td>
                                                        <td style="width: 125px" id='td9<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,9);">
                                                            <asp:Label ID="lbl9" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section9") %>' />
                                                             <asp:HyperLink ID="hl9" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt9" CssClass="txtrow" runat="server"  OnTextChanged="txt9_TextChanged" M_axLength="10" />
                                                        </td>
                                                        <td style="width: 125px" id='td10<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,10);">
                                                            <asp:Label ID="lbl10" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section10") %>' />
                                                             <asp:HyperLink ID="hl10" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt10" CssClass="txtrow" runat="server"  OnTextChanged="txt10_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td11<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,11);">
                                                            <asp:Label ID="lbl11" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section11") %>' />
                                                             <asp:HyperLink ID="hl11" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt11" CssClass="txtrow" runat="server"  OnTextChanged="txt11_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td12<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,12);">
                                                            <asp:Label ID="lbl12" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section12") %>' />
                                                             <asp:HyperLink ID="hl12" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt12" CssClass="txtrow" runat="server"  OnTextChanged="txt12_TextChanged" M_axLength="10" />
                                                        </td>
                                                        <td style="width: 125px" id='td13<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,13);">
                                                            <asp:Label ID="lbl13" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section13") %>' />
                                                             <asp:HyperLink ID="hl13" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt13" CssClass="txtrow" runat="server"  OnTextChanged="txt13_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td14<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,14);">
                                                            <asp:Label ID="lbl14" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section14") %>' />
                                                             <asp:HyperLink ID="hl14" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt14" CssClass="txtrow" runat="server"  OnTextChanged="txt14_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td15<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,15);">
                                                            <asp:Label ID="lbl15" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section15") %>' />
                                                             <asp:HyperLink ID="hl15" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt15" CssClass="txtrow" runat="server"  OnTextChanged="txt15_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td16<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,16);">
                                                            <asp:Label ID="lbl16" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section16") %>' />
                                                             <asp:HyperLink ID="hl16" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt16" CssClass="txtrow" runat="server"  OnTextChanged="txt16_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td17' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,17);">
                                                            <asp:Label ID="lbl17" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section17") %>' />
                                                             <asp:HyperLink ID="hl17" Visible="false" runat="server" class="icon-ok hcheck" />
                                                          
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td18' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,18);">
                                                            <asp:Label ID="lbl18" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section18") %>' />
                                                               <asp:HyperLink ID="hl18" Visible="false" runat="server" class="icon-ok hcheck" />
                                                          
                                                        </td>
                                                        <td style="width: 125px" id='td19<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,19);">
                                                            <asp:Label ID="lbl19" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section19") %>' />
                                                               <asp:HyperLink ID="hl19" Visible="false" runat="server" class="icon-ok hcheck" />
                                                          <asp:TextBox ID="txt19" CssClass="txtrow" runat="server"  OnTextChanged="txt19_TextChanged" M_axLength="10" />
                                                        </td>
                                                        <td style="width: 125px" id='td20<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,20);">
                                                            <asp:Label ID="lbl20" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section20") %>' />
                                                               <asp:HyperLink ID="hl20" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt20" CssClass="txtrow" runat="server"  OnTextChanged="txt20_TextChanged" M_axLength="10" />
                                                        </td>
                                                         <td style="width: 125px" id='td21' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,21);">
                                                            <asp:Label ID="lbl21" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Total") %>' />
                                                            
                                                        </td>
                                                        <td style="width: 100px" id='td22<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,22);">
                                                             <asp:Label ID="lbl22"   runat="server" Text='<%# Eval("DRev") %>' />
                                                            <asp:TextBox ID="txt22" CssClass="txtrow" runat="server"  OnTextChanged="txt22_TextChanged" M_axLength="10" />
                                                         </td>
                                                             <td style="width: 100px" id='td23<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,23);">
                                                             <asp:Label ID="lbl23"   runat="server" Text='<%# Eval("DFinal") %>' />
                                                            <asp:TextBox ID="txt23" CssClass="txtrow" runat="server"  OnTextChanged="txt23_TextChanged" M_axLength="10" />
                                                         </td>
                                                         <td style="width: 100px" id='td24<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,24);">
                                                             <asp:Label ID="lbl24"   runat="server" Text='<%# Eval("DHissued") %>' />
                                                            <asp:TextBox ID="txt24" CssClass="txtrow" runat="server"  OnTextChanged="txt24_TextChanged" M_axLength="10" />
                                                         </td>
                                                         <td style="width: 100px" id='td25<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,25);">
                                                             <asp:Label ID="lbl25"   runat="server" Text='<%# Eval("CRev") %>' />
                                                            <asp:TextBox ID="txt25" CssClass="txtrow" runat="server"  OnTextChanged="txt25_TextChanged" M_axLength="10" />
                                                         </td>
                                                         <td style="width: 100px" id='td26<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,26);">
                                                             <asp:Label ID="lbl26"   runat="server" Text='<%# Eval("CFinal") %>' />
                                                            <asp:TextBox ID="txt26" CssClass="txtrow" runat="server"  OnTextChanged="txt26_TextChanged" M_axLength="10" />
                                                         </td>
                                                         <td style="width: 100px" id='td27<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,27);">
                                                             <asp:Label ID="lbl27"   runat="server" Text='<%# Eval("CHissued") %>' />
                                                            <asp:TextBox ID="txt27" CssClass="txtrow" runat="server"  OnTextChanged="txt27_TextChanged" M_axLength="10" />
                                                         </td>
                                                        <td style="width: 150px" id='td28<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,28);">
                                                            <asp:Label ID="lbl28"   runat="server" Text='<%# Eval("Remarks") %>' />
                                                            <asp:TextBox ID="txt28" CssClass="txtrow" runat="server" OnTextChanged="txt28_TextChanged" MaxLength="150"  />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="alter">
                                                       <td style="width: 100px" onclick="HideTextMode();"><%# Eval("Folder_code") %></td>
                                                        <td style="width: 200px; text-align: left;" onclick="HideTextMode();"><%# Eval("Folder_description") %></td>
                                                        <td style="width: 100px;"></td>
                                                        <td style="width: 125px;text-align:center" id='td1<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,1);">
                                                            <asp:Label ID="lbl1" Visible="false" CssClass="lbltxt"  runat="server" Text='<%# Eval("Section1") %>' />
                                                             <asp:HyperLink ID="hl1" Visible="false" runat="server" class="icon-ok hcheck"  />
                                                            <asp:TextBox ID="txt1" CssClass="txtrow" runat="server"  OnTextChanged="txt1_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px;text-align:center" id='td2<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,2);">
                                                            <asp:Label ID="lbl2" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section2") %>' />
                                                             <asp:HyperLink ID="hl2"  Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt2" runat="server" CssClass="txtrow"  OnTextChanged="txt2_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td3<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,3);">
                                                            <asp:Label ID="lbl3" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section3") %>' />
                                                             <asp:HyperLink ID="hl3" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt3" runat="server" CssClass="txtrow"  OnTextChanged="txt3_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td4<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,4);">
                                                            <asp:Label ID="lbl4" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section4") %>' />
                                                             <asp:HyperLink ID="hl4" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt4" runat="server" CssClass="txtrow"  OnTextChanged="txt4_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td5<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,5);">
                                                            <asp:Label ID="lbl5" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section5") %>' />
                                                             <asp:HyperLink ID="hl5" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt5" runat="server" CssClass="txtrow"  OnTextChanged="txt5_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td6<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,6);">
                                                            <asp:Label ID="lbl6" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section6") %>' />
                                                             <asp:HyperLink ID="hl6" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt6" runat="server" CssClass="txtrow" OnTextChanged="txt6_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td7<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,7);">
                                                            <asp:Label ID="lbl7" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section7") %>' />
                                                             <asp:HyperLink ID="hl7" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt7" runat="server" CssClass="txtrow" OnTextChanged="txt7_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                        </td>
                                                        <td style="width: 125px" id='td8<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,8);">
                                                            <asp:Label ID="lbl8" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section8") %>' />
                                                             <asp:HyperLink ID="hl8" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt8" CssClass="txtrow" runat="server"  OnTextChanged="txt8_TextChanged" M_axLength="10" />
                                                        </td>
                                                        <td style="width: 125px" id='td9<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,9);">
                                                            <asp:Label ID="lbl9" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section9") %>' />
                                                             <asp:HyperLink ID="hl9" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt9" CssClass="txtrow" runat="server"  OnTextChanged="txt9_TextChanged" M_axLength="10" />
                                                        </td>
                                                        <td style="width: 125px" id='td10<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,10);">
                                                            <asp:Label ID="lbl10" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section10") %>' />
                                                             <asp:HyperLink ID="hl10" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt10" CssClass="txtrow" runat="server"  OnTextChanged="txt10_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td11<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,11);">
                                                            <asp:Label ID="lbl11" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section11") %>' />
                                                             <asp:HyperLink ID="hl11" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt11" CssClass="txtrow" runat="server"  OnTextChanged="txt11_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td12<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,12);">
                                                            <asp:Label ID="lbl12" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section12") %>' />
                                                             <asp:HyperLink ID="hl12" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt12" CssClass="txtrow" runat="server"  OnTextChanged="txt12_TextChanged" M_axLength="10" />
                                                        </td>
                                                        <td style="width: 125px" id='td13<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,13);">
                                                            <asp:Label ID="lbl13" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section13") %>' />
                                                             <asp:HyperLink ID="hl13" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt13" CssClass="txtrow" runat="server"  OnTextChanged="txt13_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td14<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,14);">
                                                            <asp:Label ID="lbl14" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section14") %>' />
                                                             <asp:HyperLink ID="hl14" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt14" CssClass="txtrow" runat="server"  OnTextChanged="txt14_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td15<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,15);">
                                                            <asp:Label ID="lbl15" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section15") %>' />
                                                             <asp:HyperLink ID="hl15" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt15" CssClass="txtrow" runat="server"  OnTextChanged="txt15_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td16<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,16);">
                                                            <asp:Label ID="lbl16" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section16") %>' />
                                                             <asp:HyperLink ID="hl16" Visible="false" runat="server" class="icon-ok hcheck" />
                                                             <asp:TextBox ID="txt16" CssClass="txtrow" runat="server"  OnTextChanged="txt16_TextChanged" M_axLength="10" />
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td17' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,17);">
                                                            <asp:Label ID="lbl17" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section17") %>' />
                                                             <asp:HyperLink ID="hl17" Visible="false" runat="server" class="icon-ok hcheck" />
                                                          
                                                            
                                                        </td>
                                                        <td style="width: 125px" id='td18' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,18);">
                                                            <asp:Label ID="lbl18" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section18") %>' />
                                                               <asp:HyperLink ID="hl18" Visible="false" runat="server" class="icon-ok hcheck" />
                                                          
                                                        </td>
                                                        <td style="width: 125px" id='td19<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,19);">
                                                            <asp:Label ID="lbl19" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section19") %>' />
                                                               <asp:HyperLink ID="hl19" Visible="false" runat="server" class="icon-ok hcheck" />
                                                          <asp:TextBox ID="txt19" CssClass="txtrow" runat="server"  OnTextChanged="txt19_TextChanged" M_axLength="10" />
                                                        </td>
                                                        <td style="width: 125px" id='td20<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,20);">
                                                            <asp:Label ID="lbl20" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Section20") %>' />
                                                               <asp:HyperLink ID="hl20" Visible="false" runat="server" class="icon-ok hcheck" />
                                                            <asp:TextBox ID="txt20" CssClass="txtrow" runat="server"  OnTextChanged="txt20_TextChanged" M_axLength="10" />
                                                        </td>
                                                         <td style="width: 125px" id='td21' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,21);">
                                                            <asp:Label ID="lbl21" Visible="false" CssClass="lbltxt" runat="server" Text='<%# Eval("Total") %>' />
                                                            
                                                        </td>
                                                        <td style="width: 100px" id='td22<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,22);">
                                                             <asp:Label ID="lbl22"   runat="server" Text='<%# Eval("DRev") %>' />
                                                            <asp:TextBox ID="txt22" CssClass="txtrow" runat="server"  OnTextChanged="txt22_TextChanged" M_axLength="10" />
                                                         </td>
                                                             <td style="width: 100px" id='td23<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,23);">
                                                             <asp:Label ID="lbl23"   runat="server" Text='<%# Eval("DFinal") %>' />
                                                            <asp:TextBox ID="txt23" CssClass="txtrow" runat="server"  OnTextChanged="txt23_TextChanged" M_axLength="10" />
                                                         </td>
                                                         <td style="width: 100px" id='td24<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,24);">
                                                             <asp:Label ID="lbl24"   runat="server" Text='<%# Eval("DHissued") %>' />
                                                            <asp:TextBox ID="txt24" CssClass="txtrow" runat="server"  OnTextChanged="txt24_TextChanged" M_axLength="10" />
                                                         </td>
                                                         <td style="width: 100px" id='td25<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,25);">
                                                             <asp:Label ID="lbl25"   runat="server" Text='<%# Eval("CRev") %>' />
                                                            <asp:TextBox ID="txt25" CssClass="txtrow" runat="server"  OnTextChanged="txt25_TextChanged" M_axLength="10" />
                                                         </td>
                                                         <td style="width: 100px" id='td26<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,26);">
                                                             <asp:Label ID="lbl26"   runat="server" Text='<%# Eval("CFinal") %>' />
                                                            <asp:TextBox ID="txt26" CssClass="txtrow" runat="server"  OnTextChanged="txt26_TextChanged" M_axLength="10" />
                                                         </td>
                                                         <td style="width: 100px" id='td27<%# Eval("Folder_id") %>'  onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,27);">
                                                             <asp:Label ID="lbl27"   runat="server" Text='<%# Eval("CHissued") %>' />
                                                            <asp:TextBox ID="txt27" CssClass="txtrow" runat="server"  OnTextChanged="txt27_TextChanged" M_axLength="10" />
                                                         </td>
                                                        <td style="width: 150px" id='td28<%# Eval("Folder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("Folder_id") %>,28);">
                                                            <asp:Label ID="lbl28"   runat="server" Text='<%# Eval("Remarks") %>' />
                                                            <asp:TextBox ID="txt28" CssClass="txtrow" runat="server" OnTextChanged="txt28_TextChanged" MaxLength="150"  />
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

                                  <%--  </div>
                       </div>
                                 </ItemTemplate>
                            </asp:Repeater>--%>


                   
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




                //if (_type == 8 || _type == 9 || _type == 10) return;

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
            //scrollheight();
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
            //scrollheight();

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
            //scrollheight();

        }
        function setheightdefault() {

            var div1 = document.getElementById('HeaderDiv');
            div1.setAttribute("style", "border-right:none");


        }

        function Onscrollfunction(id) {
            var div = document.getElementById('Data');
            var div2 = document.getElementById('HeaderDiv');
            div2.scrollLeft = div.scrollLeft;
            return false;
        }
        function scrollheight() {
            var div = document.getElementById('Data');
            var div1 = document.getElementById('HeaderDiv');
            if (div.scrollHeight > div.clientHeight) {
                div1.setAttribute("style", "border-right:17px solid red");
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

            if (_auth2.textContent == 33 || _auth2.textContent == 51 || _auth2.textContent == 57) {
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
