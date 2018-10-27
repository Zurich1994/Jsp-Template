<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>返回多个结果集</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String sql = request.getParameter("sqltest");
if(sql == null) {
%>
<form name="Example" method="post" action="">
<p>sql语句：<input type="text" name="sqltest" size="100" maxlength="100"></p>
<p><input type="submit" value="传送"></p>
<%
}else {
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=testC";
	String userName = "sa";
	String password = "1";
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}catch(Exception e) {
		out.println("加载驱动类时出现异常");
	}
	try {
		conn = DriverManager.getConnection(url, userName, password);
		//创建statement
		stmt = conn.createStatement();
		out.println("执行的SQL语句为："+sql+"<br>");
		//使用execute执行未知的sql语句
		boolean isResultSet = stmt.execute(sql);
		int count = 0;
		while(true) {
			count++;
			if(isResultSet) {
				ResultSet rs = stmt.getResultSet();
				out.println("返回的执行结果"+count+"为结果集<br>");
				while(rs.next()) {
					int f1 = rs.getInt(1);
					String f2 = rs.getString(2);
					String f3 = rs.getString(3);
					out.println(f1+" "+f2+" "+f3);
					out.println("<br>");
				}
				rs.close();
			}else {
				int affectedRowCount = stmt.getUpdateCount();
				if(affectedRowCount == -1) {
					break;
				}
				out.println("返回的执行结果"+count+"为更新计数<br>");
				out.println("更新计数为："+affectedRowCount+"<br>");
			}
			
			isResultSet = stmt.getMoreResults();
		}
		stmt.close();
	}catch(Exception e) {
		out.println("出现SQL异常");
	}finally {
		try{
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			out.println("关闭数据库连接时出现异常");
		}
	}
	
}
%>
</form>
</body>
</html>