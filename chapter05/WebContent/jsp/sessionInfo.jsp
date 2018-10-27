<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>输入用户信息</title>
</head>
<body>
<%--
发生其一，session中的数据被清除
1、关闭当前正在使用的额浏览器程序
2、关闭网页服务器
3、超出tomcat预设时间，一般是30分钟
4、运行程序结束session
 --%>
<form action="sessionData.jsp" method="post">
<table>
<tr>
	<td>输入用户名：</td>
	<td><input type="text" name="name"></td>
</tr>
<tr>
	<td>输入性别：</td>
	<td><input type="text" name="sex"></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="提交"></td>
</tr>
</table>
</form>
</body>
</html>