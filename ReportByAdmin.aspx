<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportByAdmin.aspx.cs" Inherits="ReportByAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--


function ShowErrorMessage(source, arguments)
{   
    if ((document.forms[0].tbFirstName.value == "")
      ||(document.forms[0].tbLastName.value == "")
      ||(document.forms[0].tbAddress1.value == "")
      ||(document.forms[0].tbCity.value == "")
      ||(document.forms[0].tbZip.value == "")
      ||(document.forms[0].tbEmail.value == "")
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
      <td> 
          <asp:Label ID="lblBreadCrumb" runat="server" Text='<a href="./">Home</a> :: <a href="Report.aspx">User Report</a> :: Site Administrator' Font-Bold="True" Font-Names="Arial" Font-Size="14pt"></asp:Label>&nbsp;
      </td>
</tr>
</table>
  <div style="margin:20px">
  <table>
  <tr>
  <td><font size="3" face="Arial, Helvetica, sans-serif"><i><asp:Label ID="lblResult" runat="server" Text="" Width="180px"></asp:Label></i></font></td>
  <td align="right"><asp:LinkButton ID="lbXLS" runat="server" Font-Bold="True" OnClick="lbXLS_Click" Font-Names="Arial">Export to <img src="./images/icon-xls.gif" border="0"/></asp:LinkButton></td>
  </tr>
  </table>
<asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CellSpacing="2" DataKeyNames="ID"
        Font-Names="Arial" GridLines="None" AllowSorting="True" OnSorting="gvUsers_Sorting">
        <Columns>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" SortExpression="UserLevel" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="UserCategory" HeaderText="UserCategory" SortExpression="UserCategory" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
        </Columns>
        <AlternatingRowStyle BackColor="DimGray" />
    </asp:GridView>
 </div>
        
  <br>  
</form> 
</body>
 </html>
