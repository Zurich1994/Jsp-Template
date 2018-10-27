<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%
//request.getScheme();返回当前协议
	String path = request.getContextPath();//返回当前站点根路径
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户下的用户信息</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/CSS/list_notes.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
</head>
<body style="background: rgb(164,259,228);">
<%
    // 编码转换
    request.setCharacterEncoding("utf-8") ;
	
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
	   ResultSet rs    = null ;
%>
<%
   // 如果有内容，则修改变量i,如果没有，则根据i的值进行无内容提示
   int i = 0 ;
   String sql = null;
   String rec_user_id = request.getParameter("rec_user_id") ;
   System.out.println("由父页面传过来的参数："+rec_user_id);
   if(rec_user_id==null)
   {
    // 没有任何查询条件
   }
   else
   {
    // 有查询条件
    sql = "SELECT rec_users.id,rec_user_name,rec_user_age,rec_user_sex,name " +
    	  "FROM rec_users, rec " +
    	  "WHERE rec_users.rec_id = rec.id and rec.id = ?" ;
   }
  
   try
   {
    Class.forName(DBDRIVER) ;
    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
    pstmt = conn.prepareStatement(sql) ;
   
    // 如果存在查询内容则需要设置条件
    if(rec_user_id!=null)
    {
     //存在查询条件
    	pstmt.setInt(1,Integer.parseInt(rec_user_id)) ;
    }
    rs = pstmt.executeQuery() ;
    
%>
<div class="listTableDiv" id="listTableDiv">
<table width="80%" class="tableStyle">
<thead>
<tr>
   <th style="border-left: 0px;">ID</th>
   <th>用户名</th>
   <th>年龄</th>
   <th>性别</th>
   <th>归属账户</th>
</tr>
</thead>
<tbody>
<%
    while(rs.next())
    {
     i++ ;
     // 进行循环打印，打印出所有的内容，以表格形式
     // 从数据库中取出内容
     int id = rs.getInt(1) ;
     String user_name = rs.getString(2) ;
     String user_age = rs.getString(3) ;
     String user_sex = rs.getString(4) ;
     String rec_name = rs.getString(5) ;
    
%>
     <tr>
      <td><%=id%></td>
      <td><%=user_name%></td>
      <td><%=user_age%></td>
      <td><%=user_sex%></td>
      <td><%=rec_name %></td>
     </tr>
<%
    }
    // 判断i的值是否改变，如果改变，则表示有内容，反之无内容
    if(i==0)
    {
     // 进行提示
%>
     <tr>
      <td colspan="6">没有任何内容！！！</td>
     </tr>
<%
    }
%>
</tbody>
</table>
</div>

<%
    rs.close() ;
    pstmt.close() ;
    conn.close() ;
   }
   catch(Exception e)
   {}
%>
<div class="operBtnDiv" id="operBtnDiv">
	<input type="button" id="insertBtn" value="添加" class="btn" />
	<input type="button" id="updateBtn" value="修改" class="btn" />
	<input type="button" id="deleteBtn" value="删除" class="btn" />
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