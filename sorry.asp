<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="images/404040.gif">
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
    <td width="100%" valign="top"> 
      <!--#include virtual="/includes/tablefill.ssi" -->
    </td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
    <td><img src="/portal/images/inv.gif" width="397" height="1"></td>
    <td><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
    <td><font size="2" face="Arial, Helvetica, sans-serif">
    <% if Request.QueryString("err") = "unknown2" then %>
		<br>
      Sorry.. The user information has 'NOT' been updated due to the unknown system problem..<br><br>
      Please, try it again by closing and reopening the browser.
      <br>
    <% elseif Request.QueryString("err") = "unknown" then %>
		<br>
      Sorry.. The company information has 'NOT' been updated due to the unknown system problem..<br><br>
      Please, try it again by closing and reopening the browser.
      <br>
    <% else %>
    <br>
      Sorry.. Currently there is a system problem:<br>
      <font color="#CC9900">'<%=Request.QueryString("err")%>'</font>.<br>
      We appreciate your help by sending an email to:<br>
      <a href="mailto:hudsonc@axis360.com">info@axis360.com</a></font><br>
      <br>
    <% end if %>
      <a href="/admin/"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2">Return 
      to Admin Home</font></a></td>
  </tr>
</table>
 
<br>
</body>
</html>
