<%@ Language=VBScript %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%

On Error Resume Next

Set UserDelData = Session("UserDelData")

%>
<html>
 
<head>
 
<title>MLB.NET :: Administration :: Modify a User</title>
 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#000033" leftmargin="0" topmargin="50" marginwidth="0" text="#FFFFFF">
<img src="../images/home.gif" width="779" height="207"><br>
<table border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="../images/inv.gif" width="150" height="1"></td>
    <td> <font size="5" face="Arial, Helvetica, sans-serif"><b> <a href="../default.asp"><font color="#FFFFFF"> 
      </font></a></b></font><br>
      <br>
      <br>
<font size="3" face="Arial, Helvetica, sans-serif">Step 
      1 of 2: <i>Enter User's Email</i></font><br>
      <br>
      <form method="post" action="/admin/usr/xt_deluser.asp" name="moduser1">
        <table border="0" cellspacing="0" cellpadding="4">
          <%
		If Request.QueryString("un")="0" then
		    Response.Write("<tr><td>&nbsp;</td>")
            Response.Write("<td><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>")
			Response.Write("Invalid email!</font></b><br>")
			Response.Write("</td></tr>")
		End If
		%> 
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Email:</font></td>
            <td nowrap><font size="2" face="Arial, Helvetica, sans-serif"> 
              <input type="text" name="Email" size="30" value="<%Response.Write(UserDelData.Item("Email"))%>">
              </font></td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap>&nbsp;</td>
            <td nowrap>&nbsp; 
              
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap><input type="submit" name="goback" value="<- Go back"></td>
            <td nowrap> 
              <input type="submit" name="Submit" value="Continue ->">
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
        </table>
      </form>
 </td>
  </tr>
</table>
<br>
</body>
 
</html>
