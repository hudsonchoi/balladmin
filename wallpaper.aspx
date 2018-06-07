<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wallpaper.aspx.cs" Inherits="wallpaper" %>
<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<link href="js/jquery-ui-1.8.9.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../uploadify/swfobject.js"></script>
<script type="text/javascript" src="../uploadify/jquery.uploadify.v2.1.4.js"></script>


<script language="JavaScript" type="text/JavaScript">
<!--
    $(document).ready(function () {

        $('#file_upload').uploadify({
            'uploader': '../uploadify/uploadify.swf',
            'script': '../uploadify/upload.ashx',
            'cancelImg': '../uploadify/cancel.png',
            'folder': 'images/wallpaper',
            'auto': false,
            'multi': true,
            'buttonImg': '../uploadify/button.png',
            'onAllComplete': function (event, data) {
                $('#rightHere').append('<input type=\"hidden\" name=\"uploadPost\" value=\"true\">');
                document.forms['form1'].submit();
            }
        });

        var playerVersion = swfobject.getFlashPlayerVersion();
        if (playerVersion.major == 0) {
            $("#multiple").hide();
            $("#single").css("display","block");
        } else {
            $("#single").hide();
        }
    });

    function DoUpload(){

        var filenames = "";
        $('input[name=filenames]').each(function() {
            filenames += $(this).val() + ",";
        });


        $.ajax({
            type: "POST",
            url: "wallpaper.aspx/CheckFileExists",
            data: "{'filename': '" + filenames + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != "") {//The ISCI (Tier3) already exists!
                    alert(data.d + " already exists.");
                }else{
                    $('#file_upload').uploadifyUpload();
                }
            },
            error: FailedMessage
        });


    }
    function DeleteWallpaper(id, filename) {
        doIt = confirm('Are you sure to delete \'' + filename + '\'?\nWarning! This can NOT be undone!');
        if (doIt) {
            window.location = "deleteWallpaper.aspx?id="+id;
        }
    }

    function FailedMessage(result) {
        alert(result.status + ' ' + result.statusText);
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

    #multiple {
        padding-bottom:20px;
    }
</style>
    <link href="../uploadify/uploadify.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="images/404040.gif" onload="<%= strScript %>">
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
    <td width="150"><img src="/portal/images/inv.gif" width="150" height="1">
    </td>
    <td>
     <asp:Label ID="lblBreadCrumb" runat="server" Text='<a href="./">Home</a> :: Wallpaper' Font-Bold="True" Font-Names="Arial" Font-Size="14pt"></asp:Label>
<br />
              <br />
   <div id="single" style="display:none">
            <a href="http://get2.adobe.com/flashplayer/"><img src="images/flash.png" style="vertical-align:middle" border="0"/></a> Flash player will allow you to upload multiple files at once.
            <table><tr><td style="width:400px"><asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload></td>
                <td><asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click"></asp:Button><asp:CustomValidator ID="cvFileCheck" runat="server" ErrorMessage="The file already exists." OnServerValidate="cvFileCheck_ServerValidate"></asp:CustomValidator></td>
             </tr></table>
    </div>
    <div id="multiple">
        <center>

        <table style="width: 530px">
                <tr>
                    <td align="left" style="width: 375px; padding-top: 3px">
                        <input id="file_upload" type="file" name="file_upload" />
                    </td>
                    <td valign="top">
                        <input type="button" value="Upload" onclick="DoUpload()" /><span id="rightHere"></span>
                    </td>
                </tr>
            </table>
        </center>
    </div>
        <div style="clear:both; width:180px">
            <asp:GridView ID="gvWallpaper" runat="server" EnableModelValidation="True" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDataBound="gvWallpaper_RowDataBound" OnRowCommand="gvWallpaper_RowCommand" CellPadding="3" GridLines="None">
            <AlternatingRowStyle BackColor="DimGray" />
            <Columns>
                  <asp:TemplateField HeaderText="Wallpaper">
                    <ItemTemplate>
                        <a href="./images/wallpaper/<%# DataBinder.Eval(Container.DataItem, "Filename") %>" Target="_blank"><img src="./images/wallpaper/<%# DataBinder.Eval(Container.DataItem, "Filename") %>" width="100" height="76" border="0"></img></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
                <asp:BoundField DataField="DateUploaded" HeaderText="DateUploaded" SortExpression="DateUploaded" />
                <asp:TemplateField HeaderText="Active" Visible="false">
                    <ItemTemplate>
                        <asp:Literal ID="ltrRadio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Active") %>'></asp:Literal>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>              
                 <asp:ButtonField ButtonType="Button" CommandName="Preview" Text="Preview" />
                 <asp:ButtonField ButtonType="Button" CommandName="Publish" Text="Publlish" />
                <asp:TemplateField>
                   <ItemTemplate>
                        <input type="button" value="Delete" onclick="DeleteWallpaper('<%# DataBinder.Eval(Container.DataItem, "ID") %>','<%# DataBinder.Eval(Container.DataItem, "Filename") %>')" />    
                       </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
       <span style="font-size:12px">* Please do not block popup window.</span>

        <br /><br /><br />
    </td>
  </tr>
</table>
<br>
<br>
</form>
</body>
 </html>
