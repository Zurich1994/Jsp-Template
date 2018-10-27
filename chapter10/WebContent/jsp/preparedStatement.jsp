<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>可传参的sql语句</title>
</head>
<body>
<%
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=tableDemo";
String userName = "sa";
String password = "";
Connection conn = null;
Statement stmt = null;
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}catch(Exception e) {
	out.println("加载数据库驱动类时出现异常");
}
try {
	conn = DriverManager.getConnection(url, userName, password);
	
	PreparedStatement pstmtDelete = conn.prepareStatement("delete from student where id = ?");
	PreparedStatement pstmtInsert = conn.prepareStatement("insert into student(id,name,address,birthday) values(?,?,?,?)");
	PreparedStatement pstmtSelect = conn.prepareStatement("select * from student where id = ? order by id");
	
	pstmtSelect.setInt(1,3);
	
	for(int i=0;i<4;i++) {
		pstmtDelete.setInt(1,i);
		
		pstmtInsert.setInt(1,i);
		pstmtInsert.setString(2,"name"+i);
		pstmtInsert.setString(3,"city"+i);
		pstmtInsert.setString(4,new Date(85,12,i).toString());
		
		pstmtDelete.executeUpdate();
		
		pstmtInsert.executeUpdate();
		ResultSet rs = pstmtSelect.executeQuery();
		
		out.println("第"+(i+1)+"次循环后的结果集为：<br>");
		
		while(rs.next()) {
			int stuId = rs.getInt(1);
			String stuName = rs.getString(2);
			String stuAdd = rs.getString(3);
			String stuBirthday = rs.getString(4);
			
			out.println(stuId+" "+stuName+" "+stuAdd+" "+stuBirthday+"<br>");
		}
	}
	
	pstmtDelete.close();
	pstmtInsert.close();
	pstmtSelect.close();
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