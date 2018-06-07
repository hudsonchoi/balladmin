<%@ Language=VBScript %>
<!--#include virtual = "/includes/validate_admin.inc" -->
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/xt_permission.asp" name="adduser2">
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
      <td> <font size="3" face="Arial, Helvetica, sans-serif">Step 2 of 2: <i>Set 
        permissions for <b><%=Session("MemberData").Item("Email")%></b>.</i><br> 
        <%If Request.QueryString <> "" Then 
			 Response.Write("<br><b><font face=Arial, Helvetica, sans-serif size=2 color=red>The licensee should have at least one permission..</font></b><br><br>")
		  End if
		%>
      
        </font> 
        <table border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td nowrap align="right"><img name="A" border="0" src="/portal/images/portal_nav_style_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <INPUT type="checkbox" id=checkbox1 name="section" value="Mlb"
          <% if Session("UserEntryData").Item("Mlb") then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="B" border="0" src="/portal/images/portal_nav_coop_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <INPUT type="checkbox" id=checkbox1 name="section" value="Coop"
          <% if Session("UserEntryData").Item("Coop") then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="C" border="0" src="/portal/images/portal_nav_ws_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <INPUT type="checkbox" id=checkbox1 name="section" value="World"
          <% if Session("UserEntryData").Item("World") then Response.Write("checked") end if%>> 
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="D" border="0" src="/portal/images/portal_nav_as_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <INPUT type="checkbox" id=checkbox1 name="section" value="Alls"
          <% if Session("UserEntryData").Item("Alls") then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="E" border="0" src="/portal/images/portal_nav_minor_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <INPUT type="checkbox" id=checkbox1 name="section" value="Minor"
          <% if Session("UserEntryData").Item("Minor") then Response.Write("checked") end if%>>
            </td>
          </tr>
           <tr> 
            <td nowrap align="right"><img src="/portal/images/portal_nav_mascot_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <INPUT type="checkbox" id=checkbox1 name="section" value="Mascot"
          <% if Session("UserEntryData").Item("Mascot") then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr align="center"> 
            <td colspan="2"> 
              <input type="submit" name="goback" value="&lt;&lt;&lt; Go Back">
              <input type="submit" name="Submit" value="Finish &gt;&gt;&gt;">
            </td>
          </tr>
        </table>
       </td>
  </tr>
</table>
  <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td> &nbsp; 
        
          <br>
      </td>
    </tr>
  </table>
  <br>
<br>    </form>
</body>
 </html>
