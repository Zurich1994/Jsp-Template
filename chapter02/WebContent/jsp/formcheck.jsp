<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简单的表单验证</title>
<script language="javaScript">
function check() {
	if(document.form1.user.value.length == 0) {
		alert("请输入用户名");
		return false;
	}
	if(document.form1.email.value.indexOf("@")==-1 || document.form1.email.value.length == 0) {
		alert("请输入一个正确的email地址");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<form action="#" name="form1" onSubmit="return check()">
用户名：<input type="text" name="user" /><br/>
邮&nbsp;&nbsp;&nbsp;&nbsp;件：<input type="text" name="email" /><br/>
<input type="submit" name="button" value="提交">
</form>
</body>
</html>

