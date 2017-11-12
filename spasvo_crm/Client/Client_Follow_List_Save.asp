<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<%

Set rs=dbconn.execute("Insert Into T_Client_Follow ( Follow_Client,Follow_User,Follow_Text,Follow_Date ) values ( '" & Request("Follow_Client") & "','" & Request("Follow_User") & "','" & Request("Follow_Text") & "','" & Request("Follow_Date") & "' )")

'修改客户更新日期
set rs=dbconn.execute("Update T_Client set Client_Update_Date='" & Date() & "' where Client_ID=" & Request("Follow_Client") & "")
'修改客户更新日期

	response.write "<script language=javascript>"
	response.write "this.location.href='Client_Follow_List.asp?ID="& request("Follow_Client") &"';"
	response.write "</script>"

%>