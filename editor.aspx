<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editor.aspx.cs" Inherits="editor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script language="JavaScript" type="text/javascript" src="./rte/cbrte/html2xhtml.js"></script>
	<script language="JavaScript" type="text/javascript" src="./rte/cbrte/richtext_compressed.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
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
<script language="JavaScript" type="text/javascript">
<!--
//build new richTextEditor
var rte1 = new richTextEditor('rte1');
rte1.html = '<%=sContent%>';
//rte1.toggleSrc = false;
rte1.build();
//-->
</script>
<p><input type="submit" name="submit" value="Submit" />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button"/>
</p>
        <p>
            &nbsp;<asp:Literal ID="Literal1" runat="server"></asp:Literal></p>
    </div>
    </form>
</body>
</html>
