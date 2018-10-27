<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重定向</title>
</head>
<body>
<form method="post" action="sendRedirect.jsp">
输入用户名：
<input type="text" name="name">
<input type="submit" value="login">
</form>
<%
String name = request.getParameter("name");
if(name != null) {
	response.sendRedirect("redirect.jsp?sendName="+name);
	System.out.println("重定向后的语句执行了！");
}
%>
</body>
</html>