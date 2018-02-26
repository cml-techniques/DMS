<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentStatusGraphDisplay.aspx.cs" Inherits="CMLTechQ.DMS.DocumentStatusGraphDisplay" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%--<webopt:BundleReference ID="BundleReference1" runat="server" Path="~/Content/css" />--%>
        <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../AMS/css/font-awesome.min.css" rel="stylesheet" />
        <script src="../Assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="../Assets/js/jquery.livegraph.js"></script>
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
        </style>
       
</head>
<body style="background-color:#F9FAFA">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
             <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
             <asp:Label ID="lbldocFolder" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
         <asp:Label ID="lbltest" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
       <input type="hidden" id="hfolderid" value="0" runat="server" />
         <input type="hidden" id="hgap" value="0" runat="server" />
         <input type="hidden" id="htype" value="1" runat="server" />
        <div id="doc-container" style="position:absolute;top:0px;">
              <div id="dvdocmenu" >
             <div class="dvtitle"> 
                 <asp:Label Text="Document Uploaded" ID="lbl" runat="server" ForeColor="#494949" Font-Size="16px"></asp:Label>
             </div>
            <div class="dvline" ></div>
            
              <div class="actionbox pull-right">
                                          <telerik:RadDropDownList ID="rdaction"  DefaultMessage="Select action" runat="server" OnSelectedIndexChanged="rdaction_SelectedIndexChanged" AutoPostBack="true">
                              <Items>
                              <telerik:DropDownListItem Value="1" Text="O&M"  />
                                 
                                <telerik:DropDownListItem Value="2" Text="MI/RD/TD"  />
                               </Items>
                            </telerik:RadDropDownList>
                        </div>
                
               </div>

            <div id="graph-area">

                 <div id="axis-area">
                     <ul class="yaxis">
                         <li>100</li>
                         <li>90</li>
                         <li>80</li>
                         <li>70</li>
                         <li>60</li>
                         <li>50</li>
                         <li>40</li>
                         <li>30</li>
                         <li>20</li>
                         <li>10</li>
                         <li>0</li>
                     </ul>
                 </div>

                             <div id="chart-area">
                      <ul class="xaxis">
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         <li ></li>
                         </ul>

                         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                         <ContentTemplate>
                            <div id="page" style="bottom:-25px;position:absolute;text-align:center;margin:0 10px;width:100%"  >
                  
                          <asp:PlaceHolder ID="PlaceHolder1" runat="server">

                          </asp:PlaceHolder>

                           
                                 <div  id="dvstatushead" runat="server" visible="false" >
                                     <div class="dvmi">
                                         <p> Manufacture Information</p>

                                     </div>
                                         <div class="dvrd">
                                         <p> Record Drawings</p>

                                     </div>
                                           <div class="dvtd">
                                         <p> Test Documentation</p>

                                     </div>
                                        <div class="dvol">
                                         <p> Overall</p>

                                     </div>
                                     </div>
               </div>
                              
                         </ContentTemplate>
                     </asp:UpdatePanel>



              </div>
                                                
              
             </div>
            </div>
    <div class="clear"></div> 
            <div class="footer"></div>                
            <script type="text/javascript">
		<!--
    $(document).ready(function () {
        window.onload = (function () {
            $('#page').liveGraph({
                height: 420,
                barWidth:100,
                barGapSize: document.getElementById("hgap").value,
                data: 'table.dataforgraph',
                hideData: true
            });
            $('div#update').show();
            $('#page').data('liveGraph').settings.hideData = false;
            $('#page h2').html("Graph");
            $('#page div.controls').show();
            $('.animation').change(function () {
                if ($(this).val() == "true") {
                    $('#page').data('liveGraph').settings.animate = true;
                } else {
                    $('#page').data('liveGraph').settings.animate = false;
                }
            });
            $('.animTime').change(function () {
                $('#page').data('liveGraph').settings.animTime = parseInt($(this).val());
            });
        });

    });
	</script>
        
  
    </form>
</body>
</html>