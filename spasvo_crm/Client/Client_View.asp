<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<% set rs=dbconn.execute("Select * From T_Client,T_User Where Client_sales=User_Id And Client_Id=" & request("Id") & "")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=trim(rs("Client_Company"))%> 信息</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----<%=trim(rs("Client_Company"))%> 客户信息 跟踪记录----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;基本信息 <span class="Font_red">注：红色*表示必填 </span></td>
  </tr>
  <tr>
    <td width="50%" height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>公司名称：<%=trim(rs("Client_Company"))%></td>
    <td width="50%" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>申请类型：
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
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>公司背景：
    <%
	IF trim(rs("Client_beijing"))<>"" Then
		Client_beijing=trim(rs("Client_beijing"))
		Set Rs1=dbconn.execute("select * from T_System Where System_Class='E' And System_Key= '"& Client_beijing &"'")
		IF not Rs1.eof Then
			response.Write(trim(rs1("System_title")))
		End If
	End IF
	%></td>
    <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>是否上市：
    <% IF trim(rs("Client_shangshi"))="1" then 
											  	response.Write "是" 
	                                          Elseif trim(rs("Client_shangshi"))="0" then
												response.Write "否"
											  End IF%>    </td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>注册资本：<%=trim(rs("Client_ziben"))%></td>
    <td bgcolor="#FFFFFF">&nbsp;年销售额：<%=trim(rs("Client_xiaoshou"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>企业规模：<%=trim(rs("Client_guimu"))%></td>
    <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>测试人员：<%=trim(rs("Client_ceshiren"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>购买正版：
    <% IF trim(rs("Client_goumei"))="1" then 
											  	response.Write "是" 
	                                          Elseif trim(rs("Client_goumei"))="0" then
												response.Write "否"
											  End IF%></td>
    <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>目前软件：<%=trim(rs("Client_ruanjian"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>公司网址：<a href="<%=trim(rs("Client_Http"))%>" target="_blank"><%=trim(rs("Client_Http"))%></a></td>
    <td height="14" bgcolor="#FFFFFF">&nbsp;邮编编码：<%=trim(rs("Client_youbian"))%></td>
  </tr>
  <tr>
    <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>公司地址：<%=trim(rs("Client_Address"))%></td>
  </tr>
  <tr>
    <td height="100" bgcolor="#FFFFFF" style="line-height:22px; padding:5px 5px 5px 5px;"><span class="Font_red">*</span>主营产品：<%=trim(rs("Client_changping"))%></td>
    <td height="30" bgcolor="#FFFFFF" style="line-height:22px; padding:5px 5px 5px 5px;"><span class="Font_red">*</span>主要服务：<%=trim(rs("Client_fuwu"))%></td>
  </tr>
  <tr>
    <td height="100" bgcolor="#FFFFFF" style="line-height:22px; padding:5px 5px 5px 5px;">案例行业：<%=trim(rs("Client_hangye"))%></td>
    <td height="30" bgcolor="#FFFFFF" style="line-height:22px; padding:5px 5px 5px 5px;">案例举例：<%=trim(rs("Client_juli"))%></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="80"><p> &nbsp;<span class="Font_red">*</span>组织架构：</p></td>
        <td width="906" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_jiagou"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="82"><p> &nbsp;<span class="Font_red">*</span>测试情况：</p></td>
        <td width="904" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_qingkuang"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="66"><p>&nbsp;其它信息：</p></td>
        <td style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_Text"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;联络信息</td>
  </tr>
  <% Set Rs1=dbconn.execute("Select * From T_Client_Name Where Client_Name_Client='" & trim(rs("Client_ID")) & "'") %>
  <tr>
    <td colspan="2" bgcolor="#FFFFFF">
	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	<% do while not rs1.eof %>
      <tr>
        <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>客户姓名：<%=trim(Rs1("Client_Name_Name"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>客户部门：<%=trim(Rs1("Client_Name_Department"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>客户职位：
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
        <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>客户电话：<%=trim(Rs1("Client_Name_Tel"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>客户手机：<%=trim(Rs1("Client_Name_Mobile"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>客户邮箱：<%=trim(Rs1("Client_Name_Email"))%></td>
        </tr>
      <tr>
        <td height="30" bgcolor="#FFFFFF">&nbsp;客户 Q Q：<%=trim(Rs1("Client_Name_QQ"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;客户 MSN：<%=trim(Rs1("Client_Name_MSN"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>技术程度：            
          <%IF trim(Rs1("Client_Name_zhishi"))="0" Then
			   response.Write("")
			ElseIF trim(Rs1("Client_Name_zhishi"))="1" Then  
			   response.Write("不懂")
			ElseIF trim(Rs1("Client_Name_zhishi"))="2" Then  
			   response.Write("略懂") 
			ElseIF trim(Rs1("Client_Name_zhishi"))="3" Then  
			   response.Write("精通")      
			End IF
		  	%></td>
        </tr>
      <tr>
        <td height="30" colspan="3" bgcolor="#FFFFFF">&nbsp;其它信息：<%=trim(Rs1("Client_Name_Text"))%></td>
        </tr>
      <tr>
        <td height="30" colspan="3" bgcolor="#FFFFFF">&nbsp;新增日期：<%=trim(Rs1("Client_Name_Date"))%></td>
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
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;<span class="Font_red">*</span>申请信息</td>
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
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;文档信息</td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#FFFFFF">
	<%
	 Set RS1=dbconn.execute("Select * From T_Client_File Where Client_File_Client='"& trim(rs("Client_ID")) &"'") 
	%>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	<% 	do while not RS1.eof %>
      <tr>
        <td height="30" bgcolor="#FFFFFF">&nbsp;文档标题：<%=trim(RS1("Client_File_FileName"))%></td>
        <td bgcolor="#FFFFFF">&nbsp;文档附件：<a href="../ClientFile/UploadFile/<%=trim(RS1("Client_File_Url"))%>" target="_blank">查看</a></td>
        <td bgcolor="#FFFFFF">&nbsp;新增日期：<%=trim(RS1("Client_File_Date"))%></td>
      </tr>
      <tr>
        <td height="30" colspan="3" bgcolor="#FFFFFF" style="line-height:25px; padding:5px 5px 5px 6px;">文档备注：<%=trim(RS1("Client_File_Text"))%></td>
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
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;跟踪信息</td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>目前阶段：
    <%
	IF trim(rs("Client_GZ_jieduan"))<>"" Then
		Client_beijing=trim(rs("Client_GZ_jieduan"))
		Set Rs1=dbconn.execute("select * from T_System Where System_Class='F' And System_Key= '"& Client_beijing &"'")
		IF not Rs1.eof Then
			response.Write(trim(rs1("System_title")))
		End If
	End IF
	%></td>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>决策人员：<%=trim(rs("Client_GZ_jcry"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>是否预算：
    <% IF trim(rs("Client_GZ_yusuan"))="1" then 
											  	response.Write "是" 
	                                          Elseif trim(rs("Client_GZ_yusuan"))="0" then
												response.Write "否"
											  End IF%></td>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>预算金额：<%=trim(rs("Client_GZ_YSmuch"))%></td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>是否报价：
    <% IF trim(rs("Client_GZ_baojia"))="1" then 
											  	response.Write "是" 
	                                          Elseif trim(rs("Client_GZ_baojia"))="0" then
												response.Write "否"
											  End IF%></td>
    <td height="30" bgcolor="#FFFFFF">&nbsp;<span class="Font_red">*</span>报价金额：<%=trim(rs("Client_GZ_BJmuch"))%></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="80"><p>&nbsp;<span class="Font_red">*</span>整体需求：</p></td>
        <td width="906" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_GZ_ztxq"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="83"><p>&nbsp;<span class="Font_red">*</span>项目情况：</p></td>
        <td width="903" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_GZ_xmqk"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="83"><p>&nbsp;<span class="Font_red">*</span>采购流程：</p></td>
        <td width="903" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_GZ_cglc"))%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100" colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="82"><p>&nbsp;<span class="Font_red">*</span>问题解决：</p></td>
        <td width="904" style="line-height:22px; padding:5px 5px 5px 0;"><%=trim(rs("Client_GZ_QA"))%></td>
      </tr>
    </table></td>
  </tr>    
  <tr>
    <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;其它信息</td>
  </tr>
  <tr>
    <td height="30" bgcolor="#FFFFFF">&nbsp;客户状态：<%IF trim(rs("Client_Follow"))="N" Then
	     response.Write("潜在客户") 
	 ElseIF trim(rs("Client_Follow"))="Y" Then 
		 response.Write("正式客户")
	 ElseIF trim(rs("Client_Follow"))="X" Then 
	 	 response.Write("放弃客户")
	 Else
	 	 response.Write("签约客户") 	  
	 End IF%></td>
    <td bgcolor="#FFFFFF">&nbsp;指派人员：<%=trim(rs("User_China"))%></td>
  </tr>
  <tr>
    <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;新增日期：<%=trim(rs("Client_Date"))%></td>
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
    <td width="350" height="25" bgcolor="#FFFFFF">&nbsp;<span style="color:#0000FF;">第 <font color="#FF0000"><%=i%></font> 跟踪记录</span></td>
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
      <td height="30" bgcolor="#FFFFFF">转　化</td>
      <td bgcolor="#FFFFFF"><select name="Client_Follow" id="Client_Follow" style="width:160px;">
	  	<option value="N">潜在客户</option>
		<option value="Y">正式客户</option>
		<option value="X">放弃客户</option>
		<option value="P">签约客户</option>
      </select>      </td>
      <td bgcolor="#FFFFFF"><input type="submit" name="Submit" value="确　认" style="width:80px;" /></td>
      <td bgcolor="#FFFFFF"><input type="button" name="button" value="返　回" style="width:80px;" onClick="history.back();" /></td>
    </tr>
  </table>
</form>
<script language="javascript" type="text/javascript" >
	document.getElementById("Client_Follow").value = "<%=trim(rs("Client_Follow"))%>"
</script>
<br />
</body>
</html>
