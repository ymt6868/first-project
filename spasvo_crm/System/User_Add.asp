<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�Ϻ���������������޹�˾</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../Javascript/User.js"></script>
</head>

<body>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----�����˺�----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <form id="Myfrom" name="Myfrom" method="post" action="User_Add_Save.asp" onSubmit="return User_add();">
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ˡ���            </td>
          <td bgcolor="#FFFFFF">&nbsp;
          <input name="User_Username" type="text" id="User_Username" style="width:120px;" /></td>
        </tr>

        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ܡ���            &nbsp;</td>
          <td height="30" bgcolor="#FFFFFF">&nbsp;
          <input name="User_password" type="password" id="User_password" style="width:120px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ա���            </td>
          <td height="30" bgcolor="#FFFFFF">&nbsp;
          <input name="User_China" type="text" id="User_China" style="width:120px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;ְ��λ</td>
          <td height="30" bgcolor="#FFFFFF">&nbsp;
            <select name="User_System" id="User_System" style="width:124px;">
			<option value="1">�г�����</option>
            <option value="2">�г���Ա</option>
          </select></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;״��̬          </td>
          <td height="30" bgcolor="#FFFFFF">&nbsp;
            <select name="User_Key" id="User_Key" style="width:124px;">
            <option value="Y">����</option>
            <option value="X">����</option>
          </select></td>
        </tr>
		<tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;Ȩ����</td>
		  <% set rs1= dbconn.execute("Select * From T_User where User_id<>'" & Request("ID") & "' and User_Key='Y' and User_Username<>'admin' order by User_System,User_ID") %>
          <td height="30" bgcolor="#FFFFFF">
		  &nbsp;
		  <%
		  	 do while not rs1.eof
		  %>
			<input type="checkbox" name="User_Admin" value="<%=trim(rs1("User_id"))%>" /><%=trim(rs1("User_China"))%>&nbsp;
		  <%
		  	 rs1.movenext
			 loop
		  %>
		  </td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" name="button2" value="ȷ����" style="width:80px;line-height:16px;" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
          <input type="reset" name="Submit2" value="�ء�д" style="width:80px;line-height:16px;" /></td>
        </tr>
      </table>
	  </form> 
</body>
</html>
