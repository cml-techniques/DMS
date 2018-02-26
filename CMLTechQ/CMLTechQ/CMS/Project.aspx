<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="CMLTechQ.CMS.Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CML Techniques - CMS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <script type="text/javascript">
        function toggle() {
            //document.getElementById("nav").style.width = "0px";
            //document.getElementById("content").style.width = "100%";<a href="Project.aspx">Project.aspx</a>
            var myFrameset = document.getElementById("container");
            var value = myFrameset.getAttribute("cols");
            if (value == "5px,100%") {
                document.getElementById("container").cols = "280px,100%";
            }
            else {
                document.getElementById("container").cols = "5px,100%";
            }
        }
    </script>
</head>
<FRAMESET rows="50px,100%" border="0" frameSpacing="0" frameBorder="0">
    <frame id="head" name="head" src="" runat="server" scrolling="no" ></frame>
    <FRAMESET rows="40px,100%" border="0" frameSpacing="0" frameBorder="0" id="main" name="main" >
        <frame id="menubar" name="menubar" src="" runat="server" scrolling="no" ></frame>
        <FRAMESET cols="280px,100%" border="0" frameSpacing="0" frameBorder="0" id="container" name="container" >
            <frame id="navbar" name="navbar" src="" runat="server" ></frame>
            <FRAMESET rows="30px,100%" border="0" frameSpacing="0" frameBorder="0"  id="FRAMESET1" name="container" >
                <frame id="innernav" name="innernav" src="" runat="server" scrolling="no" ></frame>
                <frame id="content" name="content" src="" runat="server" ></frame>
            </FRAMESET>
        </FRAMESET>
    </FRAMESET>
</FRAMESET>
</html>
