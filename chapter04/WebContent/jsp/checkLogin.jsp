<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆检查</title>
</head>
<body>
<%
String name = request.getParameter("name");
String password = request.getParameter("password");
if(name.equals("hellking") && password.equals("12345")) {
	%>
<jsp:forward page="success.jsp">
	<jsp:param name="user" value="<%=name %>" />
</jsp:forward>
	<%
}else {
	%>
	<jsp:forward page="login.jsp">
		<jsp:param name="user" value="<%=name %>"/>
	</jsp:forward>
	<%
}
%>
</body>
</html>