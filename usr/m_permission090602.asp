<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<!--#include virtual = "/includes/validate_admin.inc" -->
<%
Dim myID, myCompany, myAddress1, myAddress2, myCity, myState, myZip, myCountry, myPhone, myFax, myEmail
Dim myContract, myFirstName, myMi, myLastName, myPassword, myMlb, myMinor, myAlls, myCoop, myWorld, myMascot, mySpring, myProvince, myTrend, mySuper

if Request.Form("Referer") = "m_profile" then
	if not isEmpty (Request.Form("goback")) then 'Go back
		Response.Redirect("./moduser.asp")
	end if
	Dim oConn, oRs
	Dim myErr, strSQL, addstep, myTarget
	Dim em, pr

	em=1 'The flag for the vaild email address format
	pr=1 'The flag for checking primary key constraint
	'un=1

	'On Error Resume Next

	myErr = 0
	myErr = ValidateUserInfo()
	
	If myErr > 0 Then
		myTarget = "m_profile.asp" & "?err=" & CStr(myErr) & "&pr=" & CStr(pr) & "&em=" & CStr(em) & _
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
		"&16=" & Server.URLEncode(Request.Form("Mlb")) & _
		"&17=" & Server.URLEncode(Request.Form("Minor")) & _
		"&18=" & Server.URLEncode(Request.Form("Alls")) & _
		"&19=" & Server.URLEncode(Request.Form("Coop")) & _
		"&20=" & Server.URLEncode(Request.Form("World")) & _
		"&21=" & Server.URLEncode(Request.Form("Mascot")) & _
		"&22=" & Server.URLEncode(Request.Form("Spring")) & _
		"&23=" & Server.URLEncode(Request.Form("Province")) & _
		"&24=" & Server.URLEncode(Request.Form("Trend")) & _
		"&25=" & Server.URLEncode(Request.Form("Super"))
		Response.Redirect(myTarget)
	End If
	
	myFirstName = Request.Form("FirstName")
	myMi = Request.Form("Middlei")
	myLastName = Request.Form("LastName")
	myCompany = Request.Form("Company")
	myContract = Request.Form("Contract")
	myAddress1 = Request.Form("Address1")
	myAddress2 = Request.Form("Address2")
	myCity = Request.Form("City")
	If Request.Form("State") = "Select a State" then 'When state is NOT seleceted, get Province data!
		myState = Request.Form("Province")
	else 
		myState = Request.Form("State")
	end if
	'myState = Request.Form("State")
	myZip = Request.Form("Zip")
	myPhone = Request.Form("Phone")
	myFax = Request.Form("Fax")
	myCountry = Request.Form("Country")
	myEmail = Request.Form("Email")
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
	
	If Err.number <> 0 Then
		Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))'The final resort
	End if

	'Response.Redirect myTarget '"/admin/usr/adduser.asp" & "?err=" & CStr(myErr) & "&un=" & CStr(un) & "&em=" & CStr(em)
		
elseif Len (Request.QueryString("err")) > 0 Then
	myPassword = Request.QueryString("1")
	myFirstName = Request.QueryString("2")
	myMi = Request.QueryString("3")
	myLastName = Request.QueryString("4")
	myCompany = Request.QueryString("5")
	myContract = Request.QueryString("6")
	myAddress1 = Request.QueryString("7")
	myAddress2 = Request.QueryString("8")
	myCity = Request.QueryString("9")
	myState = Request.QueryString("10")
	myZip = Request.QueryString("11")
	myCountry = Request.QueryString("12")
	myPhone = Request.QueryString("13")
	myFax = Request.QueryString("14")
	myEmail = Request.QueryString("15")
	
	myMlb = Request.QueryString("16")
	myMinor = Request.QueryString("17")
	myAlls = Request.QueryString("18")
	myCoop = Request.QueryString("19")
	myWorld = Request.QueryString("20")
	myMascot = Request.QueryString("21")
	mySpring = Request.QueryString("22")
	myTrend = Request.QueryString("24")
	mySuper = Request.QueryString("25")
else
	Response.Redirect("../default.asp")
end if





If Err.number <> 0 Then
	Response.Redirect ("../sorry.asp?err="&Server.URLEncode(Err.Description))
End If

%>

