<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
</head>
<body>
兴趣：
<%
String[] hobby = request.getParameterValues("Habit");
if(hobby != null) {
	for(int i = 0;i<hobby.length;i++) {
		if(hobby[i].equals("Read")) {
			out.print("看书 ");
		}
		if(hobby[i].equals("Football")) {
			out.print("足球 ");
		}
		if(hobby[i].equals("Travel")) {
			out.print("旅游 ");
		}
		if(hobby[i].equals("Music")) {
			out.print("听音乐 ");
		}
		if(hobby[i].equals("TV")) {
			out.print("看电视 ");
		}
	}
}
%>
</body>
</html>