<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简单设计(成功跳转)</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/CSS/login_success.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
<script type="text/javascript" src="<%=path %>/JS/login_success.js"></script>
</head>
<body>
<div style="position: absolute;top: 30%;left: 40%;font-size: 20px;">
<%
    if(session.getAttribute("uname")!=null)
    {
       // 用户已登录
       // 用户未登录，提示用户登录，并跳转
       response.setHeader("refresh","2;URL=frame.jsp") ;
%>
       登录成功，欢迎<font color="red"><%=session.getAttribute("uname")%></font>光临！！！<br >
       两秒后自动跳转进入应收帐管理页面！！！<br>
       如果没有跳转，请按<a href ="frame.jsp">进入应收帐管理页面</a>
<%
    }
    else
    {
       // 用户未登录，提示用户登录，并跳转
      // response.setHeader("refresh","2;URL=login.jsp") ;
    %>
    <h1 style="text-align: center;">
       请您先登录！！！<br>
       <!-- 两秒后自动跳转到登录窗口！！！<br>
       如果没有跳转， -->请按<span style="color: #DD3366;cursor: pointer;" onclick="login();"><u>这里</u></span>！！！<br>
       </h1>
    <%
    }
%>
</div>
</body>
</html>