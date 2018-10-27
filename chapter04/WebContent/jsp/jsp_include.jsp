<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>include静态包含文件</title>
</head>
<body>
<%@ include file = "static.html" %>
<%
//静态包含只是把文件包含进来
%>
<a href="action.jsp">goto two --></a>
<br />
<!-- 超级连接到action.jsp文件和动态包含该文件 显示是不同的 -->
this examples show include works.
<br />
<!-- 动态包含文件 并传递参数 -->
<jsp:include page="action.jsp" flush="true">
	<jsp:param name="a1" value="<%=request.getParameter("name") %>"/>
	<jsp:param name="a2" value="<%=request.getParameter("password") %>"/>
</jsp:include>
<%-- 
	<jsp:include>和<% include %>区别
	前者是在两个页面的代码运行完之后，再将被包含的页面运行后的代码放到包含的页面中，也就是说该动作时在运行时包含的，
	并且还可以将传递参数给被包含的页面
	后者只是将其他页面的代码加到一个页面中，相当于复制，是静态的。
--%>
</body>
</html>