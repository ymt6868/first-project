<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>检索客户</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
</head>

<body>
<br />
<%
IF request("Client_Company") <> "" Then 
 set rs=dbconn.execute("select count(*) from T_Client,T_User Where Client_sales=User_ID And Client_Company like'%"& request("Client_Company") &"%'") %>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td><font color="#0000FF">检索相关 <font color="#FF0000"><%=rs(0)%></font> 条记录</font></td>
  </tr>
</table>
<% set rs=dbconn.execute("select * from T_Client,T_User Where Client_sales=User_ID And Client_Company like'%"& request("Client_Company") &"%'") %>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr align="center">
    <td width="35" height="25" bgcolor="#006699"><font color="#FFFFFF">编号</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">单位</font></td>
    <td width="80" bgcolor="#006699"><font color="#FFFFFF">指派</font></td>
  </tr>
  <%
   i=1	
   do while not rs.eof 
   %>	
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><%=i%></td>
    <td bgcolor="#FFFFFF">&nbsp;<%=trim(rs("Client_Company"))%></td>
    <td align="center" bgcolor="#FFFFFF"><%=trim(rs("User_China"))%></td>
  </tr>
  <% 
  	rs.movenext
	i=i+1
	loop
   %>
</table>
<% End if %>
</body>
</html>
