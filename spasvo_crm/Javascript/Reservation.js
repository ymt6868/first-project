
function Reservation_add()
{
	if (document.getElementById("Reservation_Client").value=="")
	{
			alert("��λ���Ʋ���Ϊ��!");
			return false;
	}
	
	if (document.getElementById("Reservation_Title").value=="")
	{
			alert("���ⲻ��Ϊ��!");
			return false;
	}
	
	if (document.getElementById("Reservation_Date").value=="")
	{
			alert("Ԥ�����ڲ���Ϊ��!");
			return false;
	}	
}