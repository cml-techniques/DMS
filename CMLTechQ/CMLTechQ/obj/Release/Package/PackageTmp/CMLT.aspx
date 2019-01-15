<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CMLT.aspx.cs" Inherits="CMLTechQ.CMLT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CML Techniques :: Web Based Document Management</title>
    <meta name="author" content="CML Techniques" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <%: Styles.Render("~/Content/css") %>
    <style type="text/css">
        #info-box ul li .imgbox a{
            font-size:50px;
        }
        #info-box h2.med {
            font-size: 16px;
        }
        #info-box p {
            font-size: 11px;
        }
        #container{
            padding-bottom:0px;
        }
        .tabs a {
            height:35px;
            line-height:35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="wrapper row1">

            <div id="header">
                <div id="header-nav">
                    <ul>
                        <li><a href="#">Messages</a></li>
                        <li><a href="#" onclick="CallManagement(2);">Management</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#" onclick="CallLogoff();">Log Off</a></li>
                    </ul>
                </div>
                <asp:Label ID="lbluserhidden" runat="server" Text="" Style="display: none"></asp:Label>
                <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none"></asp:Label>
                <div id="login-info">
                    <p>
                        <asp:Label ID="lbllogin" runat="server" Text="Label"></asp:Label>
                    </p>
                    <%--<span class="time">8:14:56</span>--%>
                    <span class="date"><asp:Label ID="lbltime" runat="server" Text="Label" /></span>
                </div>
                <div class="logo"></div>

            </div>
        </div>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="500" OnTick="TimerTick">
        </asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>--%>


        <div class="wrapper">
            <div id="container" style="padding-top: 30px;">
                <h2>Welcome to CML Techniques</h2>
                <p class="big">The latest development from CML International</p>
                <p style="width: 400px; margin: 0px auto;">Our secure web based document management system, that will contain all your commissioning and handover documentation, all just a few clicks away from wherever you are</p>
                <div class="clear"></div>
                <div id="info-box">
                    <h2 class="big">Before you start...</h2>
                    <ul>
                        <li class="first">
                            <div class="imgbox">
                                <a href="#"><i class="fa fa-file-pdf-o"></i></a>

                            </div>
                            <div class="info">
                                <h2 class="med">Latest Software</h2>
                                <p>You'll need the right software to view the documents</p>
                                <p class="more"><a href="#">Learn More</a></p>
                            </div>
                        </li>
                        <li>
                            <div class="imgbox">
                                <a href="#"><i class="fa fa-download"></i></a>
                            </div>
                            <div class="info">
                                <h2 class="med">The Latest Browser</h2>
                                <p>Have you downloaded the latest version of your browser?</p>
                                <p class="more"><a href="http://browsehappy.com/" target="_blank">Learn More</a></p>
                            </div>
                        </li>
                        <li class="last">
                            <div class="imgbox">
                                <a href="#"><i class="fa fa-graduation-cap"></i></a>
                            </div>
                            <div class="info">
                                <h2 class="med">Read The Guide</h2>
                                <p>Get the best from Techniques, by reading the latest guide</p>
                                <p class="more"><a href="#">Learn More</a></p>
                            </div>
                        </li>
                    </ul>
                </div>
                <%--<ul class="ch-grid">
                    <li>
						<div class="ch-item ch-img-4">
							<div class="ch-info">
								<h3 class="title">Downloads</h3>
								<p><span> CML Downloads </span><a href="#">Click Here</a></p>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-1">
							<div class="ch-info">
								<h3 class="title">PDF Reader</h3>
								<p><span>Adobe Acrobat Reader</span> <a href="#">Click Here</a></p>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-2">
							<div class="ch-info">
								<h3 class="title">Comments</h3>
								<p><span>Post your Comments </span><a href="#">Click Here</a></p>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-3">
							<div class="ch-info">
								<h3 class="title">Graphs</h3>
								<p><span>Project Progress </span><a href="#">Click Here</a></p>
							</div>
						</div>
					</li>
				</ul>--%>
            </div>
        </div>
        <div class="wrapper">
            <div id="content">
                <div class="floatingBox">
                    <div class="container-fluid">
                        <ul class="tabs">
                            <li class="bottom"><a href="#">CMS</a></li>
                            <li class="bottom"><a href="#">DMS</a></li>
                            <li class="bottom"><a href="#">SNS</a></li>
                            <li class="bottom"><a class="last" href="#">AMS</a></li>
                        </ul>
                        <div class="clear"></div>
                        <div class="panes_">
                            <div class="pane" style="display: none;">
                                <div class="container-fluid">
                                    <asp:PlaceHolder ID="ph_cms" runat="server"></asp:PlaceHolder>
                                </div>
                            </div>
                            <div class="pane" style="display: none;" onclick="resize();">
                                <asp:PlaceHolder ID="ph_dms" runat="server"></asp:PlaceHolder>
                                <div class="clear"></div>
                            </div>
                            <div class="pane" style="display: none;">
                                <p>This is SNS</p>
                                <%--<div class="accordion" rel="1">
                                        <asp:PlaceHolder ID="ph_sns" runat="server"></asp:PlaceHolder>
                                    </div>--%>
                            </div>
                            <div class="pane" style="display: none;">
                                <asp:PlaceHolder ID="ph_ams" runat="server"></asp:PlaceHolder>
                                <div class="clear"></div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <asp:UpdateProgress ID="UpdateProgress2" runat="server">
            <ProgressTemplate>
                <asp:Image ID="imgload" runat="server" ImageUrl="Assets/img/ajax-loader.gif" Style="top: 30%; left: 48%; position: fixed" />
            </ProgressTemplate>
        </asp:UpdateProgress>
       
    </form>
     <%: Scripts.Render("~/bundles/scripts") %>
        <script async type="text/javascript">
            $(document).ready(
                function () {
                    $("html").niceScroll({ styler: "fb", cursorcolor: "#063940", cursorwidth: '10', cursorborderradius: '0px', background: '#45818e', cursorborder: '' });
                });
        </script>
        <script async type="text/javascript">
            function CallModules(id, prm) {
                var _auth = document.getElementById("lbluserhidden");
                if (id == 1) {
                    location.replace('CMS/Project?Auth1=' + _auth.textContent + '&Auth2=' + prm);
                }
                else if (id == 2) {
                    if (prm == 33 || prm == 51 || prm == 57 || prm == 76 || prm == 82) {
                        location.replace('DMS/Project2?Auth1=' + _auth.textContent + '&Auth2=' + prm);
                    }
                    else
                        location.replace('DMS/Project?Auth1=' + _auth.textContent + '&Auth2=' + prm);
                        //location.replace('DMS/Project1?Auth1=' + _auth.textContent + '&Auth2=' + prm);
                   
                }
                else if (id == 3) {
                    location.replace('AMS/Project?Auth1=' + _auth.textContent + '&Auth2=' + prm);
                }
            }
            function CallManagement(id) {
                var _auth = document.getElementById("lbluserhidden");
                if (id == 2) {
                    location.replace('ADM/User?Auth1=' + _auth.textContent);
                }
            }
            function CallLogoff() {
                location.replace('AuthLogin');

            }
            function resize() {
                $("html").getNiceScroll().resize();
            }
        </script>
</body>
</html>
