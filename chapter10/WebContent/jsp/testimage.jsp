<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试图片</title>
</head>
<body>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=testC";
String user = "sa";
String password = "1";
String filename = request.getParameter("image");
File file = new File(filename);
try {
	FileInputStream fin = new FileInputStream(file);
	ByteBuffer nbf = ByteBuffer.allocate((int)file.length());
	byte[] array = new byte[1024];
	int offset = 0;
	int length = 0;
	while((length=fin.read(array))>0) {
		if(length != 1024) {
			nbf.put(array, 0 , length);
		}else {
			nbf.put(array);
		}
		offset += length;
	}
	byte[] content = nbf.array();
	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	String sqlstr = "select * from bindata where filename='01'";
	ResultSet rs = stmt.executeQuery(sqlstr);
	if(rs.next()) {
		rs.updateBytes(2,content);
		rs.updateRow();
	}else {
		rs.moveToInsertRow();
		rs.updateString(1,"01");
		rs.updateBytes(2,content);
		rs.insertRow();
	}
	rs.close();
	fin.close();
	out.println("恭喜，已经将新的记录成功添加到数据库");
}catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>