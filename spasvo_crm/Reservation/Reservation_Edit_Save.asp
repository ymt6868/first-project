<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
	<%	
		Reservation_ID=request("Reservation_ID")	
		Reservation_Client=request("Reservation_Client")
		Reservation_Title=request("Reservation_Title")
		Reservation_Text=request("Reservation_Text")	
		Reservation_Date=request("Reservation_Date")
		Reservation_Add_Date=request("Reservation_Add_Date")
		
		set rs=dbconn.execute("Update T_User_Reservation Set Reservation_Client='"& Reservation_Client &"',Reservation_Title='"& Reservation_Title &"',Reservation_Text='"& Reservation_Text &"',Reservation_Date='"& Reservation_Date &"',Reservation_Add_Date='"& Reservation_Add_Date &"' Where Reservation_ID='"& Reservation_ID &"'")
		
		response.write "<script language=javascript>"
		response.write "this.location.href='Reservation_ListN.asp';"
		response.write "</script>"
	%>
</body>
</html>
