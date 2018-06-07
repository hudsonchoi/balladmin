<%@ Language=VBScript %>
<!--#include virtual = "/includes/validate_admin.inc" -->
<%
'Dim addstep

'If Not Session("MemberData").Exists("Password") Then
'	If Session("MemberData").Exists("addstep") Then
		'If Request.QueryString("err") < "1" Then
		'	Session("MemberData").Item("addstep") = Session("MemberData").Item("addstep") + 1
		'End If
'	Else
'		Session("MemberData").Item("addstep") = "1"
'	End If
'	If Session("MemberData").Item("addstep") > "2" Then
'		Session("MemberData").Item("addstep") = "1"
'	End If
'End If

'addstep = Session("MemberData").Item("addstep")

Set UserEntryErrors = Session("UserEntryErrors")
Set UserEntryData = Session("UserEntryData")
%>
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/xt_profile.asp" name="adduser1">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/portal/images/inv.gif" width="1" height="30"></td>
    <td width="100">&nbsp;</td>
  </tr>
  <tr> 
      <td><img src="/portal/images/portal_head_admin.gif" width="510" height="89"></td>
    <td width="100">&nbsp;</td>
  </tr>
    <tr> 
      <td valign="top"> 
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td valign="top"><img src="/portal/images/portal_arrow.gif" width="397" height="77"></td>
            <td valign="top"><img src="/portal/images/portal_majorleaguestyleguid.gif" width="362" height="77"></td>
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
    <td><img src="/portal/images/inv.gif" width="397" height="1"></td>
    <td><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td> <font size="3" face="Arial, Helvetica, sans-serif">Step 1 of 2: <i>Enter 
        User Details</i><b><br>
        <br>
        </b></font> 
         <input type="hidden" name="formname" value="adduser.asp">
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
                  <td nowrap align="right"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td nowrap><font size="1" face="Arial, Helvetica, sans-serif" color="#CC9900">* 
                    = Required Fields</font></td>
                </tr>
                <%
		If Request.QueryString("pr")="0" then
		    Response.Write("<tr><td>&nbsp;</td>")
            Response.Write("<td><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>")
			Response.Write("The email <font face=Arial, Helvetica, sans-serif size=2 color=white> '"& Session("UserEntryData").Item("Email") & "' </font>  is already in use!<br>Please choose another email.</font></b><br>")
			Response.Write("</td></tr>")
		End If
		%>
                <!--
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif" <%If UserEntryErrors.item("UserName") = "flag" Then Response.Write("color=red") Else Response.Write("color=white") End If %>>Username*</font></td>
            <td nowrap><font size="2" face="Arial, Helvetica, sans-serif"> 
              <input type="text" name="username" size="20" value="<%Response.Write(UserEntryData.Item("UserName"))%>">
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Salutation</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <input type="text" name="salu" size="4" value="<%Response.Write(UserEntryData.Item("salu"))%>">
              </font></td>
          </tr>
          -->
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif"  <%If UserEntryErrors.Item("FirstName") = "flag" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>First 
                    Name*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="FirstName" size="20" value="<%Response.Write(UserEntryData.Item("FirstName"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Middle 
                    Initial:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Middlei" size="2" value="<%Response.Write(UserEntryData.Item("Middlei"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If UserEntryErrors.item("LastName") = "flag" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Last 
                    Name*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="LastName" size="20" value="<%Response.Write(UserEntryData.Item("LastName"))%>">
                    </font></td>
                </tr>
                <% if Request.QueryString("em")="0" then 
					Response.Write("<tr><td colspan=2><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>Your email seems to be invalid.</font></b><br>")
					Response.Write("</td></tr>")
			 elseif Request.QueryString("em")="2" then 
					Response.Write("<tr><td colspan=2><b><font size='2' face='Arial, Helvetica, sans-serif' color=red>Your email seems to be not working. Please, verify if it is working.</font></b><br>")
					Response.Write("</td></tr>")
			 end if%>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif"<%If UserEntryErrors.item("Email") = "flag" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Email*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Email" size="25" value="<%Response.Write(UserEntryData.Item("Email"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif"  <%If UserEntryErrors.item("Company") = "flag" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Company*:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Company" size="25" value="<%Response.Write(UserEntryData.Item("Company"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif"  <%If UserEntryErrors.item("Contract") = "flag" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Contract 
                    Number*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Contract" size="25" value="<%Response.Write(UserEntryData.Item("Contract"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Address1" size="25" value="<%Response.Write(UserEntryData.Item("Address1"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646">&nbsp;</td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Address2" size="25" value="<%Response.Write(UserEntryData.Item("Address2"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">City:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="City" size="20" value="<%Response.Write(UserEntryData.Item("City"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">State/Province:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="State" size="20" value="<%Response.Write(UserEntryData.Item("State"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Zip/Postal 
                    Code:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Zip" size="10" value="<%Response.Write(UserEntryData.Item("Zip"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif" <%If UserEntryErrors.item("Phone") = "flag" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Phone*:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif" > 
                    <input type="text" name="Phone" size="15" value="<%Response.Write(UserEntryData.Item("Phone"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Fax:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Fax" size="15" value="<%Response.Write(UserEntryData.Item("Fax"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Country:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Country" size="25" value="<%Response.Write(UserEntryData.Item("Country"))%>">
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif"<%If UserEntryErrors.item("Password") = "flag" Then Response.Write("color=red") Else Response.Write("color=CC9900") End If %>>Password*</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="text" name="Password" size="25" value="<%Response.Write(UserEntryData.Item("Password"))%>">
                    </font></td>
                </tr>
                <!--
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif" <%If UserEntryErrors.item("keyword") = "flag" Then Response.Write("color=red") Else Response.Write("color=white") End If %>>Keyword 
              to remember password*</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif"> 
              <input type="text" name="keyword" size="35" value="<%Response.Write(UserEntryData.Item("keyword"))%>">
              </font></td>
          </tr>
          <tr> 
            <td nowrap align="right"><font size="2" face="Arial, Helvetica, sans-serif">Set 
              Access Level*</font></td>
            <td nowrap> <font size="2" face="Arial, Helvetica, sans-serif">
              <select name="accesslevel">
                <option value="1" selected>Major League Only</option>
                <option value="2">Minor &amp; Major Leagues</option>
              </select>
              </font></td>
          </tr>
          -->
                <tr align="right"> 
                  <td nowrap bgcolor="#464646" colspan="2"> 
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
