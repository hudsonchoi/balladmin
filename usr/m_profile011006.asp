<%@ Language=VBScript %>
<% Option Explicit %>
<!-- #include virtual="/includes/Adovbs.inc" -->
<!--#include virtual = "/includes/validate_admin.inc" -->

<%
Dim strMode, i
DIM stateArray
stateArray = Array ("NA","AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")
DIM bBelongToCompany 'Flag for those whose company gets deleted 101001
bBelongToCompany = True
if Request.Form("Referer") = "moduser" then 'When it's from moduser.asp via Post
	Dim oConn, oRs, aState, bUTrendate
	Dim myErr, strSQL, myTarget
	Dim em, un
	Dim myPassword, myFirstName, myMi, myLastName, myCompany, myContract, myAddress1, myAddress2, myCity, myState, myZip, myPhone, myFax, myCountry, myEmail, myMlb, myMinor, myAlls, myCoop, myWorld, myMascot, mySpring, myProvince, myTrend, mySuper, myMlb2003

	if not isEmpty (Request.Form("goback")) then 'Go back
		Response.Redirect("../default.asp")
	end if
	em=1
	un=1

	'On Error Resume Next

	Set oConn = Server.CreateObject("ADODB.Connection")
	oConn.Open Application("DB_ConnectionString")
	Set oRs = Server.CreateObject("ADODB.Recordset")

	'myTarget = "/admin/usr/moduser.asp?un=0"


	If Len(Request.Form("Email")) > 0 Then
		'Session("MemberData").Item("Email") = Request.Form("Email")
		strSQL = "SELECT licensee.Password, licensee.FirstName, licensee.MI, licensee.LastName, legacyusers.Company, " & _
		"legacyusers.Contract, licensee.Address1, licensee.Address2, licensee.City, licensee.State, licensee.Zip, " & _
		"licensee.Phone, licensee.Fax, licensee.Country, licensee.Email, licensee.Mlb, licensee.Minor, licensee.Alls, licensee.Coop, licensee.World, licensee.Mascot, licensee.Spring, licensee.Trend, licensee.Super, licensee.Mlb2003 " & _
		"FROM licensee INNER JOIN legacyusers ON licensee.cid = legacyusers.ID WHERE licensee.Email ='" & Replace(Request.Form("Email"), "'", "''") &"'"
		'Response.Write strSQL&"<br>"
		oRs.Open strSQL, oConn,adOpenStatic, adLockPessimistic, adCmdText
		If oRs.RecordCount > 0 Then
			REM Assigning RecordSet directly to Session variables causes 'Unknown Run time err'; It lost value after rs.close
			If Len (oRs.Fields("Password")) = 0 or isNull (oRs.Fields("Password")) then myPassword="NA" else myPassword = oRs.Fields("Password") end if
			If Len (oRs.Fields("FirstName")) = 0 or isNull (oRs.Fields("FirstName")) then myFirstName="NA" else myFirstName = oRs.Fields("FirstName") end if
			myMi = oRs.Fields("MI")
			If Len (oRs.Fields("LastName")) = 0 or isNull (oRs.Fields("LastName")) then myLastName="NA" else myLastName = oRs.Fields("LastName") end if			
			myCompany = oRs.Fields("Company")
			myContract = oRs.Fields("Contract")
			If Len (oRs.Fields("Address1")) = 0 or isNull (oRs.Fields("Address1")) then myAddress1="NA" else myAddress1 = oRs.Fields("Address1") end if			
			myAddress2 = oRs.Fields("Address2")
			If Len (oRs.Fields("City")) = 0 or isNull (oRs.Fields("City")) then myCity="NA" else myCity = oRs.Fields("City") end if	
			bUTrendate = False
			if Len (oRs.Fields("State")) = 0 or isNull (oRs.Fields("State")) then
				bUTrendate = True 'in order to select drop-down
				myState = "NA"
			else
				For Each aState in stateArray 'Check State is US
					if aState = oRs.Fields("State") then
						bUTrendate = True
						Exit For
					end if
				Next
			
				if bUTrendate then
					myState = oRs.Fields("State")
				else 'International
					myProvince = oRs.Fields("State")
				end if
			end if
			
			'myState = oRs.Fields("State")
			If Len (oRs.Fields("Zip")) = 0 or isNull (oRs.Fields("Zip")) then myZip="NA" else myZip = oRs.Fields("Zip") end if	
			If Len (oRs.Fields("Phone")) = 0 or isNull (oRs.Fields("Phone")) then myPhone="NA" else myPhone = oRs.Fields("Phone") end if	
			myFax = oRs.Fields("Fax")
			If Len (oRs.Fields("Country")) = 0 or isNull (oRs.Fields("Country")) then myCountry="NA" else myCountry = oRs.Fields("Country") end if	
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
		else
			bBelongToCompany = FALSE
			oRs.Close
			strSQL = "SELECT * FROM licensee WHERE licensee.Email ='" & Replace(Request.Form("Email"), "'", "''") &"'"
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
				bUTrendate = False
				'For i = 1 to Ubound (stateArray)
				For Each aState in stateArray 'Check State is US
					if aState = oRs.Fields("State") then
						bUTrendate = True
						Exit For
					end if
				Next
			
				if bUTrendate then
					myState = oRs.Fields("State")
				else 'International
					myProvince = oRs.Fields("State")
				end if
			
				'myState = oRs.Fields("State")
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
			else
				oRs.Close
				Set oRs = Nothing
				oConn.Close
				Set oConn = Nothing
				Response.Redirect "./moduser.asp?un=0"
			end if
		End If
		oRs.Close
		Set oRs = Nothing
		oConn.Close
		Set oConn = Nothing
	ELSE
		Response.Redirect "./moduser.asp?un=0"
	End If

