<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentUploadSummary.aspx.cs" Inherits="CMLTechQ.DMS.DocumentUploadSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
     <link rel="stylesheet" href="../Assets/css/OwnStyle.css" type="text/css" />
    <link href="../Assets/css/navslider.css" type="text/css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/menustyle.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
     <script src="../Assets/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="../Assets/js/jquery.MultiFile.js" type="text/javascript"></script>
    <style type="text/css">

         
    </style>
    
    <style type="text/css">


    </style>
    </head>
<body style="border-right:solid 5px #45818e;overflow:hidden;z-index:1" class="inner" onload="scrollheight();" >
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600" ></ajaxToolkit:ToolkitScriptManager>

        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>

         <input type = "hidden" id = "hfolder" name  = "hfolder" runat="server" />
         <input type = "hidden" id = "hid" name = "hid" runat="server" />
        <input type = "hidden" id = "hprogressid" name = "hprogressid" runat="server" />


        <div id="doc-container" style="top:0px;" >
             <div id="main-content" style="bottom:0px;">
              <div class="head">
                  <div class="headtitle" style="width:60%">
                      <h2 class="title">Document Upload Summary</h2>
                  </div>


                        <div id="RightHeader" style="width:30%" >
                         <table  class="tblright">
                             <tr>
                                 <td><a  style="color:#76a5af;font-weight:700;font-size:16px" href="#" onclick="goprint();"><i class="icon-print"></i></a>  </td>      
                             </tr>
                         </table>
                    </div>


                   
                  </div>

                 <div id="HeaderDiv">
                                 <table id="repeaterHead" style="width:100%;height:40px;">
                                    <tr  >
                                        <td style="text-align:center;width:200px" >Package</td>
                                        <td style="text-align:center;width:90px" >Manual </td>
                                        <td style="text-align:center;width:100px" >Uploaded Date </td>
                                        <td style="text-align:center;width:80px" >Status</td>
                                         <td style="text-align:center;width:150px" >Document Type</td>
                                        <td style="text-align:center;width:90px" >Scheduled</td>
                                        <td style="text-align:center;width:90px" >Uploaded</td>
                                        <td style="text-align:center;width:90px" >Percentage</td>
                                        </tr>
                                </table>
                            </div>
</div>
             
             
         <div id="Data" style="top:77px">
                            <div id="DataDiv">
                            <div class="sub">
                                        <asp:Repeater ID="rptsummary" runat="server" OnItemDataBound="rptsummary_ItemDataBound" >
                                            <HeaderTemplate> 
                                                <table id="repeaterTable" style="width:100%;">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                 <tr class="rrow">
                                                   
                                                    <td style="width:197px;text-align:left;border-right: 1px solid #76a5af;padding-left:4px">                                                   
                                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Package") %>'></asp:Label>

                                                    </td>
                                                     <td style="width:90px;text-align:center;"><%# Eval("Manual") %>
                                                            
                                       </td>   
                                                      <td style="width:100px;text-align:center"><%# Eval("uploaded_date") %></td>
                                                  
                                                     <td style="width:80px;text-align:center"><%# Eval("Status") %></td>   
                                                    
                                                     <td style="width:150px;text-align:left">
                                                         <asp:Label ID="lbltype" runat="server" Text='<%#Eval("Document_Type") %>'> </asp:Label>
                                                     </td> 
                                                      
                                                     <td style="width:90px;text-align:center"><%# Eval("Scheduled") %></td>   
                                                     <td style="width:90px;text-align:center"><%# Eval("Uploaded") %></td>
                                                     <td style="width:90px;text-align:center">
                                                     <asp:Label ID="lblper" runat="server" Text='<%#Eval("percentage") %>'> </asp:Label>
                                                     </td>                                              
                                                </tr>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                 <tr class="arow">
                                                   
                                                    <td style="width:197px;text-align:left;border-right: 1px solid #76a5af;padding-left:4px">                                                     
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Package")%>'></asp:Label>

                                                    </td>

                                                     <td style="width:90px;text-align:center;"><%# Eval("Manual") %>
                                                           
                                       </td>   
                                                      <td style="width:100px;text-align:center"><%# Eval("uploaded_date") %></td>
                                                  
                                                     <td style="width:80px;text-align:center"><%# Eval("Status") %></td>   
                                                    
                                                     <td style="width:150px;text-align:left">
                                                          <asp:Label ID="lbltype" runat="server" Text='<%#Eval("Document_Type") %>'> </asp:Label>
                                                     </td> 
                                                      
                                                     <td style="width:90px;text-align:center"><%# Eval("Scheduled") %></td>   
                                                     <td style="width:90px;text-align:center"><%# Eval("Uploaded") %> </td>
                                                     <td style="width:90px;text-align:center">
                                                     <asp:Label ID="lblper" runat="server" Text='<%#Eval("percentage")%>'> </asp:Label>

                                                     </td>                                              
                                                </tr>
                                            </AlternatingItemTemplate>
                                            <FooterTemplate>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                               </div>
                       </div>
             &nbsp;</div>
             
    <div class="clear"></div>
            <div class="footer"></div>
  
        </div>

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
                //prev: '#prev',
                //next: '#next',
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
        <script type="text/javascript">
            function _autoAdjust() {
                //alert(msieversion());
                var div = $("#main-content").height();
                var win = $(window).height();
                if (div < win) {
                    $("#main-content").addClass("botzero");
                }
                else {
                    $("#main-content").addClass("botauto");
                }
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
            function goprint() {

                    var _auth1 = document.getElementById("lbluserhidden");
                    var _auth2 = document.getElementById("lblprjid");
                    var url = "DocumentUploadSummaryRpt?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent;
                    window.open(url, '', '', true);
                }
    </script>
     &nbsp;</form>
</body>
</html>
