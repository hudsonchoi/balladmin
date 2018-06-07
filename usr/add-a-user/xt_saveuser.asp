<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim oConn, oRs
Dim myErr, strSQL, addstep, myTarget

if not isEmpty (Request.Form("goback")) then
	Response.Redirect("permission.asp")
end if

if isEmpty (Session("UserEntryData").Item("Password")) then 'When nothing selected
	Response.Redirect("saveuser.asp?err")
end if

'On Error Resume Next
'if false then
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")

Set oRs = Server.CreateObject("ADODB.Recordset")
oRs.Open "licensee", oConn, adOpenKeyset, adLockPessimistic, adCmdTable
		
'		Response.Write "<br>" & Session("UserEntryData").Item("UserName")
'		Response.Write "<br>" & Session("UserEntryData").Item("salu")
'		Response.Write "<br>" & Session("UserEntryData").Item("firstname")
'		Response.Write "<br>" & Session("UserEntryData").Item("lastname")
'		Response.Write "<br>" & Session("UserEntryData").Item("middlei")
'		Response.Write "<br>" & Session("UserEntryData").Item("company")
'		Response.Write "<br>" & Session("UserEntryData").Item("address1")
'		Response.Write "<br>" & Session("UserEntryData").Item("address2")
'		Response.Write "<br>" & Session("UserEntryData").Item("city")
'		Response.Write "<br>" & Session("UserEntryData").Item("state")
'		Response.Write "<br>" & Session("UserEntryData").Item("zip")
'		Response.Write "<br>" & Session("UserEntryData").Item("phone")
'		Response.Write "<br>" & Session("UserEntryData").Item("fax")		
'		Response.Write "<br>" & Session("UserEntryData").Item("country")
'		Response.Write "<br>" & now()
'		Response.Write "<br>" & Session("UserEntryData").Item("Email")				
'		Response.Write "<br>" & Session("UserEntryData").Item("keyword")
'		Response.Write "<br>" & Session("UserEntryData").Item("accesslevel")
'		Response.Write "<br>" & Session("MemberData").Item("Password")		
		
oRs.AddNew
'oRs.Fields("UserName") = Session("UserEntryData").Item("UserName")
'oRs.Fields("Salutation") = Session("UserEntryData").Item("salu")
oRs.Fields("FirstName") = Session("UserEntryData").Item("firstname")
oRs.Fields("MI") = Session("UserEntryData").Item("middlei")
oRs.Fields("LastName") = Session("UserEntryData").Item("lastname")
oRs.Fields("Company") = Session("UserEntryData").Item("company")
oRs.Fields("Contract") = Session("UserEntryData").Item("contract")
oRs.Fields("Address1") = Session("UserEntryData").Item("address1")
oRs.Fields("Address2") = Session("UserEntryData").Item("address2")
oRs.Fields("City") = Session("UserEntryData").Item("city")
oRs.Fields("State") = Session("UserEntryData").Item("state")
oRs.Fields("Zip") = Session("UserEntryData").Item("zip")
oRs.Fields("Phone") = Session("UserEntryData").Item("phone")
oRs.Fields("Fax") = Session("UserEntryData").Item("fax")		
oRs.Fields("Country") = Session("UserEntryData").Item("country")
oRs.Fields("RegistrationDate") = now()
oRs.Fields("Email") = Session("UserEntryData").Item("Email")				
'oRs.Fields("Keyword") = Session("UserEntryData").Item("keyword")
'oRs.Fields("AccessLevel") = Session("UserEntryData").Item("accesslevel")
oRs.Fields("Password") = Session("UserEntryData").Item("Password")
oRs.Fields("mlb") = Session("UserEntryData").Item("mlb")
oRs.Fields("minor") = Session("UserEntryData").Item("minor")
oRs.Fields("alls") = Session("UserEntryData").Item("alls")
oRs.Fields("coop") = Session("UserEntryData").Item("coop")
oRs.Fields("world") = Session("UserEntryData").Item("world")
oRs.Update
If Err.number <> 0 Then
	Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))
End If

Response.Cookies("Insensitive")("username") = Session("MemberData").Item("UserName")'To be filled into user name field at login page ...
Response.Cookies("Insensitive")("FirstName") = Session("MemberData").Item("FirstName")
Response.Cookies("Insensitive").expires = #1/18/2038 00:00:00#

Dim Mailer, strName, strBody

strName = 	Session("MemberData").Item("FirstName") & " " & Session("MemberData").Item("LastName")
Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
Mailer.FromName   = "www.mlb.net"
Mailer.FromAddress= "info@mlb.net"
Mailer.RemoteHost = "mail.axis360.com"
Mailer.ContentType = "text/html" 
Mailer.AddRecipient strName, Session("MemberData").Item("Email")
Mailer.Subject = "Welcome to the MLB Net!"
	
strBody = "Hello "& Session("MemberData").Item("FirstName") & " " & Session("MemberData").Item("LastName") & ",<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "Thank you for "
strBody = strBody & "registering at the MLB Net.<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "Your login information is:<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "Username: "&Session("MemberData").Item("UserName") & "<br>" & Chr(10)
strBody = strBody & "Password: "&Session("MemberData").Item("Password") & "<br><br>" & Chr(10) & Chr(10)
strBody = strBody & "You can login at <a href=""" & "http://" & Request.ServerVariables("SERVER_NAME") & """>http://www.mlb.net/</a><br><br>" & chr(10) & chr(10)
strBody = strBody & "If you have any questions or need any other assistance, please contact us at <a href=""" & "mailto:info@mlb.net"& """>info@mlb.net</a>.<br><br>"  & Chr(10) & Chr(10)
strBody = strBody & "The MLB Net Team<br>" & Chr(10)
strBody = strBody & "<a href=""" & "http://" & Request.ServerVariables("SERVER_NAME") &""">http://www.mlb.net</a>"

Mailer.BodyText = strBody

Session("UserEntryErrors").removeAll
Session("UserEntryData").removeAll
	
If Mailer.SendMail Then
	Response.Redirect("/admin/confirm.asp?usr=a")
else
	esponse.Write "Mail send failure. Error: " & Mailer.Response
End If
		
oRs.Close
Set oRs = Nothing
oConn.Close
Set oConn = Nothing
'end if



If Err.number <> 0 Then
	Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))
End If

%>

