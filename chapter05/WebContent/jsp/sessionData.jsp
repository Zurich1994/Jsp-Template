<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>读取Session信息</title>
</head>
<body>
<%
String name = request.getParameter("name");
String sex = request.getParameter("sex");

session.setAttribute("name", name);
session.setAttribute("sex",sex);
%>
<a href="usingSession.jsp">显示已设置的Session数据对象</a>
</body>
</html>