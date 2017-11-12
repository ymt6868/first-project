<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
<% set Rs1=dbconn.execute("Select * From T_Client,T_User Where Client_sales=User_Id And Client_Id=" & request("Id") & "")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件技术有限公司</title>
<link href="../Style/Webcomfig.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../Javascript/Client.js"></script>
</head>

<body>
<!--#include file="../Include/AutoDate.asp"-->
<table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#006699">
  <tr>
    <td bgcolor="#006699"><table width="80%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><font color="#FFFFFF">----新增客户----</font></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
	  <form id="Myfrom" name="Myfrom" method="post" action="Client_Edit_Save.asp">
	  <input type="hidden" name="Client_ID" id="Client_ID" value="<%=trim(Rs1("Client_ID"))%>" />
	  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#006699">
	    <tr>
          <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;基本信息</td>
        </tr>
        <tr>
          <td width="50%" height="30" bgcolor="#FFFFFF">&nbsp;公司名称
          <input name="Client_Company" type="text" id="Client_Company" style="width:200px;" value="<%=trim(Rs1("Client_Company"))%>" readonly="readonly" />          </td>
          <td width="50%" bgcolor="#FFFFFF">&nbsp;申请类型
            <select name="Client_Class" id="Client_Class" style="width:207px;">
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
          <td height="30" bgcolor="#FFFFFF">&nbsp;公司背景
		    <select name="Client_beijing" id="Client_beijing" style="width:207px;">
			  <%
			   set rs=dbconn.execute("select * from T_System Where System_Class='E'")
			   do while not rs.eof
			   %>
              <option value="<%=trim(rs("System_Key"))%>"><%=trim(rs("System_title"))%></option>
			  <%
			  	rs.movenext
				loop
			  %>
            </select>		  </td>
          <td bgcolor="#FFFFFF">&nbsp;是否上市          
            <select name="Client_shangshi" id="Client_shangshi" style="width:207px;">
              <option value="1">是</option>
              <option value="0">否</option>
            </select>          </td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;注册资本
          <input type="text" name="Client_ziben" id="Client_ziben" style="width:200px;" value="<%=trim(Rs1("Client_ziben"))%>" /></td>
          <td bgcolor="#FFFFFF">&nbsp;年销售额
            <input type="text" name="Client_xiaoshou" id="Client_xiaoshou" style="width:200px;" value="<%=trim(Rs1("Client_xiaoshou"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;企业规模
          <input type="text" name="Client_guimu" id="Client_guimu" style="width:200px;" value="<%=trim(Rs1("Client_guimu"))%>" /></td>
          <td bgcolor="#FFFFFF">&nbsp;测试人员
            <input type="text" name="Client_ceshiren" id="Client_ceshiren" style="width:200px;" value="<%=trim(Rs1("Client_ceshiren"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;购买正版
            <select name="Client_goumei" id="Client_goumei" style="width:207px;">
              <option value="1">是</option>
              <option value="0">否</option>
            </select></td>
          <td bgcolor="#FFFFFF">&nbsp;目前软件
            <input type="text" name="Client_ruanjian" id="Client_ruanjian" style="width:200px;" value="<%=trim(Rs1("Client_ruanjian"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;公司网址
          <input name="Client_Http" id="Client_Http" type="text" style="width:200px;" value="<%=trim(Rs1("Client_Http"))%>" /></td>
          <td height="14" bgcolor="#FFFFFF">&nbsp;邮编编码
            <input type="text" name="Client_youbian" id="Client_youbian" style="width:200px;" value="<%=trim(Rs1("Client_youbian"))%>" /></td>
        </tr>
        <tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;公司地址
          <input name="Client_Address" id="Client_Address" type="text" style="width:520px;" value="<%=trim(Rs1("Client_Address"))%>" /></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;主营产品
          <textarea name="Client_zhuyingchangping" id="Client_zhuyingchangping" style="width:200px; height:100px;"><%=trim(Rs1("Client_changping"))%></textarea></td>
          <td height="30" bgcolor="#FFFFFF">&nbsp;主要服务
            <textarea name="Client_zhuyaofuwu" id="Client_zhuyaofuwu" style="width:200px; height:100px;"><%=trim(Rs1("Client_fuwu"))%></textarea></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;案例行业
          <textarea name="Client_anlihangye" id="Client_anlihangye" style="width:200px; height:100px;"><%=trim(Rs1("Client_hangye"))%></textarea></td>
          <td height="30" bgcolor="#FFFFFF">&nbsp;案例举例
          <textarea name="Client_anlihangjuli" id="Client_anlihangjuli" style="width:200px; height:100px;"><%=trim(Rs1("Client_juli"))%></textarea></td>
        </tr>
		<tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF" style="padding:0 0 0 5px;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="55"><p>                组织架构<br />
              </p>              </td>
              <td><textarea name="Client_jiagoukoubei" id="Client_jiagoukoubei" style="width:520px; height:100px;"><%=trim(Rs1("Client_jiagou"))%></textarea></td>
            </tr>
          </table></td>
        </tr>
		<tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF" style="padding:0 0 0 5px;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="55"><p>                测试情况</p>              </td>
              <td><textarea name="Client_qingkuang" id="Client_qingkuang" style="width:520px; height:100px;"><%=trim(Rs1("Client_qingkuang"))%></textarea></td>
            </tr>
          </table></td>
        </tr>
				<tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF" style="padding:0 0 0 5px;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="55"><p>其它信息</p>              </td>
              <td><textarea name="Client_Text" id="Client_Text" style="width:520px; height:100px;"><%=trim(Rs1("Client_Text"))%></textarea></td>
            </tr>
          </table></td>
        </tr>
		<tr>
          <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;申请信息</td>
        </tr>
        <% 
		Client_Products=trim(Rs1("Client_Products"))
		MyStrs = Split(Client_Products,",")
		set rs=dbconn.execute("select * from T_System Where System_Class='C'") %>
        <tr>
          <td height="30" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
				<% do while not rs.eof %>
                  <tr>
                    <td height="30" bgcolor="#FFFFFF"><input type="checkbox" name="Client_Products" id="Client_Products" value="<%=trim(rs("System_Key"))%>" <% 
			 	for each Products_ID in MyStrs
					if trim(Products_ID)=trim(rs("System_Key")) then
						response.Write("checked")
					end if
				next %> /><%=trim(rs("System_Title"))%></td>
                  </tr>
			   <%
			   rs.movenext
			   loop 
			   %>
          </table></td>
          <td height="30" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                  <% 
				  Client_Choose=trim(Rs1("Client_Choose"))
		 		  MyStrs = Split(Client_Choose,",")
				  set rs=dbconn.execute("select * from T_System Where System_Class='B'")
				  do while not rs.eof
				  %>
            <tr>
                    <td height="30" bgcolor="#FFFFFF"><input type="checkbox" name="Client_Choose" id="Client_Choose" value="<%=trim(rs("System_Key"))%>" <% 
			 	for each Products_ID in MyStrs
					if trim(Products_ID)=trim(rs("System_Key")) then
						response.Write("checked")
					end if
				next %> />
                        <%=trim(rs("System_Title"))%></td>
            </tr>
            <%
			   rs.movenext
			   loop 
			   %>
          </table></td>
        </tr>
		<tr>
          <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;跟踪信息</td>
        </tr>
		<tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;目前阶段
			<select name="Client_GZ_jieduan" id="Client_GZ_jieduan" style="width:207px;">
			   <%
			   set rs=dbconn.execute("select * from T_System Where System_Class='F'")
			   do while not rs.eof
			   %>
               <option value="<%=trim(rs("System_Key"))%>"><%=trim(rs("System_title"))%></option>
               <%
			  	rs.movenext
				loop
			   %>
			</select>		  </td>
          <td height="30" bgcolor="#FFFFFF">&nbsp;决策人员
          <input type="text" name="Client_GZ_jcry" id="Client_GZ_jcry" style="width:200px;" value="<%=trim(rs1("Client_GZ_jcry"))%>" /></td>
		</tr>
		<tr>
		  <td height="30" bgcolor="#FFFFFF">&nbsp;是否预算
		    <select name="Client_GZ_yusuan" id="Client_GZ_yusuan" style="width:207px;">
              <option value="1">是</option>
              <option value="0">否</option>
	        </select>	      </td>
	      <td height="30" bgcolor="#FFFFFF">&nbsp;预算金额
          <input type="text" name="Client_GZ_YSmuch" id="Client_GZ_YSmuch" style="width:200px;" value="<%=trim(rs1("Client_GZ_YSmuch"))%>" /></td>
		</tr>
		<tr>
		  <td height="30" bgcolor="#FFFFFF">&nbsp;是否报价
		    <select name="Client_GZ_baojia" id="Client_GZ_baojia" style="width:207px;">
              <option value="1">是</option>
              <option value="0">否</option>
            </select></td>
	      <td height="30" bgcolor="#FFFFFF">&nbsp;报价金额
          <input type="text" name="Client_GZ_BJmuch" id="Client_GZ_BJmuch" style="width:200px;" value="<%=trim(rs1("Client_GZ_BJmuch"))%>" /></td>
		</tr>
		<tr>
		  <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;整体需求
	      <textarea name="Client_GZ_ztxq" id="Client_GZ_ztxq" style="width:520px; height:100px;"><%=trim(rs1("Client_GZ_ztxq"))%></textarea></td>
        </tr>
		<tr>
		  <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;项目情况
            <textarea name="Client_GZ_xmqk" id="Client_GZ_xmqk" style="width:520px; height:100px;"><%=trim(rs1("Client_GZ_xmqk"))%></textarea></td>
	    </tr>
		<tr>
		  <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;采购流程
            <textarea name="Client_GZ_cglc" id="Client_GZ_cglc" style="width:520px; height:100px;"><%=trim(rs1("Client_GZ_cglc"))%></textarea></td>
	    </tr>
		<tr>
		  <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;问题解决
            <textarea name="Client_GZ_QA" id="Client_GZ_QA" style="width:520px; height:100px;"><%=trim(rs1("Client_GZ_QA"))%></textarea></td>
	    </tr>					
		<tr>
          <td height="25" colspan="2" bgcolor="#CCCCCC">&nbsp;其它信息</td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FFFFFF">&nbsp;客户状态
            <select name="Client_Follow" id="Client_Follow" style="width:207px;">
			  <option value="N">潜在客户</option>
			  <option value="Y">正式客户</option>
			  <option value="X">放弃客户</option>
			  <option value="P">签约客户</option>
          </select></td>
          <td bgcolor="#FFFFFF">&nbsp;指派人员
		  	<% IF session("System_Key") = "1" Then %>
            <select name="Client_sales" id="Client_sales" style="width:207px;">
              <%
			Set RS=dbconn.execute("Select * From T_User Where User_System<>22") 
			do while not RS.eof
				%>
              <option value="<%=trim(RS("User_ID"))%>"><%=trim(RS("User_China"))%></option>
              <%
			RS.movenext
			loop
		%>
            </select>
			<% Else %>
				<input type="text" name="Client_sales_1" id="Client_sales_1" value="<%=trim(Rs1("User_China"))%>" readonly="readonly" style="width:200px;" />
				<input type="hidden" name="Client_sales" id="Client_sales" />
			<% End IF %>		  </td>
        </tr>
        <tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;新增日期
            <input type="text" name="Client_Date" id="Client_Date" style="width:200px;" value="<%=trim(rs1("Client_Date"))%>" onfocus="setday(this)" /></td>
        </tr>
        <tr>
          <td height="30" colspan="2" bgcolor="#FFFFFF">&nbsp;
            <input type="submit" name="button2" value="确　认" style="width:80px;line-height:16px;" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
          <input type="reset" name="Submit2" value="重　写" style="width:80px;line-height:16px;" /></td>
        </tr>
      </table>
	  </form><br />	 
<script language="javascript" type="text/javascript" >
	document.getElementById("Client_beijing").value = "<%=trim(Rs1("Client_beijing"))%>"
	document.getElementById("Client_Follow").value = "<%=trim(Rs1("Client_Follow"))%>"
	document.getElementById("Client_Class").value = "<%=trim(Rs1("Client_Class"))%>"
	document.getElementById("Client_shangshi").value = "<%=trim(Rs1("Client_shangshi"))%>"
	document.getElementById("Client_goumei").value = "<%=trim(Rs1("Client_goumei"))%>"	
	document.getElementById("Client_sales").value = "<%=trim(Rs1("Client_sales"))%>"

	document.getElementById("Client_GZ_jieduan").value = "<%=trim(Rs1("Client_GZ_jieduan"))%>"
	document.getElementById("Client_GZ_yusuan").value = "<%=trim(Rs1("Client_GZ_yusuan"))%>"
	document.getElementById("Client_GZ_baojia").value = "<%=trim(Rs1("Client_GZ_baojia"))%>"
</script>	  
</body>
</html>
