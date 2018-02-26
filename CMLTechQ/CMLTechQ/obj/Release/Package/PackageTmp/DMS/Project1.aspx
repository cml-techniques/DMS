<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project1.aspx.cs" Inherits="CMLTechQ.DMS.Project1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DMS :: CML Techniques</title>
    <script type="text/javascript">
        function toggle() {
            //document.getElementById("nav").style.width = "0px";
            //document.getElementById("content").style.width = "100%";
            var myFrameset = document.getElementById("container");
            var value = myFrameset.getAttribute("cols");
            if (value == "5px,100%") {
                document.getElementById("container").cols = "280px,100%";
            }
            else {
                document.getElementById("container").cols = "5px,100%";
            }
        }
        function expand() {
            var myFrameset = document.getElementById("container");
            var value = myFrameset.getAttribute("cols");
            document.getElementById("container").cols = "5px,100%";
        }
        function collapse() {
            var myFrameset = document.getElementById("container");
            var value = myFrameset.getAttribute("cols");
            document.getElementById("container").cols = "280px,100%";
        }
        function callhome() {

        }
    </script>
</head>
<frameset rows="57px,100%" border="0" framespacing="0" frameborder="0">
     <frame id="head" name="head" src="" runat="server" scrolling="no" ></frame>
     <%--<FRAMESET cols="280px,100%" border="0" frameSpacing="0" frameBorder="0"  id="container" name="container" >
   --%>
         <%-- <frame id="navbar" name="navbar" src="" runat="server" ></frame>--%>
    <%--<FRAMESET rows="40px,100%" border="0" frameSpacing="0" frameBorder="0" id="main" name="main" >--%>
      <%--  <frame id="menubar" name="menubar" src="" runat="server" scrolling="no" ></frame>--%>
        <%--<FRAMESET cols="280px,100%" border="0" frameSpacing="0" frameBorder="0"  id="container" name="container" >
           
            <FRAMESET rows="40px,100%" border="0" frameSpacing="0" frameBorder="0"  id="FRAMESET1" name="container" >--%>
               <%-- <frame id="innernav" name="innernav" src="" runat="server" scrolling="no" ></frame>--%>
                <frame id="content" name="content" src="" runat="server" ></frame>
            <%--</FRAMESET>--%>
            
       <%-- </FRAMESET>--%>
    <%--</FRAMESET>--%>
        <%-- </FRAMESET>--%>
</frameset>
</html>
