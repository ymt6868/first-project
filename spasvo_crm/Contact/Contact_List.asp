<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件技术有限公司</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
<!--#include file="../Include/AutoDate.asp"-->
<script language="javascript" type="text/javascript" src="../Javascript/Client_View.js"></script>
<style type="text/css">
<!--
Input {
	width:118px;
}

Select {
	width:124px;
}

-->
</style></head>
<body>
<script language="vbscript" type="text/vbscript">
	Function UserSQL()
		dim Mysqlstr	
		if document.getElementById("Client_sales").value <> "X" then		
			Mysqlstr = "Client_sales='" + document.getElementById("Client_sales").value + "' and "		
		end if
		
		if document.getElementById("Client_Name_Name").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_Name_Name like'%" + document.getElementById("Client_Name_Name").value + "%' and "	
		end if
		
		if document.getElementById("Client_Company").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_Company like'%" + document.getElementById("Client_Company").value + "%' and "	
		end if
		
		document.getElementById("SQLstr").value = Mysqlstr
		document.myform.submit()
	End Function
</script>
<%
	If Request("Action")="Select" and Request("FenYe")="" Then
		SQLstr=Request("SQLstr")&"1=1 order by Client_Name_Date " & Request("Job_Order") & ""
		UserSql="1=1"
	ElseIf Request("Action")="Select" and Request("FenYe")="Rxby" Then
		SQLstr=Request("SQLstr")
		Page=Request("Page")
				IF session("System_Key")="1" Then
					UserSql="1=1"
				Else
					Client_sales=session("User_Id")
					UserSql="Client_sales=" & Client_sales
				End If
	Else
		SQLstr="1=1 order by Client_Name_Date desc"
				IF session("System_Key")="1" Then
					UserSql="1=1"
				Else
					Client_sales=session("User_Id")
					UserSql="Client_sales='" & Client_sales & "'"
				End If	
	End If
%>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----管理联络----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<form id="myform" name="myform" method="post" action="Contact_list.asp">
<input type="hidden" name="Action" id="Action" value="Select" />
<input type="hidden" name="SQLstr" id="SQLstr" />
<input type="hidden" name="Page" id="Page" />
<input type="hidden" name="FenYe" id="FenYe" />
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" style="margin:0 0 10px 0 ;">
      <tr>
        <td>指派</td>
        <td>
		<select name="Client_sales" id="Client_sales" style="width:124px;">
              <%
			IF session("System_Key") = "1" Then
				Client_sales_SQL="User_System=2 or User_Id='"& session("User_Id") &"'"
			Else
				Client_sales_SQL="User_Id='"& session("User_Id") &"'"
			End IF
			Set RS1=dbconn.execute("Select * From T_User Where "& Client_sales_SQL &"") 
			do while not RS1.eof
				%>
              <option value="<%=trim(RS1("User_ID"))%>"><%=trim(RS1("User_China"))%></option>
              <%
			RS1.movenext
			loop
		%>
            </select>
		</td>
        <td>姓名</td>
        <td><input name="Client_Name_Name" type="text" id="Client_Name_Name" /></td>
        <td>名称</td>
        <td><input name="Client_Company" type="text" id="Client_Company" /></td>
        <td>显示</td>
        <td><select name="Job_Order" id="Job_Order" style="width:58px;">
          <option value="desc">倒 序</option>
          <option value="asc">顺 序</option>
        </select>
              <input type="button" name="button" value="查 询" style="width:58px;" onclick="UserSQL();" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr align="center">
    <td width="35" height="28" bgcolor="#006699"><font color="#FFFFFF">编号</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">姓名</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">名称</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">指派</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">日期</font></td>
    <td colspan="3" bgcolor="#006699"><font color="#FFFFFF">操作</font></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset") 
	Mysql="Select * From T_Client_Name,T_Client,T_User Where Client_ID=Client_Name_Client And Client_sales=User_Id And " & UserSql & " And "& SQLstr
	'response.Write(Mysql)
	'response.End()
	rs.CursorLocation = 3
	rs.open Mysql,dbconn,1,1
	rs.PageSize=15
	pagecount=rs.PageCount 
	page=cint(page)
	if page<=0 then page=1
	if page>pagecount then page=pagecount
	if page="" then
		page=1
	end if

	if not rs.eof and not rs.bof then
		rs.AbsolutePage=page 
		for i=1 to rs.PageSize
	
			if (i mod 2)=0 then
				Mybgcolor="#E4E4E4"
			else
				Mybgcolor="#FFFFFF"
			end if
	
		if rs.EOF then 
			exit for
		end if
