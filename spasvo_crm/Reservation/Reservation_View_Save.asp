<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
	<%	
		Reservation_ID=request("Reservation_ID")
		Reservation_Key=request("Reservation_Key")
		
		set rs=dbconn.execute("Update T_User_Reservation set Reservation_Key='" & request("Reservation_Key") & "' where Reservation_ID=" & Reservation_ID & "")
		
		response.write "<script language=javascript>"
		response.write "this.location.href='Reservation_View.asp?ID=" & Reservation_ID & "';"
		response.write "</script>"
	%>
</body>
</html>
