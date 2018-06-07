<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim i 
Dim oConn, oRs, oCmd
Dim myErr, strSQL, addstep, myTarget
Dim Mailer, strName, strBody

if not isEmpty (Request.Form("goback")) then 'Go back
	Response.Redirect("./deluser.asp")
end if


On Error Resume Next
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")

Set oCmd = Server.CreateObject("ADODB.Command")
oCmd.ActiveConnection = oConn
oCmd.CommandText = "DELETE  FROM licensee WHERE Email = '" & Replace(Session("UserDelData")("Email"), "'", "''") & "'"
oCmd.CommandType = 1
oCmd.Prepared = True
oCmd.Execute

If Err.number <> 0 Then
	Set oCmd.ActiveConnection = Nothing
	Set oCmd = Nothing
	oConn.Close
	Set oConn = Nothing
	Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))
Else 'Succeeded!!	
	Set oCmd.ActiveConnection = Nothing
	Set oCmd = Nothing
	oConn.Close
	Set oConn = Nothing
	Session("UserDelData").removeAll
	Response.Redirect("../confirm.asp?usr=d")
End If

%>
