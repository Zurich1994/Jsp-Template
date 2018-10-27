<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单个结果集</title>
</head>
<body>
<%
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=tableDemo";
String userName = "sa";
String password = "";
String sql = null;
Connection conn = null;
Statement stm = null;
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}catch(Exception e) {
	out.println("加载驱动器类出现异常");
}
try {
	conn = DriverManager.getConnection(url, userName, password);
	//创建statement语句
	stm = conn.createStatement();
	sql = "select * from adduser";
	
	//使用executeQuery执行SQL查询语句
	ResultSet rs = stm.executeQuery(sql);
%>
<table width="740" border="1" cellspacing="0" cellpadding="6">
<tr>
	<td width="120" align="center" valign="middle">编号</td>
	<td width="145" align="center">姓名</td>
	<td width="253" align="center">密码</td>
</tr>
<%
//显示返回结果集
while(rs.next()) {
	int id = rs.getInt(1);
	String name = rs.getString(2);
	String pasw = rs.getString(3);
%>
<tr>
<td height="40" align="center" valign="middle"><%=id %></td>
<td align="center" valign="middle"><%=name %></td>
<td valign="middle"><%=pasw %></td>
</tr>
<%
}
rs.close();
stm.close();
%>
</table>
<%
}catch(Exception e) {
	out.println("出现SQL异常");
}finally {
	//关闭语句和数据库连接
	try {
		if(conn != null) {
			conn.close();
		}
	}catch(Exception e) {
		out.println("关闭数据库连接异常");
	}
}
%>
</body>
</html>