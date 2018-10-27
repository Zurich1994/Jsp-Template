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
<title>简单设计(内容界面)</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/CSS/content.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
<script type="text/javascript" src="<%=path %>/JS/content.js"></script>
</head>
<body>
<%
   // 进行乱码处理
   request.setCharacterEncoding("utf-8") ;
%>
<%
    if(session.getAttribute("uname")!=null)
    {
       // 用户已登录
%>
<input type="hidden" id="path" value="<%=path %>">
<div class="leftDiv">
<h2>系统导航</h2>
<hr><br>
	<div class="messgesManageDiv" node="list_notes">
		<span>账户管理</span>
	</div>
	<div class="usersManageDiv" node="list_users">
		<span>用户管理</span>
	</div>
	<div class="quitDiv">
		<span>退出系统</span>
	</div>
</div>
<div class="rightDiv">
	<iframe id="iframe" class="iframe" src="<%=path %>/blank.jsp" frameborder="0"></iframe>
</div>
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
</body>
</html>