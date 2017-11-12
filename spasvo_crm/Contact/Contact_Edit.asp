<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件技术有限公司</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--#include file="../Include/AutoDate.asp"-->
<script language="javascript" type="text/javascript">
function ContactForm()
{
	if (document.getElementById("Client_Name_Client").value=="")
	{
			alert("客户名称不能为空!");
			return false;
	}
	
	if (document.getElementById("Client_Name_Name").value=="")
	{
			alert("客户姓名不能为空!");
			return false;
	}
}
</script>
<% Set Rs=dbconn.execute("Select * From T_Client_Name,T_Client Where Client_ID=Client_Name_Client And Client_Name_ID='" & Request("ID") & "'") %>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----编辑联络----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <form id="Myfrom" name="Myfrom" method="post" action="Contact_Edit_Save.asp" onSubmit="return ContactForm();">
	  <input type="hidden" name="Client_Name_ID" id="Client_Name_ID" value="<%=Request("ID")%>" />
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户名称&nbsp;
			<%
			 	IF session("System_Key")="1" Then
					UserSql="1=1"
				Else
					Client_sales=session("User_Id")
					UserSql="Client_sales=" & Client_sales
				End If
			 Set Rs1=dbconn.execute("Select * From T_Client Where " & UserSql & "") 
			%>
            <select name="Client_Name_Client" id="Client_Name_Client" style="width:300px;">
				<% do while not Rs1.eof %>
				<option value="<%=trim(Rs1("Client_ID"))%>"><%=trim(Rs1("Client_Company"))%></option>
				<%
				Rs1.movenext
				loop
				%>
            </select>            </td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户姓名&nbsp;
          <input type="text" name="Client_Name_Name" id="Client_Name_Name" style="width:294px;" value="<%=trim(Rs("Client_Name_Name"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户部门&nbsp;
          <input type="text" name="Client_Name_Department" id="Client_Name_Department" style="width:294px;" value="<%=trim(Rs("Client_Name_Department"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户职位&nbsp;
		  <select name="Client_Name_Duty" id="Client_Name_Duty" style="width:300px;" >
		  <%
			 Set Rs1=dbconn.execute("select * from T_System Where System_Class='D' order by System_order") 
			 do while not Rs1.eof
			 %>
            <option value="<%=trim(Rs1("System_Key"))%>"><%=trim(Rs1("System_Title"))%></option>
			<%
			 Rs1.movenext
			 Loop
			%>
			</select>
		  </td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户电话&nbsp;
          <input type="text" name="Client_Name_Tel" id="Client_Name_Tel" style="width:294px;" value="<%=trim(Rs("Client_Name_Tel"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户手机&nbsp;
          <input type="text" name="Client_Name_Mobile" id="Client_Name_Mobile" style="width:294px;" value="<%=trim(Rs("Client_Name_Mobile"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户邮箱&nbsp;
          <input type="text" name="Client_Name_Email" id="Client_Name_Email" style="width:294px;" value="<%=trim(Rs("Client_Name_Email"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户&nbsp;Q&nbsp;Q&nbsp;
            <input type="text" name="Client_Name_QQ" id="Client_Name_QQ" style="width:294px;" value="<%=trim(Rs("Client_Name_QQ"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户&nbsp;MSN&nbsp;
            <input type="text" name="Client_Name_MSN" id="Client_Name_MSN" style="width:294px;" value="<%=trim(Rs("Client_Name_MSN"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;技术程度&nbsp;
		    <select name="Client_Name_Zhishi" id="Client_Name_Zhishi" style="width:300px;">
				<option value="1">不懂</option>
				<option value="2">略懂</option>
				<option value="3">精通</option>
			</select>
			</td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;其它信息&nbsp;
          <textarea name="Client_Name_Text" id="Client_Name_Text" style="width:294px; height:100px;"><%=trim(Rs("Client_Name_Text"))%></textarea></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;日志日期&nbsp;
            <input type="text" style="width:294px;" name="Client_Name_Date" id="Client_Name_Date" onfocus="setday(this)" value="<%=trim(Rs("Client_Name_Date"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;
            <input type="submit" name="button2" value="确　认" style="width:80px;line-height:16px;" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
          <input type="reset" name="Submit2" value="重　写" style="width:80px;line-height:16px;" /></td>
        </tr>
      </table>
	  </form>
<script type="text/vbscript" language="vbscript">
	document.getElementById("Client_Name_Client").value="<%=trim(Rs("Client_Name_Client"))%>"
	document.getElementById("Client_Name_Duty").value="<%=trim(Rs("Client_Name_Duty"))%>"
	document.getElementById("Client_Name_Zhishi").value="<%=trim(Rs("Client_Name_Zhishi"))%>"
</script>	  
</body>
</html>
