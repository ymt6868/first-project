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
<script language="javascript">
	function AddItem(strFileName)
	{
		document.getElementById("Client_File_Url").value=strFileName;
	}
</script>
<!--#include file="../Include/AutoDate.asp"-->
<script language="javascript" type="text/javascript">
function ContactForm()
{
	if (document.getElementById("Client_File_Client").value=="")
	{
			alert("�ͻ����Ʋ���Ϊ��!");
			return false;
	}
	
	if (document.getElementById("Client_File_FileName").value=="")
	{
			alert("����д�ĵ�����!");
			return false;
	}
	
	if (document.getElementById("Client_File_Url").value=="")
	{
			alert("��ѡ���ϴ��ĵ�!");
			return false;
	}
		
}
</script>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----�����ĵ�----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <form action="ClientFile_Add_Save.asp" method="post" name="Myfrom" id="Myfrom" onSubmit="return ContactForm();">
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�����&nbsp;
			<%
			 Client_sales=session("User_Id")
			 UserSql="Client_sales=" & Client_sales
			 Set Rs=dbconn.execute("Select * From T_Client Where " & UserSql & "") 
			%>
            <select name="Client_File_Client" id="Client_File_Client" style="width:300px;">
				<% do while not rs.eof %>
				<option value="<%=trim(Rs("Client_ID"))%>"><%=trim(Rs("Client_Company"))%></option>
				<%
				rs.movenext
				loop
				%>
            </select>            </td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ĵ�����&nbsp;
            <input type="text" name="Client_File_FileName" id="Client_File_FileName" style="width:294px;" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ϴ��ĵ�&nbsp;
            <input type="text" name="Client_File_Url" id="Client_File_Url" style="width:294px;" readonly="readonly" />
            ע���Զ�����</td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;�ĵ���ַ&nbsp;
          <iframe src="../Include/upload.htm" width="300" height="30" frameborder="0" scrolling="No"></iframe></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;������Ϣ&nbsp;
          <textarea name="Client_File_Text" id="Client_File_Text" style="width:294px; height:100px;"></textarea></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;��־����&nbsp;
            <input type="text" style="width:294px;" name="Client_File_Date" id="Client_File_Date" onfocus="setday(this)" value="<%=Date()%>" /></td>
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
