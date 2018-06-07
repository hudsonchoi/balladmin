<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--
function MakeCompanyBlank(){
    form1.tbCompany.value = "";
}
function MakeUserBlank(){
    form1.tbUser.value = "";
}
//-->
</script>
<style type="text/css">
    table td {
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 18px;
	}
	.AdminLink{
	    padding-top: 20px;
        padding-left: 28px
	}
	.backcopy
	{
		font-size:40px
	}
	.mlbColumn
	{
		width:260px;
		float:left;
		margin-right:30px;
	}
	
	.mlbCell
	{
		border:solid;
		border-width:4px;
		border-color:#666;
		margin-bottom:20px;
		padding:10px;
		width:650px;
		height:250px;
	}
	
	.mlbP
	{
		margin-left:5px;
		margin-bottom: -10px;
		color:#666;
	}
	
	.mlbRed
	{
		font-size:20px;
		background-color:Red;
		padding:10px;
	}
	
	.mlbBlue
	{
		font-size:20px;
		background-color:Blue;
		padding:10px;
	}
 A.noUnderline:link {text-decoration: none;color: #FFF;}
 A.noUnderline:visited {text-decoration: none;color: #FFF;}
 A.noUnderline:active {text-decoration: none;color: #FFF;}
 A.noUnderline:hover {text-decoration: none;color: #FFF;}
		
</style>
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="images/404040.gif">
<form id="form1" runat="server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
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
    <td width="150"><img src="/portal/images/inv.gif" width="150" height="1"></td>
    <td>
    
    <div class="mlbColumn">
    <div class="mlbCell">
    <div style="float:left">
        <img src="images/admin_adduser_type_small.gif" /><br /><br /><br /><br /><br /><br /><br />
    </div>
    
    <div style="float:left;">
    <p class="mlbP">A company already exists in the database.</p>
    <p><a href="CompanyMgr.aspx"><img src="images/admin_srchcmpy_button.gif" border="0"/></a></p>
    <p class="mlbP" style="margin-top:40px">No company registration exists for this new user.</p>
    <p><a href="AddCompany.aspx"><img src="images/admin_createcmpy_button.gif" border="0"/></a></p>
    <br /><br />
    </div>
    
    </div>
    <br /><br /><br /><br /><br /><br />
    </div>
        <br /><br /><br />
    </td>
  </tr>
</table>
<br>
<br>
</form>
</body>
 </html>
