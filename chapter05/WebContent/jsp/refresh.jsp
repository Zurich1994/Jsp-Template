<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>页面自动刷新</title>
</head>
<body>
<%
out.println(new Date().toLocaleString());
response.setHeader("refresh","1");
//response.setHeader("refresh","5;URL=http://www.163.com");//5秒后跳转
%>
</body>
</html>