<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/xt_m_permission.asp" name="adduser2">
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
        3 of 3: <i>Set permissions for <%=myEmail%><br>
        </i></font> 
        <%If Len (Request.QueryString("err")) > 0 Then 
			 Response.Write("<br><b><font face=Arial, Helvetica, sans-serif size=2 color=red>The licensee should have at least one permission..</font></b><br>")
		  End if
		%>
        <br>
        </font> 
        <table border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td nowrap align="right"><LABEL FOR="checkbox2"><img name="A" border="0" src="../../portal/images/portal_nav_style_1.gif" width="192" height="22"></LABEL></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id="checkbox1" name="section" value="Mlb"
          <% if myMlb then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="B" border="0" src="../../portal/images/portal_nav_coop_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom">
			<input type="checkbox" id=checkbox1 name="section" value="Coop"
          <% if myCoop then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="E" border="0" src="../../portal/images/portal_nav_spring_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id=checkbox1 name="section" value="Spring"
          <% if mySpring then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="super" border="0" src="../../portal/images/portal_nav_super_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id=checkbox1 name="section" value="Super"
          <% if mySuper then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="C" border="0" src="../../portal/images/portal_nav_ws_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom">
            <input type="checkbox" id=checkbox1 name="section" value="World"
          <% if myWorld then Response.Write("checked") end if%>> 
              
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="D" border="0" src="../../portal/images/portal_nav_as_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom">
            <input type="checkbox" id=checkbox1 name="section" value="Alls"
          <% if myAlls then Response.Write("checked") end if%>> 
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="E" border="0" src="../../portal/images/portal_nav_minor_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id=checkbox1 name="section" value="Minor"
          <% if myMinor then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="E" border="0" src="../../portal/images/portal_nav_mascot_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id=checkbox1 name="section" value="Mascot"
          <% if myMascot then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td nowrap align="right"><img name="E" border="0" src="../../portal/images/portal_nav_trend_1.gif" width="192" height="22"></td>
            <td nowrap valign="bottom"> 
              <input type="checkbox" id=checkbox1 name="section" value="Trend"
          <% if myTrend then Response.Write("checked") end if%>>
            </td>
          </tr>
          <tr> 
            <td colspan="2" align="right">
              <input type="hidden" name="FirstName" value="<%=myFirstName%>">
              <input type="hidden" name="Middlei" value="<%=myMi%>">
              <input type="hidden" name="LastName" value="<%=myLastName%>">
			  <input type="hidden" name="Company" value="<%=myCompany%>">
			  <input type="hidden" name="Contract" value="<%=myContract%>">
			  <input type="hidden" name="Address1" value="<%=myAddress1%>">
			  <input type="hidden" name="Address2" value="<%=myAddress2%>">
			  <input type="hidden" name="City" value="<%=myCity%>">
			  <input type="hidden" name="State" value="<%=myState%>">
			  <input type="hidden" name="Zip" value="<%=myZip%>">
			  <input type="hidden" name="Country" value="<%=myCountry%>">
			  <input type="hidden" name="Phone" value="<%=myPhone%>">
			  <input type="hidden" name="Fax" value="<%=myFax%>">
			  <input type="hidden" name="Email" value="<%=myEmail%>">
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
'''''''''''''''''''''''''''''''''''''''''''''

Function ValidateUserInfo()
	Set oConn = Server.CreateObject("ADODB.Connection")
	oConn.Open Application("DB_ConnectionString")		
	Set oRs = Server.CreateObject("ADODB.Recordset")
	'oRs.Open "select * from licensee where UserName = '" & Replace(Request.Form("username"),"'","''") & "'", oConn, adOpenStatic, adLockPessimistic, adCmdText
	oRs.Open "select * from licensee where Email = '" & Replace(Request.Form("Email"),"'","''") & "'", oConn, adOpenStatic, adLockPessimistic, adCmdText 'The email became the primary key 021501
	
	If Len(Request.Form("FirstName")) < 1 Then
		myErr = myErr + 1
	End If
	
	If Len(Request.Form("LastName")) < 1 Then
		myErr = myErr + 1
	End If
	
	If Len(Request.Form("Phone")) < 1 Then
		myErr = myErr + 1
	End If
		
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
	
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
	
	ValidateUserInfo = myErr
	
End Function
%>