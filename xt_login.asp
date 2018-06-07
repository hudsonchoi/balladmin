<%@ Language=VBScript %>
<% Option Explicit %>
<%
if (Lcase (Request.Form("username")) = "administrator" and Lcase (Request.Form("password")) = "11admin93") or _
   (Lcase (Request.Form("username")) = "mlbadministrator" and Lcase (Request.Form("password")) = "ffax1s") then 'When the user is valid
	Session("admin")=True
	Response.Redirect("default.asp")
else
	Response.Redirect("login.asp?code=invalid")
end if
%>