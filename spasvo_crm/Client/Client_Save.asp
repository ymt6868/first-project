<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
	<%	
	
		Set rs=dbconn.execute("Select * from T_Client Where Client_Company='" & Client_Company & "'")
		If not rs.eof or not rs.bof Then
			response.write "<script language=javascript>"
			response.write "alert('客户冲突！请检索后再添加！');"
			response.write "this.location.href='Client_Add.asp';"
			response.write "</script>"
			response.End()
		End If
	
		Client_Company=request("Client_Company")
		Client_Class=request("Client_Class")
		Client_beijing=request("Client_beijing")
		Client_shangshi=request("Client_shangshi")
		Client_ziben=request("Client_ziben")	
		Client_xiaoshou=request("Client_xiaoshou")
		Client_guimu=request("Client_guimu")
		Client_ceshiren=request("Client_ceshiren")
		Client_goumei=request("Client_goumei")
		Client_ruanjian=request("Client_ruanjian")
		Client_Http=request("Client_Http")
		Client_youbian=request("Client_youbian")
		Client_Address=request("Client_Address")
		Client_zhuyingchangping=request("Client_zhuyingchangping")
		Client_zhuyaofuwu=request("Client_zhuyaofuwu")
		Client_anlihangye=request("Client_anlihangye")
		Client_anlihangjuli=request("Client_anlihangjuli")
		Client_jiagoukoubei=request("Client_jiagoukoubei")
		Client_qingkuang=request("Client_qingkuang")
		Client_Text=request("Client_Text")
		Client_Products=request("Client_Products")
		Client_Choose=request("Client_Choose")
		Client_sales=request("Client_sales")
		Client_Follow=request("Client_Follow")
		Client_Date=request("Client_Date")
		
		'开始添加一条客户基本信息
		
		set rs=dbconn.execute("Insert Into T_Client ( Client_Company,Client_Class,Client_beijing,Client_shangshi,Client_ziben,Client_xiaoshou,Client_guimu,Client_ceshiren,Client_goumei,Client_ruanjian,Client_Http,Client_youbian,Client_Address,Client_changping,Client_fuwu,Client_hangye,Client_juli,Client_jiagou,Client_qingkuang,Client_Text,Client_Products,Client_Choose,Client_sales,Client_Follow,Client_Date ) values ('" & Client_Company & "','" & Client_Class & "','" & Client_beijing & "','" & Client_shangshi & "','" & Client_ziben & "','" & Client_xiaoshou & "','" & Client_guimu & "','" & Client_ceshiren & "','" & Client_goumei & "','" & Client_ruanjian & "','" & Client_Http & "','" & Client_youbian & "','"& Client_Address &"','" & Client_zhuyingchangping & "','" & Client_zhuyaofuwu & "','"& Client_anlihangye &"','" & Client_anlihangjuli & "','" & Client_jiagoukoubei & "','"& Client_qingkuang &"','" & Client_Text & "','" & Client_Products & "','" & Client_Choose & "','"& Client_sales &"','"& Client_Follow &"','" & Client_Date & "')")
		
		response.write "<script language=javascript>"
		response.write "this.location.href='Client_Add.asp';"
		response.write "</script>"
	%>
</body>
</html>
