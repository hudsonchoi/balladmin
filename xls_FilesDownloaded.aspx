<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xls_FilesDownloaded.aspx.cs" Inherits="xls_FilesDownloaded" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Literal ID="ltrTitle" runat="server" Text=""></asp:Literal>
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="DownloadedFile" HeaderText="DownloadedFile" 
                SortExpression="DownloadedFile" />
            <asp:BoundField DataField="DateDownLoaded" HeaderText="DateDownLoaded" 
                SortExpression="DateDownLoaded" />
            <asp:BoundField DataField="Ip" HeaderText="IP" 
                SortExpression="Ip" />
        </Columns>
        <EmptyDataTemplate>
        </EmptyDataTemplate>
        <HeaderStyle Font-Bold="True"/>
        <AlternatingRowStyle BackColor="LightGray" />
    </asp:GridView>
    </form>
</body>
</html>

