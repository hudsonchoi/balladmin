<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xls_UsersLoggedIn.aspx.cs" Inherits="xls_UsersLoggedIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Literal ID="ltrTitle" runat="server" Text=""></asp:Literal>
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" 
                SortExpression="UserLevel" />
            <asp:BoundField DataField="UserCategory" HeaderText="UserCategory" 
                SortExpression="UserCategory" />
            <asp:BoundField DataField="RequesterFN" HeaderText="MLBContactFN" 
                SortExpression="RequesterFN" />
            <asp:BoundField DataField="RequesterLN" HeaderText="MLBContactLN" 
                SortExpression="RequesterLN" />
             <asp:BoundField DataField="MLB2003LastLogin" HeaderText="ClubMarksLastLogin" 
                SortExpression="MLB2003LastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="SpringLastLogin" HeaderText="SpringLastLogin" 
                SortExpression="SpringLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="AllsLastLogin" HeaderText="AllStarsLastLogin" 
                SortExpression="AllsLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="WorldLastLogin" HeaderText="PostSeasonLastLogin" 
                SortExpression="WorldLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="CoopLastLogin" HeaderText="CoopersTownLastLogin" 
                SortExpression="CoopLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="MascotLastLogin" HeaderText="MascotsLastLogin" 
                SortExpression="MascotLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="MinorLastLogin" HeaderText="MinorLastLogin" 
                SortExpression="MinorLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="TrendLastLogin" HeaderText="ThemeArtLastLogin" 
                SortExpression="TrendLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="CreativeLastLogin" HeaderText="DesignServiceLastLogin" 
                SortExpression="CreativeLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="MarketingLastLogin" HeaderText="MarketingLastLogin" 
                SortExpression="MarketingLastLogin" Visible="false"/>
            <asp:BoundField DataField="description" HeaderText="Page" 
                SortExpression="description" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="RestrictedLastLogin" HeaderText="RestrictedLastLogin" 
                SortExpression="RestrictedLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="OpeningLastLogin" HeaderText="OpeningLastLogin" 
                SortExpression="OpeningLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="MascotBabiesLastLogin" HeaderText="MascotBabiesLastLogin" 
                SortExpression="MascotBabiesLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="PressBoxLastLogin" HeaderText="PressBoxLastLogin" 
                SortExpression="PressBoxLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="PlayballLastLogin" HeaderText="PlayballLastLogin" 
                SortExpression="PlayballLastLogin" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="LondonLastLogin" HeaderText="LondonLastLogin" 
                SortExpression="LondonLastLogin" Visible="false">
            </asp:BoundField>
        </Columns>
        <EmptyDataTemplate>
            Email
        </EmptyDataTemplate>
        <HeaderStyle Font-Bold="True"/>
        <AlternatingRowStyle BackColor="LightGray" />
    </asp:GridView>
    </form>
</body>
</html>
