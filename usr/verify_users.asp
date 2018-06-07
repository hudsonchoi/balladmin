<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim oConn, oRs
Dim strSQL, strOrder
Dim iTotal, iVerify
Dim i
'On Error Resume Next
Server.ScriptTimeout = 450
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")
Set oRs = Server.CreateObject("ADODB.Recordset")

strSQL = "SELECT count(*) as myCount FROM licensee"
oRs.Open strSQL, oConn,adOpenStatic, adLockPessimistic, adCmdText
iTotal = oRs("myCount")
oRs.Close
strSQL = "SELECT count(*) as myCount FROM licensee Where Verify = 1"
oRs.Open strSQL, oConn,adOpenStatic, adLockPessimistic, adCmdText
iVerify = oRs("myCount")
oRs.Close


strSQL = "SELECT ID, Email, Verify FROM licensee ORDER BY Email"
oRs.Open strSQL, oConn,adOpenStatic, adLockPessimistic, adCmdText

		
%>
<script language="JavaScript">
<!--Hide
function SetChecked(val) {
	dul=document.userList;
	len = dul.elements.length;
	//alert ("Bingo" + len)
	//var i=0;
	for( i=0 ; i<len ; i++) {
	//	if (dul.elements[i].name=='verify') {
			dul.elements[i].checked=val;
	//	}
	}
	//return
}
//-->
</script>
<form action="xt_verify_users.asp" method="post" name="userList">

<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=2>
   <TR> 
	<TD colspan="3"><table width="100%"><tr><td><input type="submit" name="action" value="<<< Go Back"> <input type="submit" name="action" value="Update"></td><td align="center" valign="bottom"><font face="Arial, Helvetica, sans-serif" size="1"><%=iVerify%> out of <%=iTotal%> are checked.</font></td><td align="right" valign="bottom"><font face="Arial, Helvetica, sans-serif" size="2"><a href="javascript:SetChecked(1)">Check All</a> - <a href="javascript:SetChecked(0)">Clear All</a></font></td></tr></table></TD>
  </TR>
  <TR bgcolor="#003366"> 
	<TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">#</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Email</font></TD>
    <TD><font face="Arial, Helvetica, sans-serif" size="2" color="#CCCCCC">Yes</font></TD>
  </TR>
<%
i=0
Do While not oRs.EOF%>
	<tr ALIGN="LEFT"> 
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"><font face="Arial, Helvetica, sans-serif" size="2"><%=i+1%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"><font face="Arial, Helvetica, sans-serif" size="2"><%=oRs("Email")%></font></td>
    <TD bgcolor="<% if i mod 2 = 0 then Response.Write("#e8e8e8") else Response.Write("#cccccc") end if %>"> 
    <input type="checkbox" name="verify" value="<%=oRs("ID")%>"<% if oRs("Verify") then Response.Write("checked") end if %>>
   </tr>

	 <%
	 i = i+1
	 oRs.MoveNext
Loop
%>
   <TR> 
	<TD colspan="3"><table width="100%"><tr><td><input type="submit" name="action" value="<<< Go Back"> <input type="submit" name="action" value="Update"></td><td align="center" valign="bottom"><font face="Arial, Helvetica, sans-serif" size="1"><%=iVerify%> out of <%=iTotal%> are checked.</font></td><td align="right" valign="bottom"><font face="Arial, Helvetica, sans-serif" size="2"><a href="javascript:SetChecked(1)">Check All</a> - <a href="javascript:SetChecked(0)">Clear All</a></font></td></tr></table></TD>
  </TR>
</TABLE>
<%	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing %>
</form>


