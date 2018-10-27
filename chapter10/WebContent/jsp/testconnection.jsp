<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试连接</title>
</head>
<body>
<%
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=tableDemo";
String userName = "sa";
String password = "";
Connection conn = null;
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
}catch(Exception e) {
	out.println(e+"加载驱动器类时出现异常"+"<br>");
}
try {
	conn = null;
	conn = DriverManager.getConnection(url, userName, password);
}catch(Exception e) {
	out.println(e+"连接数据库的过程中出现SQL异常"+"<br>");
}
if(conn == null) {
	out.println("连接数据库失败");
}else {
	out.println("连接数据库成功");
}
try {
	conn.close();
}catch(Exception e) {
	out.println(e+"关闭数据库连接时出现SQL异常"+"<br>");
}
%>
</body>
</html>