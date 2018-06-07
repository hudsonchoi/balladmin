<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xls_pageviews.aspx.cs" Inherits="xls_pageviews" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Literal ID="ltrTitle" runat="server" Text=""></asp:Literal>
    <asp:GridView ID="gvPageViews" runat="server">
        <Columns>
        </Columns>
        <HeaderStyle Font-Bold="True"/>
        <AlternatingRowStyle BackColor="LightGray" />
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    </form>
</body>
</html>
