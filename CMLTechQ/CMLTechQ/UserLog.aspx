<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLog.aspx.cs" Inherits="CMLTechQ.UserLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DMS User Log</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                        CellPadding="4" Width="800px" 
                            onrowdatabound="GridView1_RowDataBound">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                        <asp:BoundField DataField="_uid" HeaderText="USER ID" />
                        <asp:BoundField DataField="_ipaddress" HeaderText="IP ADDRESS" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        <asp:BoundField  HeaderText="COUNTRY" DataField="country_name">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                         <asp:BoundField  HeaderText="REGION" DataField="region_name">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                          <asp:BoundField  HeaderText="CITY" DataField="_location">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>     
                        <asp:BoundField DataField="_login" HeaderText="LOGIN TIME" >                        
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
    </div>
    </form>
</body>
</html>
