<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompanyReportByCategory.aspx.cs" Inherits="CompanyReportByCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>:: MLB Style Guides :: Companies by Category </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
      <asp:Label ID="lblBreadCrumb" runat="server" Text='<a href="./">Home</a> :: Companies by Category' Font-Bold="True" Font-Names="Arial" Font-Size="14pt"></asp:Label>&nbsp;
</td>
</tr>
</table>
<br />
<table border="0" cellspacing="0" cellpadding="0" runat="server" id="requestorTable">
  <tr valign="top"> 
      <td><img src="/portal/images/inv.gif" width="330" height="1"></td>
    <td><img src="/portal/images/portal_dottedline.gif" width="17" height="233"></td>
      <td style="width: 113px;"><font size="3" face="Arial, Helvetica, sans-serif"><i>
          <asp:Label ID="lblDescription" runat="server" Text="Choose a user category" Width="238px"></asp:Label></i></font><br />
          <br />
              <asp:DropDownList ID="ddlCategory" runat="server">
                    <asp:ListItem Value="">Select One</asp:ListItem>
                    <asp:ListItem>MLB</asp:ListItem>
                    <asp:ListItem>Club</asp:ListItem>
                    <asp:ListItem>Minor League</asp:ListItem>
                    <asp:ListItem>Sponsor</asp:ListItem>
                    <asp:ListItem>Licensee</asp:ListItem>
                    <asp:ListItem>Agency</asp:ListItem>
                    <asp:ListItem>Media</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
              </asp:DropDownList><asp:RequiredFieldValidator ID="rfvCateogry" runat="server" ControlToValidate="ddlCategory" ErrorMessage='<img src="images/alert.gif">'></asp:RequiredFieldValidator> <asp:CheckBox ID="cbActive" runat="server" Text="Active" Checked="True" Font-Names="Arial" Font-Size="10pt" />
          <%--          <asp:DropDownList ID="ddlRequestor" runat="server" DataSourceID="ObjectDataSource1"
              DataTextField="name" DataValueField="id" OnDataBound="ddlRequestor_DataBound" AutoPostBack="True">
          </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllRequestors" TypeName="dsCompanyTableAdapters.requestorsTableAdapter">
          </asp:ObjectDataSource>--%>
          
          <br /><br />
          <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><br />
          &nbsp;</td>
  </tr>
</table>
  <div style="margin:20px" runat="server" id="resultDiv" visible="false">
  <table>
  <tr>
  <td><font size="3" face="Arial, Helvetica, sans-serif"><i><asp:Label ID="lblResult" runat="server" Text="" Width="220px"></asp:Label></i></font></td>
  <td align="right"><asp:LinkButton ID="lbXLS" runat="server" Font-Bold="True" OnClick="lbXLS_Click" Font-Names="Arial">Export to <img src="./images/icon-xls.gif" border="0"/></asp:LinkButton></td>
  </tr>
  </table>
  
    <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" CellSpacing="2" Font-Names="Arial" GridLines="None" AllowSorting="True" OnSorting="gvCompany_Sorting" OnRowDataBound="gvCompany_RowDataBound">
        <Columns>
                        <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                            <ItemStyle VerticalAlign="Top" />
                        </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" SortExpression="UserLevel" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="UserCategory" HeaderText="UserCategory" SortExpression="UserCategory" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="RequestorName" HeaderText="MLBContactName" ReadOnly="True"
                SortExpression="RequestorName" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField> 
            <asp:BoundField DataField="ID" HeaderText="Sitelet" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True"
                SortExpression="Status" HtmlEncode="False" >
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField> 
        </Columns>
        <AlternatingRowStyle BackColor="DimGray" />
    </asp:GridView>
      &nbsp;
    </div>
    <br /><br /><br /><br /><br />
</form> 
</body>
 </html>
