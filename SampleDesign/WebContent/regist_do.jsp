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
<title>注册新用户</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
</head>
<body>
<%
    // 编码转换
    request.setCharacterEncoding("utf-8") ;
%>
<%!
   String DBDRIVER    = "com.microsoft.sqlserver.jdbc.SQLServerDriver" ;
   String DBURL    = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=sd" ;
   String DBUSER    = "sa" ;
   String DBPASSWORD   = "alone007" ;
   Connection conn    = null ;
   PreparedStatement pstmt = null ;
   ResultSet rs    = null ;
%>
<%
   // 声明一个int变量，用于保存用户是否合法状态
   	int flag = 0 ;
    // 接收参数
    String code = request.getParameter("new_code") ;
    String name = request.getParameter("new_name");
    String password = request.getParameter("new_password") ;
%>
<%
   String sql = "SELECT name FROM person WHERE code=?" ;
   try
   {
    Class.forName(DBDRIVER) ;
    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
    pstmt = conn.prepareStatement(sql) ;
    pstmt.setString(1,code) ;
    rs = pstmt.executeQuery() ;
    if(rs.next())
    {
	     // 用户代码存在
	     flag = 1 ;
	     request.setAttribute("err","用户名已存在！！！") ;
    }
    else
    {
     	// 代码不存在
		   String insert_sql = "INSERT INTO person VALUES(?,?,?)" ;
		   try
		   {
		    Class.forName(DBDRIVER) ;
		    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
		    pstmt = conn.prepareStatement(insert_sql) ;
		    pstmt.setString(1,code) ;
		    pstmt.setString(2,name) ;
		    pstmt.setString(3,password) ;
		    pstmt.executeUpdate() ;
		    // 如果插入成功，则肯定能执行到此段代码
		    flag = 2 ;
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
			   flag = 3;
		   }
    }
    rs.close() ;
    pstmt.close() ;
    conn.close() ;
   }
   catch(Exception e)
   {}
%>
<div style="position: absolute;top: 30%;left: 40%;font-size: 20px;">
<%
	response.setHeader("refresh","2;URL=login.jsp") ;
    if(flag==1){
%>
    用户代码已存在，两秒后跳转到登录界面！！！<br>
    如果没有跳转，请按<a href="login.jsp">这里</a>！！！
<%
   }else if(flag == 2){
%>
    用户注册成功，两秒后跳转到登录界面！！！<br>
    如果没有跳转，请按<a href="login.jsp">这里</a>！！！
<%
   }else if(flag == 3){
%>
    用户注册失败，两秒后跳转到登录界面！！！<br>
    如果没有跳转，请按<a href="login.jsp">这里</a>！！！
<%
   }
%>
</div>
</body>
</html>