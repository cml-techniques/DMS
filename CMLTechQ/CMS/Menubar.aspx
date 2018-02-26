<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menubar.aspx.cs" Inherits="CMLTechQ.CMS.Menubar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/slider.css" type="text/css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body class="inner">
    <form id="form1" runat="server">
        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluserhidden" runat="server" Text="" style="display:none"></asp:Label>
           <div id="menu-bar">
            <div class="menu">
                <div class="recentwork_carousel style2" >
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    <div class="controls">
                        <a class="prev" href="#" ><i class="icon-caret-left icon"></i></a>
                        <a class="next" href="#" ><i class="icon-caret-right icon"></i></a>
                    </div>
                </div>
            </div>
            <div class="report">
                <img src="../Assets/img/bar-chart-5-24.png" class="pull-left" height="20" width="20" />
                <%--<a  href="#">Reports &amp; Schedules</a>--%>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
    
    <!---->
    
		 <script src="../Assets/js/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(window).load(function () {
            jQuery('.recent_works1').carouFredSel({
                responsive: true,
                width: '100%',
                scroll: 1,
                auto: false,
                circular: false,
                //infinite:false,
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
</body>
</html>
