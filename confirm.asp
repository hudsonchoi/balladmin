<!--#include virtual = "/includes/validate_admin.inc" -->
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
      <% If Request.Querystring("usr") ="m" Then%>
      You have successfully <font color="#CC9900">modified</font> user's details.<br>
      <br>
      <a href="/admin/">Return to Admin Home</a><br>
      <br>
      <% ElseIf Request.Querystring("usr") ="a" Then%>
      You have successfully <font color="#CC9900">added</font> the user to the 
      database.<br>
      <br>
      A confirmation email has been sent to the user with a Username and Password.<br>
      <br>
      <a href="/admin/">Return 
      to Admin Home</a><br>
      <% ElseIf Request.Querystring("usr") ="d" Then%>
      You have successfully <font color="#CC9900">deleted</font> the user from 
      the database.<br>
      <br>
      <a href="/admin/">Return to Admin Home</a><br>
      <% ElseIf Request.Querystring("comp") ="m" Then%>
      You have successfully <font color="#CC9900">modified</font> the company information.<br>
      <br>
      <a href="/admin/">Return to Admin Home</a><br>
      <br>
      <% ElseIf Request.Querystring("comp") ="a" Then%>
      You have successfully <font color="#CC9900">added</font> the company to the 
      database.<br>
      <br>
      A confirmation email has been sent to the company with a Username and Password.<br>
      <br>
      <a href="/admin/">Return 
      to Admin Home</a><br>
      <% ElseIf Request.Querystring("comp") ="d" Then%>
      You have successfully <font color="#CC9900">deleted</font> the company from 
      the database.<br>
      <br>
      <a href="/admin/">Return to Admin Home</a><br>
      <%End If%>
      </font></td>
  </tr>
</table>
<br>

</body>
 </html>
