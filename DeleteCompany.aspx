<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteCompany.aspx.cs" Inherits="DeleteCompany" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif" id="bodyID" runat="server">
<form id="form1" runat="server">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/portal/images/inv.gif" width="1" height="30"></td>
    <td width="100">&nbsp;</td>
  </tr>
  <tr> 
      <td><a href="./"><img src="/portal/images/portal_head_admin.gif" width="510" height="89" border="0"></a></td>
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
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr> 
            <td bgcolor="#333333"><img src="images/inv.gif" width="1" height="1"></td>
          </tr>
          <tr> 
            <td bgcolor="#CCCCCC"><img src="images/inv.gif" width="1" height="1"></td>
          </tr>
          <tr> 
            <td bgcolor="#999999"><img src="images/inv.gif" width="1" height="11"></td>
          </tr>
          <tr> 
            <td bgcolor="#333333"><img src="images/inv.gif" width="1" height="1"></td>
          </tr>
          <tr> 
            <td bgcolor="#336699"><img src="images/inv.gif" width="1" height="1"></td>
          </tr>
          <tr> 
            <td bgcolor="#003366"><img src="images/inv.gif" width="1" height="33"></td>
          </tr>
          <tr> 
            <td bgcolor="#000033"><img src="images/inv.gif" width="1" height="1"></td>
          </tr>
          <tr> 
            
    <td bgcolor="#666666"><img src="images/inv.gif" width="1" height="1"></td>
          </tr>
        </table>
      </td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
      <td></td>
    <td><img src="/portal/images/portal_dottedline.gif" width="17" height="17"></td>
      <td> <font size="3" face="Arial, Helvetica, sans-serif"><span><a href="./"><strong><span style="font-size: 14pt">Home</span></strong></a><span
              style="font-size: 14pt"><strong> :: <a href="CompanyMgr.aspx">Company Manager</a> :: Delete</strong></span></font>
</td>
</tr>
</table>
<br />
<table border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
      <td style="height: 969px"><img src="/portal/images/inv.gif" width="330" height="1"></td>
    <td style="height: 969px"><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td style="height: 969px"> <font size="3" face="Arial, Helvetica, sans-serif">&nbsp;<i><asp:Label ID="lblDescription" runat="server" Text='Are you sure you want to delete the following company <br/><font color="yellow">AND &lsquo;all registrants&rsquo;,  from this company</font>? <br><b><font color="red">Warning!</font></b> This can NOT be undone.'></asp:Label></i><b><br>
        <br>
        </b></font> 

        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr>
            <td><table border="0" cellspacing="1" cellpadding="2" id="tableProfile" runat="server">
                          <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Company Name
                          :</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblCompany" runat="server"></asp:Label></font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address 1
                          :</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblAddress1" runat="server"></asp:Label></font></td>
                </tr>
                 <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address 2:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblAddress2" runat="server"></asp:Label></font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">City
                         :</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblCity" runat="server"></asp:Label></font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">State
                         :</font></td>
                  <td nowrap bgcolor="#464646">

                  <font size="2" face="Arial, Helvetica, sans-serif">
                              <asp:Label ID="lblState" runat="server"></asp:Label></font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Zip/Postal Code
                         :</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblZip" runat="server"></asp:Label></font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Country
                         :</font></td>
                  <td nowrap bgcolor="#464646">
                  <font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblCountry" runat="server"></asp:Label>&nbsp;
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Phone:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblPhone" runat="server"></asp:Label></font></td>
                </tr>

                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Email
                          :</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblEmail" runat="server"></asp:Label></font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Contract#:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblContract" runat="server"></asp:Label></font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">User Name
                          </font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblUserName" runat="server"></asp:Label></font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Password
                          </font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:Label ID="lblPassword" runat="server"></asp:Label></font></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#464646" nowrap="nowrap">
                        <span style="font-size: 7pt"><span style="font-family: Arial">User Level: </span></span>
                    </td>
                    <td bgcolor="#464646" nowrap="nowrap">
                        <asp:Label ID="lblUserLevel" runat="server" Font-Names="Arial" Font-Size="10pt"></asp:Label>
                        <asp:Label ID="lblDateRange" runat="server" Font-Names="Arial" Font-Size="10pt"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#464646" nowrap="nowrap">
                        <span style="font-size: 7pt"><span style="font-family: Arial">User Category:</span></span></td>
                    <td bgcolor="#464646" nowrap="nowrap">
                        <asp:Label ID="lblUserCategory" runat="server" Font-Names="Arial" Font-Size="10pt"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#464646" nowrap="nowrap">
                        <span style="font-size: 7pt"><span style="font-family: Arial">MLB Contact:</span></span></td>
                    <td bgcolor="#464646" nowrap="nowrap">
                        <asp:Label ID="lblRequestor" runat="server" Font-Names="Arial" Font-Size="10pt"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#464646" nowrap="nowrap" valign="top">
                        <span style="font-size: 7pt"><span style="font-family: Arial">Sitelets:</span></span></td>
                    <td bgcolor="#464646" nowrap="nowrap">
                        <asp:Label ID="lblSitelets" runat="server" Font-Names="Arial" Font-Size="10pt"></asp:Label></td>
                </tr>
                <!--
                <tr>
                    <td align="right" bgcolor="#464646" nowrap="nowrap" valign="top">
                    </td>
                    <td bgcolor="#464646" nowrap="nowrap">
                        <asp:RadioButtonList ID="rblModifyAll" runat="server" Font-Bold="True" Font-Names="Arial"
                            Font-Size="10pt" ForeColor="Yellow" Width="328px" visible="false">
                            <asp:ListItem Selected="True" Value="1">Delete this company but leave the registrants from this company intact.</asp:ListItem>
                            <asp:ListItem Value="2">Delete this company AND 'all registrants' from this company</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                -->
                <tr align="right"> 
                  <td bgcolor="#464646">&nbsp;</td>
                  <td nowrap bgcolor="#464646" align="left">
                      <input id="btnBack" type="button" value="<<< No, Go back" onclick="history.go(-1)"/>
                      <asp:Button ID="btnYes" runat="server" Text="Yes, I am positive>>>" OnClick="btnYes_Click" /></td>
                </tr>
              </table>
                <table id="tableFinished" runat="server" border="0" cellpadding="2" cellspacing="1"
                    visible="false">
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td valign="top">
                            &nbsp;<br />
                            <span style="font-size: 10pt; font-family: Arial">You have successfully <span style="color: #cc9900">
                                delete </span>the company.<br />
                                <br />
                                <a href="./">Return to Admin Home</a><br />
                            </span>
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