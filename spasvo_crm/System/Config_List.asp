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
        <td><font color="#FFFFFF">----配制管理----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr align="center">
    <td height="28" bgcolor="#006699"><font color="#FFFFFF">类别</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">标题</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">取值</font></td>
    <td colspan="2" bgcolor="#006699"><font color="#FFFFFF">操作</font></td>
  </tr>
  <%
	Set rs=dbconn.execute("Select * From T_System where System_Class<>'A' order by System_Class,System_Key")
	i=1
	do while not rs.eof
	
			if (i mod 2)=0 then
				Mybgcolor="#E4E4E4"
			else
				Mybgcolor="#FFFFFF"
			end if
%>
  <tr align="center" bgcolor="<%=Mybgcolor%>">
    <td height="28" align="center"><% IF trim(rs("System_Class"))="B" Then response.Write("原因") Else if trim(rs("System_Class"))="C" Then response.Write("产品") Else if trim(rs("System_Class"))="D" Then response.Write("职位") End if%></td>
    <td height="28" align="left">&nbsp;<%=trim(rs("System_Title"))%></td>
    <td height="28" align="center"><%=trim(rs("System_Key"))%></td>
    <td align="center"><a href="Config_List.asp?Action=Edit&ID=<%=trim(rs("System_ID"))%>&Class=<%=trim(rs("System_Class"))%>">编辑</a></td>
    <td align="center"><a href="Config_List.asp?Action=Add&Class=<%=trim(rs("System_Class"))%>">新增</a></td>
  </tr>
  <%
	rs.movenext
	i=i+1
	loop
%>
</table>
<% IF Request("Action")="Add" Then %>
<br />
<form id="form1" name="form1" method="post" action="Config_List.asp">
<input type="hidden" name="Action" id="Action" value="Title_Add" />
<input type="hidden" name="System_Class" id="System_Class" value="<%=Request("Class")%>" />
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
    <tr align="center">
      <td height="28" bgcolor="#FFFFFF">新增 [ <% 
	IF Request("Class")="B" Then 
		response.Write("原因")
    Elseif Request("Class")="C" Then 
		response.Write("产品")
	Elseif Request("Class")="D" Then
		response.Write("职位") 
	End if
	%> 
        ]</td>
      <td bgcolor="#FFFFFF">标题
        <input type="text" name="System_Title" id="System_Title" /></td>
      <td bgcolor="#FFFFFF">取值
      <input name="System_Key" type="text" id="System_Key" size="4" /></td>
      <td bgcolor="#FFFFFF"><input type="submit" name="Submit" value="确  认" /></td>
    </tr>
  </table>
</form>
<br />
<% End IF %>
<% IF Request("Action")="Edit" Then %>
<br />
<%
	Set rs=dbconn.execute("Select * From T_System Where System_ID='"& Request("ID") &"'")
%>
<form id="form1" name="form1" method="post" action="Config_List.asp">
<input type="hidden" name="Action" id="Action" value="Title_Edit" />
<input type="hidden" name="System_ID" id="System_ID" value="<%=trim(rs("System_ID"))%>" />
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
    <tr align="center">
      <td height="28" bgcolor="#FFFFFF">编辑 [ <% 
	IF Request("Class")="B" Then 
		response.Write("原因")
    Elseif Request("Class")="C" Then 
		response.Write("产品")
	Elseif Request("Class")="D" Then
		response.Write("职位") 
	End if
	%> 
        ]</td>
      <td bgcolor="#FFFFFF">标题
        <input type="text" name="System_Title" id="System_Title" value="<%=trim(rs("System_Title"))%>" /></td>
      <td bgcolor="#FFFFFF">取值
      <input name="System_Key" type="text" id="System_Key" size="4" value="<%=trim(rs("System_Key"))%>" /></td>
      <td bgcolor="#FFFFFF"><input type="submit" name="Submit" value="确  认" /></td>
    </tr>
  </table>
</form>
<br />
<% End IF %>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td height="28"><font color="#FF0000">注：非开发人员，请勿操作！</font></td>
  </tr>
</table>
<%
IF Request("Action")="Title_Add" Then

	Set RS=dbconn.execute("Insert Into T_System ( System_Title,System_Class,System_Key ) values ( '" & Request("System_Title") & "','" & Request("System_Class") & "','" & Request("System_Key") & "')")
	
	response.write "<script language=javascript>"
	response.write "this.location.href='Config_List.asp';"
	response.write "</script>"
	
End IF

IF Request("Action")="Title_Edit" Then

	Set RS=dbconn.execute("Update T_System set System_Title='" & request("System_Title") & "',System_Key='" & request("System_Key") & "' where System_ID=" & request("System_ID") & "")
	
	response.write "<script language=javascript>"
	response.write "this.location.href='Config_List.asp';"
	response.write "</script>"
	
End IF

%>
</body>
</html>
