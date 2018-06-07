<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserMgr.aspx.cs" Inherits="UserMgr" EnableEventValidation="false" %>

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
<form id="form1" runat="server" defaultbutton="btnSearch">
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
      <td style="height: 969px"></td>
    <td style="height: 969px"><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td style="height: 969px">      
       <asp:Label ID="lblBreadCrumb" runat="server" Text='<a href="./">Home</a> :: User Manager' Font-Bold="True" Font-Names="Arial" Font-Size="14pt"></asp:Label>
      <font size="3" face="Arial, Helvetica, sans-serif">
      <table width="900"><tr><td>&nbsp;</td>
      <td align="right"><asp:TextBox ID="tbSearch" runat="server">Email, Name or Company</asp:TextBox> <asp:Button ID="btnSearch"
              runat="server" Text="Search" OnClick="btnSearch_Click" /></td></tr></table>
              <br />   
          <asp:Label ID="lblNum" runat="server" Font-Bold="True" Text="Label"></asp:Label> 

      
          &nbsp;<asp:GridView ID="gvUser" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="500" CellSpacing="2" GridLines="None" DataKeyNames="ID" AllowSorting="True" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" OnRowDeleting="gvUser_RowDeleting" OnSorting="gvReport_Sorting" OnRowCommand="gvUser_RowCommand">
              <Columns>
                  <asp:BoundField >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" SortExpression="UserLevel" >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField DataField="UserCategory" HeaderText="UserCategory" SortExpression="UserCategory" >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField DataField="RequestorName" HeaderText="MLBContactName" SortExpression="RequestorName" >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" HtmlEncode="False" >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
                  <asp:BoundField >
                      <ItemStyle VerticalAlign="Top" />
                  </asp:BoundField>
              </Columns>
              <PagerSettings Position="TopAndBottom" />
              <AlternatingRowStyle BackColor="DimGray" />
              <PagerStyle Font-Bold="True" />
          </asp:GridView>
          &nbsp;&nbsp;
          <br /><br />
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

