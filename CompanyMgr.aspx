<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompanyMgr.aspx.cs" Inherits="Company" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>:: MLB Style Guides ::</title>
<style>

body{ font-family:Arial, Sans-Serif; }
.even { 
background-color: yellow; 
} 
.odd { 
background-color: red; 
} 

#basic-modal-content {display:none;}

/* Overlay */
#simplemodal-overlay {background-color:#FFF; cursor:wait;}

/* Container */
#simplemodal-container {height:200px; width:450px; padding: 10px; color:#bbb; background-color:#333; border:4px solid #444; padding:12px; font-family:Arial; font-size:12px; text-align:center}
#simplemodal-container .simplemodal-data {padding:8px;}
#simplemodal-container code {background:#141414; border-left:3px solid #65B43D; color:#bbb; display:block; font-size:12px; margin-bottom:12px; padding:4px 6px 6px;}
#simplemodal-container a {color:#ddd;}
#simplemodal-container a.modalCloseImg {background:url(./images/x.png) no-repeat; width:25px; height:29px; display:inline; z-index:3200; position:absolute; top:-15px; right:-16px; cursor:pointer;}
#simplemodal-container h3 {color:#84b8d9;}
.viewUsers {cursor: pointer; cursor: hand;}
.deleteUser {cursor: pointer; cursor: hand;}
.addUser {cursor: pointer; cursor: hand;}
 A.alphabet:link {text-decoration: none; color:#CCCCCC}
 A.alphabet:visited {text-decoration: none; color:#CCCCCC}
 A.alphabet:active {text-decoration: none; color:#CCCCCC}
 A.alphabet:hover {color: #0099CC;}
#regInfo {text-align:left; color:yellow; margin-top:10px}
</style>
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script type='text/javascript' src='js/jquery.simplemodal.js'></script>
<script type="text/javascript">
    $(document).ready(function() {
        var trindex = 0;
        var parentIndex = 0;

        $(".viewUsers").click(function() {
            //alert($(this).parent().parent()[0].tagName);
            //alert($(this).parent().parent()[0].rowIndex);
            //if (parentIndex == $(this).parent().parent()[0].rowIndex) {
            //  alert('Same row!');
            //} else {
            //}

            trindex++;
            var row = '><td colspan="14"><div id="did"><span id="cost"></span></div></td></tr>';
            var rowName = "tr" + parseInt(trindex - 1);
            $("#" + rowName).remove();

            if (parentIndex != $(this).parent().parent()[0].rowIndex) {
                parentIndex = $(this).parent().parent()[0].rowIndex;
                $(this).parent().parent().parent().children(':even').css('background-color', '#404040');
                $(this).parent().parent().parent().children(':odd').css('background-color', 'DimGray');
                $(this).parent().parent().parent().children().css('color', '#CCCCCC');
                $(this).parent().parent().parent().children().css('font-weight', 'normal');
                $(this).parent().parent().css('background-color', '#0099CC');
                $(this).parent().parent().css('color', '#FFFFFF');
                $(this).parent().parent().css('font-weight', 'bold');
                var newRow = "<tr style='background-color:#2D2D2E' id=tr" + trindex + row;
                $(this).parent().parent().after(newRow);

                //ajax call to webservice

                $.ajax({
                    type: "POST",
                    url: "UserService.asmx/GetUsersByCID",
                    //url: "UserService.asmx/HelloWorld",
                    //data: "{'name': '" + $(this).find("td span").text() + "'}",  //passing values to webservice(productid)
                    data: "{'cid': '" + $(this).attr("id") + "'}",
                    //data: "{'id': '100'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(msg) {
                        var htmlCode = "";
                        if (msg.d.length > 0) {
                            htmlCode = GenerateTheUserTable(msg, trindex);
                            //htmlCode = "<h1>Bingo!</h1>";
                        }
                        $("#tr" + trindex).find("td #did #cost").html(htmlCode);
                    },
                    error: FailedMessage     //showing error message if failure
                });
            } else {

                if (parentIndex % 2 == 0) {
                    $(this).parent().parent().css('background-color', '#404040');
                } else {
                    $(this).parent().parent().css('background-color', 'DimGray');
                }
                $(this).parent().parent().css('font-weight', 'normal');
                parentIndex = 0; //Reset it to make it dropdown again
            }
        });

        $(".addUser").click(function() {
        //$("#tbUserEmail").val($(this).attr("id"));
            $("#hvID").val($(this).attr("id"));
            $('#basic-modal-content').modal();
            
            $('#tbUserEmail').keypress(function(event){
              if(event.keyCode == 13){
                $('#send-button').click();
              }
            });
        });


    });
    function FailedMessage(result) {
        alert(result.status + ' ' + result.statusText);
    }
    function DeleteUser(trindex, firstName, cID, uID) {
        doIt = confirm('Are you sure to delete \'' + firstName + '\'?\nWarning! This can NOT be undone!');
        if (doIt) {
            $.ajax({
                type: "POST",
                //url: "WebService.asmx/GetDetails",   //webserviceName/methodName
                url: "UserService.asmx/DeleteUserAndReturnNewList",
                //url: "UserService.asmx/TryIt",
                //url: "UserService.asmx/GetDetails",
                //data: "{'name': '" + $(this).find("td span").text() + "'}",  //passing values to webservice(productid)
                data: "{'uID': '"+uID+"','cID': '"+cID+"' }",
                //data: "{'cID': 'CIDCID'}",
                //data: "{'uID': '100'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(msg) {
                    var htmlCode = "";
                    if (msg.d.length > 0) {
                        htmlCode = GenerateTheUserTable(msg, trindex);
                        //htmlCode = msg.d;
                    }
                    $("#tr" + trindex).find("td #did #cost").html(htmlCode);
                    //$("#tr" + trindex).find("td #did p #cost").html(htmlCode);
                    //$("#tr" + trindex).find("td #did p #cost").html(msg.d[0].firstName + ":" + msg.d[1].firstName + "<br/><br/><br/><br/><br/><br/><br/>");
                    //$("#tr"+trindex ).find("td #did  #des").text(msg.d.description); 
                    //$("#tr"+trindex ).find("td #did #imagepath").attr('src', msg.d.imagePath); //$("#myImage").attr("src", "path/to/newImage.jpg");
                },
                error: FailedMessage     //showing error message if failure
            });
            
        }
    }

    function ChooseThePrimaryContact(trindex, cID, uID) {
        //alert(cid + ":" + uid);
        $.ajax({
            type: "POST",
            //url: "WebService.asmx/GetDetails",   //webserviceName/methodName
            url: "UserService.asmx/ChangePrimaryContact",
            //url: "UserService.asmx/TryIt",
            //url: "UserService.asmx/GetDetails",
            //data: "{'name': '" + $(this).find("td span").text() + "'}",  //passing values to webservice(productid)
            data: "{'uID': '" + uID + "','cID': '" + cID + "' }",
            //data: "{'cID': 'CIDCID'}",
            //data: "{'uID': '100'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(msg) {
                var htmlCode = "";
                if (msg.d.length > 0) {
                    htmlCode = GenerateTheUserTable(msg, trindex);
                    //htmlCode = msg.d;
                }
                $("#tr" + trindex).find("td #did #cost").html(htmlCode);
                //$("#tr" + trindex).find("td #did p #cost").html(htmlCode);
                //$("#tr" + trindex).find("td #did p #cost").html(msg.d[0].firstName + ":" + msg.d[1].firstName + "<br/><br/><br/><br/><br/><br/><br/>");
                //$("#tr"+trindex ).find("td #did  #des").text(msg.d.description); 
                //$("#tr"+trindex ).find("td #did #imagepath").attr('src', msg.d.imagePath); //$("#myImage").attr("src", "path/to/newImage.jpg");
            },
            error: FailedMessage     //showing error message if failure
        });
    }

    function NotifyPrimaryContact(pID, pName, cID, mlbName) {
        //alert(pID + ":" + pFirstName + ":" + cid);
        if (pName == ' ') {
            alert('There is no primary contact selected.');
        } else {
            var message;
            if (mlbName == '') {
                doIt = confirm('Are you sure to email this user list to \'' + pName + '\'?');
            } else {
                doIt = confirm('Are you sure to email this user list to \'' + pName + '\ and CC to the MLB contact \'' + mlbName + '\'?');
            }
              if (doIt) {
                $.ajax({
                    type: "POST",
                    //url: "WebService.asmx/GetDetails",   //webserviceName/methodName
                    url: "UserService.asmx/NotifyPrimaryContact",
                    //url: "UserService.asmx/TryIt",
                    //url: "UserService.asmx/GetDetails",
                    //data: "{'name': '" + $(this).find("td span").text() + "'}",  //passing values to webservice(productid)
                    data: "{'pID': '" + pID + "','cID': '" + cID + "' }",
                    //data: "{'cID': 'CIDCID'}",
                    //data: "{'uID': '100'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(msg) {
                        alert(msg.d);
                        //var htmlCode = "";
                        //if (msg.d.length > 0) {
                        //htmlCode = GenerateTheUserTable(msg, trindex);
                        //htmlCode = msg.d;
                        //}
                        //$("#tr" + trindex).find("td #did #cost").html(htmlCode);
                        //$("#tr" + trindex).find("td #did p #cost").html(htmlCode);
                        //$("#tr" + trindex).find("td #did p #cost").html(msg.d[0].firstName + ":" + msg.d[1].firstName + "<br/><br/><br/><br/><br/><br/><br/>");
                        //$("#tr"+trindex ).find("td #did  #des").text(msg.d.description); 
                        //$("#tr"+trindex ).find("td #did #imagepath").attr('src', msg.d.imagePath); //$("#myImage").attr("src", "path/to/newImage.jpg");
                    },
                    error: FailedMessage     //showing error message if failure
                });
            }
        }


    }

    function GenerateTheUserTable(msg, trindex) {
        htmlCode = "<table width='100%' cellpadding='4' cellspacing='0' border='0'><tr style='color:#FFF;font-weight:bold'>" +
                        "<td><a href=\"#\" onclick=\"NotifyPrimaryContact('" + msg.d[0].pid + "','" + msg.d[0].pFirstName + " " + msg.d[0].pLastName + "','" + msg.d[0].cid + "','" + msg.d[0].mlbName + "')\"><img src=\"images/cmc_companydetails.gif\" border=\"0\"/></a>" +
                        "<td>Primary Contact</td><td>First Name</td><td>Last Name</td>" +
                        "<td>E-mail</td><td>User Category</td><td>MLB Contact</td><td>Status</td></tr>";
        for (var i = 0; i < msg.d.length; i++) {
            if (i % 2 == 1) {
                if (msg.d[i].primaryContact) {
                    htmlCode += "<tr style='background-color:#000;color:#0099CC;font-weight:bold'>";
                } else {
                    htmlCode += "<tr style='background-color:#000'>";
                }

            } else {
                if (msg.d[i].primaryContact) {
                    htmlCode += "<tr style='color:#0099CC;font-weight:bold'>";
                } else {
                    htmlCode += "<tr>";
                }
   
            }
            htmlCode += "<td><a href=\"EditUser.aspx?id=" + msg.d[i].uid + "\"><img src=\"images/cmc_edit_user_dropdown.gif\" border=\"0\"/></a> " +
                            "<img src=\"images/cmc_delete_user_dropdown.gif\" border=\"0\" onclick=\"DeleteUser('" + trindex + "', '" + msg.d[i].firstName + "','" + msg.d[i].cid + "','" + msg.d[i].uid + "')\" class=\"deleteUser\"/> " +
            //"<input type=\"button\" value=\"Delete User\" class=\"deleteUser\" onclick=\"DeleteUser('" + trindex + "', '" + msg.d[i].firstName + "','Hmmm')\">" +
                            "<a href=\"UserDetail.aspx?id=" + msg.d[i].uid + "\"><img src=\"images/cmc_details_dropdown.gif\" border=\"0\"/></a></td>" +
                            "<td><label for=\"radio" + msg.d[i].uid + "\">&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>" +
                            "<input type=\"radio\" name=\"" + msg.d[i].cid + "\" value= \"" + msg.d[i].uid + "\" id=\"radio" +
                            msg.d[i].uid + "\" onclick=\"ChooseThePrimaryContact(" + trindex + "," + msg.d[i].cid + "," + msg.d[i].uid + ")\")";
            if (msg.d[i].primaryContact) {
                htmlCode += " checked";
            }
            htmlCode += "><label for=\"radio" + msg.d[i].uid + "\">&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>" +
                            //"<td>" + msg.d[i].primaryContact + "</td>" +
                            "<td>" + msg.d[i].firstName + "</td>" +
                            "<td>" + msg.d[i].lastName + "</td>" +
                            "<td>" + msg.d[i].email + "</td>" +
                            "<td>" + msg.d[i].userCategory + "</td>";
            if (msg.d[i].requestorName != null) {
                htmlCode += "<td>" + msg.d[i].requestorName + "</td>";
            }
            if (msg.d[i].status != null) {
                htmlCode += "<td>" + msg.d[i].status + "</td>";
            }
            htmlCode += "</tr>";
            //var item = itemData[i];
            //alert(item.Test1 + item.Test2 + item.Test3);
        }
        htmlCode += "</table>";
        return htmlCode;
    }

    function ContactTheUser() {
        //$("#msg").text($("#tbUserEmail").val();
        //$("#msg").text($("#hvID").val());
        if (validateEmail($("#tbUserEmail").val())){         
            $.ajax({
                type: "POST",
                //url: "WebService.asmx/GetDetails",   //webserviceName/methodName
                url: "UserService.asmx/ContactTheUser",
                //url: "UserService.asmx/TryIt",
                //url: "UserService.asmx/GetDetails",
                //data: "{'name': '" + $(this).find("td span").text() + "'}",  //passing values to webservice(productid)
                //data: "{'pID': '" + pID + "','cID': '" + cID + "' }",
                //data: "{'cID': 'CIDCID'}",
                //data: "{'uID': '100'}",
                data: "{'email': '" + $("#tbUserEmail").val() + "','cID': '" + $("#hvID").val() + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(msg) {
                    $("#modal-msg2").css("display", "none");
                    $("#modal-msg1").html("<h2>The registration email was sent successfully!</h2>"
                        + "<div style='text-align:left'>Please keep the following information in case a registration email is not received by the user.</div>"
                        + "<div id='regInfo'>" +  JSON.stringify(msg.d).replace(/"/g,'') + "</div>" 
                    );
                    $("#send-button").css("display", "none");
                    $("#close-link").css("display", "block");
                    //alert(msg.d);
                    //$("#msg").text(msg.d);
                    //var htmlCode = "";
                    //if (msg.d.length > 0) {
                    //htmlCode = GenerateTheUserTable(msg, trindex);
                    //htmlCode = msg.d;
                    //}
                    //$("#tr" + trindex).find("td #did #cost").html(htmlCode);
                    //$("#tr" + trindex).find("td #did p #cost").html(htmlCode);
                    //$("#tr" + trindex).find("td #did p #cost").html(msg.d[0].firstName + ":" + msg.d[1].firstName + "<br/><br/><br/><br/><br/><br/><br/>");
                    //$("#tr"+trindex ).find("td #did  #des").text(msg.d.description); 
                    //$("#tr"+trindex ).find("td #did #imagepath").attr('src', msg.d.imagePath); //$("#myImage").attr("src", "path/to/newImage.jpg");
                },
                error: FailedMessage     //showing error message if failure
            });
        }else{
            alert("Invalid Email..");
        }

    }
</script>
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

function MakeItBlank() {
    //alert('bingo');
    form1.tbSearch.value = "";
    //$("#tbSearch").val() = "";
}

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 
//-->
</script>
</head>
<body bgcolor="#404040" leftmargin="0" topmargin="0" marginwidth="0" text="#CCCCCC" marginheight="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FF0000" background="images/404040.gif">
<form id="form1" runat="server" defaultbutton="btnSearch">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/portal/images/inv.gif" width="1" height="30"></asp:Label>
      </td>
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
              <asp:Label ID="lblBreadCrumb" runat="server" Text='<a href="./">Home</a> :: Company Manager' Font-Bold="True" Font-Names="Arial" Font-Size="14pt"></asp:Label>
<br />
              <br />


      <table width="900"><tr><td><asp:Button ID="btnAdd1" runat="server" OnClick="btnAdd1_Click" Text="Add a company" /></td>
      <td align="right"><asp:TextBox ID="tbSearch" runat="server" Text="Company or Username"></asp:TextBox> <asp:Button ID="btnSearch"
              runat="server" Text="Search" OnClick="btnSearch_Click" /></td></tr></table><br />   
          <asp:Label ID="lblNum" runat="server" Font-Bold="True" Text="Label"></asp:Label>
<div style="padding: 10px; font-weight:bold;">
    <asp:Literal ID="ltAlphaNav" runat="server"></asp:Literal>
 </div><asp:GridView ID="gvCompany" runat="server" 
                  AutoGenerateColumns="False" PageSize="500" GridLines="None" DataKeyNames="ID" 
                  OnRowEditing="gvCompany_RowEditing" 
                  OnPageIndexChanging="gvCompany_PageIndexChanging" 
                  OnRowDataBound="gvCompany_RowDataBound" OnRowDeleting="gvCompany_RowDeleting" 
                  OnSorting="gvReport_Sorting" OnRowCommand="gvCompany_RowCommand" 
                  CellPadding="3" Font-Size="14px">
              <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <img src="images/cmc_add_user.gif" class="addUser" id='<%# DataBinder.Eval(Container.DataItem, "ID")%>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                         <a href="EditCompany.aspx?id=<%# DataBinder.Eval(Container.DataItem, "ID") %>"><img src="images/cmc_edit.gif" border="0"/></a>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                         <a href="DeleteCompany.aspx?id=<%# DataBinder.Eval(Container.DataItem, "ID") %>"><img src="images/cmc_delete.gif" border="0"/></a>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                          <a href="CompanyDetail.aspx?id=<%# DataBinder.Eval(Container.DataItem, "ID") %>"><img src="images/cmc_details.gif" border="0"/></a>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <span id='<%# DataBinder.Eval(Container.DataItem, "ID")%>' class="viewUsers"><img src="images/cmc_view_user.gif" border="0" id="viewUserID" runat="server"/></span>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                  </asp:BoundField>
                  <asp:BoundField DataField="UserName" HeaderText="Registration Username" SortExpression="UserName" >
                  </asp:BoundField>
                  <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" >
                  </asp:BoundField>
                  <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" SortExpression="UserLevel" >
                  </asp:BoundField>
                  <asp:BoundField DataField="UserCategory" HeaderText="UserCategory" SortExpression="UserCategory" >
                  </asp:BoundField>
                  <asp:BoundField DataField="RequestorName" HeaderText="MLBContactName" SortExpression="RequestorName" >
                  </asp:BoundField>
                  <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" HtmlEncode="False" >
                  </asp:BoundField>
              </Columns>
              <PagerSettings Position="TopAndBottom" />
               <HeaderStyle BackColor="DimGray" />
              <AlternatingRowStyle BackColor="DimGray" />
               <PagerStyle Font-Bold="True" />
          </asp:GridView>
          &nbsp;&nbsp;
          <br /><br />
          <asp:Button ID="btnAdd2" runat="server" OnClick="btnAdd1_Click" Text="Add a company" /><a href="AddCompany.aspx"><strong><span style="font-size: 14pt"></span></strong></a></td>
  </tr>
</table>
    <br />
    <br />
    <br />
    <br />
    <br />
 
        
  <br>  
</form> 
<!-- modal content -->
<div id="basic-modal-content">

<div id="modal-msg1">Please provide user's email address below:</div><br /><a href="#" class="simplemodal-close" id="close-link" style="display:none"><b>CLOSE</b></a>
<div id="modal-msg2">Email: <input id="tbUserEmail" type="text" size="30"/><br /><br />
The registration email will be sent to the user.<br /><br />
<input id="send-button" type="button" value="  Send!  " onclick="ContactTheUser()"/>
<input id="hvID" type="hidden" /></div>



</body>
 </html>
