<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件技术有限公司</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../Javascript/Job.js"></script>
<script language="javascript" type="text/javascript" src="../Javascript/Client_View.js"></script>
</head>

<body>
<!--#include file="../Include/AutoDate.asp"-->
<% Set Rs=dbconn.execute("Select * From T_Client_Name,T_Client Where Client_ID=Client_Name_Client And Client_Name_ID='" & Request("ID") & "'") %>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----查看联络----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户名称&nbsp;：<%=trim(Rs("Client_Company"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户姓名&nbsp;：<%=trim(Rs("Client_Name_Name"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户部门&nbsp;：<%=trim(Rs("Client_Name_Department"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户职位&nbsp;：<%
		  IF trim(Rs("Client_Name_Duty"))<>"" Then 
		  	Set Rs1=dbconn.execute("Select * From T_System Where System_Class='D' and System_Key='"& trim(Rs("Client_Name_Duty")) &"'")
			IF Not Rs1.Eof Then
				response.Write(trim(Rs1("System_title")))
			End IF
		  End IF
		  %></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户电话&nbsp;：<%=trim(Rs("Client_Name_Tel"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户手机&nbsp;：<%=trim(Rs("Client_Name_Mobile"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户邮箱&nbsp;：<%=trim(Rs("Client_Name_Email"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户&nbsp;Q&nbsp;Q&nbsp;：<%=trim(Rs("Client_Name_QQ"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户&nbsp;MSN&nbsp;：<%=trim(Rs("Client_Name_MSN"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;技术程度&nbsp;：
            <%IF trim(Rs("Client_Name_zhishi"))="0" Then
			   response.Write("")
			ElseIF trim(Rs("Client_Name_zhishi"))="1" Then  
			   response.Write("不懂")
			ElseIF trim(Rs("Client_Name_zhishi"))="2" Then  
			   response.Write("略懂") 
			ElseIF trim(Rs("Client_Name_zhishi"))="3" Then  
			   response.Write("精通")      
			End IF
		  	%>
		  </td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;其它信息&nbsp;：<%=trim(Rs("Client_Name_Text"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;日志日期&nbsp;：<%=trim(Rs("Client_Name_Date"))%></td>
        </tr>
      </table>
</body>
</html>
