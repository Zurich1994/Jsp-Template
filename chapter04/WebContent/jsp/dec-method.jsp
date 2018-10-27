<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>方法的声明</title>
</head>
<body>
<p>请输入圆的半径</p>
<form action="dec-method.jsp" method="get" name="form">
	<input type="text" name="radius">
	<input type="submit" value="计算">
</form>
<%! 
double area(double r) {
	return Math.PI * r * r;
} 
double perimeter(double r) {
	return Math.PI * 2 * r;
}
%>

<%
String str = request.getParameter("radius");
if(str != null) {
	try {
		double r;
		r = Double.parseDouble(str);
%>
<p>圆的面积是：<%=area(r) %></p>
<p>圆的周长是：<%=perimeter(r) %></p>
<%
	}catch(Exception e) {
		out.println(e.getMessage());
	}
}
%>
</body>
</html>