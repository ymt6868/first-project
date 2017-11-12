<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<%
		User_Username=request("User_Username")
		User_password=request("User_password")
		User_China=request("User_China")
		User_System=request("User_System")
		User_Key=request("User_Key")
		User_Admin=request("User_Admin")
		
		Set Rs=dbconn.execute("Insert Into T_User ( User_Username,User_password,User_China,User_System,User_Key,User_Admin ) values ( '" & User_Username & "','" & Request("User_password") & "','" & User_China & "','" & User_System & "','" & User_Key & "','" & User_Admin & "')")
		
		response.write "<script language=javascript>"
		response.write "this.location.href='User_List.asp';"
		response.write "</script>"
%>