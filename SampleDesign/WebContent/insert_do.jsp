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
<title>插入操作</title>
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
%>
<%
   // 声明一个int变量，用于保存用户是否合法状态
int flag = 0 ;
try {
    // 接收参数
    String name = request.getParameter("new_name") ;
    String address = request.getParameter("new_address");
    String phone = request.getParameter("new_phone") ;
    String datetime = request.getParameter("new_datetime") ;
    String money = request.getParameter("new_money") ;
%>
<%
   String insert_sql = "INSERT INTO rec VALUES(?,?,?,?,?)" ;
   try
   {
    Class.forName(DBDRIVER) ;
    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
    pstmt = conn.prepareStatement(insert_sql) ;
    pstmt.setString(1,name) ;
    pstmt.setString(2,address) ;
    pstmt.setString(3,phone) ;
    pstmt.setString(4,datetime) ;
    pstmt.setString(5,money) ;
    pstmt.executeUpdate() ;
    // 如果插入成功，则肯定能执行到此段代码
    flag = 1 ;
   }
   catch(Exception e)
   {
	   e.printStackTrace();
	   flag = 2;
   }
	pstmt.close() ;
	conn.close() ;
}catch(Exception e) {
	e.printStackTrace();
	flag = 3;
}
%>
<div style="position: absolute;top: 30%;left: 40%;font-size: 20px;">
<%
	response.setHeader("refresh","2;URL=list_notes.jsp") ;
    if(flag == 1){
%>
    账户增加成功，两秒后跳转到账户列表！！！<br>
    如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
<%
   }else if(flag == 2){
%>
    账户增加失败，两秒后跳转到账户列表！！！<br>
    如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
<%
   }else {
%>
    账户增加失败，两秒后跳转到账户列表！！！<br>
    如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
<%
   }
%>
</div>
</body>
</html>