<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
	<%		
		Reservation_User=request("Reservation_User")
		Reservation_Key=request("Reservation_Key")
		Reservation_Client=request("Reservation_Client")
		Reservation_Title=request("Reservation_Title")
		Reservation_Text=request("Reservation_Text")	
		Reservation_Date=request("Reservation_Date")
		Reservation_Add_Date=request("Reservation_Add_Date")
		
		'开始添加一条客户基本信息
		
		set rs=dbconn.execute("Insert Into T_User_Reservation ( Reservation_User,Reservation_Key,Reservation_Client,Reservation_Title,Reservation_Text,Reservation_Date,Reservation_Add_Date ) values ('" & Reservation_User & "','" & Reservation_Key & "','" & Reservation_Client & "','" & Reservation_Title & "','" & Reservation_Text & "','" & Reservation_Date & "','" & Reservation_Add_Date & "')")
		
		response.write "<script language=javascript>"
		response.write "this.location.href='Reservation_Add.asp';"
		response.write "</script>"
	%>
</body>
</html>
