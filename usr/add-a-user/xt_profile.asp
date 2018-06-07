<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
if not isEmpty (Request.Form("goback")) then 'Go back
	Response.Redirect("../default.asp")
end if
Dim oConn, oRs
Dim myErr, strSQL, addstep, myTarget
Dim em, pr

em=1 'The flag for the vaild email address format
pr=1 'The flag for checking primary key constraint
'un=1

On Error Resume Next

Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")
	myErr = 0
	myErr = ValidateUserInfo()
	'Response.Write "<br>myErr=" & myErr
	Session("UserEntryData").Item("FirstName") = Request.Form("FirstName")
	Session("UserEntryData").Item("Middlei") = Request.Form("Middlei")
	Session("UserEntryData").Item("LastName") = Request.Form("LastName")
	Session("UserEntryData").Item("Company") = Request.Form("Company")
	Session("UserEntryData").Item("Contract") = Request.Form("Contract")
	Session("UserEntryData").Item("Address1") = Request.Form("Address1")
	Session("UserEntryData").Item("Address2") = Request.Form("Address2")
	Session("UserEntryData").Item("City") = Request.Form("City")
	Session("UserEntryData").Item("State") = Request.Form("State")
	Session("UserEntryData").Item("Zip") = Request.Form("Zip")
	Session("UserEntryData").Item("Phone") = Request.Form("Phone")
	Session("UserEntryData").Item("Fax") = Request.Form("Fax")
	Session("UserEntryData").Item("Country") = Request.Form("Country")
	Session("UserEntryData").Item("Email") = Request.Form("Email")
	Session("UserEntryData").Item("Password") = Request.Form("Password")

	Session("MemberData").Item("FirstName") = Session("UserEntryData").Item("FirstName")
	Session("MemberData").Item("LastName") = Session("UserEntryData").Item("LastName")
	Session("MemberData").Item("Email") = Session("UserEntryData").Item("Email")
	Session("MemberData").Item("UserName") = Session("UserEntryData").Item("UserName")

	
	If myErr > 0 Then
		'myTarget = myTarget & "?err=" & CStr(myErr) & "&un=" & CStr(un) & "&em=" & CStr(em)
		myTarget = "profile.asp" & "?err=" & CStr(myErr) & "&pr=" & CStr(pr) & "&em=" & CStr(em)
	Else 
		myTarget = "permission.asp"
		'Session("MemberData").Item("addstep") = Session("MemberData").Item("addstep") + 1
	End If
	If Err.number <> 0 Then
		oRs.Close
		Set oRs = Nothing
		oConn.Close
		Set oConn = Nothing
		Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))'The final resort
	End if
	
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
	Response.Redirect myTarget '"/admin/usr/adduser.asp" & "?err=" & CStr(myErr) & "&un=" & CStr(un) & "&em=" & CStr(em)
	





'''''''''''''''''''''''''''''''''''''''''''''

Function ValidateUserInfo()
			
	Set oRs = Server.CreateObject("ADODB.Recordset")
	'oRs.Open "select * from licensee where UserName = '" & Replace(Request.Form("username"),"'","''") & "'", oConn, adOpenStatic, adLockPessimistic, adCmdText
	oRs.Open "select * from licensee where Email = '" & Replace(Request.Form("Email"),"'","''") & "'", oConn, adOpenStatic, adLockPessimistic, adCmdText 'The email became the primary key 021501
	
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
	
	If Len(Request.Form("FirstName")) < 1 Then
		Session("UserEntryErrors").Item("FirstName") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("FirstName") = ""
		Session("UserEntryData").Item("FirstName") = Request.Form("FirstName")
	End If
	
	If Len(Request.Form("LastName")) < 1 Then
		Session("UserEntryErrors").Item("LastName") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("LastName") = ""
		Session("UserEntryData").Item("LastName") = Request.Form("LastName")
	End If

	If Len(Request.Form("Company")) < 1 Then
		Session("UserEntryErrors").Item("Company") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("Company") = ""
		Session("UserEntryData").Item("Company") = Request.Form("Company")
	End If	

	If Len(Request.Form("Contract")) < 1 Then
		Session("UserEntryErrors").Item("Contract") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("Contract") = ""
		Session("UserEntryData").Item("Contract") = Request.Form("Contract")
	End If	
	
	If Len(Request.Form("Phone")) < 1 Then
		Session("UserEntryErrors").Item("Phone") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("Phone") = ""
		Session("UserEntryData").Item("Phone") = Request.Form("Phone")
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
		
	If Len(Request.Form("Email")) < 1 Then
		Session("UserEntryErrors").Item("Email") =  "flag"
		myErr = myErr + 1
	ElseIf InStr (1, Request.Form("Email"), "@") <= 1 or _
		InStr (1, Request.Form("Email"), "@") = Len (Request.Form("Email")) or _
		InStr (1, Request.Form("Email"), ".") = 0 Then
		Session("UserEntryData").Item("Email") = Request.Form("Email")
		Session("UserEntryErrors").Item("Email") =  "flag"
		myErr = myErr + 1
		em=0
	elseif oRs.RecordCount = 1 Then
		Session("UserEntryErrors").Item("Email") =  "flag"
		Session("UserEntryData").Item("Email") = Request.Form("Email")	
		myErr = myErr + 1
		pr=0
	else
		Session("UserEntryErrors").Item("Email") = ""
		Session("UserEntryData").Item("Email") = Request.Form("Email")
	End If
	
	If Len(Request.Form("Password")) < 1 Then
		Session("UserEntryErrors").Item("Password") =  "flag"
		myErr = myErr + 1
	Else
		Session("UserEntryErrors").Item("Password") = ""
		Session("UserEntryData").Item("Password") = Request.Form("Password")
	End If
	
	REM Put the non required field into the session variable for user convenience
	Session("UserEntryData").Item("Middlei") = Request.Form("Middlei")	
	Session("UserEntryData").Item("Address1") = Request.Form("Address1")
	Session("UserEntryData").Item("Address2") = Request.Form("Address2")
	Session("UserEntryData").Item("City") = Request.Form("City")
	Session("UserEntryData").Item("State") = Request.Form("State")
	Session("UserEntryData").Item("Zip") = Request.Form("Zip")
	Session("UserEntryData").Item("Fax") = Request.Form("Fax")
	Session("UserEntryData").Item("Country") = Request.Form("Country")
	
	oRs.Close
	Set oRs = Nothing
	
	ValidateUserInfo = myErr
	
End Function

If Err.number <> 0 Then
	Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))
End If

%>

