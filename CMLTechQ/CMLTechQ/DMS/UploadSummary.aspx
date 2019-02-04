<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadSummary.aspx.cs" Inherits="CMLTechQ.DMS.UploadSummary" %>
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
        .hideAnchor {
            color:#cccccc!important;
            cursor:none;
        }
        .hideAnchor:hover {
         color:#cccccc!important;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>

        <input type = "hidden" id = "hfolder" name  = "hfolder" runat="server" />
         <input type = "hidden" id = "hid" name = "hid" runat="server" />
        <input type = "hidden" id = "hprogressid" name = "hprogressid" runat="server" />
              <input type="hidden" id="hcount" name="hcount" runat="server" />
         

       <div id="docview_area">
       <div class="pulldownbar">
       <div class="togglemenu">
          <%--<a href="#" title="Toggle Sidebar" data-prl-offcanvas="{target:'#offcanvas-search'}"><i class="fa fa-navicon"></i></a>--%>
        </div>
       </div>
                       <div class="container">
                <div class="control-panel" style="right:317.5px">
                    <div class="halfwidth-left" style="right:35%">
                        <div class="menubar ">
                            <ul class="left" style="display:flex;justify-content:space-around;align-items:center;width:100%;padding-left:0;">
                                <li><a href="#" onclick="goProgressReport();" id="pts" runat="server">Progress Tracking Sheet</a></li>
                                <li><a href="#" onclick="gostatusgraph();">Document Status Graph</a></li>
                                <li><a href="#" class="active">Summary of Uploads</a></li>
                            </ul>
                        </div>
                    </div>
                        <div class="halfwidth-right" style="left:65%">
                        <div class="menubar">
                            <ul class="right" style="display:flex;justify-content:space-around;align-items:center;width:100%;padding-left:0;">
                                <li><a href="#" onclick="expandall(1);">Expand</a></li>
                                <li><a href="#" onclick="expandall(2);">Collapse</a></li>
                                <li><a href="#" onclick="goprint();" >Print</a></li>
                            </ul>
                        </div>
                    </div>
                    </div>
                    <div class="back-block" style="right:110px;width:190px;">
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                           <ContentTemplate>
                               <%-- <asp:DropDownList ID="drpservices" runat="server" Width="100%"  OnSelectedIndexChanged="drpservices_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList> --%>
                                <telerik:RadDropDownList ID="rdservice" runat="server" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Status" Width="190px" OnSelectedIndexChanged="rdservice_SelectedIndexChanged" AutoPostBack="true" DropDownWidth="190px"  >                     
                                </telerik:RadDropDownList>

                           </ContentTemplate>
                       </asp:UpdatePanel>
                                   

                </div>

                   <div class="back-block">
                        <a href="#" onclick="goBack();"><i class="fa fa-angle-double-left"></i>&nbsp;&nbsp;BACK</a>
                </div>

       </div>
                       <div class="clear"></div>
            <div class="container-block" style="top:70px">

                            <div id="HeaderDiv" >
                                 <table  style="width:100%;" cellspacing="0";cellpadding="0" class="table-style3">
                                    <tr class="hrow">
                                        <td style="width:30%;text-align:left">
                                        <p style="margin-left:15px">Package</p></td>
                                        <td style="width:20%;text-align:left">
                                            <p style="margin-left:7px"> Document Type</p></td>
                                        <td style="text-align:center;width:10%">Uploaded Date </td>
                                        <td style="text-align:center;width:10%">Status</td>

                                        <td style="text-align:center;width:10%" >Scheduled</td>
                                        <td style="text-align:center;width:10%" >Uploaded</td>
                                        <td style="text-align:center;width:10%" >Percentage</td>
                                        </tr>
                                     <tr></tr>
                                </table>
                            </div>
                  <div id="Data"   style="top:55px">
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                           <ContentTemplate>

               <asp:Repeater ID="rptmmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound" OnItemCommand="rptmmain_ItemCommand">
                        <HeaderTemplate>
                              <table style="width:100%;height:40px;border:none;background-color:#dddddd" cellspacing="0"; cellpadding="0" id="repeaterHead" >
                          </HeaderTemplate>
                          <ItemTemplate>
                         <tr  style="height:30px;" class="rptheader" onclick="getd(<%#Container.ItemIndex %>);" id="tds<%#Container.ItemIndex %>">

                            <td style="text-align:left;width:30%;border:none"  id="td<%#Container.ItemIndex %>">
                                       <p style="margin:0;padding:0px;"><a class="pull-left" style="margin-right:10px;padding-left:4px;color:white" href="#" ><i class="icon-plus"></i></a> </p>
                             <asp:Label ID="Label1" runat="server" Text='<%#Eval("Folder_description") %>' ></asp:Label>
                            <asp:Label ID="lblsys" runat="server" Text='<%#Eval("Folder_Id") %>' Style="display:none" ></asp:Label>

                                            
                        </td>
                                        <td style="text-align:center;width:20%;border:none" ></td>
                                        <td style="text-align:center;width:10%;border:none" > </td>
                                        <td style="text-align:center;width:10%;border:none" ></td>

                                        <td style="text-align:center;width:10%;border:none" >
                                             <%# Eval("Scheduled") %>  
                                        </td>
                                        <td style="text-align:center;width:10%;border:none" >
                                          
                                            <%# Eval("Upload") %>
                                        </td>
                                        <td style="text-align:center;width:10%;border:none" >
                                              <asp:Label ID="lblpercentage" runat="server" Text='<%#Eval("percentage") %>'  ></asp:Label> 
                                        </td>

                         </tr>
                            
                              <tr style="display:none"   id='tr<%#Container.ItemIndex %>' >
                                  <td colspan="7" style="width:100%">
                                         
                              <asp:Repeater ID="rptdetails" runat="server" OnItemDataBound="rptdetails_ItemDataBound">
                                            <HeaderTemplate> 
                                                <table class="table-style3" cellspacing="0" border="0" style="width: 100%; font-size: 10px; table-layout: fixed">
                                                    </HeaderTemplate>
                                            <ItemTemplate>
                                              
                                                     <tr class="alter">

                                                     <td style="width:30%;text-align:left;" id="tdv"  runat="server">                                                   
                                                        <asp:Label ID="lblpackage" runat="server" Text='<%#Eval("Package") %>' style="margin-left:15px"></asp:Label>

                                                    </td>

                                                     <td style="width:20%;text-align:left;border-right:1px solid #dddddd;border-left:none">
                                                      
                                                          <asp:Label ID="lbldtype" runat="server" style="margin-left:7px" Text='<%#Eval("document_type") %>'  ></asp:Label>
                                                            
                                       </td>   
                                                     <td style="width:10%;text-align:center;">
                                                       
                                                           <asp:Label ID="lbluploaddate" runat="server" Text='<%#Eval("uploaded_date") %>'  ></asp:Label>

                                                      </td>
                                                     <td style="width:10%;text-align:center;">
                                                           <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("Status") %>'  ></asp:Label>

                                                     </td>   
                                                     <td style="width:10%;text-align:center;">
                                                           <asp:Label ID="lblscheduled" runat="server" Text='<%#Eval("Scheduled") %>'  ></asp:Label>
                                                         
                                                     </td> 
                                                     <td style="width:10%;text-align:center;">
                                                           <asp:Label ID="lblupload" runat="server" Text='<%#Eval("Uploaded") %>'  ></asp:Label>
                                                     </td>   
                                                     <td style="width:10%;text-align:center;">
                                                           <asp:Label ID="lblper" runat="server" Text='<%#Eval("percentage") %>'  ></asp:Label>
                                                     </td>
                                                         </tr>

                              
                          </ItemTemplate>
                                  <AlternatingItemTemplate>
                                           <tr class="row">

                                                     <td style="width:30%;text-align:left;" id="tdv"  runat="server">                                                   
                                                        <asp:Label ID="lblpackage" runat="server" Text='<%#Eval("Package") %>' style="margin-left:15px"></asp:Label>

                                                    </td>

                                                     <td style="width:20%;text-align:left;border-right:1px solid #dddddd;border-left:none">
                                                      
                                                          <asp:Label ID="lbldtype" runat="server" style="margin-left:7px" Text='<%#Eval("document_type") %>'  ></asp:Label>
                                                            
                                       </td>   
                                                     <td style="width:10%;text-align:center;">
                                                       
                                                           <asp:Label ID="lbluploaddate" runat="server" Text='<%#Eval("uploaded_date") %>'  ></asp:Label>

                                                      </td>
                                                     <td style="width:10%;text-align:center;">
                                                           <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("Status") %>'  ></asp:Label>

                                                     </td>   
                                                     <td style="width:10%;text-align:center;">
                                                           <asp:Label ID="lblscheduled" runat="server" Text='<%#Eval("Scheduled") %>'  ></asp:Label>
                                                         
                                                     </td> 
                                                     <td style="width:10%;text-align:center;">
                                                           <asp:Label ID="lblupload" runat="server" Text='<%#Eval("Uploaded") %>'  ></asp:Label>
                                                     </td>   
                                                     <td style="width:10%;text-align:center;">
                                                           <asp:Label ID="lblper" runat="server" Text='<%#Eval("percentage") %>'  ></asp:Label>
                                                     </td>
                                                    

                                                 


                                                         </tr>
                                  </AlternatingItemTemplate>


                           <FooterTemplate>
                            </table>
                             </FooterTemplate>

                          </asp:Repeater>


                                          
                              </td>
                                   </tr>
                                   

</ItemTemplate>


                          <FooterTemplate>
                              </table>
                          </FooterTemplate>
                      </asp:Repeater>

                               </ContentTemplate>
                           </asp:UpdatePanel>

                 </div>
  
        </div>

           </div>
       
    </form>
    <%: Scripts.Render("~/bundles/scripts") %>
     <script async type="text/javascript">
         function goBack() {
             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");

             if (_auth2.textContent == 33 || _auth2.textContent == 57) {
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
         function goProgressReport() {

             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");
            
             if (_auth2.textContent == "50") {
                 var url = "pts_oph?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
             }
             else if (_auth2.textContent != "25") {
                 var url = "pts?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
                
             }
             parent.location.replace(url);
         }
       
             function goprint() {

                 var _auth1 = document.getElementById("lbluserhidden");
                 var _auth2 = document.getElementById("lblprjid");
                 var url = "DocumentUploadSummaryRpt?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent;
                 window.open(url, '', '', true);
             }
             function getd(id) {
                 var e = document.getElementById('tr' + id);
                 var div1 = document.getElementById('HeaderDiv');
                 if (e) {

                     if (e.style.display == 'none') {
                         e.style.display = 'table-row';
                         e.style.visibility = 'visible';
                         _changeInActive1(id);
                         if ($("#HeaderDiv").height() + $('#tr' + id).height() > $(window).height()) {
                             div1.setAttribute("style", "border-right:16px solid #edeff0");
                         }
                         jQuery('#tds' + id).removeClass('rptheader').addClass('rptheader-select'); 
                     }
                     else {
                         e.style.display = 'none';
                         e.style.visibility = 'hidden';
                         _changeInActive2(id);                       
                             div1.setAttribute("style", "border-right:none");
                         jQuery('#tds' + id).removeClass('rptheader-select').addClass('rptheader');
                     }
                 }
             }
             function _changeInActive1(id) {
                 jQuery("#td" + id).find('i').removeClass('icon-plus').addClass('icon-minus');
             }
             function _changeInActive2(id) {
                 jQuery("#td" + id).find('i').removeClass('icon-minus').addClass('icon-plus');
             }
             function expand(i, type) {
                 var e = document.getElementById('tr' + i);
                 var div1 = document.getElementById('HeaderDiv');
                 if (e) {
                     if (type == 1) {
                         if (e.style.display == 'none') {
                             e.style.display = 'table-row';
                             e.style.visibility = 'visible';
                             div1.setAttribute("style", "border-right:16px solid #45818e");
                             jQuery('#tds' + i).removeClass('rptheader').addClass('rptheader-select');
                             _changeInActive1(i);
                         }
                     }
                     else {
                         if (e.style.display != 'none') {
                             e.style.display = 'none';
                             e.style.visibility = 'hidden';
                             jQuery('#tds' + i).removeClass('rptheader-select').addClass('rptheader');
                             _changeInActive2(i);
                         }
                     }
                 }
             }
             function expandall(type) {
                 var hcount = document.getElementById("hcount").value;
                 for (var i = 0; i <= hcount; i++) {
                     expand(i, type);
                 }
             }

    </script>
</body>
</html>
