<%@ Language=VBScript %>

<!--#include virtual = "/includes/validate_admin.inc" -->
<%
Dim myUserName, myPassword, myCompany, myID, myEmail, myContract, myMlb, myMinor, myAlls, myCoop, myWorld, myMascot, mySpring, myTrend, mySuper, myMlb2003, myAlls2007
Dim myAddress1, myAddress2, myCity, myState, myZip, myCountry, myPhone, myProvince
Dim strMode
strMode = "default"
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
myAlls2007 = 0
if Len (Request.QueryString("err")) > 0 or Len (Request.QueryString("referer")) > 0 Then
	strMode = "validation"
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
	myProvince = Request.QueryString("20")
	myTrend = Request.QueryString("21")
	mySuper = Request.QueryString("22")
	myMlb2003 = Request.QueryString("23")
	myAlls2007 = Request.QueryString("24")
'else 'Invalid accessing so go back to home
'	Response.Redirect("../default.asp")
end if
%>
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/company_permission.asp" name="adduser1">
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
      <td><img src="../../portal/images/inv.gif" width="330" height="1"></td>
    <td><img src="../../portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td> <font size="3" face="Arial, Helvetica, sans-serif">Step 1 of 2: <i>Enter 
        The Company Information</i><b><br>
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
        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr>
            <td>
              <table border="0" cellspacing="1" cellpadding="2">
                <tr bgcolor="#464646"> 
                  <td nowrap align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
                  <td nowrap><font size="1" face="Arial, Helvetica, sans-serif" color="#CC9900">* 
                    = Required Fields</font></td>
                </tr>
                <%
		If Request.QueryString("pr")="0" then
		    Response.Write("<tr><td>&nbsp;</td>")
            Response.Write("<td><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>")
			Response.Write("The user name <font face=Arial, Helvetica, sans-serif size=2 color=white> '"& myUserName & "' </font>  is already in use!<br>Please choose another user name.</font></b><br>")
			Response.Write("</td></tr>")
		End If
		%>
                          <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myCompany) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Company Name*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Company" size="25" value="<%=myCompany%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myAddress1) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Address 1*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Address1" size="25" value="<%=myAddress1%>">
                    </font></td>
                </tr>
                 <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address 2:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Address2" size="25" value="<%=myAddress2%>">
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myCity) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>City*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="City" size="25" value="<%=myCity%>">
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and myState = "Select a State" and Len (myProvince) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>State*:</font></td>
                  <td nowrap bgcolor="#464646">
<% DIM stateArray
   stateArray = Array ("Select a State","AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")%>
                  <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <select name="State"><% For i=0 to UBound(stateArray) %>
					<option<%if myState = stateArray(i) then Response.Write(" selected") end if %>><%=stateArray(i)%></option><% Next %>
					</select>
                    </font>
                    <font size="2" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and myState = "Select a State" and Len (myProvince) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>OR</font> <font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and myState = "Select a State" and Len (myProvince) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Province/Region:</font>
                    <font size="2" face="Arial, Helvetica, sans-serif"><input type="text" name="Province" size="15" value="<%=myProvince%>">
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myZip) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Zip/Postal Code*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Zip" size="25" value="<%=myZip%>">
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and myCountry = "Select a Country" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Country*:</font></td>
                  <td nowrap bgcolor="#464646">
                  <% 
If Len(myCountry) = 0 Then
	myCountry = "United States"
End If
				  DIM countryArray
                    countryArray = Array ("Select a Country","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica","Antigua And Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia and Herzegowina","Botswana","Bouvet Island","Brazil","British Indian Ocean Territory","Brunei Darussalam","Bulgaria","Burkina Faso","Burma","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos (Keeling) Islands","Colombia","Comoros","Congo","Congo, the Democratic Republic of the","Cook Islands","Costa Rica","Cote d'Ivoire","Croatia","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","England","Equatorial Guinea","Eritrea","Espana","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Guiana","French Polynesia","French Southern Territories","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Great Britain","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Heard and Mc Donald Islands","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea (North)","Korea (South)","Kuwait","Kyrgyzstan","Lao People's Democratic Republic","Latvia","Lebanon","Lesotho","Liberia","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia, Federated States of","Moldova, Republic of","Monaco","Mongolia","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","Northern Ireland","Northern Mariana Islands","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Russian Federation","Rwanda","Saint Kitts and Nevis","Saint Lucia","Saint Vincent and the Grenadines","Samoa (Independent)","San Marino","Sao Tome and Principe","Saudi Arabia","Scotland","Senegal","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and the South Sandwich Islands","South Korea","Spain","Sri Lanka","St. Helena","St. Pierre and Miquelon","Suriname","Svalbard and Jan Mayen Islands","Swaziland","Sweden","Switzerland","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tokelau","Tonga","Trinidad","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands","Uruguay","USA","Uzbekistan","Vanuatu","Vatican City State (Holy See)","Venezuela","Viet Nam","Virgin Islands (British)","Virgin Islands (U.S.)","Wales","Wallis and Futuna Islands","Western Sahara","Yemen","Zambia","Zimbabwe")
                  %>
                  <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <select name="Country"><% For i=0 to UBound(countryArray) %>
					<option<%if myCountry = countryArray(i) then Response.Write(" selected") end if %>><%=countryArray(i)%></option><% Next %>
					</select>
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Phone:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Phone" size="25" value="<%=myPhone%>">
                    </font></td>
                </tr>
                <% if Request.QueryString("em")="0" then 
					Response.Write("<tr><td colspan=2><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>Your email seems to be invalid.</font></b><br>")
					Response.Write("</td></tr>")
					end if%>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myEmail) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Email*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Email" size="25" value="<%=myEmail%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Contract#:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Contract" size="25" value="<%=myContract%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If (strMode = "validation" and Len (myUserName) = 0) or (strMode = "validation" and Request.QueryString("pr") = "0") Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>User Name*</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="UserName" size="25" value="<%=myUserName%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If strMode = "validation" and Len (myPassword) = 0 Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Password*</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Password" size="25" value="<%=myPassword%>">
                    <input type="hidden" name="Mlb" size="25" value="<%=myMlb%>">
                    <input type="hidden" name="Minor" size="25" value="<%=myMinor%>">
                    <input type="hidden" name="Alls" size="25" value="<%=myAlls%>">
                    <input type="hidden" name="Coop" size="25" value="<%=myCoop%>">
                    <input type="hidden" name="World" size="25" value="<%=myWorld%>">
                    <input type="hidden" name="Mascot" size="25" value="<%=myMascot%>">
                    <input type="hidden" name="Spring" size="25" value="<%=mySpring%>">
                    <input type="hidden" name="Trend" size="25" value="<%=myTrend%>">
                    <input type="hidden" name="Super" size="25" value="<%=mySuper%>">
                    <input type="hidden" name="Mlb2003" size="25" value="<%=myMlb2003%>">
					<input type="hidden" name="Alls2007" size="25" value="<%=myAlls2007%>">
                    </font></td>
                </tr>
                <tr align="right"> 
                  <td nowrap bgcolor="#464646" colspan="2" align="center">
                    <input type="hidden" name="referer" value="add_company">
                    <input type="submit" name="goback" value="&lt;&lt;&lt; Go back">
                    &nbsp; 
                    <input type="submit" name="Submit" value="Continue &gt;&gt;&gt;">
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <br>
      </td>
  </tr>
</table>
 
        
  <br>  
</form> 
</body>
 </html>
