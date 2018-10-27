<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除操作</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
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
<%!
    String DBDRIVER    = "com.microsoft.sqlserver.jdbc.SQLServerDriver" ;
String DBURL    = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=sd" ;
String DBUSER    = "sa" ;
String DBPASSWORD   = "alone007" ;
	Connection conn    = null ;
	PreparedStatement pstmt = null ;
%>
<%
   // 声明一个boolean变量，用于保存用户是否合法状态
   boolean flag = false ;
    
    int id = 0 ;
    try
    {
    	// 接收参数
       id = Integer.parseInt(request.getParameter("new_id")) ;
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
%>
<%
   // 更新note表中的数据
   String sql = "DELETE from rec  WHERE id=?" ;
   try
   {
    Class.forName(DBDRIVER) ;
    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
    pstmt = conn.prepareStatement(sql) ;
    pstmt.setInt(1,id) ;
    pstmt.executeUpdate() ;
    pstmt.close() ;
    conn.close() ;
    // 如果修改成功，则肯定能执行到此段代码
    flag = true ;
   }
   catch(Exception e)
   {}
    %>
<div style="position: absolute;top: 30%;left: 40%;font-size: 20px;">
    <%
       response.setHeader("refresh","2;URL=list_notes.jsp") ;
       if(flag)
       {
    %>
        账户删除成功，两秒后跳转到账户列表！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
    <%
       }
       else
       {
    %>
        账户删除失败，两秒后跳转到账户列表！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
    <%
       }
    %>
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