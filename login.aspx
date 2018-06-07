<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>:: MLB Style Guides ::</title>
</head>

<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="images/404040.gif">
<form id="form1" runat="server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/portal/images/inv.gif" width="1" height="30"></td>
    <td width="100">&nbsp;</td>
  </tr>
  <tr> 
    <td><img src="/portal/images/portal_head_admin.gif" width="510" height="89"></td>
    <td width="100">&nbsp;</td>
  </tr>
  <tr> 
    <td valign="top"> 
      <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"><img src="/portal/images/portal_arrow.gif" width="397" height="77"></td>
          <td valign="top"><img src="/portal/images/portal_majorleaguestyleguid.gif" width="362" height="77"></td>
        </tr>
      </table>
    </td>
    <td width="100%" valign="top" style="background-image:url('./images/bg.gif')"></td>
  </tr>
</table>

  <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top"> 
      <td><img src="/portal/images/inv.gif" width="397" height="1"></td>
      <td><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td> 
        <table border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td nowrap bgcolor="#333333"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#464646">
                <tr> 
                  <td align="center" colspan="2"><b><font face="Arial, Helvetica, sans-serif">Administrator 
                    Login</font></b></td>
                </tr>
                <tr> 
                  <td align="center" colspan="2">
                      <asp:Label ID="lblInvalid" runat="server" Text="Invalid Username and Password.." Visible="false" Font-Bold="true" ForeColor="Red" Font-Names="Arial, Helvetica, sans-serif" Font-Size="12px"></asp:Label>
                  </td>
                </tr>
                <tr> 
                  <td align="right"><b><font face="Arial, Helvetica, sans-serif" size="1">Username: 
                    </font></b></td>
                  <td><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbUsername" runat="server" Width="120"></asp:TextBox>
                    </font></td>
                </tr>
                <tr> 
                  <td align="right"><font face="Arial, Helvetica, sans-serif" size="1">Password: 
                    </font></td>
                  <td><font face="Arial, Helvetica, sans-serif" size="2"> 
                      <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="120"></asp:TextBox>
                    </font></td>
                </tr>
                <tr> 
                  <td align="center">&nbsp;</td>
                  <td><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"></asp:Button></font></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
 
</body>
 </html>
