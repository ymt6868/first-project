
function User_add()
{
	if (document.getElementById("User_Username").value=="")
	{
			alert("�˺Ų���Ϊ��!");
			return false;
	}
	if (document.getElementById("User_password").value=="")
	{
			alert("���벻��Ϊ��!");
			return false;
	}
	if (document.getElementById("User_China").value=="")
	{
			alert("��������Ϊ��!");
			return false;
	}	
}