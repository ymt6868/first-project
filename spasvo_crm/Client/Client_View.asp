<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<% set rs=dbconn.execute("Select * From T_Client,T_User Where Client_sales=User_Id And Client_Id=" & request("Id") & "")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=trim(rs("Client_Company"))%> ��Ϣ</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----<%=trim(rs("Client_Company"))%> �ͻ���Ϣ ���ټ�¼----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;������Ϣ <span class="Font_red">ע����ɫ*��ʾ���� </span></td>
  </tr>
  <tr>
    <td width="50%" height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>��˾���ƣ�<%=trim(rs("Client_Company"))%></td>
    <td width="50%" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�������ͣ�
	      <%
		  IF trim(Rs("Client_Class"))<>"" Then 
		  	Set Rs1=dbconn.execute("Select * From T_System Where System_Class='G' and System_Key='"& trim(Rs("Client_Class")) &"'")
			IF Not Rs1.Eof Then
				response.Write(trim(Rs1("System_title")))
			End IF
		  End IF
		  %>
	</td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>��˾������
    <%
	IF trim(rs("Client_beijing"))<>"" Then
		Client_beijing=trim(rs("Client_beijing"))
		Set Rs1=dbconn.execute("select * from T_System Where System_Class='E' And System_Key= '"& Client_beijing &"'")
		IF not Rs1.eof Then
			response.Write(trim(rs1("System_title")))
		End If
	End IF
	%></td>
    <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�Ƿ����У�
    <% IF trim(rs("Client_shangshi"))="1" then 
											  	response.Write "��" 
	                                          Elseif trim(rs("Client_shangshi"))="0" then
												response.Write "��"
											  End IF%>    </td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>ע���ʱ���<%=trim(rs("Client_ziben"))%></td>
    <td bgcolor="#FFFFFF">&nbsp;�����۶<%=trim(rs("Client_xiaoshou"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>��ҵ��ģ��<%=trim(rs("Client_guimu"))%></td>
    <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>������Ա��<%=trim(rs("Client_ceshiren"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�������棺
    <% IF trim(rs("Client_goumei"))="1" then 
											  	response.Write "��" 
	                                          Elseif trim(rs("Client_goumei"))="0" then
												response.Write "��"
											  End IF%></td>
    <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>Ŀǰ�����<%=trim(rs("Client_ruanjian"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>��˾��ַ��<a href="<%=trim(rs("Client_Http"))%>" target="_blank"><%=trim(rs("Client_Http"))%></a></td>
    <td height="14" bgcolor="#FFFFFF">&nbsp;�ʱ���룺<%=trim(rs("Client_youbian"))%></td>
  </tr>
  <tr>
    <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>��˾��ַ��<%=trim(rs("Client_Address"))%></td>
  </tr>
  <tr>
    <td height="100" bgcolor="#FFFFFF" style="line-height:22px; padding:5px 5px 5px 5px;"><span class="Font_red">*</span>��Ӫ��Ʒ��<%=trim(rs("Client_changping"))%></td>
    <td height="30" bgcolor="#FFFFFF" style="line-height:22px; padding:5px 5px 5px 5px;"><span class="Font_red">*</span>��Ҫ����<%=trim(rs("Client_fuwu"))%></td>
  </tr>
  <tr>
    <td height="100" bgcolor="#FFFFFF" style="line-height:22px; padding:5px 5px 5px 5px;">������ҵ��<%=trim(rs("Client_hangye"))%></td>
    <td height="30" bgcolor="#FFFFFF" style="line-height:22px; padding:5px 5px 5px 5px;">����������<%=trim(rs("Client_juli"))%></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="80"><p> &nbsp;<span class="Font_red">*</span>��֯�ܹ���</p></td>
        <td width="906" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_jiagou"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="82"><p> &nbsp;<span class="Font_red">*</span>���������</p></td>
        <td width="904" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_qingkuang"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="66"><p>&nbsp;������Ϣ��</p></td>
        <td style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_Text"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;������Ϣ</td>
  </tr>
  <% Set Rs1=dbconn.execute("Select * From T_Client_Name Where Client_Name_Client='" & trim(rs("Client_ID")) & "'") %>
  <tr>
    <td colspan="2" bgcolor="#FFFFFF">
	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	<% do while not rs1.eof %>
      <tr>
        <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�ͻ�������<%=trim(Rs1("Client_Name_Name"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�ͻ����ţ�<%=trim(Rs1("Client_Name_Department"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�ͻ�ְλ��
          <%
		  IF trim(Rs1("Client_Name_Duty"))<>"" Then 
		  	Set Rs2=dbconn.execute("Select * From T_System Where System_Class='D' and System_Key='"& trim(Rs1("Client_Name_Duty")) &"'")
			IF Not Rs2.Eof Then
				response.Write(trim(Rs2("System_title")))
			End IF
		  End IF
		  %></td>
        </tr>
      <tr>
        <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�ͻ��绰��<%=trim(Rs1("Client_Name_Tel"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�ͻ��ֻ���<%=trim(Rs1("Client_Name_Mobile"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�ͻ����䣺<%=trim(Rs1("Client_Name_Email"))%></td>
        </tr>
      <tr>
        <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ� Q Q��<%=trim(Rs1("Client_Name_QQ"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;�ͻ� MSN��<%=trim(Rs1("Client_Name_MSN"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�����̶ȣ�            
          <%IF trim(Rs1("Client_Name_zhishi"))="0" Then
			   response.Write("")
			ElseIF trim(Rs1("Client_Name_zhishi"))="1" Then  
			   response.Write("����")
			ElseIF trim(Rs1("Client_Name_zhishi"))="2" Then  
			   response.Write("�Զ�") 
			ElseIF trim(Rs1("Client_Name_zhishi"))="3" Then  
			   response.Write("��ͨ")      
			End IF
		  	%></td>
        </tr>
      <tr>
        <td height="30" colspan="3" bgcolor="#FFFFFF">&nbsp;������Ϣ��<%=trim(Rs1("Client_Name_Text"))%></td>
        </tr>
      <tr>
        <td height="30" colspan="3" bgcolor="#FFFFFF">&nbsp;�������ڣ�<%=trim(Rs1("Client_Name_Date"))%></td>
        </tr>
      <tr>
        <td height="30" colspan="3" bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
		<%
		Rs1.movenext
		loop 
	%>
    </table>	</td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;<span class="Font_red">*</span>������Ϣ</td>
  </tr>
    <%
  	Client_Products=trim(rs("Client_Products"))
	MyStrs = Split(Client_Products,",")
	set rs1=dbconn.execute("select * from T_System Where System_Class='C'")  
   %>
  <tr>
    <td height="30" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
        <% do while not rs1.eof %>
        <tr>
          <td height="30" bgcolor="#FFFFFF"><input type="checkbox" name="Client_Products" id="Client_Products" disabled="disabled" <% 
			 	for each Products_ID in MyStrs
					if trim(Products_ID)=trim(rs1("System_Key")) then
						response.Write("checked")
					end if
				next %> />
              <%=trim(rs1("System_Title"))%></td>
        </tr>
        <%
			   rs1.movenext
			   loop 
			   %>
      </table></td>
    <td height="30" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
        <% 
				  Client_Choose=trim(rs("Client_Choose"))
		 		  MyStrs = Split(Client_Choose,",")
				  set rs1=dbconn.execute("select * from T_System Where System_Class='B'")
				  do while not rs1.eof
				  %>
        <tr>
          <td height="30" bgcolor="#FFFFFF"><input type="checkbox" name="Client_Choose" id="Client_Choose" disabled="disabled" <% 
			 	for each Products_ID in MyStrs
					if trim(Products_ID)=trim(rs1("System_Key")) then
						response.Write("checked")
					end if
				next %> />
              <%=trim(rs1("System_Title"))%></td>
        </tr>
        <%
			   rs1.movenext
			   loop 
			   %>
      </table></td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;�ĵ���Ϣ</td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#FFFFFF">
	<%
	 Set RS1=dbconn.execute("Select * From T_Client_File Where Client_File_Client='"& trim(rs("Client_ID")) &"'") 
	%>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	<% 	do while not RS1.eof %>
      <tr>
        <td height="30" bgcolor="#FFFFFF">&nbsp;�ĵ����⣺<%=trim(RS1("Client_File_FileName"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;�ĵ�������<a href="../ClientFile/UploadFile/<%=trim(RS1("Client_File_Url"))%>" target="_blank">�鿴</a></td>
        <td bgcolor="#FFFFFF">&nbsp;�������ڣ�<%=trim(RS1("Client_File_Date"))%></td>
      </tr>
      <tr>
        <td height="30" colspan="3" bgcolor="#FFFFFF" style="line-height:25px; padding:5px 5px 5px 6px;">�ĵ���ע��<%=trim(RS1("Client_File_Text"))%></td>
        </tr>
      <tr>
        <td height="30" colspan="3" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
	 <%
		RS1.movenext
		loop
	 %>	
    </table>	</td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;������Ϣ</td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>Ŀǰ�׶Σ�
    <%
	IF trim(rs("Client_GZ_jieduan"))<>"" Then
		Client_beijing=trim(rs("Client_GZ_jieduan"))
		Set Rs1=dbconn.execute("select * from T_System Where System_Class='F' And System_Key= '"& Client_beijing &"'")
		IF not Rs1.eof Then
			response.Write(trim(rs1("System_title")))
		End If
	End IF
	%></td>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>������Ա��<%=trim(rs("Client_GZ_jcry"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�Ƿ�Ԥ�㣺
    <% IF trim(rs("Client_GZ_yusuan"))="1" then 
											  	response.Write "��" 
	                                          Elseif trim(rs("Client_GZ_yusuan"))="0" then
												response.Write "��"
											  End IF%></td>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>Ԥ���<%=trim(rs("Client_GZ_YSmuch"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>�Ƿ񱨼ۣ�
    <% IF trim(rs("Client_GZ_baojia"))="1" then 
											  	response.Write "��" 
	                                          Elseif trim(rs("Client_GZ_baojia"))="0" then
												response.Write "��"
											  End IF%></td>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>���۽�<%=trim(rs("Client_GZ_BJmuch"))%></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="80"><p>&nbsp;<span class="Font_red">*</span>��������</p></td>
        <td width="906" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_GZ_ztxq"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="83"><p>&nbsp;<span class="Font_red">*</span>��Ŀ�����</p></td>
        <td width="903" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_GZ_xmqk"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="83"><p>&nbsp;<span class="Font_red">*</span>�ɹ����̣�</p></td>
        <td width="903" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_GZ_cglc"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="82"><p>&nbsp;<span class="Font_red">*</span>��������</p></td>
        <td width="904" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_GZ_QA"))%></td>
      </tr>
    </table></td>
  </tr>    
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;������Ϣ</td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;�ͻ�״̬��<%IF trim(rs("Client_Follow"))="N" Then
	     response.Write("Ǳ�ڿͻ�") 
	 ElseIF trim(rs("Client_Follow"))="Y" Then 
		 response.Write("��ʽ�ͻ�")
	 ElseIF trim(rs("Client_Follow"))="X" Then 
	 	 response.Write("�����ͻ�")
	 Else
	 	 response.Write("ǩԼ�ͻ�") 	  
	 End IF%></td>
    <td bgcolor="#FFFFFF">&nbsp;ָ����Ա��<%=trim(rs("User_China"))%></td>
  </tr>
  <tr>
    <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;�������ڣ�<%=trim(rs("Client_Date"))%></td>
  </tr>
</table>
<br />
<%
 Set RS1=dbconn.execute("Select * From T_Client_Follow Where Follow_Client="&request("ID")&" order by Follow_ID")
 i=1
 do while not RS1.eof
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#006699" style="margin:0 0 8px 0 ;">
  <tr>
    <td width="350" height="25" bgcolor="#FFFFFF">&nbsp;<span style="color:#0000FF;">�� <font color="#FF0000"><%=i%></font> ���ټ�¼</span></td>
    <td width="100" align="center" bgcolor="#FFFFFF"><%=trim(RS1("Follow_Date"))%></td>
  </tr>
  <tr>
    <td height="30" colspan="2" bgcolor="#FFFFFF" style="padding:5px; line-height:25px;"><%=trim(RS1("Follow_Text"))%></td>
  </tr>
</table>
<%
 RS1.movenext
 i=i+1
 Loop
%>
<form id="form1" name="form2" method="post" action="Client_Follow_Save.asp">
<input type="hidden" name="Client_ID" id="Client_ID" value="<%=trim(rs("Client_ID"))%>" />
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#006699">
    <tr align="center">
      <td height="30" bgcolor="#FFFFFF">ת����</td>
      <td bgcolor="#FFFFFF"><select name="Client_Follow" id="Client_Follow" style="width:160px;">
	  	<option value="N">Ǳ�ڿͻ�</option>
		<option value="Y">��ʽ�ͻ�</option>
		<option value="X">�����ͻ�</option>
		<option value="P">ǩԼ�ͻ�</option>
      </select>      </td>
      <td bgcolor="#FFFFFF"><input type="submit" name="Submit" value="ȷ����" style="width:80px;" /></td>
      <td bgcolor="#FFFFFF"><input type="button" name="button" value="������" style="width:80px;" onClick="history.back();" /></td>
    </tr>
  </table>
</form>
<script language="javascript" type="text/javascript" >
	document.getElementById("Client_Follow").value = "<%=trim(rs("Client_Follow"))%>"
</script>
<br />
</body>
</html>
