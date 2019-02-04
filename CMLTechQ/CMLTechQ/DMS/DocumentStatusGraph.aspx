<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentStatusGraph.aspx.cs" Inherits="CMLTechQ.DMS.DocumentStatusGraph" %>
<!DOCTYPE html>

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
        .hideAnchor {
            color:#cccccc!important;
            cursor:none;
        }
        .hideAnchor:hover {
         color:#cccccc!important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600"></ajaxToolkit:ToolkitScriptManager>
        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
        <input type="hidden" id="hfolderid" value="0" runat="server" />
        <div id="docview_area">
            <div class="pulldownbar">
                <div class="togglemenu">
                    <%--<a href="#" title="Toggle Sidebar" data-prl-offcanvas="{target:'#offcanvas-search'}"><i class="fa fa-navicon"></i></a>--%>
                </div>
            </div>

            <div class="container">
                <div class="control-panel" style="right: 215px">
                    <div class="halfwidth-left" style="right: 0px; padding-right: 0px">
                        <div class="menubar" style="text-align: left">
                            <ul class="left" style="display:flex;justify-content:space-around;align-items:center;width:100%;padding-left:0;">
                                <li><a href="#" onclick="goProgressReport(this);" id="pts" runat="server">Progress Tracking Sheet</a></li>
                                <li><a href="#" class="active">Document Status Graph</a></li>
                                <li ><a href="#" onclick="gouploadsummary();">Summary of Uploads</a></li>
                            </ul>
                        </div>
                    </div>

                </div>

                <div class="back-block" style="right: 110px">
                    <a href="#" onclick="GoPrint();"><i class="fa fa-print"></i>&nbsp;&nbsp;PRINT</a>
                </div>

                <div class="back-block">
                    <a href="#" onclick="goBack();"><i class="fa fa-angle-double-left"></i>&nbsp;&nbsp;BACK</a>
                </div>


            </div>
           <div id="menu-bar" style="top:65px;position:absolute;">
            <div class="menu" style="position:fixed;right:5px;">
                <div class="recentwork_carousel1 style2">
                     <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    <div class="controls">
                        <a class="prev" href="#" ><i class="icon-caret-left icon"></i></a>
                        <a class="next" href="#" ><i class="icon-caret-right icon"></i></a>
                    </div>
                </div>
            </div>
        </div>


           
            <div id="dvgraph-container">
               <div class="dvgraph" >
              
               <iframe runat="server" id="fragraph"  allowtransparency="true"  ></iframe> 
          
            </div>
                </div>


        </div>
    </form>
    <%: Scripts.Render("~/bundles/scripts") %>
    <script async lang="javascript">
        function GetMenu(id) {
            document.getElementById("hfolderid").value = id;
            var _auth1 = document.getElementById("lblprj");

            document.getElementById('fragraph').src = "DocumentStatusGraphDisplay?Auth1=" + _auth1.innerHTML + "&Auth2=" + id;


            _changeActive();
        }
        //function _changeActive() {
        //    $(function () {
        //        $('.nav > li').click(function () {
        //            $('.nav > li').removeClass('current');
        //            $(this).addClass('current');
        //        });
        //    });
        //}
        function _changeActive() {
            $(function () {
                $('.recent_works1 > li').click(function () {
                    $('.recent_works1 > li').removeClass('current');
                    $(this).addClass('current');
                });
            });
        }
        function GoPrint() {
            var _auth1 = document.getElementById("hfolderid").value
            var _auth2 = document.getElementById("lblprjid");
            var _auth1 = document.getElementById("hfolderid").value
            var url = "DocumentStatusRpt?Auth1=" + _auth1 + "&Auth2=" + _auth2.innerHTML;
            window.open(url, '', '', true);
        }
        function goBack() {
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");

            if (_auth2.textContent == 33 || _auth2.textContent == 57) {
                    location.replace("Project2?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent);
                }
                else
                    location.replace("Project?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent);

            }

        function gouploadsummary() {

            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");

            var url = "UploadSummary?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
            parent.location.replace(url);
        }
        function goProgressReport() {

            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");


            if (_auth2.textContent == "50") {
                var url = "pts_oph?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
            }
            else if (_auth2.textContent != "25") {

                var url = "pts?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=0";
               
            }
            parent.location.replace(url);
        }
    </script>
<%--    		 <script src="../Assets/js/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>--%>
    <script async type="text/javascript">
        jQuery(window).load(function () {
            jQuery('.recent_works1').carouFredSel({
                responsive: true,
                width: '100%',
                scroll: 1,
                auto: false,
                circular: false,
                //infinite: false,
                items: {
                    width: 200,
                    visible: {
                        min: 5,
                        max: 10
                    }
                },
                //prev: '#prev',
                //next: '#next',
                prev: {
                    button: function () { return jQuery(this).closest('.recentwork_carousel1').find('.prev'); },
                    key: "left"
                },
                next: {
                    button: function () { return jQuery(this).closest('.recentwork_carousel1').find('.next'); },
                    key: "right"
                }
            });
        });
    </script>
</body>
</html>
