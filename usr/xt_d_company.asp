<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim i 
Dim oConn, oRs, oCmd
Dim myErr, strSQL, addstep, myTarget
Dim Mailer, strName, strBody
Dim CompanyDelData

if not isEmpty (Request.Form("goback")) then 'Go back
	Response.Redirect("./delcompany.asp")
end if

Set CompanyDelData = Session("CompanyDelData")

On Error Resume Next
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")

Set oCmd = Server.CreateObject("ADODB.Command")
oCmd.ActiveConnection = oConn
oCmd.CommandText = "DELETE  FROM legacyusers WHERE UserName = '" & Replace (CompanyDelData.Item("UserName"), "'", "''") & "'"
oCmd.CommandType = 1
oCmd.Prepared = True
oCmd.Execute

if Request.Form("delusers") then
	oCmd.CommandText = "DELETE  FROM licensee WHERE cid = " & CompanyDelData.Item("ID")
	oCmd.CommandType = 1
	oCmd.Prepared = True
	oCmd.Execute
end if

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
	Response.Redirect("../confirm.asp?comp=d")
End If

%>
