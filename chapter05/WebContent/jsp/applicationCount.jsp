<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
int Num = 0;
String strNum = (String)application.getAttribute("Num");

if(strNum != null) {
	Num = Integer.parseInt(strNum)+1;
}
application.setAttribute("Num",String.valueOf(Num));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>application统计站点访问数目</title>
</head>
<body>
<center>
<font size=5>application对象实例</font>
</center>
<hr>
<%=application.getRealPath("application.jsp") %>
<br>
<br>
<font color="blue">
您已经访问页面
</font>
<font color="red">
<%=Num %>
</font>
<font color="blue">
次
</font>
</body>
</html>