<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompanyDetail.aspx.cs" Inherits="CompanyDetail" %>

<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<%@ Register TagPrefix="ewc" Namespace="eWorld.UI.Compatibility" Assembly="eWorld.UI.Compatibility" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--


function ShowErrorMessage(source, arguments)
{   
    if ((document.forms[0].tbCompany.value == "")
      ||(document.forms[0].tbAddress1.value == "")
      ||(document.forms[0].tbCity.value == "")
      ||(document.forms[0].tbZip.value == "")
      ||(document.forms[0].tbEmail.value == "")
      ||(document.forms[0].tbUserName.value == "")
      ||(document.forms[0].tbPassword.value == "")
      ||((document.forms[0].ddlState.value == "Select") && (document.forms[0].tbProvince.value == ""))
      ||(document.forms[0].ddlCountry.value == "Select a country"))
    {
        arguments.IsValid = false;
    }else{
        arguments.IsValid = true;
    } 
}

function ValidateState(source, arguments)
{
    if ((document.forms[0].ddlState.value == "Select") && (document.forms[0].tbProvince.value == ""))
    {
        arguments.IsValid = false;
    }
    else
    {
        arguments.IsValid = true;
    }
}

function ValidateCountry(source, arguments)
{
  // even number?
  if (arguments.Value == "Select a country")
    arguments.IsValid = false;
  else
   arguments.IsValid = true;
    
    //alert("Bingo "+arguments.Value)
}

function CheckUserLevel()
{
    if (document.forms[0].rblUserLevel[3].checked){
       document.getElementById("dateLayer").style.visibility="visible";
    }else{
        document.getElementById("dateLayer").style.visibility="hidden";
    }
}

function ValidateUserLevel(source, arguments)
{
  // even number?
  if (arguments.Value == "")
    arguments.IsValid = false;
  else
   arguments.IsValid = true;
    
    //alert("Bingo "+arguments.Value)
}

function ValidateUserCategory(source, arguments)
{
  // even number?
  if (arguments.Value == "")
    arguments.IsValid = false;
  else
   arguments.IsValid = true;
    
    //alert("Bingo "+arguments.Value)
}

function ValidateRequestor(source, arguments)
{
  // even number?
  if (arguments.Value == "")
    arguments.IsValid = false;
  else
   arguments.IsValid = true;
    
    //alert("Bingo "+arguments.Value)
}
//-->
</script>
<style type="text/css">
.calendar td, th{padding:5px;vertical-align:middle;white-space:normal;}
#dateLayer {font-family:Arial; font-size: 12px}
</style>
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
              style="font-size: 14pt"><strong> :: <a href="CompanyMgr.aspx">Company Manager</a> :: View</strong></span></font>
</td>
</tr>
</table>
<br />
<table border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
      <td style="height: 969px"><img src="/portal/images/inv.gif" width="330" height="1"></td>
    <td style="height: 969px"><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td style="height: 969px"> <font size="3" face="Arial, Helvetica, sans-serif">&nbsp;<i><asp:Label ID="lblDescription" runat="server" Text="Company Detail"></asp:Label></i><b><br>
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
                  <td nowrap align="right" bgcolor="#464646" style="height: 28px"><font size="1" face="Arial, Helvetica, sans-serif">Address 2:</font></td>
                  <td nowrap bgcolor="#464646" style="height: 28px"><font size="2" face="Arial, Helvetica, sans-serif"> 
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
                <tr align="right"> 
                  <td bgcolor="#464646">&nbsp;</td>
                  <td nowrap bgcolor="#464646" align="left">
                      <input id="btnBack" type="button" value="<<< Go back" onclick="history.go(-1)"/></td>
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

