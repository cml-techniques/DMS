<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CASSummary_Graph.aspx.cs" Inherits="CMLTechQ.CMS.P123.CASSummary_Graph" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../../Assets/css/Layout.css" type="text/css" />
    <link href="../../Assets/css/font-awesome.min.css" rel="stylesheet" />
     <%--<script src="../../Assets/js/jquery.min.js"></script>--%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="../../Assets/js/jquery.livegraph.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Assets/css/livegraph.css" />
    <%--<link rel="stylesheet" type="text/css" href="../../Assets/css/button.css" />--%>
</head>
<body style="border-right:solid 5px #45818e" class="inner" >
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
             <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
             <asp:Label ID="lbldocFolder" runat="server" Text="" style="display:none"></asp:Label>
              <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
         <asp:Label ID="lbltest" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
        <div id="doc-container" style="top:0px;" >

             <div id="main-content" class="botzero"   >
                <div class="charthead">
                    <div class="charttitle">
                        <h2 class="title"><asp:Label ID="pageinfo" runat="server" Text=""></asp:Label></h2>
                    </div>
                    <div class="filter">
                        <table style="padding:0px;text-align:center;border:none" class="pull-right">
                            <tr>
                                <td style="padding:0px;width:150px;padding-right:20px">Building/ Zone</td>
                                <td style="padding:0px;width:150px;padding-right:20px">Category</td>
                                <td style="padding:0px;width:150px;padding-right:20px">Floor Level</td>
                                <td>Location</td>
                            </tr>
                            <tr>
                                <td style="padding:0px;width:150px;padding-right:20px" >
                                    <div class="drop-box">
                                        <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="select" >
                                            <asp:ListItem Text="Sample" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                        
                                </td>
                                <td style="padding:0px;width:150px;padding-right:20px" >
                                    <div class="drop-box">
                                        <asp:DropDownList ID="DropDownList4" runat="server"  CssClass="select" >
                                            <asp:ListItem Text="Sample" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                        
                                </td>
                                <td style="padding:0px;width:150px;padding-right:20px" >
                                    <div class="drop-box">
                                        <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="select" >
                                            <asp:ListItem Text="Sample" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </td>
                                <td style="padding:0px;width:150px;" >
                                    <div class="drop-box">
                                        <asp:DropDownList ID="DropDownList3" runat="server"  CssClass="select" >
                                            <asp:ListItem Text="Sample" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Sample" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                 <div class="chartmenu">
                     <a class="reset pull-right" href="#">Reset</a>
                     <%--<button class="reset pull-right">Make Graph</button>--%>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                         <ContentTemplate>
                             <%--<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />--%>
                         </ContentTemplate>
                     </asp:UpdatePanel>
                     
                 </div>
                 <div id="axis-area">
                     <ul class="yaxis">
                         <li>100 -</li>
                         <li>90 -</li>
                         <li>80 -</li>
                         <li>70 -</li>
                         <li>60 -</li>
                         <li>50 -</li>
                         <li>40 -</li>
                         <li>30 -</li>
                         <li>20 -</li>
                         <li>10 -</li>
                         <li>0 -</li>
                     </ul>
                 </div>
                 <div id="chart-area">
                     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                         <ContentTemplate>
                             <div id="page" style="bottom:-25px;position:absolute;text-align:center;margin:0 10px;"  >
                  
                          <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
               </div>
                         </ContentTemplate>
                     </asp:UpdatePanel>
                      
                 </div>
              
             </div>
    <div class="clear"></div>
            <div class="footer"></div>
            </div>
    <script type="text/javascript">
		<!--
        $(document).ready(function () {
            window.onload = (function () {
                $('#page').liveGraph({
                    height: 350,
                    barWidth: 100,
                    barGapSize: 15,
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
