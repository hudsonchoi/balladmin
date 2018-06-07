<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateProgress.aspx.cs" Inherits="UpdateProgress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
     <asp:Label ID="Label1" runat="server" Text="Label" Width="250px"></asp:Label>
                <br />
     <asp:Button ID="Button1" runat="server" Text="Button" Width="179px" OnClick="Button1_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br/>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <img src="images/ajax-loader.gif" /><br />
                Updating page...
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
       
    </form>
</body>
</html>
