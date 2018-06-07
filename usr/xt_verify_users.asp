<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
if Request.Form("action") = "<<< Go Back" then
	Response.Redirect("../default.asp")
else
	Dim oConn, oCmd
	Dim i
	'On Error Resume Next
	Server.ScriptTimeout = 450
	Set oConn = Server.CreateObject("ADODB.Connection")
	oConn.Open Application("DB_ConnectionString")

	Set oCmd = Server.CreateObject("ADODB.Command")
	oCmd.ActiveConnection = oConn
	oCmd.CommandText = "UPDATE licensee SET Verify = 0" 'Make all of 'em no first
	oCmd.CommandType = 1
	oCmd.Prepared = True
	oCmd.Execute
	if Request.Form("verify").Count then
		For i = 1 to Request.Form("verify").Count
			oCmd.CommandText = "UPDATE licensee SET Verify = 1 WHERE ID =" & Request.Form("verify")(i)
			oCmd.Execute
		Next
	end if
	Set oCmd.ActiveConnection = Nothing
	Set oCmd = Nothing

	oConn.Close
	Set oConn = Nothing 
	Response.Redirect("verify_users.asp")
end if
%>



