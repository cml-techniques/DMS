<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageView.aspx.cs" Inherits="CMLTechQ.DMS.ImageView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
          <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
          <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="Comm_id" runat="server" Text="" style="display:none"></asp:Label>
    <div id="doc-container" >
          
            <div id="docview-area" style="right:5px">               
                     <iframe runat="server" id="fileviewer" class="viewer" ></iframe>    
            </div>
                    </div>
        
          
    </form>
</body>
</html>
