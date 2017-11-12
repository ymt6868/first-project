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
<% Set RS=dbconn.execute("Select * From T_Client_File,T_Client Where Client_ID=Client_File_Client And Client_File_ID='"& Request("ID") &"'") %>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----查看文档----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户名称：<%=trim(rs("Client_Company"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;文档标题：<%=trim(RS("Client_File_FileName"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;上传文档：<a href="UploadFile/<%=trim(rs("Client_File_Url"))%>" target="_blank">查看</a></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF" style="padding:5px 5px 5px 6px; line-height:22px;">其它信息：<%=trim(RS("Client_File_Text"))%></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;日志日期：<%=trim(RS("Client_File_Date"))%></td>
        </tr>
      </table>
</body>
</html>
