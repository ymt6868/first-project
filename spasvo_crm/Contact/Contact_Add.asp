<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�Ϻ���������������޹�˾</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="../Include/AutoDate.asp"-->
<script language="javascript" type="text/javascript">
function ContactForm()
{
	if (document.getElementById("Client_Name_Client").value=="")
	{
			alert("�ͻ����Ʋ���Ϊ��!");
			return false;
	}
	
	if (document.getElementById("Client_Name_Name").value=="")
	{
			alert("�ͻ���������Ϊ��!");
			return false;
	}
}
</script>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----��������----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <form id="Myfrom" name="Myfrom" method="post" action="Contact_Add_Save.asp" onSubmit="return ContactForm();">
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�����&nbsp;
			<%

			 Client_sales=session("User_Id")
			 UserSql="Client_sales=" & Client_sales
			 Set Rs=dbconn.execute("Select * From T_Client Where " & UserSql & "") 
			%>
            <select name="Client_Name_Client" id="Client_Name_Client" style="width:300px;">
				<% do while not rs.eof %>
				<option value="<%=trim(Rs("Client_ID"))%>"><%=trim(Rs("Client_Company"))%></option>
				<%
				rs.movenext
				loop
				%>
            </select>            </td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�����&nbsp;
          <input type="text" name="Client_Name_Name" id="Client_Name_Name" style="width:294px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�����&nbsp;
          <input type="text" name="Client_Name_Department" id="Client_Name_Department" style="width:294px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�ְλ&nbsp;
		  <select name="Client_Name_Duty" id="Client_Name_Duty" style="width:300px;" >
		  <%
			 Set Rs=dbconn.execute("select * from T_System Where System_Class='D' order by System_order") 
			 do while not rs.eof
			 %>
            <option value="<%=trim(rs("System_Key"))%>"><%=trim(rs("System_Title"))%></option>
			<%
			 rs.movenext
			 Loop
			%>
			</select>
		  </td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ��绰&nbsp;
          <input type="text" name="Client_Name_Tel" id="Client_Name_Tel" style="width:294px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ��ֻ�&nbsp;
          <input type="text" name="Client_Name_Mobile" id="Client_Name_Mobile" style="width:294px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�����&nbsp;
          <input type="text" name="Client_Name_Email" id="Client_Name_Email" style="width:294px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�&nbsp;Q&nbsp;Q&nbsp;
            <input type="text" name="Client_Name_QQ" id="Client_Name_QQ" style="width:294px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�&nbsp;MSN&nbsp;
            <input type="text" name="Client_Name_MSN" id="Client_Name_MSN" style="width:294px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�����̶�&nbsp;
		    <select name="Client_Name_Zhishi" id="Client_Name_Zhishi" style="width:300px;">
				<option value="1">����</option>
				<option value="2">�Զ�</option>
				<option value="3">��ͨ</option>
			</select>	
		</td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;������Ϣ&nbsp;
          <textarea name="Client_Name_Text" id="Client_Name_Text" style="width:294px; height:100px;"></textarea></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;��־����&nbsp;
            <input type="text" style="width:294px;" name="Client_Name_Date" id="Client_Name_Date" onfocus="setday(this)" value="<%=Date()%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;
            <input type="submit" name="button2" value="ȷ����" style="width:80px;line-height:16px;" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
          <input type="reset" name="Submit2" value="�ء�д" style="width:80px;line-height:16px;" /></td>
        </tr>
      </table>
	  </form>
</body>
</html>
