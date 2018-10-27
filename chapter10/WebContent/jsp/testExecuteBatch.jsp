<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批处理SQL语句</title>
</head>
<body>
<%
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=testC";
String userName = "sa";
String password = "1";
Connection conn = null;
Statement stmt = null;
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}catch(Exception e) {
	out.println("加载数据库驱动类时出现异常");
}
try {
	conn = DriverManager.getConnection(url, userName, password);
	
	stmt = conn.createStatement();
	
	stmt.addBatch("delete from student where id = 1");
	stmt.addBatch("insert into student values(4,'赵六','上海','1986-10-12')");
	stmt.addBatch(" use testC");
	
	stmt.addBatch("drop table test_table");
	
	stmt.addBatch("create table test_table (clumn1 char(10), clumn2 char(20))");
	
	int[] affectedRowCounts = stmt.executeBatch();
	
	for(int i=0;i<affectedRowCounts.length;i++) {
		out.println("第"+(i+1)+"个更新语句影响的数据行数为："+affectedRowCounts[i]+"<br>");
	}
	stmt.close();
}catch(Exception e) {
	out.println("出现SQL异常"+"<br>" + e);
}finally {
	try {
		if(conn != null) {
			conn.close();
		}
	}catch(Exception e) {
		out.println("关闭数据库连接时出现异常");
	}
}
%>
</body>
</html>