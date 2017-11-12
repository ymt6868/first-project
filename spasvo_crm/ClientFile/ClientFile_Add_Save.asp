<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<%

Set rs=dbconn.execute("Insert Into T_Client_File ( Client_File_Client,Client_File_FileName,Client_File_Url,Client_File_Text,Client_File_Date ) values ( '" & Request("Client_File_Client") & "','" & Request("Client_File_FileName") & "','" & Request("Client_File_Url") & "','" & Request("Client_File_Text") & "','" & Request("Client_File_Date") & "' )")

	response.write "<script language=javascript>"
	response.write "this.location.href='ClientFile_Add.asp';"
	response.write "</script>"

%>