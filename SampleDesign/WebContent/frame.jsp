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
<title>简单设计(frame)</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
<script type="text/javascript" src="<%=path %>/JS/frame.js"></script>
</head>
<%
   // 进行乱码处理
   request.setCharacterEncoding("utf-8") ;
%>
<%
    if(session.getAttribute("uname")!=null)
    {
       // 用户已登录
%>
<frameset rows="*,40px" cols="*" framespacing="0" frameborder="no" border="false">
	<frame name="content" src="<%=path%>/content.jsp" scrolling="no" marginwidth="0" marginheight="0" noresize="noresize">
    <frame name="footer" src="<%=path%>/footer.jsp" scrolling="no" marginwidth="0" marginheight="0" noresize="noresize">
</frameset>
<%
       }
    else
    {
       // 用户未登录，提示用户登录，并跳转
      // response.setHeader("refresh","2;URL=login.jsp") ;
    %>
    <body>
    <h1 style="text-align: center;">
       请您先登录！！！<br>
       <!-- 两秒后自动跳转到登录窗口！！！<br>
       如果没有跳转， -->请按<span style="color: #DD3366;cursor: pointer;" onclick="login();"><u>这里</u></span>！！！<br>
       </h1>
       </body>
    <%
    }
    %>
</html>