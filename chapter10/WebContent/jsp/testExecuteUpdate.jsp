<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新操作</title>
</head>
<body>
<%
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=testC";
String userName = "sa";
String password = "1";
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
	sql = "delete from student where 编号 = 2";
	
	//使用executeUpdate执行SQL更新语句
	int affectedRowCount = stm.executeUpdate(sql);
	out.println("删除影响的数据行数为："+affectedRowCount+"<br>");
	
	//使用executeUpdate执行SQL更新语句
	sql = "insert into student(姓名,地址,出生日期) values('小王','北京','1980-04-13')";
	affectedRowCount = stm.executeUpdate(sql);
	out.println("插入操作影响的行数为："+affectedRowCount+"<br>");
	
	sql = "update student set 地址 = '上海' where 编号=3";
	affectedRowCount = stm.executeUpdate(sql);
	out.println("修改操作影响的行数为："+affectedRowCount+"<br>");
	
	stm.close();
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