<%@ Language=VBScript %>
<!--#include virtual = "/includes/validate_admin.inc" -->
<%
Set CompanyDelData = Session("CompanyDelData")
%>
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif">
<form method="post" action="/admin/usr/xt_d_company.asp"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
      <td> <font face="Arial, Helvetica, sans-serif">Step 2 of 2: <i>Final Review</i></font><font size="2" face="Arial, Helvetica, sans-serif"><br>
        <b><br>
        Are you positive you want to delete the following company?<br>
        </b></font><br>
        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr>
            <td>
              <table border="0" cellspacing="1" cellpadding="2">
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Company Name:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=Session("CompanyDelData").Item("Company")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address1:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=Session("CompanyDelData").Item("Address1")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address2:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=Session("CompanyDelData").Item("Address2")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">City:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=Session("CompanyDelData").Item("City")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">State/Province/Region:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=Session("CompanyDelData").Item("State")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Zip/Postal Code:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=Session("CompanyDelData").Item("Zip")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Country:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=Session("CompanyDelData").Item("Country")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Phone:</font></td>
                  <td nowrap bgcolor="#464646"> <font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=Session("CompanyDelData").Item("Phone")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Email:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=CompanyDelData.Item("Email")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Contract:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=CompanyDelData.Item("Contract")%>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">User Name:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=CompanyDelData.Item("UserName")%> </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Password:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%=CompanyDelData.Item("Password")%> </font></td>
                </tr>
                
                <tr>
                
                  <td nowrap align="right" valign="top" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Sections 
                    Allowed:</font></td>
                  <td nowrap valign="top" bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                    <%
                if CompanyDelData.Item("Mlb") then
					Response.Write("MLB Style Guide<br>")
				end if
				if CompanyDelData.Item("Alls") then
					Response.Write("All Star Game<br>")
				end if
				if CompanyDelData.Item("World") then
					Response.Write("World Series<br>")
				end if
				if CompanyDelData.Item("Minor") then
					Response.Write("Minor League Style Guide<br>")
				end if
				if CompanyDelData.Item("Coop") then
					Response.Write("Cooperstown Collection<br>")
				end if
				if CompanyDelData.Item("Mascot") then
					Response.Write("MLB Mascot Fever<br>")
				end if
				if CompanyDelData.Item("Spring") then
					Response.Write("Spring Training<br>")
				end if
				if CompanyDelData.Item("Trend") then
					Response.Write("Spring and Summer Trend")
				end if
				             
              %>
                    </font></td>
                </tr>
                <tr>
                <td nowrap bgcolor="#464646" colspan="2">
					<input type="checkbox" name="delusers" value="True" checked><font size="2" face="Arial, Helvetica, sans-serif">Delete all users belong to this company</font>
                </td>
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
