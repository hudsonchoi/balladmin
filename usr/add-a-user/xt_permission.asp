<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim i 
Dim oConn, oRs
Dim myErr, strSQL, addstep, myTarget
Dim Mailer, strName, strBody

if not isEmpty (Request.Form("goback")) then 'Go back
	Response.Redirect("profile.asp")
end if

if Request.Form("section").Count = 0 then 'When nothing selected
	Response.Redirect("permission.asp?err")
end if

REM Reset the permission to be blocked
Session("UserEntryData")("Mlb")=0
Session("UserEntryData")("Alls")=0
Session("UserEntryData")("World")=0
Session("UserEntryData")("Minor")=0
Session("UserEntryData")("Coop")=0
Session("UserEntryData")("Mascot")=0

For i=1 to Request.Form("section").Count 'Set the permission to be open
	Session("UserEntryData").Item(Request.Form("section")(i)) = 1
next


'On Error Resume Next
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")

Set oRs = Server.CreateObject("ADODB.Recordset")
oRs.Open "licensee", oConn, adOpenKeyset, adLockPessimistic, adCmdTable
		
oRs.AddNew
oRs.Fields("FirstName") = Session("UserEntryData").Item("FirstName")
oRs.Fields("MI") = Session("UserEntryData").Item("Middlei")
oRs.Fields("LastName") = Session("UserEntryData").Item("LastName")
oRs.Fields("Company") = Session("UserEntryData").Item("Company")
oRs.Fields("Contract") = Session("UserEntryData").Item("Contract")
oRs.Fields("Address1") = Session("UserEntryData").Item("Address1")
oRs.Fields("Address2") = Session("UserEntryData").Item("Address2")
oRs.Fields("City") = Session("UserEntryData").Item("City")
oRs.Fields("State") = Session("UserEntryData").Item("State")
oRs.Fields("Zip") = Session("UserEntryData").Item("Zip")
oRs.Fields("Phone") = Session("UserEntryData").Item("Phone")
oRs.Fields("Fax") = Session("UserEntryData").Item("Fax")		
oRs.Fields("Country") = Session("UserEntryData").Item("Country")
oRs.Fields("RegistrationDate") = now()
oRs.Fields("Email") = Session("UserEntryData").Item("Email")				
oRs.Fields("Password") = Session("UserEntryData").Item("Password")
oRs.Fields("Mlb") = Session("UserEntryData").Item("Mlb")
oRs.Fields("Minor") = Session("UserEntryData").Item("Minor")
oRs.Fields("Alls") = Session("UserEntryData").Item("Alls")
oRs.Fields("Coop") = Session("UserEntryData").Item("Coop")
oRs.Fields("World") = Session("UserEntryData").Item("World")
oRs.Fields("Mascot") = Session("UserEntryData").Item("Mascot")

REM Even though the default value is set at SQL Server, did it just in case e.g. trasferring table loosing default value etc.

oRs.Fields("MlbLoginCount") = 0
oRs.Fields("MinorLoginCount") = 0
oRs.Fields("CoopLoginCount") = 0
oRs.Fields("AllsLoginCount") = 0
oRs.Fields("WorldLoginCount") = 0
oRs.Fields("MascotLoginCount") = 0

