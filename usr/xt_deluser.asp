<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
if not isEmpty (Request.Form("goback")) then 'Go back
	Response.Redirect("../default.asp")
end if
Dim oConn, oRs
Dim myErr, strSQL, myTarget
Dim em, un
Dim myPassword, myFirstName, myMi, myLastName, myCompany, myContract, myAddress1, myAddress2, myCity, myState, myZip, myPhone, myFax, myCountry, myEmail, myMlb, myMinor, myAlls, myCoop, myWorld, myMascot, mySpring, myTrend, mySuper, myMlb2003, myCreative, myAlls2007

Session("UserDelData").removeAll

'On Error Resume Next

Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")
Set oRs = Server.CreateObject("ADODB.Recordset")

myTarget = "./d_profile.asp"

If Len (Request.Form("Email")) > 0 Then
	strSQL = "SELECT * FROM licensee WHERE Email='" & Replace(Request.Form("Email"), "'", "''") &"'"
	'Response.Write strSQL&"<br>"
	oRs.Open strSQL, oConn,adOpenStatic, adLockPessimistic, adCmdText
	If oRs.RecordCount > 0 Then
		REM Assigning RecordSet directly to Session variables causes 'Unknown Run time err'; It lost value after rs.close
		myPassword = oRs.Fields("Password")
		myFirstName = oRs.Fields("FirstName")
		myMi = oRs.Fields("MI")
		myLastName = oRs.Fields("LastName")
		myCompany = oRs.Fields("Company")
		myContract = oRs.Fields("Contract")
		myAddress1 = oRs.Fields("Address1")
		myAddress2 = oRs.Fields("Address2")
		myCity = oRs.Fields("City")
		myState = oRs.Fields("State")
		myZip = oRs.Fields("Zip")
		myPhone = oRs.Fields("Phone")
		myFax = oRs.Fields("Fax")
		myCountry = oRs.Fields("Country")
		myEmail = oRs.Fields("Email")
		myMlb = oRs.Fields("Mlb")
		myMinor = oRs.Fields("Minor")
		myAlls = oRs.Fields("Alls")
		myCoop = oRs.Fields("Coop")
		myWorld = oRs.Fields("World")
		myMascot = oRs.Fields("Mascot")
		mySpring = oRs.Fields("Spring")
		myTrend = oRs.Fields("Trend")
		mySuper = oRs.Fields("Super")
		myMlb2003 = oRs.Fields("Mlb2003")
		myCreative = oRs.Fields("Creative")
		myAlls2007 = oRs.Fields("Alls2007")
	
		Session("UserDelData").Item("Password")=myPassword
		Session("UserDelData").Item("FirstName")=myFirstName
		Session("UserDelData").Item("Middlei")=myMi
		Session("UserDelData").Item("LastName")=myLastName
		Session("UserDelData").Item("Company")=myCompany
		Session("UserDelData").Item("Contract")=myContract
		Session("UserDelData").Item("Address1")=myAddress1
		Session("UserDelData").Item("Address2")=myAddress2
		Session("UserDelData").Item("City")=myCity
		Session("UserDelData").Item("State")=myState
		Session("UserDelData").Item("Zip")=myZip
		Session("UserDelData").Item("Phone")=myPhone
		Session("UserDelData").Item("Fax")=myFax
		Session("UserDelData").Item("Country")=myCountry
		Session("UserDelData").Item("Email")=myEmail
		Session("UserDelData").Item("Mlb")=myMlb
		Session("UserDelData").Item("Minor")=myMinor
		Session("UserDelData").Item("Alls")=myAlls
		Session("UserDelData").Item("Coop")=myCoop
		Session("UserDelData").Item("World")=myWorld
		Session("UserDelData").Item("Mascot")=myMascot
		Session("UserDelData").Item("Spring")=mySpring
		Session("UserDelData").Item("Trend")=myTrend
		Session("UserDelData").Item("Super")=mySuper
		Session("UserDelData").Item("Mlb2003")=myMlb2003
		Session("UserDelData").Item("Creative")=myCreative
		Session("UserDelData").Item("Alls2007")=myAlls2007
		
		'myTarget = "/admin/usr/moduser.asp"
		'myTarget = "./profile.asp"
		'Session("MemberData").Item("modstep") = Session("MemberData").Item("modstep") + 1
	else
		myTarget = "./deluser.asp?un=0"
	End If
	
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
	'Response.Write("-->"&Session("UserDelData").Item("FirstName"))
	
End If

Response.Redirect myTarget


%>

