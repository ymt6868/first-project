<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<%
		User_ID=request("User_ID")
		User_Username=request("User_Username")
		User_password=request("User_password")
		User_China=request("User_China")
		User_System=request("User_System")
		User_Key=request("User_Key")
		User_Admin=request("User_Admin")
		
		Set Rs=dbconn.execute("Update T_User Set User_Username='" & request("User_Username") & "',User_password='" & request("User_password") & "',User_China='" & request("User_China") & "',User_System='" & request("User_System") & "',User_Key='" & request("User_Key") & "',User_Admin='" & request("User_Admin") & "' where User_ID=" & request("User_ID") & "")
		
		response.write "<script language=javascript>"
		response.write "this.location.href='User_List.asp';"
		response.write "</script>"
%>