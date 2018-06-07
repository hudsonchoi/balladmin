<%@ Language=VBScript %>
<html> 
<head>
 
<title>Untitled Document</title>
 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#000033" leftmargin="0" topmargin="50" marginwidth="0" text="#FFFFFF">
<img src="/admin/images/home.gif" width="779" height="207"><br>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/admin/images/inv.gif" width="150" height="1"></td>
    <td> &nbsp;
            <p><font size="5" face="Arial, Helvetica, sans-serif"><b><font size="4"><a href="../default.asp"><font color="#FFFFFF">Administration</font></a> 
        || <a href="./moduser.asp"><font color="#FFFFFF">Modifiy A User</font></a></font></b></font><br>
        <br>
		<%If Request.QueryString <> "" Then 
			 Response.Write("<b><font face=Arial, Helvetica, sans-serif size=2 color=red>The licensee should have at least one permission..</font></b><br><br>")
		  End if
		%>
       <font size="3" face="Arial, Helvetica, sans-serif">Step 
      3 of 3: <i>Give the permission to <%=Session("UserModifyData").Item("Email")%></i></font> <br>
      <form method="post" action="/admin/usr/xt_m_permission.asp" name="adduser2">
      <table border="0" cellspacing="0" cellpadding="4">
        <tr> 
          <td nowrap align="right"><INPUT type="checkbox" id=checkbox1 name="section" value="Mlb"
          <% if Session("UserModifyData").Item("Mlb") then Response.Write("checked") end if%>></td>
          <td nowrap><font size="2" face="Arial, Helvetica, sans-serif">MLB Style Guide</font></td>
        </tr>
        <tr> 
          <td nowrap align="right"><INPUT type="checkbox" id=checkbox1 name="section" value="World"
          <% if Session("UserModifyData").Item("World") then Response.Write("checked") end if%>></td>
          <td nowrap><font size="2" face="Arial, Helvetica, sans-serif">World Series</font></td>
        </tr>
        <tr> 
          <td nowrap align="right"><INPUT type="checkbox" id=checkbox1 name="section" value="Alls"
          <% if Session("UserModifyData").Item("Alls") then Response.Write("checked") end if%>></td>
          <td nowrap><font size="2" face="Arial, Helvetica, sans-serif">All Star Game</font></td>
        </tr>
        <tr> 
          <td nowrap align="right"><INPUT type="checkbox" id=checkbox1 name="section" value="Minor"
          <% if Session("UserModifyData").Item("Minor") then Response.Write("checked") end if%>></td>
          <td nowrap><font size="2" face="Arial, Helvetica, sans-serif">Minor League Style Guide</font></td>
        </tr>
        <tr> 
          <td nowrap align="right"><INPUT type="checkbox" id=checkbox1 name="section" value="Coop"
          <% if Session("UserModifyData").Item("Coop") then Response.Write("checked") end if%>></td>
          <td nowrap><font size="2" face="Arial, Helvetica, sans-serif">Cooperstown Collection</font></td>
        </tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
        <tr> 
          <td nowrap><input type="submit" name="goback" value="<- Go Back"></td>
          <td nowrap> 
            
              <input type="submit" name="Submit2" value="Finish">
           
          </td>
        </tr>
      </table>
     </form>
    </td>
  </tr>
</table>
<br>
</body>
 </html>
