<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<%
Dim i 
Dim oConn, oRs
Dim myErr, strSQL, addstep, myTarget
Dim Mailer, strName, strBody
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
	If Request.Form("section")(i) = "Mlb2003" then
		myMlb2003 = 1
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
next

if Len (Request.Form("goback")) > 0 then 'Go back
	myTarget = "m_profile.asp" & "?referer=1" & _
	"&1=" & Server.URLEncode(Request.Form("Password")) & _
	"&2=" & Server.URLEncode(Request.Form("FirstName")) & _
	"&3=" & Server.URLEncode(Request.Form("Middlei")) & _
	"&4=" & Server.URLEncode(Request.Form("LastName")) & _
	"&5=" & Server.URLEncode(Request.Form("Company")) & _
	"&6=" & Server.URLEncode(Request.Form("Contract")) & _
	"&7=" & Server.URLEncode(Request.Form("Address1")) & _
	"&8=" & Server.URLEncode(Request.Form("Address2")) & _
	"&9=" & Server.URLEncode(Request.Form("City")) & _
	"&10=" & Server.URLEncode(Request.Form("State")) & _
	"&11=" & Server.URLEncode(Request.Form("Zip")) & _
	"&12=" & Server.URLEncode(Request.Form("Country")) & _
	"&13=" & Server.URLEncode(Request.Form("Phone")) & _
	"&14=" & Server.URLEncode(Request.Form("Fax")) & _
	"&15=" & Server.URLEncode(Request.Form("Email")) & _
	"&16=" & Server.URLEncode(myMlb) & _
	"&17=" & Server.URLEncode(myMinor) & _
	"&18=" & Server.URLEncode(myAlls) & _
	"&19=" & Server.URLEncode(myCoop) & _
	"&20=" & Server.URLEncode(myWorld) & _
	"&21=" & Server.URLEncode(myMascot) & _
	"&22=" & Server.URLEncode(mySpring)
	
	bUTrendate = False
	For Each aState in stateArray 'Check State is US
		if aState = Request.Form("State") then
			bUTrendate = True
			Exit For
		end if
	Next
			
	if bUTrendate then
		myTarget = myTarget & "&23="
	else 'International
		myTarget = myTarget & "&23=" & Server.URLEncode(Request.Form("State"))
	end if
	myTarget = myTarget & "&24=" & Server.URLEncode(myTrend) & _
	"&25=" & Server.URLEncode(mySuper) & _
	"&26=" & Server.URLEncode(myMlb2003)
	Response.Redirect(myTarget)
end if



if Request.Form("section").Count = 0 then 'When nothing selected

	myTarget = "./m_permission.asp" & "?err=1" & _
	"&1=" & Server.URLEncode(Request.Form("Password")) & _
	"&2=" & Server.URLEncode(Request.Form("FirstName")) & _
	"&3=" & Server.URLEncode(Request.Form("Middlei")) & _
	"&4=" & Server.URLEncode(Request.Form("LastName")) & _
	"&5=" & Server.URLEncode(Request.Form("Company")) & _
	"&6=" & Server.URLEncode(Request.Form("Contract")) & _
	"&7=" & Server.URLEncode(Request.Form("Address1")) & _
	"&8=" & Server.URLEncode(Request.Form("Address2")) & _
	"&9=" & Server.URLEncode(Request.Form("City")) & _
	"&10=" & Server.URLEncode(Request.Form("State")) & _
	"&11=" & Server.URLEncode(Request.Form("Zip")) & _
	"&12=" & Server.URLEncode(Request.Form("Country")) & _
	"&13=" & Server.URLEncode(Request.Form("Phone")) & _
	"&14=" & Server.URLEncode(Request.Form("Fax")) & _
	"&15=" & Server.URLEncode(Request.Form("Email")) & _
	"&16=" & Server.URLEncode(myMlb) & _
	"&17=" & Server.URLEncode(myMinor) & _
	"&18=" & Server.URLEncode(myAlls) & _
	"&19=" & Server.URLEncode(myCoop) & _
	"&20=" & Server.URLEncode(myWorld) & _
	"&21=" & Server.URLEncode(myMascot) & _
	"&22=" & Server.URLEncode(mySpring)
	
	bUTrendate = False
	For Each aState in stateArray 'Check State is US
		if aState = Request.Form("State") then
			bUTrendate = True
		end if
	Next
			
	if bUTrendate then
		myTarget = myTarget & "&23="
	else 'International
		myTarget = myTarget & "&23=" & Server.URLEncode(Request.Form("State"))
	end if
	myTarget = myTarget & "&24=" & Server.URLEncode(myTrend)& _
	"&25=" & Server.URLEncode(mySuper) & _
	"&26=" & Server.URLEncode(myMlb2003)		
	
	Response.Redirect(myTarget)
end if

REM Take care of weird session variable issue.. Store them to local or null or garbage data will be stored..

