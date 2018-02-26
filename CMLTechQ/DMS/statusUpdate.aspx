<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="statusUpdate.aspx.cs" Inherits="CMLTechQ.DMS.statusUpdate" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
        <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
  <style type="text/css">
        .RadDropDownList_Default .rddlInner {
            /*border-color: #D4D4D4 !important;*/
            background-color: #E8EEEF!important;
            border-radius: 4px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 5px!important;
            font-size: 14px;
            font-weight: bold;

        }

        .rddlPopup_Default .rddlItemSelected {
            background: none repeat scroll 0 0 #3399FF !important;
        }

        .rddlPopup_Default .rddlItemHovered {
            background: none repeat scroll 0 0 #3399FF !important;
        }

        .RadDropDownList_Default .rddlInner {
            font-weight: 600 !important;
            color: black !important;
        }

        .RadDropDownList_Default .rddlIcon {
            margin-top: 3px!important;
            height: 20px!important;
            width: 20px!important;
        }

        .RadPicker_Default input {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
            font-size: 14px;
            font-weight: bold;
        }

        .RadPicker_Default span {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 4px!important;
            font-size: 14px;
            font-weight: bold;
        }
        /*.RadInput_Default span {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            padding: 5px!important;
            font-size: 14px;
            font-weight:bold;
        }*/
        .datepicker-style {
            background-color: #E8EEEF!important;
            border-radius: 0px !important;
            background-image: none !important;
            border: none!important;
            box-shadow: inset 1px 1px 0px rgba(255,255,153,0.3)!important;
            /*padding: 5px!important;*/
            font-size: 14px;
            font-weight: bold;
        }

        div.RadUpload .inputs {
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
                body {
    color: #F8F8F2;
    background-color: #FFFAF0;
}
      .dvhead {
          position:absolute;
          top:0px;left:0px;
          width:100%;
          background-color:#00BFFF;
          color:#FFFAF0;
      }
      .dvstatus {
          position:absolute;
          top:30px;left:0px;
          width:100%;
      }
    </style>
</head>
    
<body>
    <form id="form1" runat="server">

        <asp:Label ID="lblprj" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" style="display:none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" style="display:none" ></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" style="display:none"/>
        <asp:Label ID="lbldocid" runat="server" Text="" style="display:none"></asp:Label>
 

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
               <div class="dvhead">
                    <p style="margin-left:10px;">STATUS UPDATE</p>
                </div>
               <div class="dvstatus">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>  
             <table style="color:#353535;padding:10px">
                <tr style="height:30px;">
                    <td></td>
                </tr>
                            <tr>
                                <td style="width:120px;">
                                    <p class="Popsubtitle">SELECT STATUS</p>
                                </td>
                                <td>
                                    

                                    <telerik:RadDropDownList ID="rdstatus" runat="server" Skin="Default" RenderMode="Lightweight" DefaultMessage="Select Status" Width="180px">
                                     <Items>
                                                                <telerik:DropDownListItem Text="Accepted" Value="1" />
                                                                <telerik:DropDownListItem Text="Accepted With Comments" Value="2" />
                                                                <telerik:DropDownListItem Text="Rejected" Value="3" />
                                                                <telerik:DropDownListItem Text="For Review" Value="4" />
                                                                <telerik:DropDownListItem Text="Revised" Value="5" />
                                                            </Items>                   
                                                        </telerik:RadDropDownList>

                                </td>
                                <td>
                                    <asp:Button ID="btnsubmit" runat="server" Text="Update" OnClick="btnsubmit_Click" CssClass="control-general control-button-greenlight push_button" Width="100px" />
                                </td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnscancel" runat="server" Text="Cancel"  OnClientClick="CloseStatus();" CssClass="control-general control-button-yellow1 push_button" Width="100px" />
                                </td>
                            </tr>
                        </table>  
                      </ContentTemplate>
                      </asp:UpdatePanel>
                   </div>
                 

 </div>

    </form>
    <script lang="javascript">
        function CloseStatus() {
            window.parent.CloseStatus();
        }
        function UpdateStatus() {
            window.parent.UpdateStatus();
        }
        function SetstatusText() 
        {
            window.parent.SetstatusText();

        }
        function RemoveStatusText(type) {     
            window.parent.RemoveStatusText();
        }
        function CallBack() {
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");

            parent.location.replace("Project?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent);
        }
    </script>
</body>
</html>
