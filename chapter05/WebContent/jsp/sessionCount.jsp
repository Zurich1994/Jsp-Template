<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! int Num = 0; %>
<%
if(session.isNew()) {//判断是否是一个新的用户
	Num += 1;
	session.setAttribute("Num",Num);
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计站点用户访问数目</title>
<center>
<font size = 5>session计数器</font>
</center>
<br>
<center>
<font color="blue">
您是第
</font>
<font color="red">
<%=session.getAttribute("Num") %>
</font>
<font color="blue">
位访问本站的用户！
</font>
</center>

</head>
<body>

</body>
</html>