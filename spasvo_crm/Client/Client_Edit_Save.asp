<!--#include file="../Include/admin.asp"-->
<!--#include file="../Include/conn.asp"-->
	<%			
		Set Rs=dbconn.execute("Update T_Client Set Client_Class='" & request("Client_Class") & "',Client_Company='" & request("Client_Company") & "',Client_beijing='" & request("Client_beijing") & "',Client_shangshi='" & request("Client_shangshi") & "',Client_ziben='" & request("Client_ziben") & "',Client_xiaoshou='" & request("Client_xiaoshou") & "',Client_guimu='" & request("Client_guimu") & "',Client_ceshiren='" & request("Client_ceshiren") & "',Client_goumei='" & request("Client_goumei") & "',Client_ruanjian='" & request("Client_ruanjian") & "',Client_Http='" & request("Client_Http") & "',Client_youbian='" & request("Client_youbian") & "',Client_Address='" & request("Client_Address") & "',Client_changping='" & request("Client_zhuyingchangping") & "',Client_fuwu='" & request("Client_zhuyaofuwu") & "',Client_hangye='" & request("Client_anlihangye") & "',Client_juli='" & request("Client_anlihangjuli") & "',Client_jiagou='" & request("Client_jiagoukoubei") & "',Client_qingkuang='" & request("Client_qingkuang") & "',Client_Text='" & request("Client_Text") & "',Client_Products='" & request("Client_Products") & "',Client_Choose='" & request("Client_Choose") & "',Client_GZ_jieduan='"& Request("Client_GZ_jieduan") &"',Client_GZ_jcry='"& Request("Client_GZ_jcry") &"',Client_GZ_yusuan='"& Request("Client_GZ_yusuan") &"',Client_GZ_YSmuch='"& Request("Client_GZ_YSmuch") &"',Client_GZ_baojia='"& Request("Client_GZ_baojia") &"',Client_GZ_BJmuch='"& Request("Client_GZ_BJmuch") &"',Client_GZ_ztxq='"& Request("Client_GZ_ztxq") &"',Client_GZ_xmqk='"& Request("Client_GZ_xmqk") &"',Client_GZ_cglc='"& Request("Client_GZ_cglc") &"',Client_GZ_QA='"& Request("Client_GZ_QA") &"',Client_Follow='" & request("Client_Follow") & "',Client_sales='" & request("Client_sales") & "',Client_Date='" & request("Client_Date") & "' where Client_ID=" & request("Client_ID") & "")
		
		response.write "<script language=javascript>"
		response.write "this.location.href='Client_List.asp';"
		response.write "</script>"
	%>
</body>
</html>
