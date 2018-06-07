<%@ Page Language="C#" AutoEventWireup="true" CodeFile="emailblaster.aspx.cs" Inherits="emailblaster" %>

<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<%@ Register TagPrefix="ewc" Namespace="eWorld.UI.Compatibility" Assembly="eWorld.UI.Compatibility" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <script language="JavaScript" type="text/javascript" src="./rte/cbrte/html2xhtml.js"></script>
	<script language="JavaScript" type="text/javascript" src="./rte/cbrte/richtext_compressed.js"></script>

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

function MutuallyExclusive(strDropDown)
{
    //alert("Bingo")
    if (strDropDown != "sitelet")
    {
        document.forms[0].ddlSitelet.value = "0"
    }
    if (strDropDown != "requester")
    {
        document.forms[0].ddlRequesters.value = "0"
    }
    if (strDropDown != "level")
    {
        document.forms[0].ddlUserLevel.value = "0"
    }
    if (strDropDown != "category")
    {
        document.forms[0].ddlCategory.value = "0"
    }
}
//-->
</script>

<style type="text/css">
.calendar td, th{padding:5px;vertical-align:middle;white-space:normal;}
#dateLayer {font-family:Arial; font-size: 12px}
#btnFire {width: 183px; height: 45px;font-family:Arial; font-size: 14px; font-weight:bold}
.labelClass {font-size: 12px; font-family:Arial; font-weight: bold}

</style>
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="../images/404040.gif" id="bodyID" runat="server">
    <script language="JavaScript" type="text/javascript">
<!--
function submitForm() {
	//make sure hidden and iframe values are in sync for all rtes before submitting form
	updateRTEs();
	
	return true;
}

//Usage: initRTE(imagesPath, includesPath, cssFile, genXHTML, encHTML)
initRTE("./rte/cbrte/images/", "./rte/cbrte/", "", true, true);
//-->
</script>
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
            <td valign="top" style="height: 77px"><img src="/portal/images/portal_arrow.gif" width="397" height="77"></td>
            <td valign="top" style="height: 77px"><img src="/portal/images/portal_majorleaguestyleguid.gif" width="362" height="77"></td>
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
              style="font-size: 14pt"><strong> :: Email Blast</strong></span></font>
