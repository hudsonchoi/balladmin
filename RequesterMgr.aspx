<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequesterMgr.aspx.cs" Inherits="RequesterMgr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>:: MLB Style Guides ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<asp:literal runat="server" id="ltrJavaScript"></asp:literal>

<script language="javascript">
<!-- Begin
function Select(Select){
    for (var n=0; n < document.forms['form1'].length; n++) 
        if (document.forms['form1'].elements[n].type=='checkbox')
            if (document.forms['form1'].elements[n].id.indexOf('cblLicensees') >= 0)
            document.forms['form1'].elements[n].checked=Select; 
            return false; 
}

function Warning(fn, ln, id){

	if(confirm("Are you sure you want to delete '" + fn + " " + ln + "'?\nWARNING! WARNING! This can NOT be undone!")){
	    //document.write("Bingo"+ln.replace("&#8217;","'"));
	    var fn2 = fn.replace("&#8217;","'");
	    var ln2 = ln.replace("&#8217;","'");
	    window.location = "DeleteRequester.aspx?fn="+fn2+"&ln="+ln2+"&id="+id
	}
}

function DoubleCheck() {
    var ln = $('#ddlMLBContacts option:selected').text().substring(0, $('#ddlMLBContacts option:selected').text().indexOf(" ")-1);
    var fn = $('#ddlMLBContacts option:selected').text().substring($('#ddlMLBContacts option:selected').text().indexOf(" ")+1);
    //alert($('#lblRequestor b').text());
    //if (confirm("Are you sure?")) {
    //}
    //alert($('#ddlMLBContacts').val());
    //alert("Yes");
    //alert($('#ddlMLBContacts option:selected').text());
    if ($('#ddlMLBContacts').val() != "0") {
        if (!confirm('Are you sure you want to assign all users belonging to \'' + $('#lblRequestor b').text() + '\' to \'' + fn + ' ' + ln + '\'?')) return false;
    }
}

function CheckMLBContacts(sender, args) {
    if ($('#ddlMLBContacts').val() == "0") {
        args.IsValid = false;
        
    } else {
        args.IsValid = true;
    }
}
//-->  End 
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
  </t&nbsp;</td>
  </t&nbsp;</td>
  </t&nbsp;</td>
  </t&nbsp;</td>
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
       <asp:Label ID="lblBreadCrumb" runat="server" Text='<a href="./">Home</a> :: MLB Contact Manager' Font-Bold="True" Font-Names="Arial" Font-Size="14pt"></asp:Label> <br /><br />    
       <table width="900"><tr><td><asp:Button ID="btnAdd1" runat="server" OnClick="btnAdd1_Click" Text="Add a MLB Contact" /></td>
      <td align="right"></td></tr></table>
      <font size="3" face="Arial, Helvetica, sans-serif">
      <div style="width:1200px">
      <div style="float:left">
          <asp:GridView ID="gvRequesters" runat="server" AutoGenerateColumns="False" CellSpacing="2"
              DataKeyNames="id" DataSourceID="ObjectDataSource1" GridLines="None" AllowSorting="True" OnRowDataBound="gvRequesters_RowDataBound">
              <Columns>
                  <asp:BoundField DataField="lastname" HeaderText="LastName" SortExpression="lastname" />
                  <asp:BoundField DataField="firstname" HeaderText="FirstName" SortExpression="firstname" />
                  <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                  <asp:BoundField DataField="moreinfo" HeaderText="MoreInfo" SortExpression="moreinfo" />
                  <asp:BoundField />
                 <asp:TemplateField>
                    <ItemTemplate>
                        <input id="btnEditMLBContact" type="button" value="Edit Profile" onclick="window.location='EditRequester.aspx?id=<%# DataBinder.Eval(Container.DataItem, "ID")%>'" />
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:BoundField />
              </Columns>
              <AlternatingRowStyle BackColor="DimGray" />
          </asp:GridView>
          <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
              SelectMethod="GetAllRequestorsExceptSelectOne" TypeName="dsRequestorsTableAdapters.requestorsTableAdapter">
          </asp:ObjectDataSource>
          
        </div>
        <div style="float:left;margin-left:20px;margin-top:20px">
        <asp:Panel ID="pnlEdit" runat="server" Visible="false" style="float:left">
      

        <div>

        <div style="padding-bottom:10px">
              <asp:Label ID="lblMoveDone" runat="server" Text="Label" Font-Bold="True" Font-Size="Small" ForeColor="Yellow" Width="300px">
        You may assign all users to:
        </asp:Label></div>
        <div style="padding-bottom:10px">
            <asp:DropDownList ID="ddlMLBContacts" runat="server" DataTextField="Name" DataValueField="id">
            <asp:ListItem>Alarcon, Chris</asp:ListItem>
            </asp:DropDownList>&nbsp;<asp:CustomValidator ID="cvMLBContacts" runat="server" 
                ErrorMessage='<img src="images/alert.gif">' ControlToValidate="ddlMLBContacts" 
                onservervalidate="cvMLBContacts_ServerValidate" 
                ValidationGroup="assignAll" ClientValidationFunction="CheckMLBContacts"></asp:CustomValidator>
        </div>
        <asp:Button ID="btnMove" runat="server" Text="Save" Width="73px" 
                ValidationGroup="assignAll" OnClientClick="return DoubleCheck()" 
                onclick="btnMove_Click"/><asp:Button ID="btnCancel2" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                    Width="73px" /><br />

        </div>
        <div style="padding-top:10px;padding-bottom:10px" runat="server" id="orDiv">
            --------------------- OR ----------------------------
        </div>
                      
        <asp:Label ID="lblDone" runat="server" Text="Label" Font-Bold="True" Font-Size="Small" ForeColor="Yellow" Width="300px"></asp:Label><br /><br />
         <asp:Panel ID="pnlUsers" runat="server">
         <asp:Label ID="lblRequestor" runat="server" Text="Label"></asp:Label><br /><br />
         <span style="margin-left:10px">Select: <a href="#" onclick="Select(true)">All</a> | <a href="#" onclick="Select(false)">
                None</a></span>
                         <br />
          <div style="float:left; position:absolute">
                <asp:CheckBoxList ID="cblLicensees" runat="server">
          </asp:CheckBoxList>       
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" Width="73px" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                    Width="73px" />
          </div>
         </asp:Panel>

          </asp:Panel>  
                               
          </div>
         </div>

         </font>
         <div style="clear:both">
          <table width="900">
              <tr>
                  <td>
                      <asp:Button ID="btnAdd2" runat="server" OnClick="btnAdd1_Click" Text="Add a MLB Contact" /></td>
                  <td align="right">
                  </td>
              </tr>
          </table>
          </div>

            &nbsp; &nbsp; &nbsp;&nbsp;
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
