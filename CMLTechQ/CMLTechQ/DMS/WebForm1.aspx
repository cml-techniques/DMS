<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CMLTechQ.DMS.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

     <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link rel="stylesheet" href="../Assets/css/OwnStyle.css" type="text/css" />

    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .txtedit {
            display:none;
            width:100px;
        }
    </style>
</head>
<body style="border-right: solid 5px #45818e; overflow: hidden; z-index: 1" class="inner" onload="scrollheight();hideall();">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600"></ajaxToolkit:ToolkitScriptManager>

        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" Style="display: none"></asp:Label>

        <asp:Label ID="lblvalue" runat="server" Text="" Style="display: none"></asp:Label>

        <input type="hidden" id="hfolder" name="hfolder" runat="server" />
        <input type="hidden" id="hprogressid" name="hprogressid" runat="server" />
        <input type="hidden" id="htype" name="htype" runat="server" />
        <input type="hidden" id="hcount" name="hcount" runat="server" />


        <div id="doc-container" style="top: 0px;">
            <div id="main-content">
                <div class="head">
                    <div class="headtitle" style="width:60%;height:100%">
                        <h2 class="title">O&M Progress Tracking Sheet</h2>
                    </div>


                    <div id="RightHeader" onclick="HideTextMode();"  >

                    
                         <div style="padding:5px;float:right">
                            
                        <a style="color: #76a5af; font-weight: 700; font-size: 16px;margin-right:15px;" href="#" onclick="goprint();"><i class="icon-print"></i></a>
                       
                       <a style="color: #76a5af; font-weight: 700; font-size: 16px;margin-right:5px;height:100%" href="#"><i class="icon-cog"></i></a>
                       </div>
                        <div style="height:100%;float:right">
                          
                           <%-- <input type="button" class="newmain" id="btnnewmain"  value="New Main" onclick="Showpopoup();" />--%>
                             
                             
                         

                                  <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>

                                            <input type="text" id="txt111"  value="New Main" />
                                           <asp:Button ID="bdummy" runat="server" Text="" Style="background-color:transparent;border:none" OnClick="bdummy_Click" /> 
                                            

                                            </ContentTemplate>
                                      </asp:UpdatePanel>

                            </div>
                      
                        </div>


                </div>

                <div id="HeaderDiv" onclick="HideTextMode();">
                    <table id="repeaterHead" style="width: 1800px;">
                        <tr>
                            <td style="width: 50px; text-align: center" rowspan="2">Volume No

                                                <table style="border:none">
                    <tr>
                        <td style="width: 20px;;border:none"><a style="color: #ffffff; font-weight: 700; font-size: 16px;" href="#" onclick="expandall(1);" title="Collapse All"><i class="icon-plus-sign"></i></a></td>
                        <td style="border:none"><a style="color: #ffffff; font-weight: 700; font-size: 16px" href="#" onclick="expandall(2);" title="Expand All"><i class="icon-minus-sign"></i></a></td>
                      
                    </tr>
                </table>

                            </td>
                            <td style="width: 270px; text-align: center" rowspan="2">List of O&M Manuals</td>
                            <td style="text-align: center">Section 1</td>
                            <td style="text-align: center">Section 2</td>
                            <td style="text-align: center">Section 3</td>
                            <td style="text-align: center">Section 4</td>
                            <td style="text-align: center">Section 5</td>
                            <td style="text-align: center">Section 6</td>
                            <td style="text-align: center">Section 7</td>
                            <td style="text-align: center">Section 8</td>
                            <td style="text-align: center">Section 9</td>
                            <td style="text-align: center">Section 10</td>
                            <td style="width: 100px; text-align: center" rowspan="2">1st Draft Issue </td>
                            <td style="width: 250px; text-align: center" rowspan="2">Remarks</td>
                        </tr>
                        <tr>
                            <td style="width: 100px; text-align: center">Introduction / Health & Saftey</td>
                            <td style="width: 100px; text-align: center">Description of Installation</td>
                            <td style="width: 100px; text-align: center">Plant & Equipment Schedules</td>
                            <td style="width: 100px; text-align: center">Operating Procedures</td>
                            <td style="width: 100px; text-align: center">Planned Manitenance & Spares</td>
                            <td style="width: 100px; text-align: center">Emergency & Fault Finding Procedures</td>
                            <td style="width: 100px; text-align: center">Safety Procedures</td>
                            <td style="width: 100px; text-align: center">Manufactures Literature</td>
                            <td style="width: 100px; text-align: center">Testing & Commissioning Data </td>
                            <td style="width: 100px; text-align: center">As-Built Drawings</td>

                        </tr>
                    </table>
                </div>
            </div>

            <div id="Data" onscroll="Onscrollfnction();" style="top:116px;">

               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                        <asp:Repeater ID="rptmmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound" OnItemCommand="rptmmain_ItemCommand">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>

                                <div id="DataDiv">
                                    <div id='h<%#Container.ItemIndex %>' class="rptheader" style="width: 1800px; height: 20px; padding: 5px 0px" onclick="getdata(<%#Container.ItemIndex %>);">
                                        <p style="margin: 0; padding: 0px;"><a class="pull-left" style="margin-right: 10px; padding-left: 4px" href="#"><i class="icon-plus"></i></a><%# Eval("Folder_description") %> </p>
                                        <asp:Label ID="lblsys" runat="server" Text='<%# Eval("ProgressFolder_Id") %>' Style="display: none"></asp:Label>
                                    </div>
                                    <div id='d<%#Container.ItemIndex %>' style="display: none" class="sub">

                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <asp:Repeater ID="rptdetails" runat="server" OnItemDataBound="rptdetails_ItemDataBound" OnItemCommand="rptdetails_ItemCommand">
                                                    <HeaderTemplate>
                                                        <table id="repeaterTable" style="width: 1800px;">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>

                                                        <tr  id="row"  class="rrow">


                                                            <td style="width: 50px; text-align: center; border-right: 1px solid #76a5af;" onclick="HideTextMode();"><%# Eval("Folder_code") %></td>
                                                            <td style="width: 270px; text-align: left; padding-left: 2px" onclick="HideTextMode();"><%# Eval("Folder_description") %>  </td>

                                                            <td style="width: 100px; text-align: center" id='td1<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,1);">

                                                                <asp:Label ID="lbl1" style="display:none" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section1") %>'  />



                                                                <asp:Image ID="img1" style="display:none" runat="server" ImageUrl="~/Assets/img/Checks.png" />
