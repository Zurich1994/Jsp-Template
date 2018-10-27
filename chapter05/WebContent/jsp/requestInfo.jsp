<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>使用Request对象</title>
</head>
<body>
<form action="showInfo.jsp" method="post" name="form1">
<p align="center">用户名：<input type="text" name="username"/></p>
<p align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"/></p>
<p align="center"><input type="submit" name="Submit" value="提交">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="cancel" value="取消"></p>
</form>
</body>
</html>