'On Error Resume Next
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open Application("DB_ConnectionString")

Set oRs = Server.CreateObject("ADODB.Recordset")
oRs.Open "SELECT * FROM licensee WHERE Email = '" & Replace (Request.Form("Email"), "'", "''") & "'", oConn, adOpenKeyset, adLockPessimistic, adCmdText
oRs.Fields("FirstName") = Request.Form("FirstName")
oRs.Fields("MI") = Request.Form("Middlei")
oRs.Fields("LastName") = Request.Form("LastName")
oRs.Fields("Company") = Request.Form("Company")
oRs.Fields("Contract") = Request.Form("Contract")
oRs.Fields("Address1") = Request.Form("Address1")
oRs.Fields("Address2") = Request.Form("Address2")
oRs.Fields("City") = Request.Form("City")
oRs.Fields("State") = Request.Form("State")
oRs.Fields("Zip") = Request.Form("Zip")
oRs.Fields("Phone") = Request.Form("Phone")
oRs.Fields("Fax") = Request.Form("Fax")		
oRs.Fields("Country") = Request.Form("Country")
oRs.Fields("RegistrationDate") = now()
oRs.Fields("Email") = Request.Form("Email")				
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
If Err.number <> 0 Then
	REM Err handling when anything happens to DB server sending email the data to the admin
	Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
	Mailer.FromName   = "www.mlbstyleguide.com"
	Mailer.FromAddress= "hudsonc@axis360.com"
	Mailer.RemoteHost = "localhost"
	Mailer.ContentType = "text/html" 
	Mailer.AddRecipient "Hudson Choi", "hudsonc@axis360.com"
	Mailer.Subject = "The error has just been 'FIRED' at www.mlbstyleguide/admin/usr/xt_m_permission.asp"
	
	strBody = "Err.Description: " & Err.Description & "<br>" & Chr(10)
	strBody = strBody & "Err.Source: " & Err.Source & "<br><br>" & Chr(10) & Chr(10)
	strBody = strBody & "The licensee missed (Gotta be stored to db manually!!!):<br><br>" & Chr(10) & Chr(10)
	strBody = strBody & "FristName:" & Request.Form("FirstName") & "<br>" & Chr(10)
	strBody = strBody & "MI:" & Request.Form("Middlei") & "<br>" & Chr(10)
	strBody = strBody & "LastName:" & Request.Form("LastName") & "<br>" & Chr(10)
	strBody = strBody & "Company:" & Request.Form("Company") & "<br>" & Chr(10)
	strBody = strBody & "Contract:" & Request.Form("Contract") & "<br>" & Chr(10)
	strBody = strBody & "Address1:" & Request.Form("Address1") & "<br>" & Chr(10)
	strBody = strBody & "Address2:" & Request.Form("Address2") & "<br>" & Chr(10)
	strBody = strBody & "City:" & Request.Form("City") & "<br>" & Chr(10)
	strBody = strBody & "State:" & Request.Form("State") & "<br>" & Chr(10)
	strBody = strBody & "Zip:" & Request.Form("Zip") & "<br>" & Chr(10)
	strBody = strBody & "Phone:" & Request.Form("Phone") & "<br>" & Chr(10)
	strBody = strBody & "Fax:" & Request.Form("Fax") & "<br>" & Chr(10)
	strBody = strBody & "Country:" & Request.Form("Country") & "<br>" & Chr(10)
	strBody = strBody & "RegistrationDate:" & now() & "<br>" & Chr(10)
	strBody = strBody & "Email:" & Request.Form("Email") & "<br>" & Chr(10)
	strBody = strBody & "Password:" & Request.Form("Password") & "<br>" & Chr(10)
	strBody = strBody & "Mlb2002:" & myMlb & "<br>" & Chr(10)
	strBody = strBody & "Minor:" & myMinor & "<br>" & Chr(10)
	strBody = strBody & "Alls:" & myAlls & "<br>" & Chr(10)
	strBody = strBody & "Coop:" & myCoop & "<br>" & Chr(10)
	strBody = strBody & "World:" & myWorld & "<br>" & Chr(10)
	strBody = strBody & "Mascot:" & myMascot & "<br>" & Chr(10)
	strBody = strBody & "Spring:" & mySpring & "<br>" & Chr(10)
	strBody = strBody & "Trend:" & myTrend & "<br>" & Chr(10)
	strBody = strBody & "Super:" & mySuper & "<br>" & Chr(10)
	strBody = strBody & "Mlb2003:" & myMlb2003
	Mailer.BodyText = strBody

	If Mailer.SendMail Then
		oRs.Close
		Set oRs = Nothing
		oConn.Close
		Set oConn = Nothing
		'Response.Redirect("../confirm.asp?usr=m")'Nobody knows the problem but the admin
		Response.Redirect("../sorry.asp?err=unknown2")
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
	Response.Redirect("../confirm.asp?usr=m")
End If
%>


