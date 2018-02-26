<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManualQuickView.aspx.cs" Inherits="CMLTechQ.DMS.ManualQuickView" %>


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

    </head>
<body style="border-right:solid 5px #45818e;" class="inner" onload="scrollheight();">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600" ></ajaxToolkit:ToolkitScriptManager>

        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>

         <input type = "hidden" id = "hfolder" name  = "hfolder" runat="server" />
         <input type = "hidden" id = "hid" name = "hid" runat="server" />
        <input type = "hidden" id = "hprogressid" name = "hprogressid" runat="server" />


        <div id="doc-container">
            <div id="info-bar">
                <div class="head">
                    <div class="headtitle">
                        <h2 class="title">Manual Quick View</h2>
                    </div>
                    <div class="back pull-right">
                        <%-- <a class="back" href="#" onclick="goprint();"><i  class="icon-print"></i></a>--%>
                         <a style="color: #76a5af; font-weight: 700; font-size: 16px;margin-right:15px;" href="#" onclick="goprint();"><i class="icon-print"></i></a>
                    </div>
                </div>
            </div>
             <div id="main-content" style="bottom:0px;">
                 <div id="HeaderDiv">
                                 <table id="repeaterHead" style="width:100%;height:60px">
                                    <tr>
                                        <td style="text-align:center;width:280px" rowspan="2">Package</td>
                                        <td style="text-align:center;width:300px" rowspan="2">Document Name </td>
                                        <td style="text-align:center;width:100px" rowspan="2">Uploaded Date </td>
                                        <td style="text-align:center;width:100px" rowspan="2">Version</td>
                                         <td style="text-align:center;width:100px" rowspan="2">Comments</td>
                                        <td style="text-align:center;width:200px" rowspan="2">Status</td>
                                        </tr>
                                     <tr></tr>
                                </table>
                            </div>
</div>
             
             <div id="Data" style="top:65px;" onscroll="Onscrollfnction();">
                 <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                     <ContentTemplate>
                          <asp:Repeater ID="rptmmain" runat="server" OnItemDataBound="rptmmain_ItemDataBound" OnItemCommand="rptmmain_ItemCommand">
                        <HeaderTemplate>
                           
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div id="DataDiv">
                            <div id='h<%#Container.ItemIndex %>' class="rptheader" style="width:100%;height:20px;padding:5px 0px" onclick="getdata(<%#Container.ItemIndex %>);"  >
                                        <p style="margin:0;padding:0px;"><a class="pull-left" style="margin-right:10px;padding-left:4px" href="#" ><i class="icon-plus"></i></a><%# Eval("Folder_description") %> </p>
                                <asp:Label ID="lblsys" runat="server" Text='<%# Eval("Folder_Id") %>' style="display:none"></asp:Label>
                                    </div>
                            <div id='d<%#Container.ItemIndex %>' style="display:none" class="sub">
                                        <asp:Repeater ID="rptdetails" runat="server" OnItemDataBound="rptdetails_ItemDataBound">
                                            <HeaderTemplate> 
                                                <table id="repeaterTable" style="width:100%;">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="rrow">
                                                   
                                                    <td style="width:280px;text-align:left;border-right: 1px solid #76a5af;padding-left:4px";>                                                      <a href="#" onclick="goDocumentlist(<%# DataBinder.Eval(Container.DataItem, "folder_id") %>,<%# DataBinder.Eval(Container.DataItem, "Parent_Folder") %>);"><asp:Label ID="Label1" runat="server" Text='<%#Eval("Package") %>'></asp:Label></a>
                                                    </td>
                                                     <td style="width:300px;text-align:left;padding-left:4px"">
                                                              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("Docview.aspx?ID={0}&FILE={1}", Eval("doc_id"),Eval("doc_name")) %>'><%# DataBinder.Eval(Container.DataItem, "title") %> </asp:HyperLink>
                                       </td>   
                                                      <td style="width:100px;text-align:center"><%# Eval("uploaded_date") %></td>
                                                  
                                                     <td style="width:100px;text-align:center"><%# Eval("DisplayVersion") %></td>                                                 
                                                        <td style="width:100px;text-align:center">
                                                     <a href="#" onclick="GoComments('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>','<%# DataBinder.Eval(Container.DataItem, "Comment") %>');"><asp:Label ID="Label7" runat="server" Text='<%#Eval("Comment") %>'></asp:Label></a>

                                                    </td>
                                                    <td style="width:200px;text-align:center"><%# Eval("status") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                 <tr class="arow">
                                                   
                                                     <td style="width:280px;text-align:left;border-right: 1px solid #76a5af;padding-left:4px">                                                      <a href="#" onclick="goDocumentlist(<%# DataBinder.Eval(Container.DataItem, "folder_id") %>,<%# DataBinder.Eval(Container.DataItem, "Parent_Folder") %>);"><asp:Label ID="Label1" runat="server" Text='<%#Eval("Package") %>'></asp:Label></a>
                                                    </td>

                                                       <td style="width:300px;text-align:left;padding-left:4px">
                                                              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("Docview.aspx?ID={0}&FILE={1}", Eval("doc_id"),Eval("doc_name")) %>'><%# DataBinder.Eval(Container.DataItem, "title") %> </asp:HyperLink>
                                       </td>   
                                                      <td style="width:100px;text-align:center"><%# Eval("uploaded_date") %></td>
                                                  
                                                     <td style="width:100px;text-align:center"><%# Eval("DisplayVersion") %></td>
                                                     
                                                      <td style="width:100px;text-align:center">
