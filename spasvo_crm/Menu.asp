<!--#include file="Include/admin.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����˵�</title>
<link href="Style/Menu.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="Javascript/Menu.js"></script>
</head>
<body>
<script language="JavaScript" type="text/JavaScript">
var show = true;
var hide = false;
//�޸Ĳ˵������¼�ͷ����
function my_on(head,body)
{
	var tag_a;
	for(var i=0;i<head.childNodes.length;i++)
	{
		if (head.childNodes[i].nodeName=="A")
		{
			tag_a=head.childNodes[i];
			break;
		}
	}
	tag_a.className="on";
}
function my_off(head,body)
{
	var tag_a;
	for(var i=0;i<head.childNodes.length;i++)
	{
		if (head.childNodes[i].nodeName=="A")
		{
			tag_a=head.childNodes[i];
			break;
		}
	}
	tag_a.className="off";
}
//��Ӳ˵�	
window.onload=function()
{
	m1 =new Menu("menu1",'menu1_child','dtu','100',show,my_on,my_off);
	m1.init();
	m2 =new Menu("menu2",'menu2_child','dtu','100',hide,my_on,my_off);
	m2.init();
	m3 =new Menu("menu3",'menu3_child','dtu','100',hide,my_on,my_off);
	m3.init();
	m4 =new Menu("menu4",'menu4_child','dtu','100',hide,my_on,my_off);
	m4.init();
	m5 =new Menu("menu5",'menu5_child','dtu','100',hide,my_on,my_off);
	m5.init();
	m6 =new Menu("menu6",'menu6_child','dtu','100',hide,my_on,my_off);
	m6.init();
	m7 =new Menu("menu7",'menu7_child','dtu','100',show,my_on,my_off);
	m7.init();
	m8 =new Menu("menu8",'menu8_child','dtu','100',hide,my_on,my_off);
	m8.init();
}
</script>
<noscript title="ϵͳ��ʾ">
<div class="tit" id="menu0" ><a href="" class="on"  title="�۵��˵�" name="nojs" id="nojs" >ϵͳ��ʾ</a> </div>
<div class="list" id="menu0_child">
	<p><strong>�����豸��֧��js,����ʹ�ò˵��۵�����</strong></p>
</div>
</noscript>
<div id="menu">
  <div class="tit" id="menu1" title="�˵�����"><a href="#nojs" title="�۵��˵�" target="" class="on" id="menu1_a" tabindex="1" >ϵͳ��ҳ</a> </div>
	<div class="list" id="menu1_child" title="�˵�������" >
		<ul>
			<li id="m1_1" ><%=session("System_Title")%>��<%=session("User_China")%></font></li>
			<li id="m1_2" ><a href="System/Index.asp" target="User">ϵͳ����</a></li>
			<li id="m1_3" ><a href="System/User_Password.asp" target="User">�޸�����</a></li>
			<li id="m1_4" ><a href="System/Exit.asp" target="User">�˳�ϵͳ</a></li>
		</ul>
	</div>
  
  <%
  If session("System_Key") = "3" Then	
	Zhuangtai="none"
  Else
    Zhuangtai="block"
  End If
  %>	
  <div style="display:<%=Zhuangtai%>;"> 	
  <div class="tit" id="menu2" title="�˵�����" ><a href="#nojs" title="�۵��˵�" target="" class="on" id="menu2_a" tabindex="2">�ͻ�����</a> </div>
	<div class="list" id="menu2_child" title="�˵�������">
		<ul>
			<li id="m2_1" ><a href="Client/Client_Add.asp" target="User">�����ͻ�</a></li>
			<li id="m2_2" ><a href="Client/Client_ListN.asp" target="User">Ǳ�ڿͻ�</a></li>
			<li id="m2_3" ><a href="Client/Client_ListY.asp" target="User">��ʽ�ͻ�</a></li>
			<li id="m2_4" ><a href="Client/Client_ListX.asp" target="User">�����ͻ�</a></li>
			<li id="m2_5" ><a href="Client/Client_ListP.asp" target="User">ǩԼ�ͻ�</a></li>
			<li id="m2_6" ><a href="Client/Client_List.asp" target="User">����ͻ�</a></li>
		</ul>
	</div>
  <div class="tit" id="menu6" title="�˵�����" ><a href="" title="�۵��˵�" class="on" id="menu6_a" tabindex="6">�������</a> </div>
	<div class="list" id="menu6_child" title="�˵�������">
		<ul>
			<li id="m6_1" ><a href="Contact/Contact_Add.asp" target="User">��������</a></li>
			<li id="m6_2" ><a href="Contact/Contact_List.asp" target="User">��������</a></li>
		</ul>
	</div>
    <div class="tit" id="menu8" title="�˵�����" ><a href="" title="�۵��˵�" class="on" id="menu8_a" tabindex="8">�ĵ�����</a> </div>
	<div class="list" id="menu8_child" title="�˵�������">
		<ul>
			<li id="m8_1" ><a href="ClientFile/ClientFile_Add.asp" target="User">�����ĵ�</a></li>
			<li id="m8_2" ><a href="ClientFile/ClientFile_List.asp" target="User">�����ĵ�</a></li>
		</ul>
	</div>			
  <div class="tit" id="menu3" title="�˵�����" ><a href="" title="�۵��˵�" target="" class="on" id="menu3_a" tabindex="3">Ԥ������</a> </div>
	<div class="list" id="menu3_child" title="�˵�������">
		<ul>
			<li id="m3_1" ><a href="Reservation/Reservation_Add.asp" target="User">����Ԥ��</a></li>
			<li id="m3_2" ><a href="Reservation/Reservation_ListN.asp" target="User">�ȴ�Ԥ��</a></li>
			<li id="m3_2" ><a href="Reservation/Reservation_List.asp" target="User">����Ԥ��</a></li>
		</ul>
	</div>
  <div class="tit" id="menu5" title="��־����"><a href="" title="��־����" target="" class="on" id="menu5_a" tabindex="5">��־����</a> </div>
	<div class="list" id="menu5_child" title="�˵�������">
		<ul>
			<li id="m5_2" ><a href="Client/Client_Follow.asp" target="User">���ټ�¼</a></li>
		</ul>
	</div>
  </div>	
  <%
  If session("System_Key") = "3" Then	
	Zhuangtai="block"
  Else
    Zhuangtai="none"
  End If
  %>		 	
  <div style="display:<%=Zhuangtai%>;"> 		
  <div class="tit" id="menu4" title="ϵͳ����" ><a href="" title="ϵͳ����" target="" class="on" id="menu4_a" tabindex="4">ϵͳ����</a> </div>
	<div class="list" id="menu4_child" title="�˵�������">
		<ul>
			<li id="m4_1" ><a href="System/User_List.asp" target="User">�˺Ź���</a></li>
			<li id="m4_2" ><a href="System/Config_List.asp" target="User">���ƹ���</a></li>
		</ul>
	</div>
	</div>
  <div class="tit" id="menu7" title="�˵�����" ><a href="" title="�۵��˵�" class="on" id="menu7_a" tabindex="7">��������</a> </div>
	<div class="list" id="menu7_child" title="�˵�������">
		<ul id="auth" >
			<li>���ߣ��������</li>
			<li>��ַ��<a href="http://www.spasvo.com/" target="_blank">www.spasvo.com</a></li>
			<li>ʱ�䣺2013-04-30</li>
		</ul>
	</div>
</div>
</body>
</html>
