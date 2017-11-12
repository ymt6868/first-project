<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<%
Set rs=dbconn.execute("Update T_Client Set Client_Follow='" & Request("Client_Follow") & "' Where Client_ID="& Request("Client_ID") &"")

	response.write "<script language=javascript>"
	response.write "this.location.href='Client_View.asp?ID=" & request("Client_ID") & "';"
	response.write "</script>"

%>