<a href="#" onclick="GoComments('<%# DataBinder.Eval(Container.DataItem, "doc_id") %>','<%# DataBinder.Eval(Container.DataItem, "Comment") %>');"><asp:Label ID="Label7" runat="server" Text='<%#Eval("Comment") %>'></asp:Label></a>

                                                    </td>
                                                    <td style="width:200px;text-align:center"><%# Eval("status") %></td>
                                                </tr>
                                            </AlternatingItemTemplate>
                                            <FooterTemplate>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
</div>
                        </ItemTemplate>
 </asp:Repeater>
                       <%--   asp:Button ID="btndummy" runat="server" Text="btndummy" OnClick="btndummy_Click" Style="display:none" />--%>
                       <br />
                     </ContentTemplate>
                 </asp:UpdatePanel>
                   
                </div>
             
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
        <script src="../Assets/js/jquery.nicescroll.js"></script>
        <script type="text/javascript">
            $(document).ready(
                function () {
                    $("html").niceScroll({ styler: "fb", cursorcolor: "#063940", cursorwidth: '10', cursorborderradius: '0px', background: '#45818e', cursorborder: '' });
                });
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
                function goDocumentlist(id, Parent) {
                    var _auth1 = document.getElementById("lbluserhidden");
                    var _auth2 = document.getElementById("lblprjid");

                    parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + Parent + "&Auth4=" + id;
                    parent.document.getElementById("menubar").src = "Menubar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + Parent;

                    parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id;
                    parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0" + "&Auth4=" + id;




                }
    </script>
     <script type="text/javascript">
         function goprint() {

             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");
             var url = "ManualQuickViewReportPage?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
             window.open(url, '', '', true);
         }

         function getdata(id) {
             var e = document.getElementById('d' + id);
             if (e) {
                 if (e.style.display == 'none') {
                     e.style.display = 'block';
                     e.style.visibility = 'visible';
                     //_changeActive(id);
                     _changeActive();
                 }
                 else {
                     e.style.display = 'none';
                     e.style.visibility = 'hidden';
                     //_changeInActive();
                     _changeInActive(id);
                 }

             }
             scrollheight();

         }
         function setheightdefault() {

             var div1 = document.getElementById('HeaderDiv');
             div1.setAttribute("style", "border-right:none");


         }
         function _changeActive(id) {
             $(function () {
                 $('.rptheader').click(function () {
                     jQuery(this).find('i').removeClass('icon-plus').addClass('icon-minus');
                     //jQuery(this).find('i').addClass('icon-minus');
                     //jQuery(this).find('i').toggleClass('icon-minus icon-plus');
                 });
             });
         }
         function _changeInActive() {
             $(function () {
                 $('.rptheader').click(function () {
                     jQuery(this).find('i').removeClass('icon-minus').addClass('icon-plus');
                 });
             });
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

         function OpenPopup(_id, _folder) {
             document.getElementById("hprogressid").value = _id;
             document.getElementById("hfolder").value = _folder;
             $("#btnpopup").click();
         }
         function GoComments(_id, _comment) {

             var _auth1 = document.getElementById("lbluserhidden");
             var _auth2 = document.getElementById("lblprjid");
             //var _auth3 = document.getElementById("lblfolder");

             if (_id > 0) {
                 parent.document.getElementById("content").src = "Viewcomments?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _id;
             }

         }

    </script>

    
    </form>
</body>
</html>
