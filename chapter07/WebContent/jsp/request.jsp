<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request类型的生命周期</title>
</head>
<body>
<jsp:useBean id="count" scope="request" class="jsp.test.Counter"></jsp:useBean>
<font color="red">request.jsp</font><br>
您是request.jsp页面的第<font color="blue">
<jsp:getProperty property="counter" name="count"/>
</font>位参观者<br>
<%
	out.println("这是request.jsp网页的计数器！");
%>
</body>
</html>