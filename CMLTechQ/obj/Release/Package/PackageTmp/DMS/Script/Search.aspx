<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="CMLTechQ.DMS.Script.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
	<script language="JavaScript" type="text/javascript" src="settings.js"></script>
	<script language="JavaScript" type="text/javascript" src="search.js"></script>
	<!-- You can change the fonts, text colors, and styles of your search results with the CSS below -->
    <link rel="stylesheet" href="../../Assets/css/Layout.css" type="text/css" />
    <link href="../../Assets/css/font-awesome.min.css" rel="stylesheet" />	  
	<style type="text/css">
	    body {
            color:#353535!important;
	    }
		.highlight { background: #FFFF40; }
		.searchheading { font-size: 130%; font-weight: bold; }
		.summary { font-size: 80%; font-style: italic; }
		.suggestion { font-size: 100%; }
		.results { font-size: 100%; }
		.category { color: #999999; }
		.sorting { text-align: right; }

		.result_title { font-size: 100%;color:rgb(245, 153, 66)!important; }
        .result_title a {
                color:rgb(245, 153, 66)!important; 
	        }	
	        .result_title a:hover {
                color:#76a5af!important;
	        }	
		.description { font-size: 100%; color: #8EBDB6; }
		.context { font-size: 100%; }
		.infoline { font-size: 80%; font-style: normal; color: #063940;}

		.zoom_searchform { font-size: 100%; }
		.zoom_results_per_page { font-size: 80%; margin-left: 10px; }
		.zoom_match { font-size: 80%; margin-left: 10px;}				
		.zoom_categories { font-size: 80%; }
		.zoom_categories ul { display: inline; margin: 0px; padding: 0px;}
		.zoom_categories li { display: inline; margin-left: 15px; list-style-type: none; }
		
		.cat_summary ul { margin: 0px; padding: 0px; display: inline; }
		.cat_summary li { display: inline; margin-left: 15px; list-style-type: none; }

		input.zoom_button { margin: 0px; border-radius: 3px;color:#063940 !important; vertical-align: middle; display: inline-block; position: relative; cursor: pointer; box-shadow:2px 2px #13494D !important; background-image: none !important; width:100px;border:none;font-family:'Open Sans', sans-serif;height:25px; }
		input.zoom_searchbox { border-radius: 3px; color:#063940; box-shadow: none !important; -webkit-box-shadow: none;width:200px;background-color:#76a5af;border:none;padding:5px 5px 5px 10px;margin-top:4px; }
	        input.zoom_searchbox:focus {
                border-color: rgb(245, 153, 66); outline: 0px; color: rgb(105, 105, 105); background-color:#fff;color:#063940;
	        }
		.result_image { float: left; display: block; }
		.result_image img { margin: 10px; width: 80px; border: 0px; }

		.result_block { margin-top: 15px; margin-bottom: 15px; clear: left; }
		.result_altblock { margin-top: 15px; margin-bottom: 15px; clear: left; }
		
		.result_pages { font-size: 100%; }
		.result_pagescount { font-size: 100%; }
		
		.searchtime { font-size: 80%; }
		
		.recommended 
		{ 
			background: #DFFFBF; 
			border-top: 1px dotted #808080; 
			border-bottom: 1px dotted #808080; 
			margin-top: 15px; 
			margin-bottom: 15px; 
		}
		.recommended_heading { float: right; font-weight: bold; }
		.recommend_block { margin-top: 15px; margin-bottom: 15px; clear: left; }		
		.recommend_title { font-size: 100%; }
		.recommend_description { font-size: 100%; color: #008000; }
		.recommend_infoline { font-size: 80%; font-style: normal; color: #808080;}
		.recommend_image { float: left; display: block; }
		.recommend_image img { margin: 10px; width: 80px; border: 0px; }
	    a {
            
            font-weight:normal;
            font-size:14px;
            text-decoration:none;
	    }
	    #info-bar .back {
            background-color:transparent!important;
	    }
	</style>	
</head>
<body onload="if (document.getElementById('zoom_searchbox')) {document.getElementById('zoom_searchbox').focus();}">
    
    <div id="doc-container" style="top:40px;" >
        
        <div id="main-content"   >
            <div id="info-bar">
                    <div class="head">
                        <div class="headtitle">
                            <h2 class="title">Search</h2>
                        </div>
                        <div class="back pull-right">
                            <a class="back" href="javascript:history.go(-1);"><i  class="icon-backward"></i> Back</a>
                        </div>
                    </div>
            </div>
            <div style="padding:5px;">
                <script language="JavaScript" type="text/javascript">ZoomSearch();</script>
            </div>
        </div>
        <div class="clear"></div>
        <%--    <div class="footer"></div>--%>
    </div>
   <%-- <form id="form1" runat="server">
        <div class="search-box">
        </div>
    </form>--%>
</body>
</html>
