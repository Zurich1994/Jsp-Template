<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>演示out对象缓冲区的操作</title>
</head>
<body>
<%
	out.println("JSP程序设计<br>");
out.clearBuffer();//将缓冲区中的数据清除
out.println("清华大学出版社<br>");
out.flush();//先将数据写到客户端，再清除数据
out.println("康牧编著<br>");
out.println("===================<br>");
out.println("剩余缓冲区的大小："+out.getRemaining()+"bytes<br>");
out.println("预设缓冲区的大小："+out.getBufferSize()+"bytes<br>");
out.println("AutoFlush:"+out.isAutoFlush());//是否自动刷新缓冲区
out.close();//关闭输出流，终止输出
out.println("hello");
%>
</body>
</html>