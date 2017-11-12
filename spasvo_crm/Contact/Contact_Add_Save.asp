<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<%

Set rs=dbconn.execute("Insert Into T_Client_Name ( Client_Name_Client,Client_Name_Name,Client_Name_Department,Client_Name_Duty,Client_Name_Tel,Client_Name_Mobile,Client_Name_Email,Client_Name_QQ,Client_Name_MSN,Client_Name_Zhishi,Client_Name_Text,Client_Name_Date ) values ( '" & Request("Client_Name_Client") & "','" & Request("Client_Name_Name") & "','" & Request("Client_Name_Department") & "','" & Request("Client_Name_Duty") & "','" & Request("Client_Name_Tel") & "','" & Request("Client_Name_Mobile") & "','" & Request("Client_Name_Email") & "','" & Request("Client_Name_QQ") & "','" & Request("Client_Name_MSN") & "','" & Request("Client_Name_Zhishi") & "','" & Request("Client_Name_Text") & "','" & Request("Client_Name_Date") & "' )")

	response.write "<script language=javascript>"
	response.write "this.location.href='Contact_Add.asp';"
	response.write "</script>"

%>