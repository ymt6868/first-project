<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件技术有限公司</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../Javascript/Reservation.js"></script>
</head>

<body>
<!--#include file="../Include/AutoDate.asp"-->
<% Set rs=dbconn.execute("Select * From T_User_Reservation Where Reservation_ID='" & request("ID") & "'") %>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----编辑预订----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <form id="Myfrom" name="Myfrom" method="post" action="Reservation_Edit_Save.asp" onSubmit="return Reservation_add();">
	  <input type="hidden" name="Reservation_ID" id="Reservation_ID" value="<%=Trim(RS("Reservation_ID"))%>" />
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
        <tr>
          <td width="40%" height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;单　位
            <select name="Reservation_Client" type="text" id="Reservation_Client" style="width:350px;">
				<%
				IF session("User_Id")="1" Then
			 		Client_sales="1=1"
			 	Else
			 		Client_sales="Client_sales='"& session("User_Id") &"'"
			 	End IF
			 	Set RS1=dbconn.execute("Select * From T_Client Where Client_Follow='N' or Client_Follow='Y' And " & Client_sales & "")
			 	do while not RS1.eof
				%>
				<option value="<%=trim(RS1("Client_ID"))%>"><%=trim(RS1("Client_Company"))%></option>
				<%
				 RS1.movenext
				 loop
				%>
            </select>		  </td>
        </tr>
        <tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;标　题
          <input type="text" name="Reservation_Title" id="Reservation_Title" style="width:804px;" value="<%=trim(RS("Reservation_Title"))%>" /></td>
        </tr>
        <tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;描　述
          <textarea name="Reservation_Text" id="Reservation_Text" style="width:804px; height:100px;"><%=trim(RS("Reservation_Text"))%></textarea></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;预订日期
          <input type="text" name="Reservation_Date" id="Reservation_Date" style="width:120px;" onfocus="setday(this)" value="<%=trim(RS("Reservation_Date"))%>" /></td>
          <td bgcolor="#FFFFFF">&nbsp;新增日期
          <input type="text" name="Reservation_Add_Date" id="Reservation_Add_Date" style="width:120px;" onfocus="setday(this)" value="<%=trim(RS("Reservation_Add_Date"))%>" /></td>
        </tr>
        <tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" name="button2" value="确　认" style="width:80px;line-height:16px;" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
          <input type="reset" name="Submit2" value="重　写" style="width:80px;line-height:16px;" /></td>
        </tr>
      </table>
	  </form>
<script type="text/vbscript" language="vbscript">
	document.getElementById("Reservation_Client").value="<%=trim(RS("Reservation_Client"))%>"
</script>	    
</body>
</html>
