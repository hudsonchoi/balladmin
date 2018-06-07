<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xls_visits.aspx.cs" Inherits="xls_visits" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Literal ID="ltrTitle" runat="server" Text=""></asp:Literal>
    <asp:GridView ID="gvVisits" runat="server" AutoGenerateColumns="False">
        <Columns>
        <asp:BoundField DataField="thedate" HeaderText="Date" ReadOnly="True" 
                SortExpression="thedate" />
            <asp:BoundField DataField="perday" HeaderText="Visits" ReadOnly="True" 
                SortExpression="perday" />
        </Columns>
        <HeaderStyle Font-Bold="True"/>
        <AlternatingRowStyle BackColor="LightGray" />
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    </form>
</body>
</html>
