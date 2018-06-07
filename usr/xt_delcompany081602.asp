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
Dim myUserName, myPassword, myCompany, myID, myEmail, myContract, myMlb, myMinor, myAlls, myCoop, myWorld, myMascot, mySpring, myTrend
Dim myAddress1, myAddress2, myCity, myState, myZip, myCountry, myPhone

Session("CompanyDelData").removeAll

'On Error Resume Next

Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")
Set oRs = Server.CreateObject("ADODB.Recordset")

strSQL = "SELECT * FROM legacyusers WHERE UserName='" & Replace(Request.Form("UserName"), "'", "''") &"'"
'Response.Write strSQL&"<br>"
oRs.Open strSQL, oConn,adOpenStatic, adLockPessimistic, adCmdText
If oRs.RecordCount > 0 Then
	REM Assigning RecordSet directly to Session variables causes 'Unknown Run time err'; It lost value after rs.close
	myCompany = oRs.Fields("Company")
	myID = oRs.Fields("ID")
	myAddress1 = oRs.Fields("Address1")
	myAddress2 = oRs.Fields("Address2")
	myCity = oRs.Fields("City")
	myState = oRs.Fields("State")
	myZip = oRs.Fields("Zip")
	myCountry = oRs.Fields("Country")
	myPhone = oRs.Fields("Phone")
	myEmail = oRs.Fields("Email")
	myContract = oRs.Fields("Contract")
	myUserName = oRs.Fields("UserName")
	myPassword = oRs.Fields("Password")
	
	myMlb = oRs.Fields("Mlb")
	myMinor = oRs.Fields("Minor")
	myAlls = oRs.Fields("Alls")
	myCoop = oRs.Fields("Coop")
	myWorld = oRs.Fields("World")
	myMascot = oRs.Fields("Mascot")
	mySpring = oRs.Fields("Spring")
	myTrend = oRs.Fields("Trend")
	
	Session("CompanyDelData").Item("Company")=myCompany
	Session("CompanyDelData").Item("ID")=myID
	Session("CompanyDelData").Item("Address1")=myAddress1
	Session("CompanyDelData").Item("Address2")=myAddress2
	Session("CompanyDelData").Item("City")=myCity
	Session("CompanyDelData").Item("State")=myState
	Session("CompanyDelData").Item("Zip")=myZip
	Session("CompanyDelData").Item("Country")=myCountry
	Session("CompanyDelData").Item("Phone")=myPhone
	Session("CompanyDelData").Item("Email")=myEmail
	Session("CompanyDelData").Item("Contract")=myContract
	Session("CompanyDelData").Item("UserName")=myUserName
	Session("CompanyDelData").Item("Password")=myPassword
	
	Session("CompanyDelData").Item("Mlb")=myMlb
	Session("CompanyDelData").Item("Minor")=myMinor
	Session("CompanyDelData").Item("Alls")=myAlls
	Session("CompanyDelData").Item("Coop")=myCoop
	Session("CompanyDelData").Item("World")=myWorld
	Session("CompanyDelData").Item("Mascot")=myMascot
	Session("CompanyDelData").Item("Spring")=mySpring
	Session("CompanyDelData").Item("Trend")=myTrend
	
	myTarget = "./d_company.asp"
else
	myTarget = "./delcompany.asp?un=0"
End If
	
oRs.Close
Set oRs = Nothing
oConn.Close
Set oConn = Nothing
'Response.Write("-->"&Session("CompanyDelData").Item("UserName"))
Response.Redirect myTarget


%>