<%--<asp:TextBox ID="txt1" runat="server"  CssClass="txtedit" OnTextChanged="txt1_TextChanged" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />--%>
                             <input type="text"  id="txt1" class="txtedit"  onkeydown="switchmode(this,event)"  onkeypress="return CheckNumerOnly(event);" />                                                               
 

                                                            </td>

                                                            <td style="width: 100px; text-align: center" id='td2<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,2);">

                                                                <asp:Image ID="img2" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl2" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section2") %>' />
                                                                <asp:TextBox ID="txt2" runat="server" Text='<%# Eval("Section2") %>' OnTextChanged="txt2_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />

                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td3<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,3);">
                                                                <asp:Image ID="img3" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl3" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section3") %>' />
                                                                <asp:TextBox ID="txt3" runat="server" Text='<%# Eval("Section3") %>' OnTextChanged="txt3_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td4<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,4);">
                                                                <asp:Image ID="img4" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl4" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section4") %>' />
                                                                <asp:TextBox ID="txt4" runat="server" Text='<%# Eval("Section4") %>' OnTextChanged="txt4_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td5<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,5);">
                                                                <asp:Image ID="img5" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl5" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section5") %>' />
                                                                <asp:TextBox ID="txt5" runat="server" Text='<%# Eval("Section5") %>' OnTextChanged="txt5_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td6<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,6);">
                                                                <asp:Image ID="img6" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl6" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section6") %>' />
                                                                <asp:TextBox ID="txt6" runat="server" Text='<%# Eval("Section6") %>' OnTextChanged="txt6_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td7<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,7);">
                                                                <asp:Image ID="img7" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl7" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section7") %>' />
                                                                <asp:TextBox ID="txt7" runat="server" Text='<%# Eval("Section7") %>' OnTextChanged="txt7_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td8<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,8);">
                                                                <asp:Image ID="img8" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl8" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section8") %>' />
                                                                <asp:TextBox ID="txt8" runat="server" Text='<%# Eval("Section8") %>' OnTextChanged="txt8_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td9<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,9);">
                                                                <asp:Image ID="img9" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl9" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section9") %>' />
                                                                <asp:TextBox ID="txt9" runat="server" Text='<%# Eval("Section9") %>' OnTextChanged="txt9_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td10<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,10);">
                                                                <asp:Image ID="img10" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl10" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section10") %>' />
                                                                <asp:TextBox ID="txt10" runat="server" Text='<%# Eval("Section10") %>' OnTextChanged="txt10_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td11<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,11);">
                                                                

                                                                <asp:Label ID="lbl11" ForeColor="#FF0000" runat="server" Text='<%# Eval("DraftIssueDate") %>' />
                                                              
                            <asp:TextBox ID="txt11" runat="server" Text='<%# Eval("DraftIssueDate") %>' OnTextChanged="txt11_TextChanged" CssClass="txtedit" MaxLength="10" />
                                                               
                                                               
               <ajaxToolkit:CalendarExtender runat="server" Enabled="True" TargetControlID="txt11" ID="CalendarExtender1" PopupButtonID="txt11" Format="dd/MM/yyyy" PopupPosition="TopRight" OnClientShown="showCalendar" CssClass="Calendar" ></ajaxToolkit:CalendarExtender>

              

                                                                 
                                                           

                                                            </td>
                                                            <td style="width: 250px; text-align: left" id='td12<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,12);">
                                                                <asp:Label ID="lbl12" Width="250px" ForeColor="#FF0000" runat="server" Text='<%# Eval("Remarks") %>' />
                                                                <asp:TextBox ID="txt12" runat="server" Text='<%# Eval("Remarks") %>' OnTextChanged="txt12_TextChanged" Width="246px" ClientIDMode="Static" />

                                                            </td>
                                                        </tr>

                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr class="arow" id="row">
                                                            <td style="width: 50px; text-align: center; border-right: 1px solid #76a5af;" onclick="HideTextMode();"><%# Eval("Folder_code") %></td>
                                                            <td style="width: 270px; text-align: left; padding-left: 2px" onclick="HideTextMode();"><%# Eval("Folder_description") %>  </td>

                                                            <td style="width: 100px; text-align: center" id='td1<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,1);">

                                                                <asp:Label ID="lbl1" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section1") %>' />

                                                                <asp:Image ID="img1" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />

                                                                <asp:TextBox ID="txt1" runat="server" Text='<%# Eval("Section1") %>' CssClass="txtedit" ClientIDMode="Static" OnTextChanged="txt1_TextChanged" AutoPostBack="false" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />

                                                            </td>

                                                            <td style="width: 100px; text-align: center" id='td2<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,2);">

                                                                <asp:Image ID="img2" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl2" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section2") %>' />
                                                                <asp:TextBox ID="txt2" runat="server" Text='<%# Eval("Section2") %>' OnTextChanged="txt2_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />

                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td3<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,3);">
                                                                <asp:Image ID="img3" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl3" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section3") %>' />
                                                                <asp:TextBox ID="txt3" runat="server" Text='<%# Eval("Section3") %>' OnTextChanged="txt3_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td4<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,4);">
                                                                <asp:Image ID="img4" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl4" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section4") %>' />
                                                                <asp:TextBox ID="txt4" runat="server" Text='<%# Eval("Section4") %>' OnTextChanged="txt4_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td5<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,5);">
                                                                <asp:Image ID="img5" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl5" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section5") %>' />
                                                                <asp:TextBox ID="txt5" runat="server" Text='<%# Eval("Section5") %>' OnTextChanged="txt5_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td6<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,6);">
                                                                <asp:Image ID="img6" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl6" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section6") %>' />
                                                                <asp:TextBox ID="txt6" runat="server" Text='<%# Eval("Section6") %>' OnTextChanged="txt6_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td7<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,7);">
                                                                <asp:Image ID="img7" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl7" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section7") %>' />
                                                                <asp:TextBox ID="txt7" runat="server" Text='<%# Eval("Section7") %>' OnTextChanged="txt7_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td8<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,8);">
                                                                <asp:Image ID="img8" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl8" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section8") %>' />
                                                                <asp:TextBox ID="txt8" runat="server" Text='<%# Eval("Section8") %>' OnTextChanged="txt8_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td9<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,9);">
                                                                <asp:Image ID="img9" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl9" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section9") %>' />
                                                                <asp:TextBox ID="txt9" runat="server" Text='<%# Eval("Section9") %>' OnTextChanged="txt9_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td10<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,10);">
                                                                <asp:Image ID="img10" Visible="false" runat="server" ImageUrl="~/Assets/img/Checks.png" />
                                                                <asp:Label ID="lbl10" Visible="false" ForeColor="#FF0000" runat="server" Text='<%# Eval("Section10") %>' />
                                                                <asp:TextBox ID="txt10" runat="server" Text='<%# Eval("Section10") %>' OnTextChanged="txt10_TextChanged" CssClass="txtedit" ClientIDMode="Static" MaxLength="3" onkeypress="return CheckNumerOnly(event);" />
                                                            </td>
                                                            <td style="width: 100px; text-align: center" id='td11<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,11);">
                                                                <asp:Label ID="lbl11" ForeColor="#FF0000" runat="server" Text='<%# Eval("DraftIssueDate") %>' />

                                                                <asp:TextBox ID="txt11" runat="server" Text='<%# Eval("DraftIssueDate") %>' OnTextChanged="txt11_TextChanged" CssClass="txtedit" MaxLength="10" />

