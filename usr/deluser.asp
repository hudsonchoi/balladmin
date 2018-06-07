<%@ Language=VBScript %>
<!--#include virtual = "/includes/validate_admin.inc" -->
<!-- #include virtual="/includes/Adovbs.inc" -->
<%

On Error Resume Next

Set UserDelData = Session("UserDelData")

%>
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/xt_deluser.asp" name="moduser1">
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
      
      <td> <font size="3" face="Arial, Helvetica, sans-serif">Step 1 of 2: <i>Enter 
        User's Email</i></font><br>
        <br>
    
        <table border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td nowrap align="right">&nbsp;</td>
            <td nowrap><font size="1" face="Arial, Helvetica, sans-serif">Email:</font></td>
          </tr>
          <%
		If Request.QueryString("un")="0" then
		    Response.Write("<tr><td>&nbsp;</td>")
            Response.Write("<td><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>")
			Response.Write("Invalid email!</font></b><br>")
			Response.Write("</td></tr>")
		End If
		%>
          <tr> 
            <td nowrap align="right">&nbsp;</td>
            <td nowrap><font size="2" face="Arial, Helvetica, sans-serif"> 
              <input type="text" name="Email" size="25" value="<%Response.Write(UserDelData.Item("Email"))%>">
              </font></td>
          </tr>
          <tr> 
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp; </td>
          </tr>
          <tr> 
            <td nowrap>&nbsp; </td>
            <td nowrap> <font face="Arial, Helvetica, sans-serif" size="2"> 
              <input type="submit" name="goback" value="&lt;&lt;&lt; Go back">
              <input type="submit" name="Submit" value="Continue &gt;&gt;&gt;">
              </font></td>
          </tr>
        </table>
      
      </td>
  </tr>
</table>
  <br>
<br></form>
</body>
 </html>
