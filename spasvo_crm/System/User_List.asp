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
        <td><font color="#FFFFFF">----账号管理----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr align="center">
    <td width="35" height="28" bgcolor="#006699"><font color="#FFFFFF">编号</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">账号</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">姓名</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">职位</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">状态</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">日期</font></td>
    <td colspan="2" bgcolor="#006699"><font color="#FFFFFF">操作</font></td>
  </tr>
  <%
	Set rs=dbconn.execute("Select * From T_User,T_System Where User_System=System_Key And System_Class='A' order by User_System,User_ID")
	i=1
	do while not rs.eof
	
			if (i mod 2)=0 then
				Mybgcolor="#E4E4E4"
			else
				Mybgcolor="#FFFFFF"
			end if
%>
  <tr align="center" bgcolor="<%=Mybgcolor%>">
    <td height="28" align="center"><%=i%></td>
    <td height="28" align="center"><%=trim(rs("User_Username"))%></td>
    <td height="28" align="center"><%=trim(rs("User_China"))%></td>
    <td height="28" align="center"><%=trim(rs("System_Title"))%></td>
    <td height="28" align="center"><%IF trim(rs("User_Key"))="Y" Then response.Write("正常") Else response.Write("锁定") End IF%></td>
    <td height="28" align="center"><%=trim(year(cdate(trim(rs("User_Date")))))+"-"+trim(month(cdate(trim(rs("User_Date")))))+"-"+trim(Day(cdate(trim(rs("User_Date")))))%></td>
    <td align="center"><a href="User_Edit.asp?ID=<%=trim(rs("User_ID"))%>">编辑</a></td>
    <td align="center"><a href="User_List?Action=Del&ID=<%=trim(rs("User_ID"))%>"></a><a href="User_Add.asp">新增</a></td>
  </tr>
  <%
	rs.movenext
	i=i+1
	loop
%>
</table>
</body>
</html>
