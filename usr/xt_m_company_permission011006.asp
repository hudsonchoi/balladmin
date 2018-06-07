<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim i 
Dim oConn, oRs, oCmd
Dim myErr, strSQL, addstep, myTarget
Dim Mailer, strName, strBody
Dim myCompany, myEmail, myUserName, myPassword, myContract
Dim myAddress1, myAddress2, myCity, myState, myZip, myCountry, myPhone
Dim myMlb, myMinor, myAlls, myCoop, myWorld, myMascot, mySpring, myTrend, mySuper, myMlb2003
DIM stateArray, bUTrendate, aState
stateArray = Array ("Select a State","AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")

myMlb = 0
myMinor = 0
myAlls = 0
myCoop = 0
myWorld = 0
myMascot = 0
mySpring = 0
myTrend = 0
mySuper = 0
myMlb2003 = 0

For i=1 to Request.Form("section").Count 'Set the permission to be open
	If Request.Form("section")(i) = "Mlb" then
		myMlb = 1
	end if
	If Request.Form("section")(i) = "Minor" then
		myMinor = 1
	end if
	If Request.Form("section")(i) = "Alls" then
		myAlls = 1
	end if
	If Request.Form("section")(i) = "Coop" then
		myCoop = 1
	end if
	If Request.Form("section")(i) = "World" then
		myWorld = 1
	end if
	If Request.Form("section")(i) = "Mascot" then
		myMascot = 1
	end if
	If Request.Form("section")(i) = "Spring" then
		mySpring = 1
	end if
	If Request.Form("section")(i) = "Trend" then
		myTrend = 1
	end if
	If Request.Form("section")(i) = "Super" then
		mySuper = 1
	end if
	If Request.Form("section")(i) = "Mlb2003" then
		myMlb2003 = 1
	end if
next
	
if not isEmpty (Request.Form("goback")) then 'Go back
	myTarget = "m_company.asp" & "?referer=1" & _
	"&0=" & Server.URLEncode(Request.Form("ID")) & _
	"&1=" & Server.URLEncode(Request.Form("Company")) & _
	"&2=" & Server.URLEncode(Request.Form("Address1")) & _
	"&3=" & Server.URLEncode(Request.Form("Address2")) & _
	"&4=" & Server.URLEncode(Request.Form("City")) & _
	"&5=" & Server.URLEncode(Request.Form("State")) & _
	"&6=" & Server.URLEncode(Request.Form("Zip")) & _
	"&7=" & Server.URLEncode(Request.Form("Country")) & _
	"&8=" & Server.URLEncode(Request.Form("Phone")) & _
	"&9=" & Server.URLEncode(Request.Form("Email")) & _
	"&10=" & Server.URLEncode(Request.Form("Contract")) & _
	"&11=" & Server.URLEncode(Request.Form("UserName")) & _
	"&12=" & Server.URLEncode(Request.Form("Password")) & _
	"&13=" & Server.URLEncode(myMlb) & _
	"&14=" & Server.URLEncode(myMinor) & _
	"&15=" & Server.URLEncode(myAlls) & _
	"&16=" & Server.URLEncode(myCoop) & _
	"&17=" & Server.URLEncode(myWorld) & _
	"&18=" & Server.URLEncode(myMascot) & _
	"&19=" & Server.URLEncode(mySpring)
	
	bUTrendate = False
	For Each aState in stateArray 'Check State is US
		if aState = Request.Form("State") then
			bUTrendate = True
			Exit For
		end if
	Next
			
	if bUTrendate then
		myTarget = myTarget & "&20="
	else 'International
		myTarget = myTarget & "&20=" & Server.URLEncode(Request.Form("State"))
	end if
	myTarget = myTarget & "&21=" & Server.URLEncode(myTrend) & _
	"&22=" & Server.URLEncode(mySuper) & _
	"&23=" & Server.URLEncode(myMlb2003)
	Response.Redirect(myTarget)
end if

