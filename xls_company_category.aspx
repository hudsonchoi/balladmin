﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xls_company_category.aspx.cs" Inherits="xls_company_category" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" Font-Names="Arial" OnRowDataBound="gvCompany_RowDataBound">
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
            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" SortExpression="UserLevel" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="UserCategory" HeaderText="UserCategory" SortExpression="UserCategory" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="RequestorName" HeaderText="MLBContactName" ReadOnly="True"
                SortExpression="RequestorName" >
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
        <AlternatingRowStyle BackColor="LightGray"  />
    </asp:GridView>
    
    
    </div>
    </form>
</body>
</html>
