<%@ Page Language="C#" AutoEventWireup="true" CodeFile="emailblaster2.aspx.cs" Inherits="emailblaster2" validateRequest="false" %>

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
	alert('Bingo'+document.form1.message.value + "<--")
	//return true;
}

function VerifyMSG(source, arguments)
{
    updateRTEs();
    if (document.form1.message.value == ''){
        arguments.IsValid = false;
    }else{
        arguments.IsValid = true;
    }
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
          <asp:Label ID="lblStep" runat="server" Text="Step 3 of 4:"></asp:Label>
          <i>
              <asp:Label ID="lblDescription" runat="server" Text="Provide the email subject and message"></asp:Label></i><b><br>
                  <br />
                  <table id="tableUserCategory" runat="server" border="0" cellpadding="2" cellspacing="1"
                      visible="true">
                      <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                          <td align="right" class="labelClass" nowrap="nowrap">
                              Subject:
                          </td>
                          <td style="width: 400px" valign="top">
                              <asp:TextBox ID="tbSubject" runat="server" Width="350px"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="tbSubject"
                                  ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator></td>
                      </tr>
                      <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                          <td align="right" class="labelClass" nowrap="nowrap" valign="top">
                              Message:</td>
                          <td style="width: 400px" valign="top">
                              <table cellpadding="0" cellspacing="0">
                              <tr>
                              <td>
<script language="JavaScript" type="text/javascript">
<!--
//build new richTextEditor
var rte1 = new richTextEditor('message');
rte1.html = '<%=sContent%>';
//rte1.toggleSrc = false;
rte1.build();
//-->
</script></td>
                              <td valign="top"><asp:CustomValidator ID="cvMessage" runat="server" ErrorMessage='<img src="images/alert.gif">' ClientValidationFunction="VerifyMSG"></asp:CustomValidator>
                                  </td>
                              </tr>
                              </table>
                          </td>
                      </tr>
                      <tr align="right">
                          <td bgcolor="#464646">
                              <img height="5" src="images/spacer.gif" width="80" />&nbsp;</td>
                          <td align="left" bgcolor="#464646" nowrap="nowrap" style="width: 400px">
                              <input id="btnBack" type="button" value="<<< Go back" runat="server"/><asp:Button ID="btnContinue3" runat="server" OnClick="btnContinue3_Click" Text="Continue >>>" /></td>
                      </tr>
                  </table>
        <br>
        </b></font> 

        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
          <tr>
            <td>
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1200">
    <Services>
    <asp:ServiceReference Path="EmailBlaster.asmx" />
    </Services>
    </asp:ScriptManager>
        <script language="javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    
    function Update()
    {
        prm._doPostBack('UpdatePanel1', '');
        setTimeout("Update()", 1000);
    }
    
    function btnFire_onclick() {

        //alert(strSubject)
        ret = EmailBlaster.LaunchEmailBlast('<%=Session["subject"].ToString() %>', '<%=Session["message"].ToString() %>', onComplete, onTimeOut, onError)
        setTimeout("Update()", 1000);
        document.getElementById('UpdatePanel1').style.display = 'block'
        return true;
    }

    function onComplete(arg){
        var mySplitResult = arg.split(":");
        var myHTML;
        document.getElementById('UpdatePanel1').style.display = 'none'
        myHTML = "Total # of emails tried: " + mySplitResult[0] + "<br/><br/>";
        myHTML =  myHTML + "Total # of emails sent: " + (mySplitResult[0]-mySplitResult[1]) + "<br/><br/>";
        if (mySplitResult[0] == '<%=Session["iRemaining"].ToString() %>'){
            
            if (parseInt(mySplitResult[1])>0){
                myHTML = myHTML + "Total # of emails failed: " + mySplitResult[1] + "<br/><br/>";
                myHTML = myHTML + "Here is the list of emails failed.<br><br>";
            }
            myHTML = myHTML + mySplitResult[2];
            document.getElementById('lblDone').innerHTML = myHTML;
        }else{
            var ua = navigator.userAgent.toLowerCase();
            if (ua.indexOf('safari/') != -1){
                myHTML = myHTML + "Sorry some of them didn't receive the email. Please blast it again to those who did NOT receive it by pressing the button again.";
            }else{
                myHTML = myHTML + "Sorry some of them didn't receive the email. Please blast it again to those who did NOT receive it at <a href=\"javascript:document.location.reload()\">HERE</a>.";
            }
            
        }
        document.getElementById('lblDone').innerHTML = myHTML;
        
        //ret = EmailBlaster.CountSent(, onComplete2, onTimeOut, onError)
        //alert(arg);
    }

    function onComplete2(arg){
        alert(arg);
    }
    function onTimeOut(arg){
        alert("Timeout" + arg.ToString());
    }

    function onError(arg){
        alert("Error" + arg);
    }
    </script>
                <table border="0" cellspacing="1" cellpadding="2" id="tableRequestor" runat="server" visible="false" Style="width:500px">
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td valign="top">
                            &nbsp;<br />
                            <br />
                            <button id="btnFire" onclick="return btnFire_onclick()" type="button">Blast them away!</button><br /><br />
                           <asp:Label ID="lblToSend" runat="server" Text="Label" Width="450px" Font-Size="Large"></asp:Label>
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server" OnLoad="UpdatePanel1_Load">
                                <ContentTemplate><br />
                                    <asp:Label ID="lblResult" runat="server" Text="Label" Width="490px" Font-Size="Large"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                             <br /><br /><asp:Label ID="lblDone" runat="server" Font-Bold="True" Width="490px" Font-Size="Large"></asp:Label>
                
            </td>
                    </tr>
                    <tr bgcolor="#464646" style="font-weight: bold; font-size: 7pt">
                        <td valign="top">
                            <asp:Button ID="btnBack4" runat="server" CausesValidation="False" OnClick="btnBack4_Click"
                                Text="<<< Go back" /></td>
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
