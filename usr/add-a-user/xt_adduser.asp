<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim oConn, oRs
Dim myErr, strSQL, addstep, myTarget
Dim em, pr

addstep = Session("MemberData").Item("addstep")
'Response.Write "<br>addstep=" & addstep
If addstep = "1" Then
	Session("UserEntryErrors").removeAll 
	Session("UserEntryData").removeAll
End If

em=1 'The flag for the vaild email address format
pr=1 'The flag for checking primary key constraint
'un=1

'On Error Resume Next

Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")

If addstep ="1" Then

	myErr = 0
	myErr = ValidateUserInfo()
	'Response.Write "<br>myErr=" & myErr
	Session("UserEntryData").Item("salu") = Request.Form("salu")
	Session("UserEntryData").Item("middlei") = Request.Form("middlei")
	Session("UserEntryData").Item("address2") = Request.Form("address2")
	Session("UserEntryData").Item("phone") = Request.Form("phone")
	Session("UserEntryData").Item("fax") = Request.Form("fax")
	Session("UserEntryData").Item("country") = Request.Form("country")
	Session("UserEntryData").Item("accesslevel") = Request.Form("accesslevel")

	Session("MemberData").Item("FirstName") = Session("UserEntryData").Item("firstname")
	Session("MemberData").Item("LastName") = Session("UserEntryData").Item("lastname")
	Session("MemberData").Item("Email") = Session("UserEntryData").Item("Email")
	Session("MemberData").Item("UserName") = Session("UserEntryData").Item("UserName")

	
	If myErr > 0 Then
		'myTarget = myTarget & "?err=" & CStr(myErr) & "&un=" & CStr(un) & "&em=" & CStr(em)
		myTarget = "profile.asp" & "?err=" & CStr(myErr) & "&pr=" & CStr(pr) & "&em=" & CStr(em)
	Else 
		myTarget = permission.asp
		'Session("MemberData").Item("addstep") = Session("MemberData").Item("addstep") + 1
	End If
	Response.Redirect myTarget '"/admin/usr/adduser.asp" & "?err=" & CStr(myErr) & "&un=" & CStr(un) & "&em=" & CStr(em)
	
ElseIf addstep ="2" Then
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
		oRs.Fields("UserName") = Session("UserEntryData").Item("UserName")
		oRs.Fields("Salutation") = Session("UserEntryData").Item("salu")
		oRs.Fields("FirstName") = Session("UserEntryData").Item("firstname")
		oRs.Fields("LastName") = Session("UserEntryData").Item("lastname")
		oRs.Fields("MI") = Session("UserEntryData").Item("middlei")
		oRs.Fields("Company") = Session("UserEntryData").Item("company")
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
		oRs.Fields("Keyword") = Session("UserEntryData").Item("keyword")
		oRs.Fields("AccessLevel") = Session("UserEntryData").Item("accesslevel")
		oRs.Fields("Password") = Session("MemberData").Item("Password")
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
			'Response.Redirect("/content/sorry.asp")
			Response.Write "Mail send failure. Error: " & Mailer.Response
		End If
		
End If

oRs.Close
Set oRs = Nothing
oConn.Close
Set oConn = Nothing


'''''''''''''''''''''''''''''''''''''''''''''

Function ValidateUserInfo()
			
	Set oRs = Server.CreateObject("ADODB.Recordset")
	'oRs.Open "select * from licensee where UserName = '" & Replace(Request.Form("username"),"'","''") & "'", oConn, adOpenStatic, adLockPessimistic, adCmdText
	oRs.Open "select * from licensee where Email = '" & Replace(Request.Form("email"),"'","''") & "'", oConn, adOpenStatic, adLockPessimistic, adCmdText 'The email became the primary key 021501
	
	'If Len(Request.Form("username")) < 1 Then
	'	Session("UserEntryErrors").Item("UserName") =  "flag"
	'	myErr = myErr + 1
	'ElseIf oRs.RecordCount = 1 Then
	'	Session("UserEntryErrors").Item("UserName") =  "flag"
	'	Session("UserEntryData").Item("UserName") = Request.Form("username")	
	'	myErr = myErr + 1
	'	un=0
	'Else
	'	Session("UserEntryErrors").Item("UserName") = ""
	'	Session("UserEntryData").Item("UserName") = Request.Form("username")
	'End If
	
	If Len(Request.Form("firstname")) < 1 Then
		Session("UserEntryErrors").Item("firstname") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("firstname") = ""
		Session("UserEntryData").Item("firstname") = Request.Form("firstname")
	End If
	
	If Len(Request.Form("lastname")) < 1 Then
		Session("UserEntryErrors").Item("lastname") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("lastname") = ""
		Session("UserEntryData").Item("lastname") = Request.Form("lastname")
	End If

	If Len(Request.Form("company")) < 1 Then
		Session("UserEntryErrors").Item("company") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("company") = ""
		Session("UserEntryData").Item("company") = Request.Form("company")
	End If	

	'If Len(Request.Form("address1")) < 1 Then
	'	Session("UserEntryErrors").Item("address1") =  "flag"
	'	myErr = myErr + 1
	'Else
	'	Session("UserEntryErrors").Item("address1") = ""
	'	Session("UserEntryData").Item("address1") = Request.Form("address1")
	'End If
		
	'If Len(Request.Form("city")) < 1 Then
	'	Session("UserEntryErrors").Item("city") =  "flag"
	'	myErr = myErr + 1
	'Else
	'	Session("UserEntryErrors").Item("city") = ""
	'	Session("UserEntryData").Item("city") = Request.Form("city")
	'End If

	'If Len(Request.Form("state")) < 1 Then
	'	Session("UserEntryErrors").Item("state") =  "flag"
	'	myErr = myErr + 1
	'Else
	'	Session("UserEntryErrors").Item("state") = ""
	'	Session("UserEntryData").Item("state") = Request.Form("state")
	'End If

	'If Len(Request.Form("zip")) < 1 Then
	'	Session("UserEntryErrors").Item("zip") =  "flag"
	'	myErr = myErr + 1
	'Else
	'	Session("UserEntryErrors").Item("zip") = ""
	'	Session("UserEntryData").Item("zip") = Request.Form("zip")
	'End If

	'If Len(Request.Form("keyword")) < 1 Then
	'	Session("UserEntryErrors").Item("keyword") =  "flag"
	'	myErr = myErr + 1
	'Else
	'	Session("UserEntryErrors").Item("keyword") = ""
	'	Session("UserEntryData").Item("keyword") = Request.Form("keyword")
	'End If
		
	If Len(Request.Form("email")) < 1 Then
		Session("UserEntryErrors").Item("Email") =  "flag"
		myErr = myErr + 1
	ElseIf InStr (1, Request.Form("email"), "@") <= 1 or _
		InStr (1, Request.Form("email"), "@") = Len (Request.Form("email")) or _
		InStr (1, Request.Form("email"), ".") = 0 Then
		Session("UserEntryData").Item("Email") = Request.Form("email")
		Session("UserEntryErrors").Item("Email") =  "flag"
		myErr = myErr + 1
		em=0
	elseif oRs.RecordCount = 1 Then
		Session("UserEntryErrors").Item("Email") =  "flag"
		Session("UserEntryData").Item("Email") = Request.Form("email")	
		myErr = myErr + 1
		pr=0
	else
		Session("UserEntryErrors").Item("Email") = ""
		Session("UserEntryData").Item("Email") = Request.Form("email")
	End If
	
	oRs.Close
	Set oRs = Nothing
	
	ValidateUserInfo = myErr
	
End Function

If Err.number <> 0 Then
	Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))
End If

%>

