<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<%

set rs=dbconn.execute("Update T_Client_Follow set Follow_Text='" & request("Follow_Text") & "',Follow_Date='" & request("Follow_Date") & "' where Follow_ID=" & request("Follow_ID") & "")

	response.write "<script language=javascript>"
	response.write "this.location.href='Client_Follow_List.asp?ID="& request("Follow_Client") &"';"
	response.write "</script>"

%>