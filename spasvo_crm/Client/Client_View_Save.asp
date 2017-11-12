<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<%
Set rs=dbconn.execute("Update T_Client Set Client_State='" & Request("Client_State") & "' Where Client_ID="& Request("Client_ID") &"")

	response.write "<script language=javascript>"
	response.write "this.location.href='Client_list.asp';"
	response.write "</script>"

%>