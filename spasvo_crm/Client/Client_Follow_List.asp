<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<% set rs=dbconn.execute("Select * From T_Client Where Client_Id=" & request("Id") & "")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
<!--#include file="../Include/AutoDate.asp"-->
</head>

<body>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----<%=trim(rs("Client_Company"))%> 客户跟踪记录----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<%
 Set RS1=dbconn.execute("Select * From T_Client_Follow Where Follow_Client="&request("ID")&" order by Follow_Date")
 i=1
 do while not RS1.eof
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#006699" style="margin:0 0 8px 0 ;">
  <tr>
    <td height="25" bgcolor="#FFFFFF">&nbsp;<span style="color:#0000FF;">第 <font color="#FF0000"><%=i%></font> 跟踪记录</span></td>
    <td align="center" bgcolor="#FFFFFF"><%=trim(RS1("Follow_Date"))%></td>
    <td align="center" bgcolor="#FFFFFF"><a href="Client_Follow_List.asp?ID=<%=trim(rs("Client_ID"))%>">添加</a></td>
    <td align="center" bgcolor="#FFFFFF"><a href="Client_Follow_List.asp?Action=Edit&Follow=<%=trim(RS1("Follow_ID"))%>&i=<%=i%>&ID=<%=trim(rs("Client_ID"))%>">更新</a></td>
    <td align="center" bgcolor="#FFFFFF"><a href="Client_Follow_List.asp?Action=Del&Follow=<%=trim(RS1("Follow_ID"))%>&ID=<%=trim(rs("Client_ID"))%>" onClick="return confirm('是否要删除？');">删除</a></td>
  </tr>
  <tr>
    <td height="30" colspan="5" bgcolor="#FFFFFF" style="padding:5px; line-height:25px;"><%=trim(RS1("Follow_Text"))%></td>
  </tr>
</table>
<%
 RS1.movenext
 i=i+1
 Loop
%>
<%
 IF Request("Action")="Edit" Then 
 RS2=dbconn.execute("Select * From T_Client_Follow Where Follow_ID="&request("Follow"))
%>

<form id="form1" name="form1" method="post" action="Client_Follow_List_Edit.asp">
<input type="hidden" name="Follow_ID" id="Follow_ID" value="<%=trim(RS2("Follow_ID"))%>" />
<input type="hidden" name="Follow_Client" id="Follow_Client" value="<%=trim(rs("Client_ID"))%>" />
  <br />
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#006699">
  	<tr>
		<td height="25" bgcolor="#FFFFFF" style="color:#0000FF;">&nbsp;第 <font color="#FF0000"><%=request("i")%></font> 跟踪记录</td>
	    <td align="right" bgcolor="#FFFFFF" style="color:#0000FF;"><input type="text" name="Follow_Date" id="Follow_Date"  style="width:155px;" onfocus="setday(this)" value="<%=trim(RS2("Follow_Date"))%>" /></td>
  	</tr>
    <tr>
      <td height="10" colspan="2" bgcolor="#FFFFFF"><textarea name="Follow_Text" id="Follow_Text" cols="81" rows="10" style="width:853px; height:200px; line-height:25px;"><%=trim(RS2("Follow_Text"))%></textarea></td>
    </tr>
    <tr>
      <td height="10" colspan="2" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="确　认" style="width:160px;" /></td>
    </tr>
  </table>
</form>
<% Else %>
<form id="form1" name="form1" method="post" action="Client_Follow_List_Save.asp">
<input type="hidden" name="Follow_Client" id="Follow_Client" value="<%=trim(rs("Client_ID"))%>" />
<input type="hidden" name="Follow_User" id="Follow_User" value="<%=session("User_Id")%>" />
  <br />
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#006699">
  	<tr>
		<td height="25" bgcolor="#FFFFFF" style="color:#0000FF;">&nbsp;第 <font color="#FF0000"><%=i%></font> 跟踪记录</td>
	    <td align="right" bgcolor="#FFFFFF" style="color:#0000FF;"><input type="text" name="Follow_Date" id="Follow_Date"  style="width:155px;" onfocus="setday(this)" value="<%=Date()%>" /></td>
  	</tr>
    <tr>
      <td height="10" colspan="2" bgcolor="#FFFFFF"><textarea name="Follow_Text" id="Follow_Text" style="width:853px; height:200px; line-height:25px;"></textarea></td>
    </tr>
	  	
    <tr>
      <td height="10" colspan="2" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="确　认" style="width:160px;" /></td>
    </tr>
  </table>
</form>
<% End IF %>
<% 
IF Request("Action")="Del" Then 
	dbconn.execute("delete from T_Client_Follow where Follow_ID="& request("Follow") &"")
	response.write"<SCRIPT language=JavaScript>"
	response.write"this.location.href='Client_Follow_List.asp?ID="& trim(rs("Client_ID")) &"';</SCRIPT>" 
End IF
%>
</body>
</html>
