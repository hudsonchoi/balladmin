<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditRequester.aspx.cs" Inherits="EditRequester" %>

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

function MakeItBlank(){
    form1.tbSearch.value = "";
}

//-->
</script>
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="images/404040.gif">
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
              style="font-size: 14pt"><strong> :: <a href="RequesterMgr.aspx">MLB Contact Manager</a> :: Add a MLB Contact</strong></span></font>
</td>
</tr>
</table>
<br />
<table border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
      <td style="height: 969px"><img src="/portal/images/inv.gif" width="330" height="1"></td>
    <td style="height: 969px"><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td style="height: 969px"> <font size="3" face="Arial, Helvetica, sans-serif">&nbsp;<i><asp:Label ID="lblDescription" runat="server" Text="Enter the MLB Contact information"></asp:Label></i><b><br>
        <br>
        </b></font> 

        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr>
            <td><table border="0" cellspacing="1" cellpadding="2" id="tableProfile" runat="server">
                <tr bgcolor="#464646"> 
                  <td nowrap align="right" style="width: 82px"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
                  <td nowrap style="font-size: 12pt"><font size="1" face="Arial, Helvetica, sans-serif" color="#CC9900"><span style="font-size: 10pt;
                          color: red"><strong>*</strong></span>
                    = Required Fields</font><br /><asp:CustomValidator ID="cvMessage" runat="server" ClientValidationFunction="ShowErrorMessage"
                              Display="Dynamic" Font-Bold="True" Font-Names="Arial" Font-Size="Smaller">Some of the required information is missing.<br>Please fill in the field(s) the flashing arrow pointing to.</asp:CustomValidator></td>
                </tr>
                          <tr> 
                  <td nowrap align="right" bgcolor="#464646" style="width: 82px"><font size="1" face="Arial, Helvetica, sans-serif">First Name<strong><span style="font-size: 10pt;
                          color: #ff0000">*</span></strong>:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbFirstName" runat="server" Width="170px"></asp:TextBox><asp:RequiredFieldValidator
                          ID="rfvFirstName" runat="server" ControlToValidate="tbFirstName" ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator></font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646" style="width: 82px"><font size="1" face="Arial, Helvetica, sans-serif">Last Name<strong><span style="font-size: 10pt;
                          color: #ff0000">*</span></strong>:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbLastName" runat="server" Width="170px"></asp:TextBox><asp:RequiredFieldValidator
                          ID="rfvLastName" runat="server" ControlToValidate="tbLastName" ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator></font></td>
                </tr>
                 <tr> 
                  <td nowrap align="right" bgcolor="#464646" style="width: 82px"><font size="1" face="Arial, Helvetica, sans-serif">Email<strong><span style="font-size: 10pt;
                          color: #ff0000"></span></strong>:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbEmail" runat="server" Width="170px"></asp:TextBox><asp:RegularExpressionValidator
                              ID="revEmail" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Invalid e-mail"
                              Font-Bold="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                          
                          </font></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#464646" nowrap="nowrap" style="width: 82px">
                    </td>
                    <td bgcolor="#464646" nowrap="nowrap">
                        <asp:CheckBox ID="cbLicenseeA" runat="server" Text="Licensee A MLB Contact" Font-Names="Arial" Font-Size="X-Small" /></td>
                </tr>
                <tr align="right"> 
                  <td bgcolor="#464646" style="width: 82px; height: 28px;">&nbsp;</td>
                  <td nowrap bgcolor="#464646" align="left" style="height: 28px">
                      <asp:Button ID="btnContinue1" runat="server" Text="Submit" OnClick="btnContinue1_Click" />
                      <asp:Label ID="lblErr" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small"
                          ForeColor="Yellow" Visible="False"></asp:Label></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <br>
      </td>
  </tr>
</table>
    <br />
    <br />
    <br />
    <br />
    <br />
 
        
  <br>  
</form> 
</body>
 </html>
