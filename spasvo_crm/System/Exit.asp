<%
session("User_Id")=""
session("System_Title")=""
session("System_Key")=""
session("User_Username")=""
session("User_China")=""

response.write "<script language=javascript>"
response.write "window.parent.parent.location.href='../Login.asp';"
response.write "</script>"
%>