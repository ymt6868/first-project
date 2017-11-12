<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件技术有限公司</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../Javascript/Client.js"></script>
</head>

<body>
<!--#include file="../Include/AutoDate.asp"-->
<%
Set RS=dbconn.execute("select * from T_Client,T_User,T_User_Reservation where Reservation_Client=Client_ID And Reservation_User=User_Id And Reservation_ID='" & Request("ID") & "'")
%>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----查看预订----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
        <tr>
          <td width="20%" height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;单　位</td>
          <td width="20%" height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;<%=trim(rs("Client_Company"))%></td>
        </tr>
        <tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;标　题</td>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;<%=trim(rs("Reservation_Title"))%></td>
        </tr>
        <tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;描　述          </td>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;<%=trim(rs("Reservation_Text"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;预订日期          </td>
          <td bgcolor="#FFFFFF">&nbsp;<%=trim(rs("Reservation_Date"))%></td>
          <td bgcolor="#FFFFFF">&nbsp;新增日期          </td>
          <td bgcolor="#FFFFFF">&nbsp;<%=trim(rs("Reservation_Add_Date"))%></td>
        </tr>
      </table>  
      <br />
      <form id="form1" name="form1" method="post" action="Reservation_View_Save.asp">
	  <input type="hidden" name="Reservation_ID" id="Reservation_ID" value="<%=Trim(RS("Reservation_ID"))%>" />
        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
          <tr align="center">
            <td height="30" bgcolor="#FFFFFF">转化</td>
            <td bgcolor="#FFFFFF">
			<select name="Reservation_Key" id="Reservation_Key" style="width:80px;line-height:16px;">
				<option value="N">等待</option>
				<option value="Y">完成</option>
				<option value="X">未完成</option>
            </select>
            </td>
            <td bgcolor="#FFFFFF"><input type="submit" name="Submit" value="确 认" style="width:80px;line-height:16px;" /></td>
          </tr>
        </table>
</form>
<script type="text/vbscript" language="vbscript">
	document.getElementById("Reservation_Key").value="<%=trim(RS("Reservation_Key"))%>"
</script>
</body>
</html>
