<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str = request.getParameter("submit");
if(str == null) {
	str = "";
}
if(str.equals("yes")) {
	response.setContentType("application/msword;charset=UTF-8");//设置输出数据的类型
}
%>
<%--
text/html:网页
text/plain:纯文本
application:x-msexcel:Excel文件
application:msword:Word文件
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>response对象实例</title>
</head>
<body>
<p>我正在学习response对象</p>
<p>将当前页保存为word文档吗？</p>
<form method="get" name="form">
<input type="submit" value="yes" name="submit">
</form>
</body>
</html>