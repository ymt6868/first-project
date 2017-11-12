<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----系统桌面----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><table width="100%" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#006699">
          <tr>
            <td height="20" bgcolor="#006699"><font color="#FFFFFF">&nbsp;正式客户</font></td>
          </tr>
		  <%
		  	 Client_sales=session("User_Id")
		  	 UserSql="Client_sales='" & Client_sales & "'"
		   Set RS=dbconn.execute("Select * From T_Client Where Client_Follow='Y' And " & UserSql & "")
		   do while not rs.eof
		  %>
          <tr>
            <td height="30" bgcolor="#FFFFFF">&nbsp;<a href="../Client/Client_View.asp?Id=<%=trim(rs("Client_Id"))%>"><%=trim(rs("Client_Company"))%></a>&nbsp;[<%=trim(rs("Client_Date"))%>]</td>
          </tr>
		  <%
		  	rs.movenext
			loop
		  %>
        </table></td>
        <td>&nbsp;</td>
        <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#006699">
          <tr>
            <td height="20" bgcolor="#006699"><font color="#FFFFFF">&nbsp;等待预订</font></td>
          </tr>
          <%
		  	 Client_sales=session("User_Id")
		  	 UserSql="Reservation_User='" & Client_sales & "'"
		   Set RS=dbconn.execute("Select * From T_Client,T_User_Reservation Where Reservation_Client=Client_ID And Reservation_Key='N' And " & UserSql & " order by Reservation_Date asc")
		   do while not rs.eof
		  %>
          <tr>
            <td height="30" bgcolor="#FFFFFF">&nbsp;<a href="../Reservation/Reservation_View.asp?Id=<%=trim(rs("Reservation_Id"))%>"><%=trim(rs("Reservation_Title"))%></a>&nbsp;[<font color="#0000FF"><%=trim(rs("Client_Company"))%></font>]&nbsp;[<font color="#FF0000"><%
			IF cdate(trim(rs("Reservation_Date")))-Date()=0 Then
			   response.Write("今天联系")
			ElseIF cdate(trim(rs("Reservation_Date")))-Date()=1 Then
			   response.Write("明天联系")			
			ElseIF cdate(trim(rs("Reservation_Date")))-Date()=2 Then
			   response.Write("后天联系")   
			ElseIF cdate(trim(rs("Reservation_Date")))-Date()<0 Then
			   response.Write("为什么不联系")
			Else
			   response.Write(trim(rs("Reservation_Date")))     		
			End IF
			%></font>]</td>
          </tr>
          <%
		  	rs.movenext
			loop
		  %>
        </table></td>
      </tr>
      
    </table></td>
  </tr>
</table>
</body>
</html>