elseif Len (Request.QueryString("err")) > 0 or Len (Request.QueryString("referer")) > 0 Then
			
	strMode = "validation"
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
	myProvince = Request.QueryString("23")
	myTrend = Request.QueryString("24")
	mySuper = Request.QueryString("25")
	myMlb2003 = Request.QueryString("26")
	
else 'Invalid accessing so go back to home
	Response.Redirect("../default.asp")
end if
%>
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/m_permission.asp" name="adduser1">
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
      <td> <font size="3" face="Arial, Helvetica, sans-serif">Step 2 of 3: <i>Modify 
        User Details</i><b><br>
        <br>
        </b></font> 
        <%
				If Request.QueryString("err") <> "" Then 
					If Request.QueryString("err") = "1" Then
						Response.Write("<b><font face=Arial, Helvetica, sans-serif size=2 color=red>There is an error.<br>Please complete the missing information below.</font></b><br><br>")
					Else 
						Response.Write("<b><font face=Arial, Helvetica, sans-serif size=2 color=red>There are " & Request.QueryString("err") & " errors.<br>Please complete the missing info below.</font></b><br><br>")
					End If
				End If 
			%>
        <input type="hidden" name="formname" value="adduser.asp">
        <% If not bBelongToCompany then
				Response.Write("<b><font face=Arial, Helvetica, sans-serif size=4 color=red>Notice!</font><font face=Arial, Helvetica, sans-serif size=2 color=red> " & myFirstName & " " & myLastName & "'s company, " & myCompany & ", has been DELETED!!</font></b><br><br>")
		   end if %>
        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr> 
            <td>
              <table border="0" cellspacing="1" cellpadding="2">
                <tr bgcolor="#404040"> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td nowrap bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" color="#CC9900">* 
                    = Required Fields / NA = Not Available</font></td>
                </tr>
                <%
		If Request.QueryString("pr")="0" then
		    Response.Write("<tr><td>&nbsp;</td>")
            Response.Write("<td><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>")
			Response.Write("The email <font face=Arial, Helvetica, sans-serif size=2 color=white> '"& myEmail & "' </font>  is already in use!<br>Please choose another email.</font></b><br>")
			Response.Write("</td></tr>")
		End If
		%>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myFirstName) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>First 
                    Name*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="FirstName" size="20" value="<%=myFirstName%>">
                    </font></td>
                </tr>
                <tr bgcolor="#404040">
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Middle 
                    Initial:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Middlei" size="2" value="<%=myMi%>">
                    </font></td>
                </tr>
                <tr>
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myLastName) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Last 
                    Name*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="LastName" size="20" value="<%=myLastName%>">
                    </font></td>
                </tr>
                <% if Request.QueryString("em")="0" then 
					Response.Write("<tr><td>&nbsp;</td>")
					Response.Write("<td><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>The email seems to be invalid.</font></b><br>")
					Response.Write("</td></tr>")
			 elseif Request.QueryString("em")="2" then 
					Response.Write("<tr><td>&nbsp;</td>")
					Response.Write("<td><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>Your email seems to be not working. Please, verify if it is working.</font></b><br>")
					Response.Write("</td></tr>")
			 end if%>
                <tr bgcolor="#404040">
                  <td nowrap align="right" bgcolor="#464646"><b><font size="1" face="Arial, Helvetica, sans-serif">Email:</font></b></td>
                  <td nowrap bgcolor="#464646"><b><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=myEmail%>
                    </font></b>
                    <input type="hidden" name="Email" Value="<%=myEmail%>"></td>
                </tr>
                <tr>
                  <td nowrap align="right" bgcolor="#464646"><b><font size="1" face="Arial, Helvetica, sans-serif">Company:</font></b></td>
                  <td nowrap bgcolor="#464646"><b><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=myCompany%>
                    </font></b> 
                    <input type="hidden" name="Company" value="<%=myCompany%>">
                    </td>
                </tr>
                <tr bgcolor="#404040">
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Contract 
                    Number:</font></td>
                  <td nowrap bgcolor="#464646"><b><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=myContract%>
                    <input type="hidden" name="Contract" value="<%=myContract%>">
                    </font></b></td>
                </tr>
                <tr>
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myAddress1) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Address 1*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Address1" size="25" value="<%=myAddress1%>">
                    </font></td>
                </tr>
                <tr bgcolor="#404040">
               <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address 2:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Address2" size="25" value="<%=myAddress2%>">
                    </font></td>
                </tr>
                <tr>
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myCity) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>City*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="City" size="20" value="<%=myCity%>">
                    </font></td>
                </tr>
                <tr bgcolor="#404040">
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and myState = "Select a State" and Len (myProvince) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>State*:</font></td>
                  <td nowrap bgcolor="#464646">
                  <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <select name="State"><% For i=0 to UBound(stateArray) %>
					<option<%if myState = stateArray(i) then Response.Write(" selected") end if %>><%=stateArray(i)%></option><% Next %>
					</select>
                    </font>
                    <font size="2" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and myState = "Select a State" and Len (myProvince) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>OR</font> <font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and myState = "Select a State" and Len (myProvince) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Province/Region:</font>
                   <font size="2" face="Arial, Helvetica, sans-serif"> <input type="text" name="Province" size="15" value="<%=myProvince%>">
                    </font></td>
                </tr>
                <tr>
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myZip) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Zip/Postal Code*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Zip" size="10" value="<%=myZip%>">
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and myCountry = "Select a Country" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Country*:</font></td>
                  <td nowrap bgcolor="#464646">
                  <% DIM countryArray
                     countryArray = Array ("NA","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica","Antigua And Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia and Herzegowina","Botswana","Bouvet Island","Brazil","British Indian Ocean Territory","Brunei Darussalam","Bulgaria","Burkina Faso","Burma","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos (Keeling) Islands","Colombia","Comoros","Congo","Congo, the Democratic Republic of the","Cook Islands","Costa Rica","Cote d'Ivoire","Croatia","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","England","Equatorial Guinea","Eritrea","Espana","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Guiana","French Polynesia","French Southern Territories","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Great Britain","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Heard and Mc Donald Islands","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea (North)","Korea (South)","Kuwait","Kyrgyzstan","Lao People's Democratic Republic","Latvia","Lebanon","Lesotho","Liberia","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia, Federated States of","Moldova, Republic of","Monaco","Mongolia","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","Northern Ireland","Northern Mariana Islands","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Russian Federation","Rwanda","Saint Kitts and Nevis","Saint Lucia","Saint Vincent and the Grenadines","Samoa (Independent)","San Marino","Sao Tome and Principe","Saudi Arabia","Scotland","Senegal","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and the South Sandwich Islands","South Korea","Spain","Sri Lanka","St. Helena","St. Pierre and Miquelon","Suriname","Svalbard and Jan Mayen Islands","Swaziland","Sweden","Switzerland","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tokelau","Tonga","Trinidad","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands","Uruguay","USA","Uzbekistan","Vanuatu","Vatican City State (Holy See)","Venezuela","Viet Nam","Virgin Islands (British)","Virgin Islands (U.S.)","Wales","Wallis and Futuna Islands","Western Sahara","Yemen","Zambia","Zimbabwe")
                  %>
                  <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <select name="Country"><% For i=0 to UBound(countryArray) %>
					<option<%if myCountry = countryArray(i) then Response.Write(" selected") end if %>><%=countryArray(i)%></option><% Next %>
					</select>
                    </font></td>
                </tr>
                <tr bgcolor="#404040">
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myPhone) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Phone*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Phone" size="15" value="<%=myPhone%>">
                    </font></td>
                </tr>
                <tr>
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Fax:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Fax" size="15" value="<%=myFax%>">
                    </font></td>
                </tr>
                <tr>
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myPassword) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Password*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Password" size="25" value="<%=myPassword%>">
                    </font></td>
                </tr>
                <tr bgcolor="#404040"> 
                  <td nowrap bgcolor="#464646">&nbsp;
                  </td>
                  <td nowrap bgcolor="#464646"> 
                    <input type="hidden" name="referer" value="m_profile">
                    <input type="hidden" name="Mlb" size="25" value="<%=myMlb%>">
                    <input type="hidden" name="Mlb2003" size="25" value="<%=myMlb2003%>">
                    <input type="hidden" name="Minor" size="25" value="<%=myMinor%>">
                    <input type="hidden" name="Alls" size="25" value="<%=myAlls%>">
                    <input type="hidden" name="Coop" size="25" value="<%=myCoop%>">
                    <input type="hidden" name="World" size="25" value="<%=myWorld%>">
                    <input type="hidden" name="Mascot" size="25" value="<%=myMascot%>">
                    <input type="hidden" name="Spring" size="25" value="<%=mySpring%>">
                    <input type="hidden" name="Trend" size="25" value="<%=myTrend%>">
                    <input type="hidden" name="Super" size="25" value="<%=mySuper%>">
                    <input type="submit" name="goback" value="&lt;&lt;&lt; Go back">
                    <input type="submit" name="Submit" value="Continue &gt;&gt;&gt;">
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
  </tr>
</table>
  <br>
<br>    </form>
</body>
 </html>