<%--                                                                <ajaxToolkit:CalendarExtender runat="server" Enabled="True" TargetControlID="txt11" ID="CalendarExtender1" PopupButtonID="txt11" Format="dd/MM/yyyy" PopupPosition="TopRight" OnClientShown="showCalendar" CssClass="Calendar" ></ajaxToolkit:CalendarExtender>--%>


                                                            </td>
                                                            <td style="width: 250px; text-align: left" id='td12<%# Eval("ProgressFolder_id") %>' onclick="gos(<%# Eval("Progress_Id") %>,<%# Eval("ProgressFolder_id") %>,12);">
                                                                <asp:Label ID="lbl12" Width="250px" ForeColor="#FF0000" runat="server" Text='<%# Eval("Remarks") %>' />
                                                                <asp:TextBox ID="txt12" runat="server" Text='<%# Eval("Remarks") %>' OnTextChanged="txt12_TextChanged" Width="246px" ClientIDMode="Static" />

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
                   <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>

            </div>




            <div class="clear"></div>
            <div class="footer"></div>



        </div>

         
        <asp:Button ID="btndummy" runat="server" Text="btndummy" />
        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btndummy" PopupControlID="pnlpop"></asp:ModalPopupExtender>

        <asp:Panel ID="pnlpop" runat="server" Style="display: none; background: #cccccc;" Width="350px">
           
 <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>

                    <table class="tblpopoup1" style="width: 100%; background-color: #3e838c">
                        <tr>
                            <td class="poptext">
                                <asp:Label ID="lblpnlhead" Text="Create Package" runat="server"></asp:Label></td>
                            <td><a href="#" onclick="goclose();"><i style="color: white" class="icon-remove-sign pull-right icon liclose"></i></a></td>

                        </tr>
                    </table>

                    <%--<div class="dvshadow" style="width:100%;">--%>

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

                    <%-- <div>--%>

       

                </ContentTemplate>
            </asp:UpdatePanel>

             </asp:Panel>
         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>

                                            <asp:Button ID="btndummy2" runat="server" Text="" Style="background-color: transparent; border: none" />
                                            <asp:Button ID="btndummy1" runat="server" Text="btndummy1" OnClick="btndummy_Click" Style="display: none" />
                                           