</td>
</tr>
</table>
<br />
<table border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
      <td style="height: 969px"><img src="/portal/images/inv.gif" width="25" height="1"></td>
      <td style="height: 969px"> <font size="3" face="Arial, Helvetica, sans-serif">
          <asp:Label ID="lblStep" runat="server" Text="Step 1 of 4:"></asp:Label>
          <i>
              <asp:Label ID="lblDescription" runat="server" Text="Choose the type of recipients"></asp:Label></i><b><br>
        <br>
        </b></font> 

        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr>
            <td><table border="0" cellspacing="1" cellpadding="2" id="tableProfile" runat="server">
                          <tr style="font-size: 12pt"> 
                  <td nowrap align="right" bgcolor="#464646" class="labelClass">By sitelet:</td>
                  <td nowrap bgcolor="#464646" style="width: 341px"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:DropDownList ID="ddlSitelet" runat="server" Width="200px" DataSourceID="ObjectDataSourceSitelets" DataTextField="description" DataValueField="id" OnDataBound="ddlSitelet_DataBound">
                      </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSourceSitelets" runat="server"
                          OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSitelets" TypeName="dsCompanyTableAdapters.siteletsTableAdapter">
                      </asp:ObjectDataSource>
                  </font></td>
                </tr>
                <tr> 
                  <td nowrap align="right" bgcolor="#464646" class="labelClass">By MLB Contact:</td>
                  <td nowrap bgcolor="#464646" style="width: 341px"><asp:DropDownList ID="ddlRequesters" runat="server" Width="200px" DataSourceID="ObjectDataSourceRequesters" DataTextField="name" DataValueField="id" OnDataBound="ddlRequesters_DataBound">
                  </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSourceRequesters" runat="server"
                      OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllRequestors"
                      TypeName="dsCompanyTableAdapters.requestorsTableAdapter"></asp:ObjectDataSource>
                  </td>
                </tr>
                 <tr> 
                  <td nowrap align="right" bgcolor="#464646" class="labelClass">By user level:</td>
                  <td nowrap bgcolor="#464646" style="height: 20px; width: 341px;"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <asp:DropDownList ID="ddlUserLevel" runat="server" Width="200px">
                          <asp:ListItem Value="0">Select One</asp:ListItem>
                          <asp:ListItem>A</asp:ListItem>
                          <asp:ListItem>B</asp:ListItem>
                          <asp:ListItem>C</asp:ListItem>
                          <asp:ListItem>D</asp:ListItem>
                      </asp:DropDownList></font></td>
                </tr>
                <tr> 
                 <td nowrap align="right" bgcolor="#464646" class="labelClass">By user category:</td>
                  <td nowrap bgcolor="#464646" style="width: 341px">
                      <asp:DropDownList ID="ddlCategory" runat="server" Width="200px">
                          <asp:ListItem Value="0">Select One</asp:ListItem>
                          <asp:ListItem>MLB</asp:ListItem>
                          <asp:ListItem>Club</asp:ListItem>
                          <asp:ListItem>Minor League</asp:ListItem>
                          <asp:ListItem>Sponsor</asp:ListItem>
                          <asp:ListItem>Licensee</asp:ListItem>
                          <asp:ListItem>Agency</asp:ListItem>
                          <asp:ListItem>Media</asp:ListItem>
                          <asp:ListItem>Other</asp:ListItem>
                      </asp:DropDownList></td>
                </tr>
                <tr align="right"> 
                  <td bgcolor="#464646" style="height: 33px">&nbsp;</td>
                  <td nowrap bgcolor="#464646" align="left" style="width: 341px; height: 33px;">
                      <asp:Button ID="btnBack1" runat="server" OnClick="btnBack1_Click" Text="<<< Go back" CausesValidation="False" />
                      <asp:Button ID="btnContinue1" runat="server" Text="Continue >>>" OnClick="btnContinue1_Click" />
                      <br />
                      <asp:CustomValidator ID="cvType" runat="server" CssClass="labelClass" ErrorMessage="Choose a type of recipient."
                          OnServerValidate="cvType_ServerValidate"></asp:CustomValidator></td>
                </tr>
              </table>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                  
        
              <table border="0" cellspacing="1" cellpadding="2" id="tableUserLevel" runat="server" visible="false">
                  <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                      <td valign="top">
                          <asp:Label ID="lblRecipientNumber" runat="server" Text="Label" CssClass="labelClass"></asp:Label>
                          <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <img src="images/ajax-loader.gif" /><br />
                <span class="labelClass">Preparing the database...</span>
            </ProgressTemplate>
        </asp:UpdateProgress>
                      </td>
                  </tr>
                  <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                      <td valign="top"><table cellpadding="0" cellspacing="0"><tr><td>
                      <asp:Button ID="Button1" runat="server" OnClick="btnBack2_Click" Text="<<< Go back" CausesValidation="False" />&nbsp;
                      </td>
                      <td>
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                          <asp:Button ID="Button2" runat="server" Text="Continue >>>" OnClick="btnContinue2_Click" />
                          </ContentTemplate>
                </asp:UpdatePanel>
                      </td>
                      </tr></table>   
                          </td>
                  </tr>
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td valign="top">
                            <asp:GridView ID="gvRecipients" runat="server" CellSpacing="2" Font-Names="Arial" Font-Size="12px" GridLines="None" AllowSorting="True" AutoGenerateColumns="False" OnSorting="gvRecipients_Sorting">
                                <AlternatingRowStyle BackColor="#464646" />
                                <RowStyle BackColor="DimGray" />
                                <Columns>
                                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
                                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                    <asp:BoundField DataField="UserCategory" HeaderText="UserCategory" SortExpression="UserCategory" />
                                    <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" SortExpression="UserLevel" />
                                </Columns>
                            </asp:GridView>
                            </td>
                    </tr>
                    <tr align="right">
                        <td nowrap bgcolor="#464646" align="left">
                        
                        <asp:Button ID="btnBack2" runat="server" OnClick="btnBack2_Click" Text="<<< Go back" CausesValidation="False" />
                            <asp:Button ID="btnContinue2" runat="server" Text="Continue >>>" OnClick="btnContinue2_Click" />
                         
                      
                            </td>
                    </tr>
                </table>
                 
                <table border="0" cellspacing="1" cellpadding="2" id="tableUserCategory" runat="server" visible="false">
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td align="right" nowrap="nowrap" class="labelClass">
                            Subject:
                        </td>
                        <td style="width: 400px" valign="top">
                            <asp:TextBox ID="tbSubject" runat="server" Width="350px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="tbSubject"
                                ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td align="right" nowrap="nowrap" valign="top" class="labelClass">
                            Message:</td>
                        <td style="width: 400px" valign="top">
</td>
                    </tr>
                    <tr align="right">
                        <td bgcolor="#464646">
                            <img height="5" src="images/spacer.gif" width="80" />&nbsp;</td>
                        <td nowrap bgcolor="#464646" align="left" style="width: 400px"><asp:Button ID="btnBack3" runat="server" OnClick="btnBack3_Click" Text="<<< Go back" CausesValidation="False" />
                            <asp:Button ID="btnContinue3" runat="server" Text="Continue >>>" OnClick="btnContinue3_Click" /></td>
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