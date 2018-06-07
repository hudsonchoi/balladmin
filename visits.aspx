<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visits.aspx.cs" Inherits="visits" %>
<%@ Register TagPrefix="ewc" Namespace="eWorld.UI.Compatibility" Assembly="eWorld.UI.Compatibility" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script language="JavaScript" type="text/JavaScript">
<!--
function SetLastMonth()
{   

    //var lastMonth =;
    //var currentTime = new Date()
    //var month = currentTime.getMonth() + 1
    //var day = currentTime.getDate()
    //var year = currentTime.getFullYear()
    //document.write(month + "/" + day + "/" + year)

    if (form1.cbLastMonth.checked == true){//Set the date range to last month
        //form1.calendarPopup1$textBox.value = '1/1/2010'
        //month = month - 1;
        //if (month == 0){
        //    month = 12;
        //}
        form1.calendarPopup1$textBox.value = '<%= strTheFirstDay %>'
        form1.calendarPopup2$textBox.value = '<%= strTheLastDay %>'
    }else{//Set it to current date
        form1.calendarPopup1$textBox.value = '<%=strOneMonthAgo %>'
        form1.calendarPopup2$textBox.value = '<%= strToday %>'
    }
    
}

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
.calendar td, th{padding:4px;vertical-align:middle;white-space:normal;}
p {margin-bottom:5px;}
</style>
<!--[if gte IE 8]>
<style type="text/css">
#calendarPopup1_image {position:relative; bottom:-5px}
#calendarPopup2_image {position:relative; bottom:-5px}
</style>
<![endif]-->
<!--[if lte IE 7]>
<style type="text/css">
#calendarPopup1_image {position:relative; bottom:3px}
#calendarPopup2_image {position:relative; bottom:3px}
</style>
<![endif]-->
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
      <td style="font-family:Arial; font-weight:bold; font-size:19px"> 
      <a href="./">Home</a> <asp:Literal ID="ltrBreadCrumb" runat="server"></asp:Literal>
      <asp:Literal ID="ltrBreadCrumb2" runat="server"></asp:Literal>
</td>
</tr>
</table>
<br />
<table border="0" cellspacing="0" cellpadding="0" runat="server" id="siteletTable" width="747">
  <tr valign="top"> 
      <td><img src="/portal/images/inv.gif" width="330" height="1"></td>
    <td><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td style="width: 400px; font-family: Arial; font-style:italic; font-size:18px">
          <p>
          <asp:Literal ID="ltDescription" runat="server" Text="Sitelet: Club Marketing Center"/>
          </p>
          <p>

           <asp:Label ID="lblDate" runat="server" Text="Choose the date range:" Width="238px"></asp:Label><br />

         </p>
        
          From: <ewc:CalendarPopup ID="calendarPopup1" runat="server" ControlDisplay="textboximage"
            ImageUrl="./images/calendar.gif" Width="70px" CssClass="calendar" AllowArbitraryText="True" DisableTextBoxEntry="False" LowerBoundDate="1753-01-01">
        </ewc:CalendarPopup><asp:RequiredFieldValidator
                          ID="rfvFrom" runat="server" 
              ControlToValidate="calendarPopup1$textBox" 
              ErrorMessage='<img src="images/alert.gif">' Display="Dynamic"></asp:RequiredFieldValidator>
        
          To: <ewc:CalendarPopup ID="calendarPopup2" runat="server" ControlDisplay="textboximage"
            ImageUrl="./images/calendar.gif" Text="Change Date" Width="70px" CssClass="calendar" AllowArbitraryText="True" DisableTextBoxEntry="False" LowerBoundDate="1753-01-01">
        </ewc:CalendarPopup>
          <asp:RequiredFieldValidator
                          ID="rfvFrom0" runat="server" 
              ControlToValidate="calendarPopup2$textBox" 
              ErrorMessage='<img src="images/alert.gif">' Display="Dynamic"></asp:RequiredFieldValidator>
        
        <br />
          <asp:CheckBox ID="cbLastMonth" runat="server" Text="Last Month" 
              Font-Italic="false" Font-Bold="false" Font-Size="12px"/>
         <p>
         
                   <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
         </p>
        </td>
  </tr>
</table>
  <div style="margin:20px" runat="server" id="resultDiv" visible="false">
  <table>
  <tr>
  <td align="right">
      <asp:LinkButton ID="lbXLS" runat="server" Font-Bold="True" 
          Font-Names="Arial" onclick="lbXLS_Click">Export to <img src="./images/icon-xls.gif" border="0"/></asp:LinkButton></td>
  </tr>
  </table>
  
    <asp:GridView ID="gvVisits" runat="server" CellSpacing="2" Font-Names="Arial" 
          GridLines="None" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="thedate" HeaderText="Date" ReadOnly="True" 
                SortExpression="thedate" />
            <asp:BoundField DataField="perday" HeaderText="Visits" ReadOnly="True" 
                SortExpression="perday" />
        </Columns>
        <RowStyle ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle ForeColor="White" />
        <AlternatingRowStyle BackColor="DimGray" />
    </asp:GridView>
    </div>
    <br /><br /><br /><br /><br />
</form> 
</body>
 </html>
