<!--#include file="../Include/conn.asp"-->
<?xml version="1.0" encoding="gb2312"?>
<% set rs=dbconn.execute("select * from T_Client where Client_Company='" & trim(request("SQL")) & "'") %>
<XMLRoot>
	<% if not rs.eof then %>
		<SUCCESS>YES</SUCCESS>
		<name><%=trim(rs("Client_Company"))%></name>
	<% else %>
		<SUCCESS>NO</SUCCESS>
	<% end if %>
</XMLRoot>