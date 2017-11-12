<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<% set rs=dbconn.execute("Select * From T_Client,T_User Where Client_sales=User_Id And Client_Id=" & request("Id") & "")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=trim(rs("Client_Company"))%> 信息</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----<%=trim(rs("Client_Company"))%> 客户信息 跟踪记录----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<%
 Set RS1=dbconn.execute("Select * From T_Client_Follow Where Follow_Client="&request("ID")&" order by Follow_ID")
 i=1
 do while not RS1.eof
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#006699" style="margin:0 0 8px 0 ;">
  <tr>
    <td width="350" height="25" bgcolor="#FFFFFF">&nbsp;<span style="color:#0000FF;">第 <font color="#FF0000"><%=i%></font> 跟踪记录</span></td>
    <td width="100" align="center" bgcolor="#FFFFFF"><%=trim(RS1("Follow_Date"))%></td>
  </tr>
  <tr>
    <td height="30" colspan="2" bgcolor="#FFFFFF" style="padding:5px; line-height:25px;"><%=trim(RS1("Follow_Text"))%></td>
  </tr>
</table>
<%
 RS1.movenext
 i=i+1
 Loop
%>
</body>
</html>
