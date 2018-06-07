<%@ Language=VBScript %>
<%
Set UserDelData = Session("UserDelData")
%>
<html> 
<head>
 
<title>Untitled Document</title>
 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#000033" leftmargin="0" topmargin="50" marginwidth="0" text="#FFFFFF">
<img src="/admin/images/home.gif" width="779" height="207"> <br>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/admin/images/inv.gif" width="150" height="1"></td>
    <td> 
      <p><font size="5" face="Arial, Helvetica, sans-serif"><b><font size="4"><a href="../default.asp"><font color="#FFFFFF">Administration</font></a>  
        || <a href="./deluser.asp"><font color="#FFFFFF">Delete A User</font></a></font></b></font><br>
        <br>
        <br>
<font size="3" face="Arial, Helvetica, sans-serif">Step 
        2 of 2: <i>Final Review</i></font></p>
        <font size="3" face="Arial, Helvetica, sans-serif"><b>Are you sure you want to delete the following user?</b></font>
      <form method="post" action="/admin/usr/xt_d_profile.asp" name="adduser1">
        <input type="hidden" name="formname" value="adduser.asp">
        <table border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">First 
              Name:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("FirstName")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Middle 
              Initial:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Middlei")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Last 
              Name:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("LastName")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Email:</font></td>
            <td nowrap><font size="2" face="Arial, Helvetica, sans-serif"> 
             <%=UserDelData.Item("Email")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Company:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Company")%>
              </font></td>
          </tr>
                    <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Contract#:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Contract")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Address:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Address1")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right">&nbsp;</td>
            <td nowrap><font size="2" face="Arial, Helvetica, sans-serif"> 
              &nbsp;<%=UserDelData.Item("Address2")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">City:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("City")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">State/Province:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("State")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Zip/Postal:
              Code</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Zip")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Phone:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Phone")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Fax:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Fax")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Country:</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Country")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Password:</font></td>
            <td nowrap><font size="2" face="Arial, Helvetica, sans-serif"> 
              <%=UserDelData.Item("Password")%>
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right" valign="top"><font size="2" face="Arial, Helvetica, sans-serif">Sections Allowed:</font></td>
            <td nowrap valign="top"><font size="2" face="Arial, Helvetica, sans-serif"> 
              <%
                if UserDelData.Item("Mlb") then
					Response.Write("MLB Style Guide<br>")
				end if
				if UserDelData.Item("Alls") then
					Response.Write("All Star Game<br>")
				end if
				if UserDelData.Item("World") then
					Response.Write("World Series<br>")
				end if
				if UserDelData.Item("Minor") then
					Response.Write("Minor League Style Guide<br>")
				end if
				if UserDelData.Item("Coop") then
					Response.Write("Cooperstown Collection<br>")
				end if
				             
              %>
              </font></td>
          </tr>
          <tr> 
            <td nowrap><input type="submit" name="goback" value="<- Go back"></td>
            <td nowrap> 
            <input type="submit" name="Submit" value="Positive!"> 
            </td>
          </tr>
        </table>
      </form> </td>
  </tr>
</table>
<br>
</body>
 </html>
