<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocViewOM.aspx.cs" Inherits="CMLTechQ.DMS.DocViewOM" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>--%>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<!DOCTYPE html> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/css/Layout.css" type="text/css" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <%--<script src="../Assets/js/jquery.min.js"></script>--%>
    <script type="text/javascript">
        function getdata(id) {
            var e = document.getElementById('d' + id);
            if (e) {
                if (e.style.display != 'block') {
                    e.style.display = 'block';
                    e.style.visibility = 'visible';
                }
                else {
                    e.style.display = 'none';
                    e.style.visibility = 'hidden';
                }
            }
        }
    </script>
</head>
<body style="border-right:solid 5px #45818e;" class="inner fixed_background">
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager runat="server" AsyncPostBackTimeout="3600"></asp:ToolkitScriptManager>
        <div id="doc-container" >
            <div id="info-bar">
               <%-- <div id="container-menu">
                    <ul class="nav">
                        <li class="item "><a ><asp:Label ID="fileinfo" runat="server" Text=""></asp:Label></a></li>
                    </ul>
                    <a class="pull-right back" href="javascript:history.go(-1);"><i  class="icon-backward"></i> Back</a>
                </div>--%>
                <div class="head">
                    <div class="headtitle">
                        <h2 class="title"><asp:Label ID="fileinfo" runat="server" Text=""></asp:Label></h2>
                    </div>
                    <div class="back pull-right">
                         <a class="back" href="javascript:history.go(-1);"><i  class="icon-backward"></i> Back</a>
                    </div>
                </div>
            </div>
            <div>
            <div id="docview-area">               
                    <iframe runat="server" id="documentviewer" class="viewer" ></iframe>        
            </div>
            <div id="comment-area">
                <%--<h2 class="head"><i class="icon-comments-alt"></i> Comments</h2>
                <asp:TextBox ID="TextBox1" runat="server" Width="289px" Height="100px" TextMode="MultiLine" CssClass="commentbox"></asp:TextBox>
                <div class="action">
                    
                            <input class="txtbox" type="text" placeholder="Page No." value="" id="Text1" runat="server" />
                       
                            <input class="txtbox" type="text" placeholder="Sec. No." value="" id="Text3" runat="server" />
                    <a href="#" class="pull-right"><i class="icon-plus-sign"></i> Add</a>--%>
                <%--<cc1:Editor ID="Editor1" runat="server" Width="289px" Height="100px" />--%>     
                <div style="height:150px;padding:5px;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="action vdark">

                            <input class="txtbox center w70" type="text" placeholder="Page No." value="" id="txtpage" runat="server" />
                       
                            <input class="txtbox center w70" type="text" placeholder="Sec. No." value="" id="txtsec" runat="server" />
                        

                            
                        
                    </div>
                    <asp:TextBox ID="txtcomments" runat="server" Width="280px" Height="100px" TextMode="MultiLine"  class="txtbox" ></asp:TextBox>
                    <div class="action white border">
                        <asp:LinkButton ID="btnadd" CssClass="pull-right actbtn light" style="width:70px" runat="server" OnClick="btnadd_Click">Add</asp:LinkButton>
                    </div>
                    
</ContentTemplate>
                        </asp:UpdatePanel>
                </div>
                <div id="comment-list">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
 <asp:Repeater ID="rptcomments" runat="server" >
                        <HeaderTemplate>
                            <table class="list">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="rrow">
                                <td>
                                    <div id='h<%#Container.ItemIndex %>' class="main">
                                        <p style="margin:0;padding:0"><%#Container.ItemIndex %> > <%# Eval("Comment") %> > <%# Eval("sec_no") %> > <%# Eval("page_no") %> ><a class="pull-right" href="#" onclick="getdata(<%#Container.ItemIndex %>);"><i class="icon-eye-open"></i></a></p>
                                    </div>
                                    <div id='d<%#Container.ItemIndex %>' style="display:none" class="sub">
                                        <table class="list">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtcomts" runat="server" Text='<%# Eval("Comment") %>' CssClass="txtbox comments" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
 <asp:LinkButton ID="btnedit" CssClass="pull-left actbtn dark margin" style="text-align:center;width:70px" runat="server" >Edit</asp:LinkButton>
                                                     <asp:LinkButton ID="LinkButton1" CssClass="pull-left actbtn dark" style="text-align:center;width:70px" runat="server" >Delete</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="arow">
                               <td>
                                    <div id='h<%#Container.ItemIndex %>' class="main">
                                        <p style="margin:0;padding:0"><%#Container.ItemIndex %> > <%# Eval("Comment") %> > <%# Eval("sec_no") %> > <%# Eval("page_no") %> ><a class="pull-right" href="#" onclick="getdata(<%#Container.ItemIndex %>);"><i class="icon-eye-open"></i></a></p>
                                    </div>
                                    <div id='d<%#Container.ItemIndex %>' style="display:none" class="sub">
                                        <table class="list">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtcomts" runat="server" Text='<%# Eval("Comment") %>' CssClass="txtbox comments" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
 <asp:LinkButton ID="btnedit" CssClass="pull-left actbtn light margin" style="text-align:center;width:70px" runat="server" >Edit</asp:LinkButton>
                                                     <asp:LinkButton ID="LinkButton1" CssClass="pull-left actbtn light" style="text-align:center;width:70px" runat="server" >Delete</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                   
                </div>
                   
                </div>
            </div>
</div>
        <div class="clearfix"></div>
            <div class="footer"></div>
    
    </form>
</body>
</html>