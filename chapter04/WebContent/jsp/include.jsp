<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>include指令实例</title>
</head>
<body>
<%--
	include用来包含一个静态文件
	语法格式：
	<%@ include file = "url" %>
 --%>
<p>插入html文件：<%@ include file="include_html.html" %></p>
<p>插入文本文件：<%@ include file="include_txt.txt" %></p>
<p>插入JSP文件：显示当前时间：<%@ include file="include_JSP.jsp" %></p>
<p>插入JSP代码：<%@ include file="include_code.code" %></p>
</body>
</html>