<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CloudUpload.aspx.cs" Inherits="CMLTechQ.CloudUpload" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
         div.RadUpload .ruInputs {
             
        }
        
         div.RadUpload .ruProgress ul li {
             background-color:rgba(0,51,204,1);
         }
         div.RadUpload .ruFileWrap span {
             font-size:14px!important;
             color:#353535;
             width:60%;
         }
         div.RadUpload .ruRemove {
             display:inline-block;
             font-size:14px;
             background-color:#f00;
             padding:0px!important;
             padding-left:5px!important;
             padding-right:5px!important;
             text-decoration:none!important;
             color:#f5f5f5;
         }

        div.RadUpload .ruBrowse {
            background-position: 0 -30px;
            background-color: #0099CC!important;
            box-shadow: 0px 2px 0px rgba(0,51,204,1);
            color: #F9FAFA!important;
            border: 0px;
            font-weight: bold;
            padding: 0!important;
            /*height: 30px!important;*/
            border-radius: 4px;
            display: block;
            width: 100px;
            margin: 0px;
            cursor: pointer;
        }

        div.RadUpload_Default .ruFileWrap .ruButtonHover {
            background-position: 100% -30px !important;
        }


        div.RadUpload .ruFakeInput {
            border: 1px solid red !important;
            width: 20px !important;
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
    <div>
  
        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" InputSize="30" UploadedFilesRendering="BelowFileInput" MultipleFileSelection="Automatic" Skin="Silk" Width="100%" >
           
        </telerik:RadAsyncUpload>
       
    </div>
    </form>
</body>
</html>
