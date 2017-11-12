<%
If session("User_Id")="" or session("System_Title")="" or session("System_Key")="" or session("User_Username")="" or session("User_China")="" then
	Response.Write("<script language=javascript>this.top.location.href='../Login.asp';</script>")
	response.End()
End if
%>