if Request.Form("section").Count = 0 then 'When nothing selected
	myTarget = "./m_company_permission.asp?err=1" & _
	"&0=" & Server.URLEncode(Request.Form("ID")) & _
	"&1=" & Server.URLEncode(Request.Form("Company")) & _
	"&2=" & Server.URLEncode(Request.Form("Address1")) & _
	"&3=" & Server.URLEncode(Request.Form("Address2")) & _
	"&4=" & Server.URLEncode(Request.Form("City")) & _
	"&5=" & Server.URLEncode(Request.Form("State")) & _
	"&6=" & Server.URLEncode(Request.Form("Zip")) & _
	"&7=" & Server.URLEncode(Request.Form("Country")) & _
	"&8=" & Server.URLEncode(Request.Form("Phone")) & _
	"&9=" & Server.URLEncode(Request.Form("Email")) & _
	"&10=" & Server.URLEncode(Request.Form("Contract")) & _
	"&11=" & Server.URLEncode(Request.Form("UserName")) & _
	"&12=" & Server.URLEncode(Request.Form("Password")) & _
	"&13=" & Server.URLEncode(myMlb) & _
	"&14=" & Server.URLEncode(myMinor) & _
	"&15=" & Server.URLEncode(myAlls) & _
	"&16=" & Server.URLEncode(myCoop) & _
	"&17=" & Server.URLEncode(myWorld) & _
	"&18=" & Server.URLEncode(myMascot) & _
	"&19=" & Server.URLEncode(mySpring)
	
	bUTrendate = False
	For Each aState in stateArray 'Check State is US
		if aState = Request.Form("State") then
			bUTrendate = True
			Exit For
		end if
	Next
			
	if bUTrendate then
		myTarget = myTarget & "&20="
	else 'International
		myTarget = myTarget & "&20=" & Server.URLEncode(Request.Form("State"))
	end if
	myTarget = myTarget & "&21=" & Server.URLEncode(myTrend) & _
	"&22=" & Server.URLEncode(mySuper) & _
	"&23=" & Server.URLEncode(myMlb2003)
	
	Response.Redirect(myTarget)
end if

REM Take care of weird session variable issue.. Store them to local or null or garbage data will be stored..
		

On Error Resume Next
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")

Set oRs = Server.CreateObject("ADODB.Recordset")
oRs.Open "SELECT * FROM legacyusers WHERE UserName = '" & Replace (Request.Form("UserName"), "'", "''") & "'", oConn, adOpenKeyset, adLockPessimistic, adCmdText
oRs.Fields("Company") = Request.Form("Company")
oRs.Fields("Address1") = Request.Form("Address1")
oRs.Fields("Address2") = Request.Form("Address2")
oRs.Fields("City") = Request.Form("City")
oRs.Fields("State") = Request.Form("State")
oRs.Fields("Zip") = Request.Form("Zip")
oRs.Fields("Country") = Request.Form("Country")
oRs.Fields("Phone") = Request.Form("Phone")
oRs.Fields("Email") = Request.Form("Email")
oRs.Fields("Contract") = Request.Form("Contract")
oRs.Fields("UserName") = Request.Form("UserName")			
oRs.Fields("Password") = Request.Form("Password")

oRs.Fields("Mlb") = myMlb
oRs.Fields("Minor") = myMinor
oRs.Fields("Alls") = myAlls
oRs.Fields("Coop") = myCoop
oRs.Fields("World") = myWorld
oRs.Fields("Mascot") = myMascot
oRs.Fields("Spring") = mySpring
oRs.Fields("Trend") = myTrend
oRs.Fields("Super") = mySuper
oRs.Fields("Mlb2003") = myMlb2003

oRs.Update

