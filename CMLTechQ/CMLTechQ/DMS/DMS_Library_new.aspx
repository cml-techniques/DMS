<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DMS_Library_new.aspx.cs" Inherits="CMLTechQ.DMS.DMS_Library_new" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

            <%--<link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />--%>
   <%-- <link href="../AMS/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/dropdown.css" rel="stylesheet" />--%>

    <link href="../csf/animate.css" rel="stylesheet" />
    <link href="../csf/bootstrap.css" rel="stylesheet" />
    <link href="../csf/style.css" rel="stylesheet" />
    <link href="../csf/sweetalert.css" rel="stylesheet" />

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />

    <script src="../jsf/jquery-2.1.1.js"></script>
    <script src="../jsf/bootstrap.min.js"></script>

    <script src="../jsf/inspinia.js"></script>d
    <script src="../jsf/jquery.metisMenu.js"></script>
    <script src="../jsf/pace.min.js"></script>
    <script src="../jsf/jquery.slimscroll.min.js"></script>
    <script src="../jsf/sweetalert.min.js"></script>

   

    <script src="../jsf/jquery.dataTables.min.js"></script>
    <script src="../jsf/dataTables.bootstrap.min.js"></script>
    <script src="../jsf/Datatable.Responsive.js"></script>
    <script src="../jsf/dataTables.tableTools.min.js"></script>
    <script src="../jsf/jquery.jeditable.js"></script>

    <script src="../jsf/CTplusPagination.js"></script>

     <style type="text/css">
                body {
            font-size:13px!important;
        } 

        #doccontainer {
            position: absolute;
            top: 0px;
            bottom: 0px;
            right: 0px;
            left: 0;
            background-color: #FFFFFF;
            overflow: hidden;
        }

        .input-group-addon:first-child {
            margin-left: -13px;
            padding-right: 20px;
            padding-top: 8px;
        }

        div.dataTables_paginate {
            padding-top: 0px!important;
        }

        tr.filter td {
            padding: 0px !important;
        }

        .MainButton {
            width: 90px !important;
        }

        .tdcomment {
            color: #0000FF;
        }

        .tdDue {
            color: #ff0000;
        }

        .trhead td {
            font-weight: 600;
            font-size: 13px;
        }

        .trdetails td {
            font-size: 11px !important;
            font-weight: 400 !important;
        }

        .downarr {
            width: 30px;
            background-color: transparent;
            border: none;
            text-align: center;
        }

        .wrapper-content {
            padding: 8px;
        }

        .dt-toolbar {
            margin: 0px 0px 0px 0px;
            background-color: #FFFFFF;
            left: 15px;
            right: 15px;
            top: 5px;
            border-bottom: 1px solid #ebebeb;
            padding: 0px 25px;
            height: 45px;
        }


        select::-ms-expand {
            display: none;
        }

        select {
            -webkit-appearance: none;
            -moz-appearance: none;
            text-indent: 1px;
            text-overflow: '';
            border-color: #e7eaec;
            font-size: 13px;
            padding: 4px;
            height: auto;
            border-radius: 4px;
            background: url(../Assets/img/down_arrow.png) no-repeat 97% white;
            background-size: 10px 10px;
            background-origin: content-box;
            border: 0.01em solid #DDDDDD;
        }

            select:focus {
                border-color: #1AB394;
                outline: 0;
            }

        .form-control {
            border-radius: 4px !important;
            font-size: 13px;
        }

        .modalbutton {
            width: 90px;
            padding: 4.5px 6px !important;
        }

        .nofilter {
            background-color: #ffffff;
        }

        /*
            new jj
        */
        .ibox-content {
            padding: 15px 15px 50px 15px;
        }


        .dt-toolbar-footer {
            padding: 7px 10px;
            height: 35px;
            background-color: #E7EAEC;
            left: 30px;
            right: 30px;
        }

        div.dataTables_info {
            padding-top: 0px;
        }

        .hrow td {
            background-color: #FFFFFF !important;
            font-size: 12px;
            font-weight: 600 !important;
        }

        .tdItemNo {
            padding: 2px;
            text-align: left;
        }



        .dataTables_filter {
            float: right !important;
            /*width: 430px !important;*/
            height: 30px;
            margin: 0px 0px 0px 0px;
            /*padding: 5px 0px 0px 0px;*/
        }





        .dataTables_wrapper {
            padding: 0;
        }


        .dataTables_filter .input-group-addon {
            float: right;
        }

        .input-group-addon:first-child {
            border-left: 0;
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            border-right: 1px solid #e7eaec;
        }

        .dataTables_filter .input-group-addon + .form-control {
            border-right: 0;
            border-radius: 0 !important;
        }


            .dataTables_filter .input-group-addon + .form-control:focus {
                border-color: #e7eaec !important;
                -webkit-box-shadow: none !important;
                -moz-box-shadow: none !important;
                box-shadow: none !important;
            }

        .fa {
            cursor: pointer;
        }
        /*
            JJ
        */
        .width-right-toolbar {
            width: 430px;
            /*width: 440px; for safari*/
        }

        /* Track */
        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            -webkit-border-radius: 10px;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            -webkit-border-radius: 10px;
            border-radius: 10px;
            background: rgba(255,0,0,0.8);
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);
        }

            ::-webkit-scrollbar-thumb:window-inactive {
                background: rgba(255,0,0,0.4);
            }

        table.dataTable thead .sorting {
            background-image: linear-gradient(rgba(255,255,255,0.8),rgba(255,255,255,0.8)), url(../../Content/css/plugins/images/sort.png);
            background-repeat: no-repeat;
            position: inherit;
        }

        table.dataTable thead .sorting_asc,
        table.dataTable thead .sorting_desc {
            background-image: none;
        }

        .table-responsive {
            overflow-x: hidden;
            /*overflow:hidden;*/
        }

        .table-bordered {
            font-size: 13px!important;
        }

        .head {
            display: block;
            background-color: #eaeaea;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 1px 2px 0 rgba(0,0,0,.1);
            padding: 0;
            height: 35px;
        }

        .title {
            margin: 0;
            padding: 0 0 0 15px;
            font-size: 16px;
            line-height: 32px;
            letter-spacing: .5px;
            color: #8a8a8a;
            text-align: left;
            font-weight: 600;
            font-family: 'Open Sans',sans-serif;
            display: inline;
        }

        .action-menu {
            float: right;
            height: 28px;
            width: 30%;
            padding-top: 1px;
        }

        .control-button-white-1 {
            background-color: #fff;
            box-shadow: 0 1px 2px 0 rgba(0,0,0,.1);
            color: #353535!important;
            border: 1px solid #ddd;
            font-weight: 700;
            padding: 5.5px 10px!important;
            margin-right: 5px;
        }

        .control-general {
            display: inline-block;
            border-radius: 4px;
        }

        .push_button {
            position: relative;
            color: #8a8a8a;
            display: block;
            text-decoration: none;
            margin: 0 auto;
            border-radius: 4px;
            border: 1px solid #ddd;
            background: #fff;
            text-align: center;
            padding: 20px 30px;
            -webkit-transition: all .1s;
            -moz-transition: all .1s;
            transition: all .1s;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.1);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.1);
            box-shadow: 0 1px 2px rgba(0,0,0,.1);
            cursor: pointer;
        }

        .modal-dialog {
            width: 600px;
            margin: 10% auto!important;
        }

        .modal1 {
            z-index: 2050 !important;
        }

        .modal1 {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 1050;
            display: none;
            overflow: hidden;
            -webkit-overflow-scrolling: touch;
            outline: 0;
        }

        .modal-open .modal1 {
            overflow-x: hidden;
            overflow-y: auto;
        }

        .dispnone {
            display: none;
        }
        .tdfile {
            cursor:pointer;
            color: #0000EE;
        }
            .tdfile:visited {
                color: #551A8B;
            }
        .col-sm-5 {
             left: 220px;
        }
        .col-xs-11
        {
        padding-right: 0px;
        }
    </style>
    <style type="text/css">
        .ruBrowse {
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
            font-size:13px;
        }

        .ruButton {
            width: 79px;
            height: 22px;
            border: 0;
            padding-bottom: 2px;
            background-position: 0 -23px;
            background-repeat: no-repeat;
            background-color: transparent;
            text-align: center;
        }

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

        div.RadUpload .ruInputs {
            margin-top: auto!important;
        }

        div.RadUpload .ruRemove {
            display: inline-block;
            font-size: 14px;
            background-color: #f00;
            padding: 0px!important;
            padding-left: 5px!important;
            padding-right: 5px!important;
            text-decoration: none!important;
            color: #f5f5f5;
        }

        .RadGrid {
            border-radius: 4px;
            overflow: hidden;
            border-color: #dddddd;
            box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.1);
        }

        .ghead {
            height: 32px !important;
            color: #3f4141;
            font-weight: 700 !important;
        }

        .newbord {
            border-right: none !important;
        }

        .newbord1 {
            border-left: none !important;
            border-right: none !important;
        }

        .newbord2 {
            border-left: none !important;
        }

        .RadUpload .ruRemove {
            overflow: visible;
            border: 0;
            background-position: 4px -70px;
            width: auto;
            padding-left: 16px;
            cursor: pointer;
            font-size: 10px;
        }

        .RadUpload .ruButton {
            width: 79px;
            height: 22px;
            border: 0;
            padding-bottom: 2px;
            background-position: 0 -23px;
            background-repeat: no-repeat;
            background-color: transparent;
            text-align: center;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:Label ID="lblprj" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblprjid" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lblfolder" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocid" runat="server" Text="0" Style="display: none"></asp:Label>
        <asp:Label ID="lbluseridhidden" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbltest" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbluserid" runat="server" Text="" Style="display: none" />
        <asp:Label ID="lbldocstyleId" runat="server" Text="" Style="display: none"></asp:Label>
        <asp:Label ID="lbldocstylechange" runat="server" Text="" Style="display: none"></asp:Label>
        <input type="hidden" id="hfile" name="hfile" runat="server" />
        <input type="hidden" id="hfilesize" name="hfilesize" runat="server" />
        <input type="hidden" id="hdocid" name="hdocid" runat="server" />
        <input type="hidden" id="haction" runat="server" />
        <input type="hidden" id="hdndocid" runat="server" />
        <input type="hidden" id="hdnvalue" runat="server" />

        <input type="hidden" id="hdnrowid" runat="server" />


        <div id="doccontainer">
            <div class="head" id="dvhead">
                <div class="headtitle" style="width: 65%; float: left">
                    <h2 class="title">
                        <asp:Label ID="pageinfo" runat="server" Text="Document Library"></asp:Label>
                    </h2>
                </div>
                <div class="action-menu" style="width: 35%;">
                    <a href="#" class="control-general control-button-white-1 push_button pull-right" id="btnback" onclick="goBack();"><i class="fa fa-angle-double-left"></i>BACK</a>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnadddoc" runat="server" Text="Add Document" class="control-general control-button-white-1 push_button pull-right" OnClientClick="AddNewDocument();" />

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnaddtoproject" runat="server" Text="Add To Project" OnClientClick="GetCheckedRows();" OnClick="btnaddtoproject_Click" class="control-general control-button-white-1 push_button pull-right" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div style="/*height: 33px*/"></div>
            <div style="height: 100%; overflow: auto">
                <div class="ibox-content">
                    <div class="table-responsive" style="width: 100%">

                        <table class="table table-striped table-bordered table-hover dataTables-example" id="datatable_fixed_column">
                            <thead>
                                <tr>
                                    <td style="width: 30px"></td>
                                    <th style="width: 20%">Manufacturer</th>
                                    <th style="width: 15%">Type</th>
                                    <th style="width: 20%;">Modal</th>
                                    <th style="width: 45%;">File Name</th>
                                    <th style="width: 40px;"></th>
                                    <th style="width: 40px;"></th>
                                    <th class="dispnone"></th>
                                    <th class="dispnone"></th>
                                    <th class="dispnone"></th>
                                </tr>
                                <tr class="filter">
                                    <td class="nofilter"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="nofilter"></td>
                                    <td class="nofilter"></td>
                                    <td class="dispnone nofilter"></td>
                                    <td class="dispnone nofilter"></td>
                                    <td class="dispnone nofilter"></td>


                                </tr>
                            </thead>
                            <asp:PlaceHolder ID="pls1" runat="server"></asp:PlaceHolder>
                          
                        </table>







                    </div>

                </div>
            </div>

        </div>

        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:Button ID="btndlete" runat="server" Style="width: 100px; display: none" OnClick="btndlete_Click" Text="Delete" ClientIDMode="Static"></asp:Button>
            </ContentTemplate>
        </asp:UpdatePanel>


        <button type="button" class="hidden" data-toggle="modal" data-target="#myModalDR" data-backdrop="static" id="popbutton">
            Basic fadeIn effect
        </button>
        <div class="modal1 inmodal" id="myModalDR" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-content animated fadeIn">
                        <div class="modal-header" style="padding: 10px">
                            <h4 class="modal-title">Add New Document</h4>
                            <small>Use the below boxes  to edit the Details</small>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <table style="width: 100%;font-size:13px;">
                                    <tr>
                                        <td>Manufacturer</td>
                                        <td style="width: 5px"></td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                      <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                                        <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="select">
                                                            <asp:ListItem Text="Test">

                                                            </asp:ListItem>

                                                        </asp:DropDownList>
                                    </ContentTemplate>
                                          </asp:UpdatePanel>
                                    </td>
                                                    <td style="padding: 10px">
                                                        <%--<button class="btn btn-primary modalbutton" style="width:100px;" id="btnaddnewmanu" onclick="gonewmanufacturer()">New</button>--%>
                                                        <a href="#" class="btn btn-primary modalbutton" style="width: 100px;" onclick="gonewmanufacturer()">New </a>
                                                    </td>
                                                </tr>
                                            </table>


                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 5px"></td>
                                    </tr>
                                    <tr>
                                        <td>Type</td>
                                        <td style="width: 5px"></td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txttype" runat="server" Width="200px" CssClass="form-control"></asp:TextBox></td>

                                                </tr>
                                            </table>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 5px"></td>
                                    </tr>
                                    <tr>
                                        <td>Model No</td>
                                        <td style="width: 5px"></td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtmodel" runat="server" Width="200px" CssClass="form-control"></asp:TextBox></td>
                                                    <td style="padding-left: 5px;">
                                                        <asp:CheckBox ID="chkmodel" runat="server" onclick="_checked('chkmodel','txtmodel')" /></td>
                                                </tr>
                                            </table>

                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px"></td>
                                    </tr>
                                    <tr>
                                        <td>File name</td>
                                        <td style="width: 5px"></td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <input type="file" id="DocFileUpload" style="display: none" onchange="GetValue();" runat="server" />
                                                        <input type="button" value="Select" class="rubutton ruBrowse" onclick="browseclick();" id="btnbrowse" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblfileinfo" runat="server" style="font-size:13px;"></asp:Label>
                                                        <a href="#" onclick="clearfile();" id="lnkremove"><i style="color: red;" class="fa fa-remove"></i></a>
                                                    </td>
                                                </tr>
                                            </table>


                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px"></td>
                                    </tr>
                                    <tr>
                                        <td>Source</td>
                                        <td style="width: 5px"></td>

                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtsourec" runat="server" Width="200px" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                    <td style="padding-left: 5px">
                                                        <asp:CheckBox runat="server" ID="chksource" onclick="_checked('chksource','txtsourec')" />
                                                    </td>
                                                </tr>
                                            </table>


                                        </td>

                                    </tr>

                                </table>

                            </div>

                        </div>
                        <div class="modal-footer" style="padding: 10px">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnManusave" runat="server" CssClass="btn btn-primary modalbutton" Style="width: 100px;" OnClientClick="return UpdateDataTableValue();" OnClick="btnManusave_Click" Text="Save"></asp:Button>
                                    <button type="button" class="btn btn-default modalbutton" data-dismiss="modal" style="width: 100px;">Cancel</button>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <button type="button" class="hidden" data-toggle="modal1" data-target="#modalnewmanufact" data-backdrop="static" id="btnmanufact">
            Basic fadeIn effect
        </button>
        <div class="modal1 inmodal" id="modalnewmanufact" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-content animated fadeIn">
                        <div class="modal-header" style="padding: 10px">
                            <h4 class="modal-title">Add New Manaufacturer</h4>

                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <table style="width: 100%;;font-size:13px;">
                                    <tr>
                                        <td>Manufacturer</td>
                                        <td style="width: 5px"></td>
                                        <td>
                                              <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                            <asp:TextBox ID="txtmanufacturer" runat="server" Width="300px" CssClass="form-control"></asp:TextBox>
                                    </ContentTemplate>
                                                  </asp:UpdatePanel>
                                        </td>

                                    </tr>

                                </table>

                            </div>

                        </div>
                        <div class="modal-footer" style="padding: 10px">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btsaveManu" runat="server" CssClass="btn btn-primary modalbutton" Style="width: 100px;" OnClick="btsaveManu_Click" Text="Add" OnClientClick="return NewManuValidation()"></asp:Button>
                                    <button type="button" class="btn btn-default modalbutton" data-dismiss="modal" style="width: 100px;">Cancel</button>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </form>
</body>
<script type="text/javascript">

    // DO NOT REMOVE : GLOBAL FUNCTIONS!

    $(document).ready(function () {

        //$('#example-getting-started').multiselect();
        //pageSetUp();
        /* // DOM Position key index //

        l - Length changing (dropdown)
        f - Filtering input (search)
        t - The Table! (datatable)
        i - Information (records)
        p - Pagination (paging)
        r - pRocessing
        < and > - div elements
        <"#id" and > - div with an id
        <"class" and > - div with a class
        <"#id.class" and > - div with an id and class

        Also see: http://legacy.datatables.net/usage/features
        */

        /* BASIC ;*/
        var responsiveHelper_dt_basic = undefined;
        var responsiveHelper_datatable_fixed_column = undefined;
        var responsiveHelper_datatable_col_reorder = undefined;
        var responsiveHelper_datatable_tabletools = undefined;

        var breakpointDefinition = {
            tablet: 1024,
            phone: 480
        };


        /* END BASIC */

        /* COLUMN FILTER  */
        var otable = $('#datatable_fixed_column').DataTable({
            //"bFilter": false,
            //"bInfo": false,
            //"bLengthChange": false
            //"bAutoWidth": false,
            //"bPaginate": false,
            //"bStateSave": true // saves sort state using localStorage
            //"sScrollY": "200px",
            //"bAutoWidth": false,
            //"scrollCollapse": true,
            "bSort": false,
            "sPaginationType": "CTplusPagination",
            "oTableTools": {
                "sSwfPath": "http://cdn.datatables.net/tabletools/2.2.2/swf/copy_csv_xls_pdf.swf",
                "aButtons": [
                    {
                        "sExtends": "print",
                        "bShowAll": false

                    }
                ]
            },
            "defaultContent": "<button>Click!</button>",
            "oLanguage": {
                "sInfo": "<p style='font-weight:normal;font-style:normal;text-align: right;'>View _START_ - _END_ of _TOTAL_</p>",
                "sInfoEmpty": "View _START_ - _END_ of _TOTAL_",
                "sEmptyTable": "View _START_ - _END_ of _TOTAL_",
                "sZeroRecords": '',
                "sProcessing": 'Please wait - loading...'
            },

            "sDom": "<'dt-toolbar'<'row'<'pull-left'<'TopLeftToolbar'>><'row pull-right width-right-toolbar'f<'TopRightToolbar'>Tt>r>>" +
                    "t" +
                    "<'dt-toolbar-footer'<'col-sm-2 col-xs-5 hidden-xs'<'EditToolbar'>><'col-xs-8 col-sm-5'p><'col-sm-4 col-xs-11 hidden-xs pull-right'i>>",

            "autoWidth": true,

            "preDrawCallback": function () {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_datatable_fixed_column) {
                    responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#datatable_fixed_column'), breakpointDefinition);
                }
            },

            "rowCallback": function (nRow) {
                responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
            },
            "drawCallback": function (oSettings) {
                responsiveHelper_datatable_fixed_column.respond();
                $("#datatable_fixed_column_filter input[type=search]").attr("placeholder", "Search");
            },


            initComplete: function () {

                this.api().columns().every(function () {

                    var column = this;

                    var select = $('<select  style="width:100%;"><option value="">All</option></select>')

                        .appendTo($(column.header()).empty())

                        .on('change', function () {

                            var val = $.fn.dataTable.util.escapeRegex(

                                $(this).val()

                            );



                            column

                                .search(val ? '^' + val + '$' : '', true, false)

                                .draw();

                        });




                    column.data().unique().sort().each(function (d, j) {

                        if (column.search() === '^' + d + '$') {

                            select.append('<option selected="selected" value="' + d + '">' + d + '</option>')

                        } else {

                            select.append('<option value="' + d + '">' + d + '</option>')

                        }

                    });

                });

                //$("#tdnofilter").find("select").remove()

                $(".nofilter").find("select").remove()




                $("#datatable_fixed_column thead th").removeClass('sorting_asc');
                $("#datatable_fixed_column thead th").addClass('sorting');

                $('a.DTTT_button_print').hide();




            }
        });


        $('#datatable_fixed_column tbody').on('click', 'button', function () {
            var data = table.row($(this).parents('tr')).data();
            alert(data[0] + "'s salary is: " + data[5]);
        });

        // custom toolbar


        //$("div.TopRightToolbar").html('<div style="margin-right:15px;float:right;"><button type="button" class="btn btn-outline btn-default btn-sm" id="btnPrint" onclick="gotoPrint();">Back</button></div>');
        //$("div.TopLeftToolbar").html('<div class="pull-left"><button type="button" class="btn btn-primary btn-sm">Add To Project</button> <button type="button" class="btn btn-outline btn-default btn-sm MainButton" id="btncreatenew">Add New</button><p> library </p></div>');

        // Apply the filter
        $("#datatable_fixed_column thead th input[type=text]").on('keyup change', function () {

            otable
                .column($(this).parent().index() + ':visible')
                .search(this.value)
                .draw();

        });
        $('#datatable_fixed_column').on('click', 'tr.group', function () {

            var currentOrder = otable.order()[0];

            if (currentOrder[0] === 3 && currentOrder[1] === 'asc') {

                otable.order([3, 'desc']).draw();

            }

            else {

                otable.order([3, 'asc']).draw();

            }


            var table = $('#datatable_fixed_column').DataTable();

            $('#datatable_fixed_column tbody').on('click', 'tr', function () {
                alert(otable.row(this).data());
            });

            var checkIds = [];
            oTable.$('tr').each(function (index, rowhtml) {
                var checked = $('input[type="checkbox"]:checked', rowhtml).length;
                if (checked == 1) {
                    checkIds.push($('.hideme', rowhtml).text());
                }
            });
            alert(checkIds);

        });




        $('#datatable_fixed_column tbody').on('click', 'td', function () {

            var table = $('#datatable_fixed_column').DataTable();
            document.getElementById("hdnrowid").value = table.cell(this).index().row;

            var colIdx = table.cell(this).index().column;
            var data = table.row($(this).parents('tr')).data();


            document.getElementById("hdndocid").value = data[7];
            document.getElementById("hfile").value = data[4];

            table.row($(this).parents('tr').addClass('select'));
            table.row($(this).parents('tr').addClass('select')).draw();

            //Function for chanage curent row values
            //table.cell(this).data("hai").draw();
            //var dvalue = table.row($(this).parents('tr')).data();
            //dvalue[1] = "New man";
            //dvalue[2] = "Ne model";
            //dvalue[3] = "New test";
            //dvalue[4] = "New corf";
            //table.row($(this).parents('tr')).data(dvalue).draw();

            if (colIdx == "5") {
                clearall();
                $("#ddlManufacturer option:contains(" + data[1] + ")").attr('selected', 'selected');


                $("#txttype").val(data[2]);
                $("#txtmodel").val(data[3]);

                if (data[3] == "N/A") {
                    $("#chkmodel").click();
                }

                if (data[8] == "N/A") {
                    $("#chksource").click();
                }

                $("#txtsourec").val(data[8]);

                if (data[4] != "") {
                    $("#hfile").val(data[4]);
                    $("#hfilesize").val(data[9]);

                    $("#lnkremove").show();

                    $("#lblfileinfo").text(data[4]);
                    $("#btnbrowse").hide();

                }
                else {
                    $("#btnbrowse").show();
                    $("#lnkremove").hide();

                    $("#lblfileinfo").text("");
                }


                $("#haction").val("2");
                $("#myModalDR").modal('show');

                $("#btnManusave").val("Update");

            }
            if (colIdx == "6") {

                var row = table.row($(this).parents('tr'));

                swal({
                    title: "Warning?",
                    text: "Are you sure you want to delete this file!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#DD6B55',
                    confirmButtonText: 'Yes',
                    cancelButtonText: "No",
                    closeOnConfirm: false,
                    closeOnCancel: true
                },
function (isConfirm) {
    if (isConfirm) {
        $("#btndlete").click();
        //var rowNode = row.node();
        row.remove();
        table.draw();
        //swal({
        //    title: 'Confirmation!',
        //    text: 'Document successfully deleted!',
        //    type: 'success'
        //});

    } else {
        return;
    }
});


                //    var checkstr = confirm('Are you sure you want to delete this?');
                //    if (checkstr == true) {

                //        var data = table.row($(this).parents('tr')).data();

                //        $("#btndlete").click();


                //        //alert("'Id Value is: " + data[0] + "'First vaue is :" + data[1] + "'second vaue is :" + data[2]);

                //        table.row($(this).parents('tr')).remove();
                //        table.draw();


                //    } else {
                //        return false;
                //    }

            }

            if (colIdx == "4") {
                //document.getElementById("hdndocid").value = data[7];
                //document.getElementById("hfile").value = data[4];

                if (data[4] != "") { Callviewer(data[7]) }



            }


        });



        $(".sorting").on('click', function () {


            if ($(this).hasClass('sorting_desc') === false) {
                if (otable.order()[0][0] != $(this).index()) {
                    $("#datatable_fixed_column thead th").removeClass('sorting_asc');
                    $("#datatable_fixed_column thead th").removeClass('sorting_desc');
                    $("#datatable_fixed_column thead th").addClass('sorting');
                }
                otable.order([$(this).index(), 'desc']).draw();
                $(this).removeClass('sorting');
                $(this).removeClass('sorting_asc');
                $(this).addClass('sorting_desc');
            }
            else {
                if (otable.order()[0][0] != $(this).index()) {
                    $("#datatable_fixed_column thead th").removeClass('sorting_desc');
                    $("#datatable_fixed_column thead th").removeClass('sorting_asc');
                    $("#datatable_fixed_column thead th").addClass('sorting');
                }
                otable.order([$(this).index(), 'asc']).draw();
                $(this).removeClass('sorting_desc');
                $(this).addClass('sorting_asc');
            }
        });

    })

    function getid(e, id) {
        if (e.checked) {

            var abc = document.getElementById("hdnvalue").value;
            if (abc.length > 0) {
                abc = abc + ",";
            }
            document.getElementById("hdnvalue").value = abc + id;
            alert(document.getElementById("hdnvalue").value);
        }
    }

    function GetCheckedRows() {


        //delete checked row
        //$("input:checked", $("#datatable_fixed_column").dataTable().fnGetNodes()).each(function () {

        //    $("#datatable_fixed_column").dataTable().fnDeleteRow($(this).parents('tr')[0], false)

        //});

        document.getElementById("hdnvalue").value = "";

        var oTable = $('#datatable_fixed_column').dataTable();
        var rowcollection = oTable.$("input:checked", { "page": "all" });

        if (rowcollection.length == 0) {
            swal({
                title: 'Infomation!',
                text: 'Please select the Document!',
                type: "info",
            });

            return false;
        }


        rowcollection.each(function (index, elem) {

            var checkbox_value = $(elem).attr('id');


            var abc = document.getElementById("hdnvalue").value;
            if (abc.length > 0) {
                abc = abc + ",";
            }

            document.getElementById("hdnvalue").value = abc + checkbox_value;

        });

        oTable.$('input').removeAttr('checked');


        //alert(document.getElementById("hdnvalue").value);




        //oTable.$("input:checked").each(function () {
        //    alert("Id: " + $(this).attr("id") + " Value: " + $(this).val() + " Checked: " + $(this).is(":checked"));
        //});


        //$("input:checked", $("#datatable_fixed_column").dataTable().fnGetNodes()).each(function () {

        //    alert($(this).attr('id'));

        //});

    }

    function goAddDoc1() {

    }
    function gonewmanufacturer() {
        $("#modalnewmanufact").modal('show');
    }
    function _checked(sender, target) {
        var _chk = document.getElementById(sender).checked;
        var _txt = document.getElementById(target);
        if (_chk == true) {
            _txt.value = "N/A";
            _txt.disabled = true;
        }
        else {
            _txt.value = "";
            _txt.disabled = false;
        }
    }
    function goclick() {

        var table = $('#datatable_fixed_column').DataTable();
        var dvalue = table.rows(0).data();
        //alert(dvalue[1].value);
        var nva = table.row($(this).parents('tr')).data();


        //dvalue[1] = "New man";
        //dvalue[2] = "Ne model";
        //dvalue[3] = "New test";
        //dvalue[4] = "New corf";
        //table.rows(0).data(dvalue).draw();
        table.row($(this).parents('tr')).data(dvalue).draw();


    }
    function UpdateDataTableValue() {

        if ($("#haction").val == "1") {

            if (document.getElementById('<%= DocFileUpload.ClientID %>').files.length === 0) {
                    swal({
                        title: 'Infomation!',
                        text: 'Please select the File!',
                        type: "info",
                    });
                    return false;
                }
            }
            else {
                if ($("#hfile").text() == "" && $("#lblfileinfo").text() == "") {
                    swal({
                        title: 'Infomation!',
                        text: 'Please select the File!',
                        type: "info",
                    });
                    return false;
                }


            }

            if (document.getElementById('<%= DocFileUpload.ClientID %>').files.length > 0) {

                var fileUpload = $("#DocFileUpload").get(0);
                var files = fileUpload.files;

                var data = new FormData();

                for (var i = 0; i < files.length; i++) {
                    data.append(files[i].name, files[i]);

                    $("#hfile").val(files[i].name);
                    $("#hfilesize").val(files[i].size);


                }
                var files = fileUpload.files


                $.ajax({
                    url: "Handler1.ashx",
                    type: "POST",
                    data: data,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        //alert(data);

                    },
                    error: function (err) {
                        alert(err.statusText)


                    }


                });
            }

            if ($("#hdnrowid").val() != "") {
                var table = $('#datatable_fixed_column').DataTable();
                var rowid = document.getElementById("hdnrowid").value;

                var dvalue = table.row(rowid).data();
                dvalue[1] = $('#ddlManufacturer :selected').text();

                dvalue[2] = $("#txttype").val();
                dvalue[3] = $("#txtmodel").val();
                dvalue[4] = $("#hfile").val();
                dvalue[8] = $("#txtsourec").val();

                table.row(rowid).data(dvalue).draw();



                $("#hdnrowid").val("");

            }

            //$("#myModalDR").modal('hide');

        }


        function GetValue() {
            var _file = document.getElementById("DocFileUpload").value;
            var i = _file.lastIndexOf("\\");
            var _filename = _file.substring(i + 1);
            $("#lblfileinfo").text(_filename);
            $("#lnkremove").show();

            $("#btnbrowse").hide();
        }
        function browseclick() {
            $("#DocFileUpload").click();


        }
        function clearall() {

            $("#DocFileUpload").val("");
            $("#lblfileinfo").text("");
            $("#btnbrowse").show();

            $("#lnkremove").hide();


            $("#lblfileinfo").text("");

            $("#txttype").val("");
            $("#txtmodel").val("");
            $("#chksource").val("");
            $("#txtsourec").val("");
            $("#txtsourec").prop('disabled', false);

            $("#hfile").val("");
            $("#hfilesize").val("");

            $("#chksource").prop('checked', false);


            $("#txtmodel").prop('disabled', false);
            $("#chkmodel").prop('checked', false);

            $("#btnManusave").text("Save");
        }
        function clearfile() {
            $("#lblfileinfo").text("");
            $("#btnbrowse").show();

            $("#lnkremove").hide();
        }
        function AddNewDocument() {
            $("#hdnrowid").val("");
            $("#haction").val("1");
            $("#myModalDR").modal('show');
            $("#btnbrowse").show();
            $("#lnkremove").hide();
            clearall();

        }
        function NewManuValidation() {
            if ($("#txtmanufacturer").val() == "") {
                swal({
                    title: 'Infomation!',
                    text: 'Enter Manufacturer!',
                    type: "info",
                });
                return false;
            }
            //$("#modalnewmanufact").hide();

        }
        function goBack() {

        
            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");

            parent.document.getElementById("content").src = "DocumentList1?Auth1=" + _auth1.textContent + "&Auth2=" + _auth2.textContent + "&Auth3=" + _auth3.textContent;



            //var row_clone = $('#datatable_fixed_column tbody tr:eq(1)').clone();
            //$('#datatable_fixed_column').dataTable().fnAddData(row_clone);


            //    var dvalue = table.row();
            //    dvalue["id"] = 111;
            //    dvalue["Manufacturer"] = "New man";
            //dvalue[2] = "Ne model";
            //dvalue[3] = "New test";
            //dvalue[4] = "New corf";
            //dvalue[5] = "New corf";
            //table.row.add(dvalue).draw();


        }
        function AddNewRowList(id) {


            var table = $('#datatable_fixed_column').DataTable();
            var newRow = "<tr ><td> <input  type='checkbox' id=" + id + " /> </td><td>" + $('#ddlManufacturer :selected').text() + "</td><td>" + $("#txttype").val() + "</td><td>" + $("#txtmodel").val() + "</td><td class='tdfile'>" + $("#hfile").val() + "</td><td ><a href='#'><i class='fa fa-pencil-square-o'></i></a></td><td ><a href='#'><i class='fa fa-trash-o'></i></a></td><td class='dispnone'>" + id + "</td><td class='dispnone'>" + $("#txtsourec").val() + "</td><td class='dispnone'>" + $("#hfilesize").val() + "</td></tr>";
            table.row.add($(newRow)).draw();


        }
        function Callviewer(id) {

            var _auth1 = document.getElementById("lbluseridhidden");
            var _auth2 = document.getElementById("lblprjid");
            var _auth3 = document.getElementById("lblfolder");

            parent.document.getElementById("content").src = "Docview?ID=" + id;

        }
        function closeModal(type) {
            $("#modalnewmanufact").modal('hide');
        }
        function SaveUpdate(Id, type) {
            var message;
            if (type == 1)
                message = "Document Successfully Saved";
            else
                message = "Document Successfully Updated";
            swal({
                title: "Confirmation",
                text: message,
                type: "success",
                showCancelButton: false,
                confirmButtonText: "Ok",
                closeOnConfirm: true
            },
            function (isConfirm) {
                if (type == 1) { AddNewRowList(Id); }
                $("#myModalDR").modal('hide');
            });

        }
        function Messages(type) {
            if (type == 1) {
                swal({
                    title: 'Confirmation!',
                    text: 'Document Succesfully Deleted!',
                    type: "success",
                });
            }
            else if (type == 2) {
                swal({
                    title: 'Information!',
                    text: 'Manufacturer already Exists!',
                    type: "info",
                });
            }
            else if (type == 3) {
                swal({
                    title: 'Confirmation!',
                    text: 'Manufacturer Added Successfully!',
                    type: "info",
                });

            }
            else if (type == 4) {
                swal({
                    title: 'Confirmation!',
                    text: 'documents added to the project!',
                    type: "success",
                });
            }
        }
</script>
</html>
