<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上海泽众软件科技有限公司客户管理系统</title>

<style type="text/css">
<!--
#{
	margin:0;
	padding:0;
}

body{
	margin:0;
	padding:0;
	font-size:12px;
	background:url(Images/beijing.gif);
}
.text_width{
	width:120px;
}

.while {
	color: #FFFFFF;
}
-->
</style></head>
<script language=javascript>
	function login()
	{
		if(document.formuser.username.value=="")
		{
			document.formuser.username.focus();
			return false;
		}
		if(document.formuser.password.value=="")
		{
			document.formuser.password.focus();
			return false;
		}
		if(document.formuser.bkye.value=="")
		{
			document.formuser.bkye.focus();
			return false;
		}
	}
</script>
<body>
	<form action="submit.asp" method="post" name="formuser" id="formuser" onSubmit="return login();">
      <br />
      <br />
      <table width="1004" height="603" border="0" align="center" cellpadding="0" cellspacing="0">   
    <tr>
    <td align="right" style="width: 419px"><img src="images/pic01.gif" width="216" height="301" border="0" ></td>
    <td valign="top" style="width: 393px"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="393" height="151" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="393" height="301" valign="middle" background="images/pic02.gif"><div align="center">
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td style="height: 30px; width: 182px; font-size:13px;"><div align="right" class="unnamed1">&nbsp; <span class="while">用户名</span><span class="STYLE1">&nbsp;</span>&nbsp; </div></td>
              <td width="55%" style="height: 30px"><div align="left">
                  &nbsp;<input name="username" type="text" class="text_width" id="username" />
                  </div></td>
            </tr>
            <tr>
              <td style="width: 182px; height: 19px;font-size:13px;"><div align="right" class="unnamed1"><span class="while">密&nbsp; 码</span><span class="STYLE1">&nbsp;</span>&nbsp; </div></td>
              <td style="height: 19px"><div align="left">
                  &nbsp;<input name="password" type="password" class="text_width" id="password" />
              </div></td>
            </tr>
            <tr>
              <td height="30" align="right">
                  <input type="submit" name="Submit" value="登　录" style="BORDER-RIGHT: #5a7edc 0px; BORDER-TOP: #5a7edc 0px; BORDER-LEFT: #5a7edc 0px; WIDTH: 61px; height:20px; COLOR:#000000; BORDER-BOTTOM: #5a7edc 0px; background:url(images/button.gif)"></td>
              <td height="30" align="left">&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" name="reset" value="重　填" style="BORDER-RIGHT: #5a7edc 0px; BORDER-TOP: #5a7edc 0px; BORDER-LEFT: #5a7edc 0px; WIDTH: 61px;  height:20px; COLOR:#000000; BORDER-BOTTOM: #5a7edc 0px;background:url(images/button.gif)" /></td>
            </tr>
          </table>
          </div></td>
      </tr>
    </table></td>
    <td width="192">&nbsp;</td>
  </tr>
</table>
</FORM>
</body>
</html>
