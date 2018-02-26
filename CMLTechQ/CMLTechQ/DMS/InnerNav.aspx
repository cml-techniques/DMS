<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InnerNav.aspx.cs" Inherits="CMLTechQ.DMS.InnerNav" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: Web Based Document Management</title>
    <meta name="author" content="CML Techniques" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%: Styles.Render("~/Content/css") %>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbldocFolder" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
         <asp:Label ID="lblfid" runat="server" Text="" style="display:none"/>
        <asp:Label ID="lbltype" runat="server" Text="0" style="display:none"/>
         <div id="container-menu-bar">
               
                <%--<div id="container-toggle" >
                    <a href="#" onclick="parent.toggle();"><img src="../Assets/img/expand-16.ico" alt="" /> </a>
                </div>--%>
                <div id="container-menu">
                    <div class="toggle"><a href="#" onclick="refresh();"><img src="../Assets/img/expand-16.ico" alt="" /> </a></div>
                    <div style="display:flex; justify-content:space-around;align-items:center;">
                    
                    
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                        </div>
                </div>
             <div class="report" id="dvreport" runat="server">
               <%--  <a  href="#" onclick="goquick();">Manual Quick View</a>--%>
                <a  href="#" onclick="goProgress();" class="push_button"><i class="icon-bar-chart"></i> Reports</a>
            </div>
                
            </div>
    </form>
    <%: Scripts.Render("~/bundles/scripts") %>
    <script async type="text/javascript">
        function PageNavaigation_Doc(id, type) {

            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");

            document.getElementById("lblfid").textContent = id;
            document.getElementById("lbltype").textContent = type;

            if (type == 1) {
                parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id;
            }
            else if (type == 2) {
                parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type;
            }
            else if (type == 3) {
                parent.document.getElementById("content").src = "DocumentList2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type;
            }
            else if (type == 4) {
                parent.document.getElementById("content").src = "DocumentList3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type;
            }
            else {
                parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + id + "&Auth4=" + type;
            }
            _changeActive();
        }
        function PageNavaigation_Rep(type) {

            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");

         

            if (type == 1) {

                parent.location.replace("pts");
                //parent.document.getElementById("content").src = "ProgressTrackingSheet?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;
                //parent.document.getElementById("navbar").src = "Navbar?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;

            }
            else if (type == 2) {
                parent.document.getElementById("content").src = "DocumentStatusGraph?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;

            }
            else if (type == 4) {
                parent.document.getElementById("content").src = "UploadSummary?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;

            }
            else if (type == 3) {
                parent.document.getElementById("content").src = "WebForm1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;

            }
            //parent.document.getElementById("navbar").src = "";
            _changeActive();
        }
        function _changeActive() {
            $(function () {
                $('.nav > li').click(function () {
                    $('.nav > li').removeClass('current');
                    $(this).addClass('current');
                });
            });
        }
        function goProgress() {
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");

            if (_auth2.textContent == "25") {
                var url = "DocumentStatusGraph?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
            }
            else {
                if (_auth2.textContent == "50")
                    var url = "pts_oph?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
                else
                    var url = "pts?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
            }
            parent.location.replace(url);
            //parent.document.getElementById("content").src = "ProgressTrackingSheet?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;
            parent.document.getElementById("innernav").src = "InnerNav?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + -1;
            parent.toggle();
        }
        //function goquick() {
        //    var _auth1 = document.getElementById("lbluseridhidden");
        //    var _auth2 = document.getElementById("lblprjid");
        //    parent.document.getElementById("content").src = "ManualQuickView?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + 0;
        //}

        function refresh() {
            parent.toggle();
          
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");

            var _auth3 = document.getElementById("lblfid");
            var _auth4 = document.getElementById("lbltype");


            if (_auth4.textContent == "1") {
                parent.document.getElementById("content").src = "DocumentList?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;
            }
            else if (_auth4.textContent == "2") {
                parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + _auth4.textContent;
            }
            else if (_auth4.textContent == "3") {
                parent.document.getElementById("content").src = "DocumentList2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + _auth4.textContent;
            }
            else if (_auth4.textContent == "4") {
                parent.document.getElementById("content").src = "DocumentList3?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + _auth4.textContent;
            }
            else {
                if (_auth3.textContent=="0")return;
                parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent + "&Auth4=" + _auth4.textContent;
            }

        }
    </script>
    
</body>
</html>
