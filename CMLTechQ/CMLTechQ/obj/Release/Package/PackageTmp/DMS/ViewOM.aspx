<%@ Page Title="" Language="C#" MasterPageFile="~/DMS/Frame1.Master" AutoEventWireup="true" CodeBehind="ViewOM.aspx.cs" Inherits="CMLTechQ.DMS.ViewOM" ValidateRequest="false" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        /*.bgViewer {
            height: 100%;
            width: 100%;
            position: fixed;
            border: none;
            z-index: 99;
            background-color: #000;
            display: none;
            filter: alpha(opacity=40);
            opacity: 0.7;
        }

        .fstatus {
            width: 533px;
            height: 65px;
            z-index: 100;
            top: 50%;
            position: fixed;
            left: 30%;
            display: none;
            border: none;
        }*/
        /*.Silk.RadEditor {
            border-radius:4px;
            border:1px solid #dddddd!important;
            width:200px;
            height:200px;
           background-color:#dddddd!important;
           color:#353535!important;
        }
        .Silk.reWrapper {
            border:1px solid #dddddd;
            
        }
        .Silk.RadEditor .reContentCell {
            background-color:#dddddd;
            color:#000000!important;
        }*/
        /*.reDialog .reTool {
            background-color:#808080!important;
            background-image:none!important;
        }
        .reToolbar li {
            background-image:none;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input id="hidden_content" type="hidden" runat="server" />
    <input id="hidden_page" type="hidden" runat="server" />
    <input id="hidden_sec" type="hidden" runat="server" />
    <input id="hidden_id" type="hidden" runat="server" />
    <input id="hfile" type="hidden" runat="server" />
    <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
    <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
    <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
    <asp:Label ID="lbldocid" runat="server" Text="" Style="display: none"></asp:Label>
    <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
    <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
    <asp:Label ID="lblprojectname" runat="server" Text="" Style="display: none" />
    
        <div>
            <telerik:RadEditor ID="RadEditor1" runat="server" Skin="Silk" EditModes="Design" AutoResizeHeight="false" Width="200px" style="color:#353535!important;" >
                        <Tools>
                            <telerik:EditorToolGroup >
                                <telerik:EditorTool Name="Bold" />
                                <telerik:EditorTool Name="Italic" />
                                <telerik:EditorTool Name="Underline" />
                                <telerik:EditorTool Name="Undo" />
                                <telerik:EditorTool Name="Redo" />
                                <telerik:EditorTool Name="InsertOrderedList" />
                                <telerik:EditorTool Name="InsertUnorderedList" />
                            </telerik:EditorToolGroup>
                            
                        </Tools>
                        <Modules>
                            <telerik:EditorModule />
                        </Modules>
                        
                    </telerik:RadEditor>
    </div>
   
</asp:Content>
