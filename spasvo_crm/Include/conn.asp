<%
dim strconn,dbconn
strconn = "driver={MySQL ODBC 3.51 Driver};server=127.0.0.1;port=3306;database=spasvo_crm;user=root;password=root;stmt=set names gbk"
set dbconn = server.createobject("adodb.connection")
dbconn.open strconn
%>