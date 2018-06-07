<%@ Page Language="C#" AutoEventWireup="true" CodeFile="probe.aspx.cs" Inherits="probe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" CellSpacing="2" Font-Names="Arial" GridLines="None" AllowSorting="True" OnSorting="gvCompany_Sorting" OnRowDataBound="gvCompany_RowDataBound">
        <Columns>
                        <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="ID" HeaderText="Sitelet" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True"
                SortExpression="Status" HtmlEncode="False" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField> 
        </Columns>
        <AlternatingRowStyle BackColor="DimGray" />
    </asp:GridView>
    </div>
    </form>
</body>
</html>
