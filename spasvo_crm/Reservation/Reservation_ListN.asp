<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�Ϻ���������������޹�˾</title>
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
		if document.getElementById("Reservation_User").value <> "X" then		
			Mysqlstr = "Reservation_User='" + document.getElementById("Reservation_User").value + "' and "		
		end if
		
		if document.getElementById("Reservation_Client").value <> "X" then		
			Mysqlstr = Mysqlstr + "Reservation_Client like'%" + document.getElementById("Reservation_Client").value + "%' and "		
		end if
		
		if document.getElementById("Reservation_Title").value <> "" then		
			Mysqlstr = Mysqlstr + "Reservation_Title like'%" + document.getElementById("Reservation_Title").value + "%' and "		
		end if
		
		if document.getElementById("Reservation_Date").value <> "" then		
			Mysqlstr = Mysqlstr + "Reservation_Date = '" + document.getElementById("Reservation_Date").value + "' and "		
		end if
		
		if document.getElementById("Start_Reservation_Date").value <> "" then		
			Mysqlstr = Mysqlstr + "Reservation_Add_Date >= '" + document.getElementById("Start_Reservation_Date").value + "' and "		
		end if
		
		if document.getElementById("Over_Reservation_Date").value <> "" then		
			Mysqlstr = Mysqlstr + "Reservation_Add_Date <= '" + document.getElementById("Over_Reservation_Date").value + "' and "		
		end if
		
		document.getElementById("SQLstr").value = Mysqlstr
		document.myform.submit()
	End Function
</script>
<%
	If Request("Action")="Select" and Request("FenYe")="" Then
		SQLstr=Request("SQLstr")&"1=1 order by Reservation_Id " & Request("Reservation_Order") & ""
		UserSql="1=1"
	ElseIf Request("Action")="Select" and Request("FenYe")="Rxby" Then
		SQLstr=Request("SQLstr")
		Page=Request("Page")
				IF session("System_Key")="1" Then
					UserSql="1=1"
				Else
					Client_sales=session("User_Id")
					UserSql="Reservation_User=" & Client_sales
				End If
	Else
		SQLstr="1=1 order by Reservation_Id desc"
				IF session("System_Key")="1" Then
					UserSql="1=1"
				Else
					Client_sales=session("User_Id")
					UserSql="Reservation_User='" & Client_sales & "'"
				End If	
	End If
%>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----�ȴ�Ԥ��----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<form id="myform" name="myform" method="post" action="Reservation_ListN.asp">
<input type="hidden" name="Action" id="Action" value="Select" />
<input type="hidden" name="SQLstr" id="SQLstr" />
<input type="hidden" name="Page" id="Page" />
<input type="hidden" name="FenYe" id="FenYe" />
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" style="margin:0 0 10px 0 ;">
      <tr>
        <td>ָ��</td>
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
        <td>��λ</td>
        <td>
		<select name="Reservation_Client" id="Reservation_Client" style="width:124px;">
			<%
			 IF session("User_Id")="1" Then
			 	Client_sales="1=1"
			 Else
			 	Client_sales="Client_sales='"& session("User_Id") &"'"
			 End IF
			 Set RS=dbconn.execute("Select * From T_Client Where Client_Follow='Y' And " & Client_sales & "")
			 do while not RS.eof
			%>
			<option value="<%=Trim(RS("Client_ID"))%>"><%=Trim(RS("Client_Company"))%></option>
			<%
			 RS.movenext
			 Loop
			 %>
		</select>		</td>
        <td>����</td>
        <td><input name="Reservation_Title" type="text" id="Reservation_Title" /></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Ԥ��</td>
        <td><input name="Reservation_Date" type="text" id="Reservation_Date" onfocus="setday(this)" /></td>
        <td>����</td>
        <td><input name="Start_Reservation_Date" type="text" id="Start_Reservation_Date" onfocus="setday(this)" /></td>
        <td>����</td>
        <td><input name="Over_Reservation_Date" type="text" id="Over_Reservation_Date" onfocus="setday(this)" /></td>
        <td>��ʾ</td>
        <td><select name="Reservation_Order" id="Reservation_Order" style="width:58px;">
            <option value="desc">�� ��</option>
            <option value="asc">˳ ��</option>
          </select>
            <input type="button" name="button" value="�� ѯ" style="width:58px;" onclick="UserSQL();" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr align="center">
    <td width="35" height="28" bgcolor="#006699"><font color="#FFFFFF">���</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">����</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">��λ</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">Ԥ������</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">ָ��</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">״̬</font></td>
    <td bgcolor="#006699"><font color="#FFFFFF">��������</font></td>
    <td colspan="2" bgcolor="#006699"><font color="#FFFFFF">����</font></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset") 
	Mysql="select * from T_Client,T_User,T_User_Reservation where Reservation_Client=Client_ID And Reservation_User=User_Id And Reservation_Key='N' And " & UserSql & " And "& SQLstr
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
    <td height="28" align="left" bgcolor="<%=Mybgcolor%>">&nbsp;<%=trim(rs("Reservation_Title"))%></td>
    <td height="28" align="left" bgcolor="<%=Mybgcolor%>">&nbsp;<%=trim(rs("Client_Company"))%>&nbsp;</td>
    <td height="28" align="center" bgcolor="<%=Mybgcolor%>"><%=trim(rs("Reservation_Date"))%></td>
	    <td height="28" align="center" bgcolor="<%=Mybgcolor%>"><%=trim(rs("User_China"))%></td>
    <td height="28" align="center" bgcolor="<%=Mybgcolor%>"><%IF trim(rs("Reservation_key"))="N" Then
	     response.Write("�ȴ�") 
	 ElseIF trim(rs("Reservation_key"))="Y" Then 
		 response.Write("���")
	 Else
	 	 response.Write("δ���") 
	 End IF%></td>
    <td height="28" align="center" bgcolor="<%=Mybgcolor%>"><%=trim(rs("Reservation_Add_Date"))%></td>
    <td height="28" align="center"><a href="Reservation_Edit.asp?Id=<%=trim(rs("Reservation_ID"))%>">�༭</a></td>
    <td align="center"><a href="Reservation_View.asp?Id=<%=trim(rs("Reservation_Id"))%>">�鿴</a></td>
  </tr>
<%
	rs.movenext
	next
%> 
</table>
<table width="80%" border="0" align="center" cellpadding="2" cellspacing="0">	
          <tr>
            <td align="left">ҳ�Σ� <strong>
              <%if request("page")="" or request("page")="0" then
			   		response.Write("1")
			   elseif cint(request("page"))=pagecount+1 Then
			   		response.Write pagecount
			   else 
			   		response.Write(request("page")) 
			   end if%></strong>  / <strong><%=pagecount%></strong> ҳ</td>
			<td align="center">
			<input type="button" name="button2" value="��һҳ" style="width:75px;" onclick="YPage();" />
		    <input type="button" name="button3" value="��һҳ" style="width:75px;" onclick="SPage();" />
		    <input type="button" name="button4" value="��һҳ" style="width:75px;" onclick="XPage();" />
		    <input type="button" name="button5" value="���һҳ" style="width:75px;" onclick="HPage();" /></td>
            <td align="right">ת��<select name="UserPage" id="UserPage" style="width:40px;" onchange="GetUserPage();">
			  <% For i=1 to  pagecount%>	
              <option value="<%=i%>"><%=i%></option>
			  <% Next %>
            </select>ҳ</td>
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
