<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件技术有限公司</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----修改密码----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<form id="form1" name="form1" method="post" action="User_Password.asp" onsubmit="return UpdatePassWord();">
<input type="hidden" name="Action" id="Action" value="Edit" />
  <table width="250" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td height="28">旧密码</td>
      <td><input name="Client_Password_1" type="password" id="Client_Password_1" /></td>
    </tr>
    <tr>
      <td height="28">新密码</td>
      <td><input name="Client_Password_2" type="password" id="Client_Password_2" /></td>
    </tr>
    <tr>
      <td height="28">新密码</td>
      <td><input name="Client_Password_3" type="password" id="Client_Password_3" /></td>
    </tr>
    <tr>
      <td height="28">&nbsp;</td>
      <td><input type="submit" name="Submit2" value="确 认" style="width:69px;" />
      <input type="reset" name="Submit" value="重 写" style="width:69px;" /></td>
    </tr>
  </table>
</form>
<%
if request("Action")="Edit" then
	set rs=dbconn.execute("select * from T_User where User_Id='" & session("User_Id") & "'")
	if not rs.eof and trim(rs("User_Password"))=request("Client_Password_1") then
		if request("Client_Password_2")=request("Client_Password_3") then
			set rs=dbconn.execute("Update T_User set User_Password='" & request("Client_Password_2") & "' Where User_Id='" & session("User_Id") & "'")
			response.write "<script language=javascript>"
			response.write "alert('修改成功！');"
			response.write "this.location.href='User_Password.asp';"
			response.write "</script>"	
		else
			response.write "<script language=javascript>"
			response.write "alert('输入两次密码不一样！');"
			response.write "this.location.href='User_Password.asp';"
			response.write "</script>"			
		end if
	else
		response.write "<script language=javascript>"
		response.write "alert('旧密码不正确！');"
		response.write "this.location.href='User_Password.asp';"
		response.write "</script>"
	end if
end if
%>
<script language="javascript">
	function UpdatePassWord()
	{
		if ( document.getElementById("Client_Password_1").value=="" || document.getElementById("Client_Password_2").value=="" || document.getElementById("Client_Password_3").value=="" )
		{ 
			alert("请填写完整信息!");
			return false;
		}
	}
</script>
</body>
</html>
