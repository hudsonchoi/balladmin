<%@ Language=VBScript %>
<html><head>
<title>Untitled Document</title>
 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#000033" leftmargin="0" topmargin="50" marginwidth="0" text="#FFFFFF">
<img src="/admin/images/home.gif" width="779" height="207"><br>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/admin/images/inv.gif" width="150" height="1"></td>
    <td> 
      <p><font size="5" face="Arial, Helvetica, sans-serif"><b><font size="4">Administration 
        || Add A User</font></b></font><br>
        <br>
        <br>
       <font size="3" face="Arial, Helvetica, sans-serif">Step 
      3 of 3: <i>Generate Temporary Password for <%=Session("UserEntryData").Item("Email")%></i></font> <br>
      <br>
      	<%If Request.QueryString <> "" Then 
			 Response.Write("<b><font face=Arial, Helvetica, sans-serif size=2 color=red>The password has not been created..</font></b><br><br>")
		  End if %>
      <table border="0" cellspacing="0" cellpadding="4">
        <tr valign="top"> 
          <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Password:</font></td>
          <td nowrap><font size="2" face="Arial, Helvetica, sans-serif"><%=Session("UserEntryData").Item("Password")%></font></td>
          <td nowrap> 
            <form method="post" action="/admin/usr/xt_genpwd.asp" name="adduser2">
              <input type="submit" name="Submit" value="Generate">
            </form>
          </td>
        </tr><form method="post" action="/admin/usr/xt_saveuser.asp" name="saveuser">
        <tr>
          <td nowrap><input type="submit" name="goback" value="<- Go Back"></td>
          <td nowrap> 
              <input type="submit" name="Submit2" value="Add User">      
          </td>
          <td nowrap>&nbsp;</td>
        </tr>
        </form>
      </table>
   </td>
  </tr>
</table>
<br>
</body>
 </html>
