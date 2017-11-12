<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件技术有限公司</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
<!--#include file="../Include/AutoDate.asp"-->
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
			Mysqlstr = "Client_sales=" + document.getElementById("Client_sales").value + " and "		
		end if
		
		if document.getElementById("Client_beijing").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_beijing='" + document.getElementById("Client_beijing").value + "' and "		
		end if
		
		if document.getElementById("Client_shangshi").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_shangshi='" + document.getElementById("Client_shangshi").value + "' and "		
		end if
		
		if document.getElementById("Client_Class").value <> "X" then		
			Mysqlstr = Mysqlstr + "Client_Class='" + document.getElementById("Client_Class").value + "' and "		
		end if
		
		if document.getElementById("jieduan").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_GZ_jieduan='" + document.getElementById("jieduan").value + "' and "		
		end if
		
		if document.getElementById("Client_yusuan").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_GZ_yusuan='" + document.getElementById("Client_yusuan").value + "' and "		
		end if		
		
		if document.getElementById("Client_Products").value <> "X" then		
			Mysqlstr = Mysqlstr + "Client_Products like'%" + document.getElementById("Client_Products").value + "%' and "		
		end if
		
		if document.getElementById("Client_Address").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_Address like'%" + document.getElementById("Client_Address").value + "%' and "		
		end if
		
		if document.getElementById("Client_Company").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_Company like'%" + document.getElementById("Client_Company").value + "%' and "		
		end if
		
		if document.getElementById("Start_Date").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_Date >= '" + document.getElementById("Start_Date").value + "' and "		
		end if
		
		if document.getElementById("Over_Date").value <> "" then		
			Mysqlstr = Mysqlstr + "Client_Date <= '" + document.getElementById("Over_Date").value + "' and "		
		end if
		
		document.getElementById("SQLstr").value = Mysqlstr
		document.myform.submit()
	End Function
</script>
<%
	set rs= dbconn.execute("Select * From T_User where User_id='" & session("User_Id") & "'")
	User_Admin=trim(rs("User_Admin"))
	IF User_Admin<>"" Then
		My_User_Admin=Split(User_Admin,", ")
		for each my_admin in My_User_Admin
			Full_Client_sales=Full_Client_sales+" or User_id=" & my_admin
		next
		Full_Client_sales="(User_id="&session("User_Id")&""+Full_Client_sales+")"
	Else
		Full_Client_sales="User_id="&session("User_Id")
	End IF

	If Request("Action")="Select" and Request("FenYe")="" Then
		SQLstr=Request("SQLstr")&"1=1 order by Client_Id " & Request("Client_Order") & ""
		UserSql="1=1"
	ElseIf Request("Action")="Select" and Request("FenYe")="Rxby" Then
		SQLstr=Request("SQLstr")
		Page=Request("Page")
		UserSql=Full_Client_sales
	Else
		SQLstr="1=1 order by Client_Id desc"
		UserSql=Full_Client_sales
	End If
%>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----正式客户----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<form id="myform" name="myform" method="post" action="Client_ListY.asp">
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
			Set RS1=dbconn.execute("Select * From T_User Where 1=1 and "& Full_Client_sales &"")  
			do while not RS1.eof
				%>
              <option value="<%=trim(RS1("User_ID"))%>"><%=trim(RS1("User_China"))%></option>
              <%
			RS1.movenext
			loop
		%>
            </select>
		</td>
        <td>背景</td>
        <td><select name="Client_beijing" id="Client_beijing" style="width:124px;">
            <%
			   set rs=dbconn.execute("select * from T_System Where System_Class='E'")
			   do while not rs.eof
			   %>
            <option value="<%=trim(rs("System_Key"))%>"><%=trim(rs("System_title"))%></option>
            <%
			  	rs.movenext
				loop
			  %>
          </select>
        </td>
        <td>上市</td>
        <td><select name="Client_shangshi" id="Client_shangshi" style="width:124px;">
            <option value="1">是</option>
            <option value="0">否</option>
        </select></td>
        <td>类型</td>
        <td><select name="Client_Class" id="Client_Class" >
			  <%
			   set rs=dbconn.execute("select * from T_System Where System_Class='G'")
			   do while not rs.eof
			   %>
              <option value="<%=trim(rs("System_Key"))%>"><%=trim(rs("System_title"))%></option>
			  <%
			  	rs.movenext
				loop
			  %>
        </select></td>
      </tr>
      <tr>
        <td>公司</td>
        <td><input name="Client_Company" type="text" id="Client_Company" /></td>
        <td>地址</td>
        <td><input name="Client_Address" type="text" id="Client_Address" /></td>
        <td>阶段</td>
        <td><select name="jieduan" id="jieduan" style="width:124px;">
            <%
			   set rs=dbconn.execute("select * from T_System Where System_Class='F'")
			   do while not rs.eof
			   %>
            <option value="<%=trim(rs("System_Key"))%>"><%=trim(rs("System_title"))%></option>
            <%
			  	rs.movenext
				loop
			  %>
        </select></td>
        <td>预算</td>
        <td><select name="Client_yusuan" id="Client_yusuan" style="width:124px;">
            <option value="1">有</option>
            <option value="0">无</option>
        </select></td>
      </tr>
      <tr>
        <td>产品</td>
        <td><select name="Client_Products" id="Client_Products" >
            <%
			 Set Rs=dbconn.execute("select * from T_System Where System_Class='C'") 
			 do while not rs.eof
			 %>
            <option value="<%=trim(rs("System_Key"))%>"><%=trim(rs("System_Title"))%></option>
            <%
			 rs.movenext
			 Loop
			%>
        </select></td>
        <td>日期</td>
        <td><input name="Start_Date" type="text" id="start" onfocus="setday(this)" /></td>
        <td>日期</td>
        <td><input name="Over_Date" type="text" id="over" onfocus="setday(this)" /></td>
        <td>显示</td>
        <td><select name="Client_Order" id="Client_Order" style="width:58px;">
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
    <td bgcolor="#006699"><font color="#FFFFFF">单位</font></td>
    <td width="100" bgcolor="#006699"><font color="#FFFFFF">指派</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">日期</font></td>
    <td colspan="2" bgcolor="#006699"><font color="#FFFFFF">操作</font></td>
  </tr>
<%

	UserSql="Client_Follow='Y' and "&Full_Client_sales
	
	set rs=server.createobject("adodb.recordset") 
	Mysql="select * from T_Client,T_User where Client_sales=User_Id And " & UserSql & " and "& SQLstr
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
    <td height="28" align="left" bgcolor="<%=Mybgcolor%>">&nbsp;&nbsp;<%=trim(rs("Client_Company"))%></td>
    <td height="28" align="left" bgcolor="<%=Mybgcolor%>">&nbsp;<%=trim(rs("User_China"))%></td>
    <td height="28" align="center" bgcolor="<%=Mybgcolor%>"><%=trim(rs("Client_Date"))%></td>
    <td height="28" align="center"><a href="Client_View.asp?Id=<%=trim(rs("Client_Id"))%>">查看</a></td>
    <td align="center"><a href="Client_Follow_List.asp?Id=<%=trim(rs("Client_Id"))%>">记录</a></td>
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
</body>
</html>
