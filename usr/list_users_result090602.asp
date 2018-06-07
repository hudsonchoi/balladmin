<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim oConn, oRs
Dim strSQL, strOrder
Dim i

'On Error Resume Next
Server.ScriptTimeout = 450
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")
Set oRs = Server.CreateObject("ADODB.Recordset")


'strSQL = "SELECT * FROM licensee ORDER BY "&Request.Form("order")

strSQL = "SELECT licensee.Password, licensee.FirstName, licensee.LastName, legacyusers.Company, " & _
		"licensee.Phone, licensee.Email, licensee.Mlb, licensee.Minor, licensee.Alls, licensee.Coop, licensee.World, licensee.Mascot, licensee.Spring, licensee.Trend, licensee.Super " & _
		"FROM licensee INNER JOIN legacyusers ON licensee.cid = legacyusers.ID ORDER BY "
		
If Request.Form("order") = "Company" then
	strSQL = strSQL & "legacyusers."&Request.Form("order")
else
	strSQL = strSQL & "licensee."&Request.Form("order")
end if

'Response.Write strSQL&"<br>"
oRs.Open strSQL, oConn,adOpenStatic, adLockPessimistic, adCmdText

If Request.Form("type") = "Output to Excel" Then
	Response.ContentType = "application/vnd.ms-excel"
End If
	
%>
<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=2 width="620">
  <TR bgcolor="#003366"> 
	<TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">#</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Email</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Password</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">First Name</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Last Name</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Company</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Phone</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">MLB</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Coop</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">WS</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">ASG</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Minor</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Mascot</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Spring</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Trend</font></TD>
	<TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Super</font></TD>
  </TR>
<%
i=0
Do While not oRs.EOF%>
	<tr ALIGN="LEFT"> 
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"><font face="Arial, Helvetica, sans-serif" size="2"><%=i+1%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Email")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Password")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" ><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("FirstName")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" ><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("LastName")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" ><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Company")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" ><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Phone")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Mlb") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Coop") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("World") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Alls") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Minor") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Mascot") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Spring") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Trend") then Response.Write("o") else Response.Write("x") end if %></font></td>
	<TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Super") then Response.Write("o") else Response.Write("x") end if %></font></td>
   </tr>

	 <%
	 i = i+1
	 oRs.MoveNext
Loop
%>
</TABLE>

<%
oRs.Close
strSQL = "SELECT licensee.Password, licensee.FirstName, licensee.LastName, licensee.Company, " & _
		"licensee.Phone, licensee.Email, licensee.Mlb, licensee.Minor, licensee.Alls, licensee.Coop, licensee.World, licensee.Mascot, licensee.Spring, licensee.Trend, licensee.Super " & _
		"FROM licensee WHERE licensee.cid NOT IN (SELECT ID from legacyusers) ORDER BY licensee."&Request.Form("order")
		
'If Request.Form("order") = "Company" then
'	strSQL = strSQL & "legacyusers."&Request.Form("order")
'else
'	strSQL = strSQL & "licensee."&Request.Form("order")
'end if

'Response.Write strSQL&"<br>"
oRs.Open strSQL, oConn,adOpenStatic, adLockPessimistic, adCmdText

'If Request.Form("type") = "Output to Excel" Then
'	Response.ContentType = "application/vnd.ms-excel"
'End If
%>
<br>	
<font face="Arial, Helvetica, sans-serif" size="4" color="red"><b>The users whose companies are deleted:</b></font>
<br>
<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=2 width="620">
  <TR bgcolor="#003366"> 
	<TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">#</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Email</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Password</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">First Name</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Last Name</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Company</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Phone</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">MLB</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Coop</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">WS</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">ASG</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Minor</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Mascot</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Spring</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Trend</font></TD>
	<TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Super</font></TD>
  </TR>
<%
i=0
Do While not oRs.EOF%>
	<tr ALIGN="LEFT"> 
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"><font face="Arial, Helvetica, sans-serif" size="2"><%=i+1%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Email")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Password")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" ><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("FirstName")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" ><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("LastName")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" ><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Company")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" ><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Phone")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Mlb") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Coop") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("World") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Alls") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Minor") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Mascot") then Response.Write("o") else Response.Write("x") end if %></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Spring") then Response.Write("o") else Response.Write("x") end if %></font></td>
	<TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Trend") then Response.Write("o") else Response.Write("x") end if %></font></td>
	<TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>" align="center"><font face="Arial, Helvetica, sans-serif" size="2"><% if oRs("Super") then Response.Write("o") else Response.Write("x") end if %></font></td>
   </tr>

	 <%
	 i = i+1
	 oRs.MoveNext
Loop
%>
</TABLE>
<br>
<table width="620" border="0" cellspacing="0" cellpadding="2">
  <tr> 
    <td align="right"><font face="Arial, Helvetica, sans-serif" 
	size="2"><a href="/admin/">Return to Admin Home</a></font></td>
  </tr>
</table>

<%	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing %>


