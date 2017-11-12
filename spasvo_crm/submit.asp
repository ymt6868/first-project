<!--#include file="Include/conn.asp"-->
<%
username=request("username")
password=request("password")
bkye=request("bkye")
'1=1 换成 bkye=session("getcode") 启用验证码
if 1=1 then
	set rs=dbconn.execute("select * from T_User,T_System where User_System=System_ID And User_Username='"& username &"'")
	if rs.eof then
		response.write "<script language=javascript>"
		response.write "alert('用户名不存在！');"
		response.write "this.location.href='login.asp';"
		response.write "</script>"
	else
		if trim(rs("User_Password"))=password then
			IF trim(rs("User_Key"))="Y" Then
				session("User_Id") = trim(rs("User_Id"))
				session("System_Title") = trim(rs("System_Title"))
				session("System_Key") = trim(rs("System_Key"))
				session("User_Username") = trim(rs("User_Username"))
				session("User_China") = trim(rs("User_China"))
				response.write "<script language=javascript>"
				response.write "this.location.href='main.asp';"
				response.write "</script>"
			Else
				response.write "<script language=javascript>"
				response.write "alert('用户名锁定！');"
				response.write "this.location.href='login.asp';"
				response.write "</script>"	
			End IF	
		else
			response.write "<script language=javascript>"
			response.write "alert('密码错误！');"
			response.write "this.location.href='login.asp';"
			response.write "</script>"
		end if
	end if
else
	response.write "<script language=javascript>"
	response.write "alert('验证码错误！');"
	response.write "this.location.href='login.asp';"
	response.write "</script>"	
end if	
%>