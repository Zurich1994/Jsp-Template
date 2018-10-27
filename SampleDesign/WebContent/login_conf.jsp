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
<title>简单设计(验证登录)</title>
</head>
<body>
	<center>
		<h1>应收帐管理范例 —— JSP + JDBC实现</h1>
		<hr>
		<br>
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
		   // 声明一个boolean变量，用于保存用户是否合法状态
		   boolean flag = false ;
		    // 接收参数
		    String code = request.getParameter("code") ;
		    String password = request.getParameter("password") ;
		%>
		<%
		   String sql = "SELECT name FROM person WHERE code=? and password=?" ;
		   try
		   {
		    Class.forName(DBDRIVER) ;
		    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
		    pstmt = conn.prepareStatement(sql) ;
		    pstmt.setString(1,code) ;
		    pstmt.setString(2,password) ;
		    rs = pstmt.executeQuery() ;
		    if(rs.next())
		    {
		     // 用户合法
		     flag = true ;
		     // 将用户名保存在session之中
		     session.setAttribute("uname",rs.getString(1)) ;
		    }
		    else
		    {
		     // 保存错误信息
		     request.setAttribute("err","错误的用户名及密码！！！") ;
		    }
		    rs.close() ;
		    pstmt.close() ;
		    conn.close() ;
		   }
		   catch(Exception e)
		   {}
		%>
		<%
		    // 跳转
		    if(flag)
		    {
		       // 用户合法
		%>
		       <jsp:forward page="login_success.jsp"/>
		<%
		    }
		    else
		    {
		       //用户非法
		%>
		       <jsp:forward page="login.jsp"/>
		<%
		    }
		%> 
	</center>   
</body>
</html>