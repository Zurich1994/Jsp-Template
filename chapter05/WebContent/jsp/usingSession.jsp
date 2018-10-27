<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示session信息</title>
</head>
<body>
<%
Object id = session.getAttribute("name");
Object sex = session.getAttribute("sex");

if(id != null) {
	out.println("姓名："+id.toString());
	out.println("<br />");
	out.println("性别："+sex.toString());
}else {
	out.println("无设置session对象");
}
%>

</body>
</html>