oRs.Update
If Err.number <> 0 Then
	REM Err handling when anything happens to DB server sending email the data to the admin
	Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
	Mailer.FromName   = "www.mlbstyleguide.com"
	Mailer.FromAddress= "info@mlbstyleguide.com"
	Mailer.RemoteHost = "mail.axis360.com"
	Mailer.ContentType = "text/html" 
	Mailer.AddRecipient "Hudson Choi", "hudsonc@axis360.com"
	Mailer.Subject = "The error has just been 'FIRED' at www.mlbstyleguide/admin/usr/xt_permission.asp"
	
	strBody = "Err.Description: " & Err.Description & "<br>" & Chr(10)
	strBody = strBody & "Err.Source: " & Err.Source & "<br><br>" & Chr(10) & Chr(10)
	strBody = strBody & "The licensee missed (Gotta be stored to db manually!!!):<br><br>" & Chr(10) & Chr(10)
	strBody = strBody & "FristName:" & Session("UserEntryData").Item("FirstName") & "<br>" & Chr(10)
	strBody = strBody & "MI:" & Session("UserEntryData").Item("MI") & "<br>" & Chr(10)
	strBody = strBody & "LastName:" & Session("UserEntryData").Item("LastName") & "<br>" & Chr(10)
	strBody = strBody & "Company:" & Session("UserEntryData").Item("Company") & "<br>" & Chr(10)
	strBody = strBody & "Contract:" & Session("UserEntryData").Item("Contract") & "<br>" & Chr(10)
	strBody = strBody & "Address1:" & Session("UserEntryData").Item("Address1") & "<br>" & Chr(10)
	strBody = strBody & "Address2:" & Session("UserEntryData").Item("Address2") & "<br>" & Chr(10)
	strBody = strBody & "City:" & Session("UserEntryData").Item("City") & "<br>" & Chr(10)
	strBody = strBody & "State:" & Session("UserEntryData").Item("State") & "<br>" & Chr(10)
	strBody = strBody & "Zip:" & Session("UserEntryData").Item("Zip") & "<br>" & Chr(10)
	strBody = strBody & "Phone:" & Session("UserEntryData").Item("Phone") & "<br>" & Chr(10)
	strBody = strBody & "Fax:" & Session("UserEntryData").Item("Fax") & "<br>" & Chr(10)
	strBody = strBody & "Country:" & Session("UserEntryData").Item("Country") & "<br>" & Chr(10)
	strBody = strBody & "RegistrationDate:" & now() & "<br>" & Chr(10)
	strBody = strBody & "Email:" & Session("UserEntryData").Item("Email") & "<br>" & Chr(10)
	strBody = strBody & "Password:" & Session("UserEntryData").Item("Password") & "<br>" & Chr(10)
	strBody = strBody & "Mlb:" & Session("UserEntryData").Item("Mlb") & "<br>" & Chr(10)
	strBody = strBody & "Minor:" & Session("UserEntryData").Item("Minor") & "<br>" & Chr(10)
	strBody = strBody & "Alls:" & Session("UserEntryData").Item("Alls") & "<br>" & Chr(10)
	strBody = strBody & "Coop:" & Session("UserEntryData").Item("Coop") & "<br>" & Chr(10)
	strBody = strBody & "World:" & Session("UserEntryData").Item("World") & "<br>" & Chr(10)
	strBody = strBody & "Mascot:" & Session("UserEntryData").Item("Mascot") & "<br>" & Chr(10)
	
	Mailer.BodyText = strBody

	Session("UserEntryErrors").removeAll
	Session("UserEntryData").removeAll
	If Mailer.SendMail Then
		oRs.Close
		Set oRs = Nothing
		oConn.Close
		Set oConn = Nothing
		Response.Redirect("../confirm.asp?usr=a")'Nobody knows the problem but the admin
	else
		oRs.Close
		Set oRs = Nothing
		oConn.Close
		Set oConn = Nothing
		Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Mailer.Response))'The final resort
	End If
	
	
End If

Response.Cookies("Insensitive")("Email") = Session("MemberData").Item("Email")'To be filled into user name field at login page ...
Response.Cookies("Insensitive")("FirstName") = Session("MemberData").Item("FirstName")
Response.Cookies("Insensitive").expires = #1/18/2038 00:00:00#

REM Send the confirmation email
strName = 	Session("MemberData").Item("FirstName") & " " & Session("MemberData").Item("LastName")
Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
Mailer.FromName   = "www.mlbstyleguide.com"
Mailer.FromAddress= "info@mlbstyleguide.com"
Mailer.RemoteHost = "mail.axis360.com"
Mailer.ContentType = "text/html" 
Mailer.AddRecipient strName, Session("MemberData").Item("Email")
Mailer.Subject = "Welcome to the MLB Styleguide!"

strBody = "Hello "& Session("MemberData").Item("FirstName") & " " & Session("MemberData").Item("LastName") & ",<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "Thank you for "
strBody = strBody & "registering at www.mlbstyleguide.com.<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "Use your login information below:<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "Email: "& Session("UserEntryData").Item("Email") & "<br>" & Chr(10)
strBody = strBody & "Password: "& Session("UserEntryData").Item("Password") & "<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "You can login at <a href=""" & "http://" & Request.ServerVariables("SERVER_NAME") & "/default.asp?e=" & Server.URLEncode(Session("MemberData").Item("Email")) & """>http://"&Request.ServerVariables("SERVER_NAME")&"</a><br><br>" & chr(10) & chr(10)
strBody = strBody & "If you have any questions or need any other assistance, please contact us at <a href=""" & "mailto:info@mlbstyleguide.com"& """>info@mlbstyleguide.com</a>.<br><br>"  & Chr(10) & Chr(10)
strBody = strBody & "Thank you,<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "Major League Baseball Properties"

Mailer.BodyText = strBody


	
If Mailer.SendMail Then 'Success!!
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
	Session("UserEntryErrors").removeAll
	Session("UserEntryData").removeAll
	Response.Redirect("/admin/confirm.asp?usr=a")
elseif inStr (Mailer.Response, "503") then 
	REM Since the email is the primary key, delete the record out of db!
	oConn.Execute "DELETE FROM licensee WHERE Email = '"&Session("MemberData").Item("Email")&"'"
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
	Response.Redirect ("./profile.asp?em=2")
else
	Session("UserEntryErrors").removeAll
	Session("UserEntryData").removeAll
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
	Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Mailer.Response))
End If
		

%>

