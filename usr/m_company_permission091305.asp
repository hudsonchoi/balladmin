<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<!--#include virtual = "/includes/validate_admin.inc" -->
<%
Dim myID, myCompany, myAddress1, myAddress2, myCity, myState, myZip, myCountry, myPhone, myEmail
Dim myContract, myUserName,	myPassword,	myMlb, myMinor,	myAlls,	myCoop,	myWorld, myMascot, mySpring, myTrend, mySuper, myMlb2003

if Request.Form("Referer") = "m_company" then
	if not isEmpty (Request.Form("goback")) then 'Go back
		Response.Redirect("./modcompany.asp")
	end if
	Dim oConn, oRs
	Dim myErr, strSQL, addstep, myTarget
	Dim em, pr
	

	em=1 'The flag for the vaild email address format
	pr=1 'The flag for checking primary key constraint
	'un=1

	On Error Resume Next
	myErr = 0
	myErr = ValidateUserInfo()
	
	If myErr > 0 Then
		'myTarget = myTarget & "?err=" & CStr(myErr) & "&un=" & CStr(un) & "&em=" & CStr(em)
		myTarget = "m_company.asp" & "?err=" & CStr(myErr) & "&pr=" & CStr(pr) & "&em=" & CStr(em) & _
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
		"&13=" & Server.URLEncode(Request.Form("Mlb")) & _
		"&14=" & Server.URLEncode(Request.Form("Minor")) & _
		"&15=" & Server.URLEncode(Request.Form("Alls")) & _
		"&16=" & Server.URLEncode(Request.Form("Coop")) & _
		"&17=" & Server.URLEncode(Request.Form("World")) & _
		"&18=" & Server.URLEncode(Request.Form("Mascot")) & _
		"&19=" & Server.URLEncode(Request.Form("Spring")) & _
		"&20=" & Server.URLEncode(Request.Form("Province")) & _
		"&21=" & Server.URLEncode(Request.Form("Trend")) & _
		"&22=" & Server.URLEncode(Request.Form("Super")) & _
		"&23=" & Server.URLEncode(Request.Form("Mlb2003"))
		Response.Redirect(myTarget)
	'Else 
		'myTarget = "m_company_permission.asp"
		'Session("MemberData").Item("addstep") = Session("MemberData").Item("addstep") + 1
	End If
	myID = Request.Form("ID")
	myCompany = Request.Form("Company")
	myAddress1 = Request.Form("Address1")
	myAddress2 = Request.Form("Address2")
	myCity = Request.Form("City")
	If Request.Form("State") = "Select a State" then 'When state is NOT seleceted, get Province data!
		myState = Request.Form("Province")
	else 
		myState = Request.Form("State")
	end if
	myZip = Request.Form("Zip")
	myCountry = Request.Form("Country")
	myPhone = Request.Form("Phone")
	myEmail = Request.Form("Email")
	myContract = Request.Form("Contract")
	myUserName = Request.Form("UserName")
	myPassword = Request.Form("Password")
	myMlb = Request.Form("Mlb")
	myMinor = Request.Form("Minor")
	myAlls = Request.Form("Alls")
	myCoop = Request.Form("Coop")
	myWorld = Request.Form("World")
	myMascot = Request.Form("Mascot")
	mySpring = Request.Form("Spring")
	myTrend = Request.Form("Trend")
	mySuper = Request.Form("Super")
	myMlb2003 = Request.Form("Mlb2003")
	
	If Err.number <> 0 Then
		Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))'The final resort
	End if
elseif Len (Request.QueryString("err")) > 0 Then
	myID = Request.QueryString("0")
	myCompany = Request.QueryString("1")
	myAddress1 = Request.QueryString("2")
	myAddress2 = Request.QueryString("3")
	myCity = Request.QueryString("4")
	myState = Request.QueryString("5")
	myZip = Request.QueryString("6")
	myCountry = Request.QueryString("7")
	myPhone = Request.QueryString("8")
	myEmail = Request.QueryString("9")
	myContract = Request.QueryString("10")
	myUserName = Request.QueryString("11")
	myPassword = Request.QueryString("12")
	myMlb = Request.QueryString("13")
	myMinor = Request.QueryString("14")
	myAlls = Request.QueryString("15")
	myCoop = Request.QueryString("16")
	myWorld = Request.QueryString("17")
	myMascot = Request.QueryString("18")
	mySpring = Request.QueryString("19")
	myTrend = Request.QueryString("21")
	mySuper = Request.QueryString("22")
	myMlb2003 = Request.QueryString("23")
else
	Response.Redirect("../default.asp")
end if

