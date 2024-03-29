<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
	}
	
	.mlbLink
	{
		margin-left:5px;
		margin-top: -2px;
	}
	
	
	.mlbBlue
	{
		font-size:20px;
		background-color:Blue;
		padding:10px;
	}
		
	 A.noUnderline:link {text-decoration: none;color: #666;}
     A.noUnderline:visited {text-decoration: none;color: #666;}
     A.noUnderline:active {text-decoration: none;color: #666;}
     A.noUnderline:hover {text-decoration: none;color: #0099CC;}
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
        <span class="backcopy">
        <img src="images/admin_adduser_type.gif" style="width: 175px; height: 89px" /></span><br />
        
    <p><a href="AddUser.aspx" class="noUnderline"><img src="images/admin_newusr_button.gif" border="0" /></a></p>
    </div>
    <div class="mlbCell">
    <span class="backcopy">
        <img src="images/admin_createblst_type.gif" 
            style="width: 176px; height: 136px" /></span><br />
    <p><a href="EmailBlaster.aspx" class="noUnderline">
        <img src="images/admin_cmpsemail_button.gif" border="0"/></a></p>
    </div>
    </div>
    
    
    <div class="mlbColumn">
    <div class="mlbCell">
    <span class="backcopy">
        <img src="images/admin_mnglists_type.gif" style="width: 175px; height: 90px" /></span><br />
        <p><a href="CompanyMgr.aspx"><img src="images/admin_cmpy_button.gif" border="0"/></a></p>
        <p><a href="UserMgr.aspx"><img src="images/admin_indvdl_button.gif" border="0"/></a></p>
        <p><a href="RequesterMgr.aspx"><img src="images/admin_mlbcontct_button.gif" border="0"/></a></p>
    </div>
   <div class="mlbCell">
       <table style="width:230px"><tr><td><p class="mlbLink"><a href="wallpaper.aspx" class="noUnderline">Wallpaper</a></p></td>
           <td style="text-align:left">
               <asp:HyperLink ID="hlWallPaper" runat="server" Target="_blank">
                   <asp:Image ID="imgWallpaper" runat="server" BorderStyle="None" Width="100" Height="76" /></asp:HyperLink></td>
        </tr></table>
       
    </div>
    </div>
    
    <div class="mlbColumn">
       <div class="mlbCell">
           <img src="images/admin_runreports_type.gif" 
               style="width: 171px; height: 90px" /><br /><br />
    <p class="mlbLink"><a href="UsersLoggedIn.aspx" class="noUnderline">Users Logged In</a></p>
    <p class="mlbLink"><a href="UsersLoggedIn.aspx?not" class="noUnderline">Users Not Logged In</a></p>
    <p class="mlbLink"><a href="Filesdownloaded.aspx" class="noUnderline">Files Downloaded</a></p>
    <p class="mlbLink"><a href="visits.aspx" class="noUnderline">CMC Visits</a></p>
    <p class="mlbLink"><a href="CompanyReportByRequestor.aspx" class="noUnderline">Companies by MLB Contact</a></p>
    <p class="mlbLink"><a href="ReportByRequestor.aspx" class="noUnderline">Users by MLB Contact</a></p>
               <p class="mlbLink"><a href="CompanyReportByCategory.aspx" class="noUnderline">Companies by Categroy</a></p>
    <p class="mlbLink"><a href="UserReportByCategory.aspx" class="noUnderline">Users by Category</a></p>
    </div>
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
