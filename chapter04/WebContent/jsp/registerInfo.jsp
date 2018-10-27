<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="page" class="com.TestBean"/>
<jsp:setProperty name="user" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册信息</title>
</head>
<body>
注册成功！
<br />
<br />
使用Bean属性方法：
<br />
用户名：<%=user.getUserName() %>
<br />
密码：<%=user.getPassword() %>
<br />
年龄：<%=user.getAge() %>
<br />
<hr />
使用getProperty：
<br />
用户名：<jsp:getProperty name="user" property="userName" />
<br />
密码：<jsp:getProperty name="user" property="password" />
<br />
年龄：<jsp:getProperty name="user" property="age" />
<br />
</body>
</html>