<%--                                             <asp:Button ID="btnmain" Text="New main" runat="server" Height="100%" BackColor="Black" ForeColor="White" BorderStyle="None" OnClientClick="Showpopoup();" />--%>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    


        <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="../../Assets/js/dropdown.js" type="text/javascript"></script>
        <script src="../../Assets/js/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>

        <script type="text/javascript">
            jQuery(window).load(function () {
                jQuery('.recent_works1').carouFredSel({
                    responsive: true,
                    width: '100%',
                    scroll: 1,
                    auto: false,
                    items: {
                        width: 300,
                        visible: {
                            min: 4,
                            max: 10
                        }
                    },
                    prev: {
                        button: function () { return jQuery(this).closest('.recentwork_carousel').find('.prev'); },
                        key: "left"
                    },
                    next: {
                        button: function () { return jQuery(this).closest('.recentwork_carousel').find('.next'); },
                        key: "right"
                    }
                });
            });
        </script>



    </form>
    <script type="text/javascript">

        function HideTextMode() {
            showlabel();
            hideall();
        }


        function gos(_id, _folder, _type) {

            ///HideTextMode();
           // _type = 2;
            hideall();

            document.getElementById("hprogressid").value = _id;
            document.getElementById("hfolder").value = _folder;
            document.getElementById("htype").value = _type;



            $('#td' + _type + _folder).find('span').hide();
            $('#td' + _type + _folder).find('img').hide();


            //_type = 1;


            $('#td' + _type + _folder).find('input').show();
            //$('#td' + _type + _folder).find('input').
            $('#td' + _type + _folder).find('input').select();



        }
        function ss() {
            var _folder = document.getElementById("hfolder").value;
            var _type = document.getElementById("htype").value;
            $("#td110").find('img').hide();
            $("#td110").find('span').hide();
            $("#td210").find('img').hide();
            $("#td210").find('span').hide();
        }
        function remove(_type, _folder) {
            //$('#td' + _type + _folder).find('img').hide();
            //$('#td' + _type + _folder).find('span').hide();

            $("#td110").find('img').hide();
            $("#td110").find('span').hide();
        }

        function switchmode(e, evt) {

          
            if (evt.keyCode == 57)
            {
                evt.stopPropagation();

                var value = e.value;
               

                var _folder = document.getElementById("hfolder").value;
                 var _type = document.getElementById("htype").value;

                 $('#td' + _type + _folder).find('input').hide();

               $('#td' + _type + _folder).find('span').html(value);
               

            if (value >= 100) {
              
                $('#td' + _type + _folder).find('img').addClass("display", "block");
                $('#td' + _type + _folder).find('img').addClass("visibility", "visible");


                $('#td' + _type + _folder).find('span').addClass("display", "none");
                $('#td' + _type + _folder).find('span').addClass("visibility", "hidden");

               // $('#td' + _type + _folder).find('span').hide();
            }
            else {
               // $('#td' + _type + _folder).find('img').hide();
                $('#td' + _type + _folder).find('span').addClass("display", "block");
                $('#td' + _type + _folder).find('span').addClass("visibility", "visible");

                $('#td' + _type + _folder).find('img').addClass("display", "none");
                $('#td' + _type + _folder).find('img').addClass("visibility", "hidden");

               
               
            }

                //Search(
            $("bdummy").click();
            return true;

        }
               
        }
        function hideall() {
            $('#row td input').hide();
        }
        function showlabel() {

            //$('#row td span').show();
            //$('#row td img').show();

        }
    </script>
    <script type="text/javascript">
        function _autoAdjust() {
            //alert(msieversion());
            var div = $("#main-content").height();
            var win = $(window).height();
            if (div < win) {
                //if (msieversion() > 0) {
                //    var win = $(window).height() - 40;<a href="Schedule.aspx">Schedule.aspx</a>
                //}
                //else {
                //    var win = $(window).height() - 40;
                //}
                //$("#main-content").height(win);
                $("#main-content").addClass("botzero");
            }
            else {
                $("#main-content").addClass("botauto");
            }
        }
    </script>
    <script type="text/javascript">


        function CheckNumerOnly(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode == 13) return true;
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
            var url = "ProgressTrackReport?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent;
            window.open(url, '', '', true);
        }

        function getdata(id) {
            var e = document.getElementById('d' + id);

            if (e) {
                if (e.style.display == 'none') {
                    e.style.display = 'block';
                    e.style.visibility = 'visible';
                    // _changeActive(id);
                    // _changeActive();
                    jQuery('#h' + id).find('i').removeClass('icon-plus').addClass('icon-minus');
                }
                else {
                    e.style.display = 'none';
                    e.style.visibility = 'hidden';
                    jQuery('#h' + id).find('i').removeClass('icon-minus').addClass('icon-plus');
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
        //function _changeActive(id) {
        //    $(function () {
        //        $('.rptheader').click(function () {
        //            jQuery(this).find('i').removeClass('icon-plus').addClass('icon-minus');
        //            //jQuery(this).find('i').addClass('icon-minus');
        //            //jQuery(this).find('i').toggleClass('icon-minus icon-plus');
        //        });
        //    });
        //}
        //function _changeInActive() {
        //    $(function () {
        //        $('.rptheader').click(function () {
        //            jQuery(this).find('i').removeClass('icon-minus').addClass('icon-plus');
        //        });
        //    });
        //}
        //function fixHeader() {
        //    var t = document.getElementById("repeaterHead");
        //    var thead = t.getElementsByTagName("thead")[0];
        //    var t1 = t.cloneNode(false);
        //    t1.appendChild(thead);
        //    tableHeader.appendChild(t1)
        //}
        //window.onload = fixHeader();
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
                div1.setAttribute("style", "border-right:17px solid #45818e");
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
        //function Showpopoup1() 
        //{

        //    }
        function Showpopoup() {

            $("#btndummy").click();

        }
    </script>
<%--                <script src="../Assets/js/jquery.min.js"></script>
            <script src="../Assets/js/jquery.nicescroll.js"></script>
        <script type="text/javascript">
            $(document).ready(
                function () {
                    $("html").niceScroll({ styler: "fb", cursorcolor: "#063940", cursorwidth: '10', cursorborderradius: '0px', background: '#45818e', cursorborder: '' });
                });
        </script>--%>
</body>
</html>



