<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCompany.aspx.cs" Inherits="AddCompany" %>
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

function ChangeStep()
{
    /*
    if (document.forms[0].rblUserCategory[4].checked){
        document.getElementById("lblStep").innerText = "Step 3 of 4";
    }else{
        document.getElementById("lblStep").innerText = "Step 3 of 3";
    }*/
    
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
              style="font-size: 14pt"><strong> :: <a href="CompanyMgr.aspx">Company Manager</a> :: Add a Company</strong></span></font>
</td>
</tr>
</table>
<br />
<table border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
      <td style="height: 969px"><img src="/portal/images/inv.gif" width="330" height="1"></td>
    <td style="height: 969px"><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td style="height: 969px"> <font size="3" face="Arial, Helvetica, sans-serif">
          <asp:Label ID="lblStep" runat="server" Text="Step 1 of 5:"></asp:Label>
          <i>
              <asp:Label ID="lblDescription" runat="server" Text="Enter the company information"></asp:Label></i><b><br>
        <br>
        </b></font> 

        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr>
            <td><table border="0" cellspacing="1" cellpadding="2" id="tableProfile" runat="server">
                <tr bgcolor="#464646"> 
                  <td nowrap align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
                  <td nowrap style="font-size: 12pt"><font size="1" face="Arial, Helvetica, sans-serif" color="#CC9900"><span style="font-size: 10pt;
                          color: red"><strong>*</strong></span>
                    = Required Fields</font><br /><asp:CustomValidator ID="cvMessage" runat="server" ClientValidationFunction="ShowErrorMessage"
                              Display="Dynamic" Font-Bold="True" Font-Names="Arial" Font-Size="Smaller">Some of the required information is missing.<br>Please fill in the field(s) the flashing arrow pointing to.</asp:CustomValidator></td>
                </tr>
                          <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Company Name<strong><span style="font-size: 10pt;
                          color: #ff0000">*</span></strong>:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbCompany" runat="server" Width="170px"></asp:TextBox><asp:RequiredFieldValidator
                          ID="rfvCompany" runat="server" ControlToValidate="tbCompany" ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator><asp:CustomValidator
                              ID="cvCompany" runat="server" ControlToValidate="tbCompany" Display="Dynamic"
                              ErrorMessage="Already registered" Font-Bold="True" OnServerValidate="cvCompany_ServerValidate"></asp:CustomValidator>
                              <asp:CustomValidator ID="cvMaxCharacters" runat="server" ErrorMessage="The max # of characters is 100" Display="Dynamic" Font-Bold="True" 
                          onservervalidate="cvMaxCharacters_ServerValidate" ControlToValidate="tbCompany"></asp:CustomValidator></font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Address 1<strong><span style="font-size: 10pt;
                          color: #ff0000">*</span></strong>:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbAddress1" runat="server" Width="170px"></asp:TextBox><asp:RequiredFieldValidator
                          ID="rfvAddress1" runat="server" ControlToValidate="tbAddress1" ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator></font></td>
                </tr>
                 <tr> 
                  <td nowrap align="right" bgcolor="#464646" style="height: 28px"><font size="1" face="Arial, Helvetica, sans-serif">Address 2:</font></td>
                  <td nowrap bgcolor="#464646" style="height: 28px"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbAddress2" runat="server" Width="170px"></asp:TextBox></font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">City<strong><span style="font-size: 10pt;
                         color: #ff0000">*</span></strong>:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbCity" runat="server" Width="170px"></asp:TextBox><asp:RequiredFieldValidator
                          ID="rfvCity" runat="server" ControlToValidate="tbCity" ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator></font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">State<strong><span style="font-size: 10pt;
                         color: #ff0000">*</span></strong>:</font></td>
                  <td nowrap bgcolor="#464646">

                  <font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:DropDownList ID="ddlState" runat="server">
                          <asp:ListItem Value="Select">Select</asp:ListItem>
                          <asp:ListItem Value="AL">AL</asp:ListItem>
                          <asp:ListItem Value="AK">AK</asp:ListItem>
                          <asp:ListItem Value="AZ">AZ</asp:ListItem>
                          <asp:ListItem Value="AR">AR</asp:ListItem>
                          <asp:ListItem Value="CA">CA</asp:ListItem>
                          <asp:ListItem Value="CO">CO</asp:ListItem>
                          <asp:ListItem Value="CT">CT</asp:ListItem>
                          <asp:ListItem Value="DE">DE</asp:ListItem>
                          <asp:ListItem Value="DC">DC</asp:ListItem>
                          <asp:ListItem Value="FL">FL</asp:ListItem>
                          <asp:ListItem Value="GA">GA</asp:ListItem>
                          <asp:ListItem Value="HI">HI</asp:ListItem>
                          <asp:ListItem Value="ID">ID</asp:ListItem>
                          <asp:ListItem Value="IL">IL</asp:ListItem>
                          <asp:ListItem Value="IN">IN</asp:ListItem>
                          <asp:ListItem Value="IA">IA</asp:ListItem>
                          <asp:ListItem Value="KS">KS</asp:ListItem>
                          <asp:ListItem Value="KY">KY</asp:ListItem>
                          <asp:ListItem Value="LA">LA</asp:ListItem>
                          <asp:ListItem Value="ME">ME</asp:ListItem>
                          <asp:ListItem Value="MD">MD</asp:ListItem>
                          <asp:ListItem Value="MA">MA</asp:ListItem>
                          <asp:ListItem Value="MI">MI</asp:ListItem>
                          <asp:ListItem Value="MN">MN</asp:ListItem>
                          <asp:ListItem Value="MS">MS</asp:ListItem>
                          <asp:ListItem Value="MO">MO</asp:ListItem>
                          <asp:ListItem Value="MT">MT</asp:ListItem>
                          <asp:ListItem Value="NE">NE</asp:ListItem>
                          <asp:ListItem Value="NV">NV</asp:ListItem>
                          <asp:ListItem Value="NH">NH</asp:ListItem>
                          <asp:ListItem Value="NJ">NJ</asp:ListItem>
                          <asp:ListItem Value="NM">NM</asp:ListItem>
                          <asp:ListItem Value="NY">NY</asp:ListItem>
                          <asp:ListItem Value="NC">NC</asp:ListItem>
                          <asp:ListItem Value="ND">ND</asp:ListItem>
                          <asp:ListItem Value="OH">OH</asp:ListItem>
                          <asp:ListItem Value="OK">OK</asp:ListItem>
                          <asp:ListItem Value="OR">OR</asp:ListItem>
                          <asp:ListItem Value="PA">PA</asp:ListItem>
                          <asp:ListItem Value="RI">RI</asp:ListItem>
                          <asp:ListItem Value="SC">SC</asp:ListItem>
                          <asp:ListItem Value="SD">SD</asp:ListItem>
                          <asp:ListItem Value="TN">TN</asp:ListItem>
                          <asp:ListItem Value="TX">TX</asp:ListItem>
                          <asp:ListItem Value="UT">UT</asp:ListItem>
                          <asp:ListItem Value="VT">VT</asp:ListItem>
                          <asp:ListItem Value="VA">VA</asp:ListItem>
                          <asp:ListItem Value="WA">WA</asp:ListItem>
                          <asp:ListItem Value="WV">WV</asp:ListItem>
                          <asp:ListItem Value="WI">WI</asp:ListItem>
                          <asp:ListItem Value="WY">WY</asp:ListItem>
                      </asp:DropDownList></font><font size="2" face="Arial, Helvetica, sans-serif">OR</font> <font size="1" face="Arial, Helvetica, sans-serif">Province/Region:</font>
                      <asp:TextBox ID="tbProvince" runat="server" Width="100px"></asp:TextBox><asp:CustomValidator
                          ID="cvState" runat="server" ControlToValidate="ddlState" ErrorMessage='<img src="images/alert.gif">'
                          OnServerValidate="cvState_ServerValidate" ClientValidationFunction="ValidateState"></asp:CustomValidator><font size="2" face="Arial, Helvetica, sans-serif">
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Zip/Postal Code<strong><span style="font-size: 10pt;
                         color: #ff0000">*</span></strong>:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbZip" runat="server" Width="170px"></asp:TextBox><asp:RequiredFieldValidator
                          ID="rfvZip" runat="server" ControlToValidate="tbZip" ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator></font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Country<strong><span style="font-size: 10pt;
                         color: #ff0000">*</span></strong>:</font></td>
                  <td nowrap bgcolor="#464646">
                  <font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="ObjectDataSource1"
                          DataTextField="CountryName" DataValueField="CountryName">
                      </asp:DropDownList><asp:CustomValidator ID="cvCountry" runat="server" ClientValidationFunction="ValidateCountry"
                          ControlToValidate="ddlCountry" Display="Dynamic" ErrorMessage='<img src="Images/alert.gif">'
                          OnServerValidate="cvCountry_ServerValidate"></asp:CustomValidator>
                      <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                          SelectMethod="GetAllCountries" TypeName="dsCountryTableAdapters.countrylistTableAdapter">
                      </asp:ObjectDataSource>
                    </font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Phone:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbPhone" runat="server" Width="170px"></asp:TextBox></font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646"><font size="1" face="Arial, Helvetica, sans-serif">Contract#:</font></td>
                  <td nowrap bgcolor="#464646"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:TextBox ID="tbContract" runat="server" Width="170px"></asp:TextBox></font></td>
                </tr>
                 <tr align="right"> 
                  <td bgcolor="#464646">&nbsp;</td>
                  <td nowrap bgcolor="#464646" align="left">
                      <asp:Button ID="btnBack1" runat="server" OnClick="btnBack1_Click" Text="<<< Go back" CausesValidation="False" />
                      <asp:Button ID="btnContinue1" runat="server" Text="Continue >>>" OnClick="btnContinue1_Click" /></td>
                </tr>
              </table>
              <table border="0" cellspacing="1" cellpadding="2" id="tableUserLevel" runat="server" visible="false">
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td nowrap align="right">
                            <font face="Arial, Helvetica, sans-serif" size="1"><span style="font-size: 10pt;
                                color: #ff0000"><img height="363" src="images/spacer.gif" width="80" />&nbsp;</span></font></td>
                        <td valign="top"><asp:CustomValidator ID="cvUserLevel" runat="server"
                                Display="Dynamic" ErrorMessage="Please choose an user level." Font-Names="Arial"
                                Font-Size="12px" OnServerValidate="cvUserLevel_ServerValidate" ControlToValidate="rblUserLevel" ValidateEmptyText="True" ClientValidationFunction="ValidateUserLevel"></asp:CustomValidator><br />
                            <asp:RadioButtonList ID="rblUserLevel" runat="server" Font-Names="Arial" Font-Size="12px">
                            <asp:ListItem Value="B">Level B (Access to the allowed Sitelet(s); No expiration; Access&lt;br /&gt;&#160;&#160;&#160;&#160;&#160;&#160;&#160;to New Club Marks on Jan. 1; Monitored by MLB Contacts)</asp:ListItem>
                            <asp:ListItem Value="C">Level C (Access to the allowed sitelet(s); All accees expires on&lt;br /&gt;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Dec. 31;  Monitored by MLB Contacts)</asp:ListItem>
                            <asp:ListItem Value="D">Level D (Access to the allowed sitelet(s); Access allowed for the&lt;br /&gt;&#160;&#160;&#160;&#160;&#160;&#160;&#160;specified time only; Monitored by MLB Contacts)</asp:ListItem>
                                </asp:RadioButtonList>
                             <div id="dateLayer" style="visibility:hidden">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Allow an access from: <ewc:CalendarPopup ID="calendarPopupFrom" runat="server" ControlDisplay="textboximage"
            ImageUrl="./images/calendar.gif" Text="Change Date" Width="65px" CssClass="calendar" Nullable="True" AllowArbitraryText="True" DisableTextBoxEntry="False">
        </ewc:CalendarPopup>
                                 <asp:RequiredFieldValidator ID="rfvFrom" runat="server" ControlToValidate="calendarPopupFrom"
                                     Display="Dynamic" ErrorMessage='<img src="images/alert.gif">' Enabled="False"></asp:RequiredFieldValidator><asp:CustomValidator
                                         ID="cvFrom" runat="server" ControlToValidate="calendarPopupFrom" Display="Dynamic"
                                         Enabled="False" ErrorMessage="Invalid" OnServerValidate="cvFrom_ServerValidate"></asp:CustomValidator>&nbsp;to: <ewc:CalendarPopup ID="calendarPopupTo" runat="server" ControlDisplay="textboximage"
            ImageUrl="./images/calendar.gif" Text="Change Date" Width="65px" CssClass="calendar" Nullable="True" AllowArbitraryText="True" DisableTextBoxEntry="False">
        </ewc:CalendarPopup>
                                 <asp:RequiredFieldValidator ID="rfvTo" runat="server" ControlToValidate="calendarPopupTo"
                                     Display="Dynamic" Enabled="False" ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator><asp:CustomValidator
                                         ID="cvTo" runat="server" ControlToValidate="calendarPopupTo" Display="Dynamic"
                                         Enabled="False" ErrorMessage="Invalid" OnServerValidate="cvTo_ServerValidate"></asp:CustomValidator>&nbsp;&nbsp;mm/dd/yyyy&nbsp;<br />
                                 <asp:CompareValidator ID="cpvDateRange" runat="server" ControlToCompare="calendarPopupTo"
                                     ControlToValidate="calendarPopupFrom" EnableClientScript="False" Enabled="False"
                                     ErrorMessage="The date range is not valid." Operator="LessThanEqual" Type="Date"></asp:CompareValidator></div>
                            </td>
                    </tr>
                    <tr align="right">
                        <td bgcolor="#464646">
                            <img height="5" src="images/spacer.gif" width="80" />&nbsp;</td>
                        <td nowrap bgcolor="#464646" align="left"><asp:Button ID="btnBack2" runat="server" OnClick="btnBack2_Click" Text="<<< Go back" CausesValidation="False" />
                            <asp:Button ID="btnContinue2" runat="server" Text="Continue >>>" OnClick="btnContinue2_Click" /></td>
                    </tr>
                </table>
                <table border="0" cellspacing="1" cellpadding="2" id="tableUserCategory" runat="server" visible="false">
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td nowrap align="right">
                            <font face="Arial, Helvetica, sans-serif" size="1"><span style="font-size: 10pt;
                                color: #ff0000">
                                <img height="363" src="images/spacer.gif" width="80" />&nbsp;</span></font></td>
                        <td valign="top"><asp:CustomValidator ID="cvUserCategory" runat="server" ClientValidationFunction="ValidateUserCategory"
                                ControlToValidate="rblUserCategory" Display="Dynamic" ErrorMessage="Please choose an user category."
                                Font-Names="Arial" Font-Size="12px" OnServerValidate="cvUserCategory_ServerValidate"
                                ValidateEmptyText="True"></asp:CustomValidator><br />
                            <asp:RadioButtonList ID="rblUserCategory" runat="server" Font-Names="Arial" Font-Size="12px" DataTextField="description" DataValueField="id">
                                <asp:ListItem>MLB</asp:ListItem>
                                <asp:ListItem>Club</asp:ListItem>
                                <asp:ListItem>Minor League</asp:ListItem>
                                <asp:ListItem>Sponsor</asp:ListItem>
                                <asp:ListItem>Licensee</asp:ListItem>
                                <asp:ListItem>Agency</asp:ListItem>
                                <asp:ListItem>Media</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:RadioButtonList>
                            <div id="Div1" style="visibility:hidden">
                                &nbsp;&nbsp;</div>
                        </td>
                    </tr>
                    <tr align="right">
                        <td bgcolor="#464646">
                            <img height="5" src="images/spacer.gif" width="80" />&nbsp;</td>
                        <td nowrap bgcolor="#464646" align="left"><asp:Button ID="btnBack3" runat="server" OnClick="btnBack3_Click" Text="<<< Go back" CausesValidation="False" />
                            <asp:Button ID="btnContinue3" runat="server" Text="Continue >>>" OnClick="btnContinue3_Click" /></td>
                    </tr>
                </table>
                <table border="0" cellspacing="1" cellpadding="2" id="tableRequestor" runat="server" visible="false">
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td nowrap align="right">
                            <font face="Arial, Helvetica, sans-serif" size="1"><span style="font-size: 10pt;
                                color: #ff0000">
                                <img height="363" src="images/spacer.gif" width="80" />&nbsp;</span></font></td>
                        <td valign="top"><asp:CustomValidator ID="cvRequestor" runat="server" ClientValidationFunction="ValidateRequestor"
                                ControlToValidate="ddlRequestor" Display="Dynamic" ErrorMessage="Please choose a MLB Contact."
                                Font-Names="Arial" Font-Size="12px" OnServerValidate="cvRequestor_ServerValidate"
                                ValidateEmptyText="True"></asp:CustomValidator><br />
                            &nbsp;<asp:DropDownList ID="ddlRequestor" runat="server" DataSourceID="ObjectDataSource2"
                                DataTextField="name" DataValueField="id" OnDataBound="ddlRequestor_DataBound">
                            </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllRequestors" TypeName="dsCompanyTableAdapters.requestorsTableAdapter">
                            </asp:ObjectDataSource>

                        </td>
                    </tr>
                    <tr align="right">
                        <td bgcolor="#464646">
                            <img height="5" src="images/spacer.gif" width="80" />&nbsp;</td>
                        <td nowrap bgcolor="#464646" align="left"><asp:Button ID="btnBack4" runat="server" OnClick="btnBack4_Click" Text="<<< Go back" CausesValidation="False" />
                            <asp:Button ID="btnContinue4" runat="server" Text="Continue >>>" OnClick="btnContinue4_Click" /></td>
                    </tr>
                </table>
                <table border="0" cellspacing="1" cellpadding="2" id="tablesitlet" runat="server" visible="false">
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td nowrap align="right">
                            <font face="Arial, Helvetica, sans-serif" size="1"><span style="font-size: 10pt;
                                color: #ff0000">
                                <img height="363" src="images/spacer.gif" width="80" />&nbsp;</span></font></td>
                        <td valign="top"><asp:CustomValidator ID="cvSitelet" runat="server" ClientValidationFunction="ValidateUserCategory"
                                ControlToValidate="rblUserCategory" Display="Dynamic" ErrorMessage="Please choose at least one sitelet."
                                Font-Names="Arial" Font-Size="12px" OnServerValidate="cvSitelet_ServerValidate"
                                ValidateEmptyText="True"></asp:CustomValidator><br />
                           <asp:CheckBoxList ID="cblSitelet" runat="server" Font-Names="Arial" Font-Size="12px" DataSourceID="ObjectDataSource3" DataTextField="description" DataValueField="id" OnDataBound="cblSitelet_DataBound">
                                </asp:CheckBoxList><asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetAllSitelets" TypeName="dsCompanyTableAdapters.siteletsTableAdapter">
                                </asp:ObjectDataSource>
                    
                        </td>
                    </tr>
                    <tr align="right">
                        <td bgcolor="#464646">
                            <img height="5" src="images/spacer.gif" width="80" />&nbsp;</td>
                        <td nowrap bgcolor="#464646" align="left"><asp:Button ID="btnBack5" runat="server" OnClick="btnBack5_Click" Text="<<< Go back" CausesValidation="False" />
                            <asp:Button ID="btnContinue5" runat="server" Text="Continue >>>" OnClick="btnContinue5_Click" /></td>
                    </tr>
                </table>
                
                <table border="0" cellspacing="1" cellpadding="2" id="tableFinished" runat="server" visible="false">
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td valign="top">
                            &nbsp;<br />
                            <span style="font-size: 10pt; font-family: Arial">You have successfully <font color="#cc9900">
                                added</font> a company to the database!<br />
                                <br />
                                <asp:Literal ID="ltrAddUsers" runat="server"></asp:Literal>
                                <br />
                            <a href="./">Return to Admin Home</a><br /></span>
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