if Request.Form("modify") then
	Set oCmd = Server.CreateObject("ADODB.Command")
	oCmd.ActiveConnection = oConn
	oCmd.CommandText = "UPDATE licensee SET licensee.Mlb = " & myMlb & _
	", licensee.Minor = " & myMinor & _
	", licensee.Alls = " & myAlls & _
	", licensee.Coop = " & myCoop & _
	", licensee.World = " & myWorld & _
	", licensee.Mascot = " & myMascot & _
	", licensee.Spring = " & mySpring & _
	", licensee.Trend = " & myTrend & _
	", licensee.Super = " & mySuper & _
	", licensee.Mlb2003 = " & myMlb2003 & _
	"WHERE cid = " & Request.Form("ID")
	oCmd.CommandType = 1
	oCmd.Prepared = True
	oCmd.Execute
	Set oCmd = Nothing	'Response.Write("Company-->" & myCompany)
end if
If Err.number <> 0 Then
	REM Err handling when anything happens to DB server sending email the data to the admin
	Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
	Mailer.FromName   = "www.mlbstyleguide.com"
	Mailer.FromAddress= "info@mlbstyleguide.com"
	Mailer.RemoteHost = "localhost"
	Mailer.ContentType = "text/html" 
	Mailer.AddRecipient "Hudson Choi", "hudsonc@axis360.com"
	Mailer.Subject = "The error has just been 'FIRED' at www.mlbstyleguide/admin/usr/xt_m_company_permission.asp"
	
	strBody = "Err.Description: " & Err.Description & "<br>" & Chr(10)
	strBody = strBody & "Err.Source: " & Err.Source & "<br><br>" & Chr(10) & Chr(10)
	strBody = strBody & "The company missed (Gotta be stored to db manually!!!):<br><br>" & Chr(10) & Chr(10)
	strBody = strBody & "Company:" & Request.Form("Company") & "<br>" & Chr(10)
	strBody = strBody & "Address1:" & Request.Form("Address1") & "<br>" & Chr(10)
	strBody = strBody & "Address2:" & Request.Form("Address2") & "<br>" & Chr(10)
	strBody = strBody & "City:" & Request.Form("City") & "<br>" & Chr(10)
	strBody = strBody & "State:" & Request.Form("State") & "<br>" & Chr(10)
	strBody = strBody & "Zip:" & Request.Form("Zip") & "<br>" & Chr(10)
	strBody = strBody & "Country:" & Request.Form("Country") & "<br>" & Chr(10)
	strBody = strBody & "Phone:" & Request.Form("Phone") & "<br>" & Chr(10)
	strBody = strBody & "Email:" & Request.Form("Email") & "<br>" & Chr(10)
	strBody = strBody & "Contract:" & Request.Form("Contract") & "<br>" & Chr(10)
	strBody = strBody & "UserName:" & Request.Form("UserName") & "<br>" & Chr(10)
	strBody = strBody & "Password:" & Request.Form("Password") & "<br>" & Chr(10)

	strBody = strBody & "Mlb:" & myMlb & "<br>" & Chr(10)
	strBody = strBody & "Minor:" & myMinor & "<br>" & Chr(10)
	strBody = strBody & "Alls:" & myAlls & "<br>" & Chr(10)
	strBody = strBody & "Coop:" & myCoop & "<br>" & Chr(10)
	strBody = strBody & "World:" & myWorld & "<br>" & Chr(10)
	strBody = strBody & "Mascot:" & myMascot & "<br>" & Chr(10)
	strBody = strBody & "Spring:" & mySpring & "<br>" & Chr(10)
	strBody = strBody & "Trend:" & myTrend
	strBody = strBody & "Super:" & mySuper
	strBody = strBody & "Mlb2003:" & myMlb2003
		
	Mailer.BodyText = strBody

	If Mailer.SendMail Then
		oRs.Close
		Set oRs = Nothing
		oConn.Close
		Set oConn = Nothing
		'Response.Redirect("../confirm.asp?usr=m")'Nobody knows the problem but the admin
		Response.Redirect("../sorry.asp?err=unknown")
	else
		oRs.Close
		Set oRs = Nothing
		oConn.Close
		Set oConn = Nothing
		Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Mailer.Response))'The final resort
	End If
Else 'Succeeded!!	
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
	Response.Redirect("../confirm.asp?comp=m")
End If	

%>


