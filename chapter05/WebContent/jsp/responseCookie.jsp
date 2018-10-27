<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.Cookie" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置Cookie对象</title>
<%
//通过request对象将cookie中的内容取出来
Cookie[] cookies = request.getCookies();
Cookie cookie_response = null;
if(cookies == null) {
	out.println("没有Cookie"+"<br />");
}else {
	try {
		if(cookies.length == 0) {
			System.out.println("客户端禁止写入Cookie");
		}else {
			for(int i = 0; i< cookies.length; i++) {
				Cookie temp = cookies[i];
				if(temp.getName().equals("cookietest")){
					cookie_response = temp;
					break;
				}
			}
		}
	}catch(Exception e) {
		System.out.println(e);
	}
}
out.println("当前时间为："+new Date().toLocaleString()+"<br />");
if(cookie_response != null) {
	out.println(cookie_response.getName()+"上一次的访问时间:"+cookie_response.getValue());
	cookie_response.setValue(new Date().toLocaleString().toString());
}else {
	out.println("第一次访问！");
	cookie_response = new Cookie("cookietest",new Date().toLocaleString());
	out.println("创建Cookie");
}

response.addCookie(cookie_response);
response.setContentType("text/html");
response.flushBuffer();
%>
</head>
<body>

</body>
</html>