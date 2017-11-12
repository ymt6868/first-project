
function Reservation_add()
{
	if (document.getElementById("Reservation_Client").value=="")
	{
			alert("单位名称不能为空!");
			return false;
	}
	
	if (document.getElementById("Reservation_Title").value=="")
	{
			alert("标题不能为空!");
			return false;
	}
	
	if (document.getElementById("Reservation_Date").value=="")
	{
			alert("预订日期不能为空!");
			return false;
	}	
}