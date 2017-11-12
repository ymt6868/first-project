
function User_add()
{
	if (document.getElementById("User_Username").value=="")
	{
			alert("账号不能为空!");
			return false;
	}
	if (document.getElementById("User_password").value=="")
	{
			alert("密码不能为空!");
			return false;
	}
	if (document.getElementById("User_China").value=="")
	{
			alert("姓名不能为空!");
			return false;
	}	
}