<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>第一个JSP程序</title>
</head>
<body>
<%! int number = 1; %>
<%! public int count() {
	return number++;
} %>

<%
	out.println("Hello JSP!");
	out.println("欢迎使用JSP交互式动态网页！");
%>
<br />
<%="您是第"+count()+"位客人" %>
<br />
</body>
</html>