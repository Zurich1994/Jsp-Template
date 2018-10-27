<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>使用Request对象</title>
</head>
<body>
<h1>您刚才输入的内容是：</h1>
<%
Enumeration enu = request.getParameterNames();
while(enu.hasMoreElements()) {
	String parameterName = (String)enu.nextElement();
	String paramaterValue = (String)request.getParameter(parameterName);
	out.print("参数名称："+parameterName+"<br />");
	out.print("参数内容："+paramaterValue+"<br />");
}
%>
</body>
</html>