%>
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/xt_m_company_permission.asp" name="adduser2">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="../../portal/images/inv.gif" width="1" height="30"></td>
    <td width="100">&nbsp;</td>
  </tr>
  <tr> 
    <td><img src="../../portal/images/portal_head_admin.gif" width="510" height="89"></td>
    <td width="100">&nbsp;</td>
  </tr>
    <tr> 
      <td valign="top"> 
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td valign="top"><img src="../../portal/images/portal_arrow.gif" width="397" height="77"></td>
            <td valign="top"><img src="../../portal/images/portal_majorleaguestyleguid.gif" width="362" height="77"></td>
          </tr>
        </table>
      </td>
      <td width="100%" valign="top"> 
        <!--#include virtual="/includes/tablefill.ssi" -->
      </td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
    <td><img src="../../portal/images/inv.gif" width="397" height="1"></td>
    <td><img src="../../portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td><font size="3" face="Arial, Helvetica, sans-serif"> <font size="3" face="Arial, Helvetica, sans-serif">Step 
        3 of 3: <i>Set permissions for <%=myCompany%><br>
        </i></font> 
        <%If Len (Request.QueryString("err")) > 0 Then 
			 Response.Write("<br><b><font face=Arial, Helvetica, sans-serif size=2 color=red>The licensee should have at least one permission..</font></b><br>")
		  End if
		%>
        <br>
        </font> 
        <table border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td nowrap align="right"><img name="A2003" border="0" src="../../portal/images/2006ClubMarks_OFF.gif" width="192" height="21"></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id="checkbox1" name="section" value="Mlb2003" <% if myMlb2003 then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr>
            <td nowrap align="right"><img name="E" border="0" src="../../portal/images/portal_nav_spring_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom">
              <input type="checkbox" id=checkbox1 name="section" value="Spring" <% if mySpring then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr>
            <td nowrap align="right"><img src="../../portal/images/2006OpeningDay_OFF.gif" width="192" height="21"></td>
            <td nowrap valign="bottom">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap align="right"><img name="D" border="0" src="../../portal/images/portal_nav_as_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom">
              <input type="checkbox" id=checkbox1 name="section" value="Alls" <% if myAlls then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr>
            <td nowrap align="right"><img name="C" border="0" src="../../portal/images/2006PostSeason_OFF.gif" width="192" height="21"></td>
            <td nowrap valign="bottom">
              <input type="checkbox" id=checkbox1 name="section" value="World" <% if myWorld then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="B" border="0" src="../../portal/images/portal_nav_coop_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom">
			<input type="checkbox" id=checkbox1 name="section" value="Coop" <% if myCoop then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr>
            <td nowrap align="right"><img src="../../portal/images/2006Mascot_OFF.gif" width="192" height="21"></td>
            <td nowrap valign="bottom">
              <input type="checkbox" id=checkbox1 name="section" value="Mascot" <% if myMascot then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="E" border="0" src="../../portal/images/portal_nav_minor_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id=checkbox1 name="section" value="Minor" <% if myMinor then Response.Write("checked") end if%>>
            </td>
          </tr><tr> 
            <td nowrap align="right"><img name="E" border="0" src="../../portal/images/portal_nav_trend_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id=checkbox1 name="section" value="Trend" <% if myTrend then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr>  
            <td colspan="2" align="right">
				<input type="checkbox" id=checkbox1 name="modify" value="True" checked><font size="2" face="Arial, Helvetica, sans-serif">
				Modify all users belong to this company</font>
             </td>
          </tr> 
          <tr> 
            <td colspan="2" align="center"> 
              <input type="hidden" name="ID" value="<%=myID%>">
			  <input type="hidden" name="Company" value="<%=myCompany%>">
			  <input type="hidden" name="Address1" value="<%=myAddress1%>">
			  <input type="hidden" name="Address2" value="<%=myAddress2%>">
			  <input type="hidden" name="City" value="<%=myCity%>">
			  <input type="hidden" name="State" value="<%=myState%>">
			  <input type="hidden" name="Zip" value="<%=myZip%>">
			  <input type="hidden" name="Country" value="<%=myCountry%>">
			  <input type="hidden" name="Phone" value="<%=myPhone%>">
			  <input type="hidden" name="Email" value="<%=myEmail%>">
			  <input type="hidden" name="Contract" value="<%=myContract%>">
			  <input type="hidden" name="UserName" value="<%=myUserName%>">
			  <input type="hidden" name="Password" value="<%=myPassword%>">
              <input type="submit" name="goback" value="&lt;&lt;&lt; Go Back">
              <input type="submit" name="Submit" value="Finish &gt;&gt;&gt;">
            </td>
          </tr>
        </table>
      </td>
  </tr>
</table>
  <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td> &nbsp; 
        
          <br>
      </td>
    </tr>
  </table>
  <br>
<br>    </form>
</body>
 </html>
 <%
Function ValidateUserInfo()
	Set oConn = Server.CreateObject("ADODB.Connection")
	oConn.Open Application("DB_ConnectionString")		
	Set oRs = Server.CreateObject("ADODB.Recordset")
	'oRs.Open "select * from licensee where UserName = '" & Replace(Request.Form("username"),"'","''") & "'", oConn, adOpenStatic, adLockPessimistic, adCmdText
	oRs.Open "select * from legacyusers where UserName = '" & Replace(Request.Form("UserName"),"'","''") & "'", oConn, adOpenStatic, adLockPessimistic, adCmdText 'The UserName became the primary key 050801

	If Len(Request.Form("Password")) < 1 Then
		myErr = myErr + 1
	End If
	
	If Len(Request.Form("Address1")) < 1 Then
		myErr = myErr + 1
	End If
	
	If Len(Request.Form("City")) < 1 Then
		myErr = myErr + 1
	End If
	
	If Request.Form("State") = "Select a State" and Len(Request.Form("Province")) < 1 Then
		myErr = myErr + 1
	End If
	
	If Len(Request.Form("Zip")) < 1 Then
		myErr = myErr + 1
	End If
	
	If Request.Form("Country") = "Select a Country" Then
		myErr = myErr + 1
	End If
		
	If Len(Request.Form("Company")) < 1 Then
		myErr = myErr + 1
	End If	
	
	If Request.Form("Email") = "NA" then
		'bypass
	ElseIf Len(Request.Form("Email")) < 1 Then
		myErr = myErr + 1
	ElseIf InStr (1, Request.Form("Email"), "@") <= 1 or _
		InStr (1, Request.Form("Email"), "@") = Len (Request.Form("Email")) or _
		InStr (1, Request.Form("Email"), ".") = 0 Then
		myErr = myErr + 1
		em=0
	End If
	
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
		
	ValidateUserInfo = myErr
	
End Function

If Err.number <> 0 Then
	Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))
End If

%>