%>   
  <tr align="center" bgcolor="<%=Mybgcolor%>">
    <td height="28" align="center" bgcolor="<%=Mybgcolor%>"><%=i%></td>
    <td height="28" align="left" bgcolor="<%=Mybgcolor%>">&nbsp;<%=trim(rs("Client_Name_Name"))%></td>
    <td height="28" align="left" bgcolor="<%=Mybgcolor%>">&nbsp;<%=trim(rs("Client_Company"))%></td>
    <td height="28" align="left" bgcolor="<%=Mybgcolor%>">&nbsp;<%=trim(rs("User_China"))%></td>
    <td height="28" align="center" bgcolor="<%=Mybgcolor%>"><%=trim(rs("Client_Name_Date"))%></td>
    <td height="28" align="center" bgcolor="<%=Mybgcolor%>"><a href="Contact_Edit.asp?ID=<%=trim(rs("Client_Name_ID"))%>">编辑</a></td>
    <td align="center" bgcolor="<%=Mybgcolor%>"><a href="Contact_List.asp?ID=<%=trim(rs("Client_Name_ID"))%>&action=del" onClick="return confirm('是否要删除？');">删除</a></td>
    <td align="center" bgcolor="<%=Mybgcolor%>"><a href="Contact_Veiw.asp?ID=<%=trim(rs("Client_Name_ID"))%>">查看</a></td>
  </tr>
<%
	rs.movenext
	next
%> 
</table>
<table width="80%" border="0" align="center" cellpadding="2" cellspacing="0">	
          <tr>
            <td align="left">页次： <strong>
              <%if request("page")="" or request("page")="0" then
			   		response.Write("1")
			   elseif cint(request("page"))=pagecount+1 Then
			   		response.Write pagecount
			   else 
			   		response.Write(request("page")) 
			   end if%></strong>  / <strong><%=pagecount%></strong> 页</td>
			<td align="center">
			<input type="button" name="button2" value="第一页" style="width:75px;" onclick="YPage();" />
		    <input type="button" name="button3" value="上一页" style="width:75px;" onclick="SPage();" />
		    <input type="button" name="button4" value="下一页" style="width:75px;" onclick="XPage();" />
		    <input type="button" name="button5" value="最后一页" style="width:75px;" onclick="HPage();" /></td>
            <td align="right">转到<select name="UserPage" id="UserPage" style="width:40px;" onchange="GetUserPage();">
			  <% For i=1 to  pagecount%>	
              <option value="<%=i%>"><%=i%></option>
			  <% Next %>
            </select>页</td>
          </tr> 
</table>
</form>
<script language="vbscript" type="text/vbscript">

	Function YPage()
		document.getElementById("SQLstr").value = "<%=SQLstr%>"
		document.getElementById("FenYe").value = "Rxby"
		document.getElementById("Page").value = "1"
		document.myform.submit()
	End Function
	
	Function SPage()
		document.getElementById("SQLstr").value = "<%=SQLstr%>"
		document.getElementById("FenYe").value = "Rxby"
		document.getElementById("Page").value = "<%=Page-1%>"
		document.myform.submit()
	End Function

	Function XPage()
		document.getElementById("SQLstr").value = "<%=SQLstr%>"
		document.getElementById("FenYe").value = "Rxby"
		document.getElementById("Page").value = "<%=Page+1%>"
		document.myform.submit()
	End Function	
	
	Function HPage()
		document.getElementById("SQLstr").value = "<%=SQLstr%>"
		document.getElementById("FenYe").value = "Rxby"
		document.getElementById("Page").value = "<%=pagecount%>"
		document.myform.submit()
	End Function

	Function GetUserPage()
		document.getElementById("SQLstr").value = "<%=SQLstr%>"
		document.getElementById("FenYe").value = "Rxby"
		document.getElementById("Page").value = document.getElementById("UserPage").value
		document.myform.submit()
	End Function
</script>
<script type="text/vbscript" language="vbscript">
	document.getElementById("UserPage").value="<%=Page%>"
</script>
<% End if %>
<%
	if request("action")="del" then
		dbconn.execute("delete from T_Client_Name where Client_Name_ID="& request("ID") &"")
		response.write"<SCRIPT language=JavaScript>"
		response.write"this.location.href='Contact_List.asp';</SCRIPT>" 
	end if
%>
</body>
</html>
