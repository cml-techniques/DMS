<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dms_lib.aspx.cs" Inherits="CMLTechQ.DMS.dms_lib" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

        <%--<link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />--%>
    <link href="../AMS/css/font-awesome.min.css" rel="stylesheet" />
    <%--<link href="../Assets/css/dropdown.css" rel="stylesheet" />--%>

    <link href="../csf/animate.css" rel="stylesheet" />
    <link href="../csf/bootstrap.css" rel="stylesheet" />
    <link href="../csf/style.css" rel="stylesheet" />

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />


    <script src="../jsf/jquery-2.1.1.js"></script>
    <script src="../jsf/bootstrap.min.js"></script>

    <script src="../jsf/inspinia.js"></script>
    <script src="../jsf/jquery.metisMenu.js"></script>
    <script src="../jsf/pace.min.js"></script>
    <script src="../jsf/jquery.slimscroll.min.js"></script>

   

    <script src="../jsf/jquery.dataTables.min.js"></script>
    <script src="../jsf/dataTables.bootstrap.min.js"></script>
    <script src="../jsf/Datatable.Responsive.js"></script>
    <script src="../jsf/dataTables.tableTools.min.js"></script>
    <script src="../jsf/jquery.jeditable.js"></script>

    <script src="../jsf/CTplusPagination.js"></script>

    <style type="text/css">
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
            background: url(../images/down_arrow.png) no-repeat 97% white;
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
            float: left !important;
            /*width: 430px !important;*/
            height: 30px;
            margin: 0px 0px 0px 0px;
            padding: 5px 0px 0px 0px;
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
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hdnvalue" runat="server" name="hdnvalue" />
        <input id="Button1" type="button" onclick="gos();" runat="server" value="gos" />

            <div class="ibox-content" >

                <div class="table-responsive" style="width:100%">
                    <table class="table table-striped table-bordered table-hover dataTables-example" id="datatable_fixed_column" >
                        <thead>
                            <tr>
                                <td style="width: 30px"></td>
                                <th style="width: 20%">Manufacturer</th>
                                <th style="width: 15%">Type</th>
                                <th style="width: 20%;">Modal</th>
                                <th style="width: 45%;">File Name</th>
                                <th style="width: 40px;"></th>
                                  <th style="width:40px;"></th>
                            </tr>
                            <tr class="filter">
                                <td class="nofilter"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                 <td class="nofilter"></td>
                                 <td class="nofilter"></td>


                            </tr>
                        </thead>

                        <asp:PlaceHolder ID="pls1" runat="server"></asp:PlaceHolder>


                    </table>


                    <asp:ListView ID="upload_doc" runat="server" DataKeyNames="ITM_ID">
                        <ItemTemplate>
                            <tr id="itm_tr" runat="server" class="row">
                                <td style="width: 40%"><%# Eval("MANF_NAME") %></td>
                                <td style="width: 40%"><%# Eval("FILE_NAME") %></td>
                                <td style="width: 20%; text-align: right">
                                    <asp:Label ID="doc_idLabel" runat="server" Text='<%# Eval("ITM_ID") %>' Style="display: none" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="" CssClass="btnstyle1 style-edit" /><asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="" CssClass="btnstyle1 style-delete" />
                                </td>
                            </tr>
                        </ItemTemplate>


                        <LayoutTemplate>

                            <table id="datatable_fixed_column" runat="server" class="table-style1" style="width: 100%">
                                <tr id="itm_tr" runat="server" class="hrow">
                                    <td style="width: 40%">Document Title</td>
                                    <td style="width: 40%">File Name</td>
                                    <td style="width: 20%"></td>
                                </tr>
                                <tr id="itemPlaceholder" runat="server"></tr>
                            </table>

                        </LayoutTemplate>


                    </asp:ListView>





                </div>

            </div>

            <%-- <asp:ListView ID="doc_list" runat="server" DataKeyNames="ITM_ID" Style="width: 100%;" >
                                                                <ItemTemplate>
                                                                    <tr id="itm_tr" runat="server" class="row">
                                                                        <td style="width: 100px; text-align: left"><%#Eval("MANF_NAME") %></td>
                                                                        <td style="width: 250px; text-align: left"><%#Eval("CONTRA_TYPE") %></td>
                                                                        <td style="width: 250px; text-align: left; word-wrap: break-word">
                                                                            <asp:Label ID="lbltitle" runat="server" Text='<%#Eval("Model") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width: 250px; text-align: left"><%#Eval("FILE_NAME") %></td>
                                                                        <td style="width: 25px;">
                                                                            <asp:Label ID="doc_idLabel" runat="server" Text='<%# Eval("ITM_ID") %>' Style="display: none" />
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <LayoutTemplate>
                                                                    <table id="datatable_fixed_column" runat="server" class="table-style2" cellspacing="0" border="0" style="width: 100%; table-layout: fixed">
                                                                        <tr id="itm_tr" runat="server" class="hrow">
                                                                            <td style="width: 100px; text-align: left">Man Name</td>
                                                                            <td style="width: 250px; text-align: left">Contactor</td>
                                                                            <td style="width: 250px; text-align: left">Model</td>
                                                                            <td style="width: 250px; text-align: left">File Name</td>
                                                                            <td style="width: 25px"></td>
                                                                        </tr>
                                                                        <tr id="itemPlaceholder" runat="server"></tr>
                                                                    </table>
                                                                </LayoutTemplate>
                                                                <EmptyDataTemplate>
                                                                    <table cellspacing="0" border="0" style="width: 100%; table-layout: fixed" class="table-style2">
                                                                        <tr id="itm_tr" runat="server" class="hrow">
                                                                             <td style="width: 100px; text-align: left">Man Name</td>
                                                                            <td style="width: 250px; text-align: left">Contactor</td>
                                                                            <td style="width: 250px; text-align: left">Model</td>
                                                                            <td style="width: 250px; text-align: left">File Name</td>
                                                                            <td style="width: 25px"></td>
                                                                        </tr>
                                                                        <tr class="row">
                                                                            <td colspan="5">Document basket is empty</td>
                                                                        </tr>
                                                                    </table>
                                                                </EmptyDataTemplate>
                                                            </asp:ListView>--%>
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

            //    "columnDefs": [

            //{ "visible": false, "targets": 3 }

            //    ],

            //    "order": [[3, 'asc']],

            //"displayLength": 8,

            //"drawCallback": function (settings) {

            //    var api = this.api();

            //    var rows = api.rows({ page: 'current' }).nodes();

            //    var last = null;


            //    api.column(5, { page: 'current' }).data().each(function (group, i) {
            //        if (last !== group) {
            //            //if (i > "0") {
            //            $(rows).eq(i).before(

            //                '<tr class="group" style="background-color:#1AB394;font-weight:700;color:#f4f4f4;"><td colspan="35">' + group + '</td></tr>'
            //            );
            //            last = group;
            //            //}
            //        }

            //    });
            //},
            initComplete: function () {

                this.api().columns().every(function () {

                    var column = this;

                    var select = $('<select class="select" style="width:100%;border:none!important;"><option value="">All</option></select>')

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

        // custom toolbar
        //$("div.toolbar").html('<div class="text-right"><button type="button" class="btn btn-outline btn-default btn-sm" onclick="removes();">Settings</button> <button type="button" class="btn btn-outline btn-default btn-sm">Print</button> </div>');
        //$("div.toolbar1").html('<div class="text-left"><button type="button" class="btn btn-primary btn-sm">Register</button> <button type="button" class="btn btn-outline btn-default btn-sm MainButton" id="btncreatenew">Create New</button> <button type="button" class="btn btn-outline btn-default btn-sm">Saved Log</button> <button type="button" class="btn btn-outline btn-default btn-sm">Reports</button></div>');


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

    function gos() {


        //var table = $('#datatable_fixed_column').DataTable();

        //$('#datatable_fixed_column tbody').on('click', 'tr', function () {
        //    alert(table.row(this).data());
        //});

        var table = $('#datatable_fixed_column').DataTable();

        //    table
        //        .column(0)
        //        .data()
        //        .each(function (value, index) {
        //            console.log('Data in index: ' + index + ' is: ' + value);
        //            alert('Data in index: ' + index + ' is: ' + value);
        //        });
        //}

        var oTable = $('#datatable_fixed_column').dataTable();
        var rowcollection = oTable.$("input:checked", { "page": "all" });


        var checkIds = [];

        for (var i = 0; i < rowcollection.length; i++) {

            //var abc = rowcollection[i].value();
        }

        rowcollection.each(function (index, elem, value) {

            var checkbox_value = $(elem).text();
            var checkbox_value1 = $(elem).val();

            var id = $(this).attr('id');

            alert(id);
            //Do something with 'checkbox_value'
        });

    }
    function godelete(id) {
        alert(id);
    }
    function goedit(id) {
        alert(id);
    }
</script>
</html>