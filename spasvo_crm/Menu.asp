<!--#include file="Include/admin.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理菜单</title>
<link href="Style/Menu.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="Javascript/Menu.js"></script>
</head>
<body>
<script language="JavaScript" type="text/JavaScript">
var show = true;
var hide = false;
//修改菜单的上下箭头符号
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
//添加菜单	
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
<noscript title="系统提示">
<div class="tit" id="menu0" ><a href="" class="on"  title="折叠菜单" name="nojs" id="nojs" >系统提示</a> </div>
<div class="list" id="menu0_child">
	<p><strong>您的设备不支持js,不能使用菜的折叠功能</strong></p>
</div>
</noscript>
<div id="menu">
  <div class="tit" id="menu1" title="菜单标题"><a href="#nojs" title="折叠菜单" target="" class="on" id="menu1_a" tabindex="1" >系统首页</a> </div>
	<div class="list" id="menu1_child" title="菜单功能区" >
		<ul>
			<li id="m1_1" ><%=session("System_Title")%>︱<%=session("User_China")%></font></li>
			<li id="m1_2" ><a href="System/Index.asp" target="User">系统桌面</a></li>
			<li id="m1_3" ><a href="System/User_Password.asp" target="User">修改密码</a></li>
			<li id="m1_4" ><a href="System/Exit.asp" target="User">退出系统</a></li>
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
  <div class="tit" id="menu2" title="菜单标题" ><a href="#nojs" title="折叠菜单" target="" class="on" id="menu2_a" tabindex="2">客户管理</a> </div>
	<div class="list" id="menu2_child" title="菜单功能区">
		<ul>
			<li id="m2_1" ><a href="Client/Client_Add.asp" target="User">新增客户</a></li>
			<li id="m2_2" ><a href="Client/Client_ListN.asp" target="User">潜在客户</a></li>
			<li id="m2_3" ><a href="Client/Client_ListY.asp" target="User">正式客户</a></li>
			<li id="m2_4" ><a href="Client/Client_ListX.asp" target="User">放弃客户</a></li>
			<li id="m2_5" ><a href="Client/Client_ListP.asp" target="User">签约客户</a></li>
			<li id="m2_6" ><a href="Client/Client_List.asp" target="User">管理客户</a></li>
		</ul>
	</div>
  <div class="tit" id="menu6" title="菜单标题" ><a href="" title="折叠菜单" class="on" id="menu6_a" tabindex="6">联络管理</a> </div>
	<div class="list" id="menu6_child" title="菜单功能区">
		<ul>
			<li id="m6_1" ><a href="Contact/Contact_Add.asp" target="User">新增联络</a></li>
			<li id="m6_2" ><a href="Contact/Contact_List.asp" target="User">管理联络</a></li>
		</ul>
	</div>
    <div class="tit" id="menu8" title="菜单标题" ><a href="" title="折叠菜单" class="on" id="menu8_a" tabindex="8">文档管理</a> </div>
	<div class="list" id="menu8_child" title="菜单功能区">
		<ul>
			<li id="m8_1" ><a href="ClientFile/ClientFile_Add.asp" target="User">新增文档</a></li>
			<li id="m8_2" ><a href="ClientFile/ClientFile_List.asp" target="User">管理文档</a></li>
		</ul>
	</div>			
  <div class="tit" id="menu3" title="菜单标题" ><a href="" title="折叠菜单" target="" class="on" id="menu3_a" tabindex="3">预订管理</a> </div>
	<div class="list" id="menu3_child" title="菜单功能区">
		<ul>
			<li id="m3_1" ><a href="Reservation/Reservation_Add.asp" target="User">新增预订</a></li>
			<li id="m3_2" ><a href="Reservation/Reservation_ListN.asp" target="User">等待预订</a></li>
			<li id="m3_2" ><a href="Reservation/Reservation_List.asp" target="User">管理预订</a></li>
		</ul>
	</div>
  <div class="tit" id="menu5" title="日志管理"><a href="" title="日志管理" target="" class="on" id="menu5_a" tabindex="5">日志管理</a> </div>
	<div class="list" id="menu5_child" title="菜单功能区">
		<ul>
			<li id="m5_2" ><a href="Client/Client_Follow.asp" target="User">跟踪记录</a></li>
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
  <div class="tit" id="menu4" title="系统管理" ><a href="" title="系统管理" target="" class="on" id="menu4_a" tabindex="4">系统管理</a> </div>
	<div class="list" id="menu4_child" title="菜单功能区">
		<ul>
			<li id="m4_1" ><a href="System/User_List.asp" target="User">账号管理</a></li>
			<li id="m4_2" ><a href="System/Config_List.asp" target="User">配制管理</a></li>
		</ul>
	</div>
	</div>
  <div class="tit" id="menu7" title="菜单标题" ><a href="" title="折叠菜单" class="on" id="menu7_a" tabindex="7">关于我们</a> </div>
	<div class="list" id="menu7_child" title="菜单功能区">
		<ul id="auth" >
			<li>作者：泽众软件</li>
			<li>网址：<a href="http://www.spasvo.com/" target="_blank">www.spasvo.com</a></li>
			<li>时间：2013-04-30</li>
		</ul>
	</div>
</div>
</body>
</html>
