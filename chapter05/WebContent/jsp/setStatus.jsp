<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>I设置响应的状态</title>
</head>
<body bgColor="cyan">
<font size=3>
<%--
3位数字的状态码，主要分为5类
1**：主要是实验性质的；
2**：请求成功；
3**：在请求之前采取进一步的行动
4**：浏览器无法满足请求时，返回状态码
5**：服务器出现问题

常见的状态码：
200：请求成功；
404：请求资源不可用
500：服务器内部错误，不能服务
 --%>
<p>
单击下面的链接<br />
<a href="status1.jsp">状态行请求超时</a>
<a href="status2.jsp">状态行请求成功</a>
<a href="status3.jsp">状态表示服务器内部错</a>
</p>
</font>
</body>
</html>