<%@ Language=VBScript %>
<!--#include virtual = "/includes/validate_admin.inc" -->
<%
Set UserDelData = Session("UserDelData")
%>
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/xt_d_profile.asp" name="adduser1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
      <td> <font face="Arial, Helvetica, sans-serif">Step 2 of 2: <i>Final Review</i></font><font size="2" face="Arial, Helvetica, sans-serif"><br>
        <b><br>
        Are you positive you want to delete the following user?<br>
        </b></font><br>
        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr>
            <td>
              <table border="0" cellspacing="1" cellpadding="2">
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">First 
                    Name:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <input type="hidden" name="formname" value="adduser.asp">
                    <%=UserDelData.Item("FirstName")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Middle 
                    Initial:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Middlei")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Last 
                    Name:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("LastName")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Email:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Email")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Company:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Company")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Contract 
                    Number:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Contract")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Address1")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1">&nbsp;</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Address2")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">City:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("City")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">State/Province/Region:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("State")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Zip/Postal: 
                    Code</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Zip")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Phone:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Phone")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Fax:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Fax")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Country:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Country")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Password:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=UserDelData.Item("Password")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" valign="top" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Sections 
                    Allowed:</font></td>
                  <td nowrap valign="top" bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%
                if UserDelData.Item("Mlb") then
					Response.Write("MLB Style Guide<br>")
				end if
				if UserDelData.Item("Alls") then
					Response.Write("All Star Game<br>")
				end if
				if UserDelData.Item("World") then
					Response.Write("World Series<br>")
				end if
				if UserDelData.Item("Minor") then
					Response.Write("Minor League Style Guide<br>")
				end if
				if UserDelData.Item("Coop") then
					Response.Write("Cooperstown Collection<br>")
				end if
				if UserDelData.Item("Mascot") then
					Response.Write("MLB Mascot Fever<br>")
				end if
				if UserDelData.Item("Spring") then
					Response.Write("Spring Training<br>")
				end if
				if UserDelData.Item("Trend") then
					Response.Write("Trend<br>")
				end if
				if UserDelData.Item("Super") then
					Response.Write("Super Human")
				end if            
              %>
                    </font></td>
                </tr>
                <tr> 
                  <td nowrap bgcolor="#464646"> <font face="Arial, Helvetica, sans-serif" size="2"> 
                    <input type="submit" name="goback" value="&lt;&lt;&lt; No, Go Back">
                    </font></td>
                  <td nowrap bgcolor="#464646"> <font face="Arial, Helvetica, sans-serif" size="2"> 
                    <input type="submit" name="Submit" value="Yes, I am Sure &gt;&gt;&gt;">
                    </font></td>
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
