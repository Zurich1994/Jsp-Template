<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>page类型的生命周期</title>
</head>
<body>
<jsp:useBean id="count" scope="page" class="jsp.test.Counter" />
<font color="red">
演示
</font><br><br>
您是本站第
<font color="blue">
<jsp:getProperty name="count" property="counter" />
</font>位参观者
</body>
</html>