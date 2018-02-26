<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Manual1.aspx.cs" Inherits="CMLTechQ.DMS.View_Manual1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>View Documents</title>
    <meta charset="utf-8"/>

	<link rel="stylesheet" href="../Assets/css/StyleView.css" type="text/css" />
	<script src="../Assets/js/jquery.min.js"></script>
    <script src="../Assets/js/ckeditor.js"></script>

	<script lang="javascript">
	    function ResizeWidth() {
	        var height = $(window).height() - 40;
	        //var width = $(window).width() - 410;
	        //$("#dvViewManual").width(width);
	        $("#dvViewManual1").height(height);
	    }
	</script>
       
	<style type="text/css">
	</style>
	<script type="text/javascript">
	    window.onload = function () {
	        ResizeWidth();
	    }
	    window.onresize = function () {
	        ResizeWidth();
	    }
	</script>

</head>
<body >
	<form id="form1" runat="server">
<div id="dvRightHead">
                &nbsp;<input type="button" value="Back"  id="btnback" onclick="javascript: history.back(-1);" />
		</div>
		<div id="dvViewManual1">
				<iframe id="myframe" runat="server" ></iframe>
		</div>
	</form> 
</body>
</html>
