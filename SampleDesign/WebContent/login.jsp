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
<title>简单设计(登录)</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/CSS/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
<script type="text/javascript" src="<%=path %>/JS/login.js"></script>
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
   String create_db_sql = " if not exists(select * from sys.databases where name = 'sd') create database sd;" ;
   String create_tb_sql = " if exists(select * from sys.databases where name = 'sd') use sd; " +
   						  " if not Exists(Select 1 From sysObjects Where Name ='person' And Type In ('S','U'))" +
   						  " CREATE TABLE person( " +
   						  " [id] [int] IDENTITY(1,1) NOT NULL, " +
						  " [code] [varchar](20) NOT NULL,  " +
						  " [name] [varchar](20) NOT NULL,  " +
						  " [password] [varchar](20) NOT NULL, " +
					 	  " CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED " +
						  " ( " +
						  " 	[id] ASC  " +
						  " )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] " +
   						  " ) ON [PRIMARY] " +
   						  " if not Exists(Select 1 From sysObjects Where Name ='rec' And Type In ('S','U'))" +
   						  " CREATE TABLE rec( "+
						  " [id] [int] IDENTITY(1,1) NOT NULL, "+
						  " [name] [varchar](20) NULL, "+
						  " [address] [varchar](50) NULL, "+
						  " [phone] [varchar](20) NULL, "+
						  " [datetime] [datetime] NULL, "+
						  " [money] [money] NULL, "+
						  " CONSTRAINT [PK_rec] PRIMARY KEY CLUSTERED  "+
						  " ( "+
						  " [id] ASC "+
						  " )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] "+
						  " ) ON [PRIMARY]" + 
						  " if not Exists(Select 1 From sysObjects Where Name ='rec_users' And Type In ('S','U'))" +
   						  " CREATE TABLE rec_users( "+
						  " [id] [int] IDENTITY(1,1) NOT NULL, "+
						  " [rec_user_name] [varchar](50) NULL, "+
						  " [rec_user_age] [int] NULL, "+
						  " [rec_user_sex] [varchar](4) NULL, "+
						  " [rec_id] [int] NOT NULL, "+
						  " CONSTRAINT [PK_rec_users] PRIMARY KEY CLUSTERED   "+
						  " ( "+
						  " [id] ASC "+
						  " )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] "+
						  " ) ON [PRIMARY]";
   try
   {
    Class.forName(DBDRIVER) ;
    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
    pstmt = conn.prepareStatement(create_db_sql) ;//建数据库
    pstmt.executeUpdate() ;
    // 如果创建成功，则肯定能执行到此段代码
    pstmt = conn.prepareStatement(create_tb_sql);
    pstmt.executeUpdate() ;
   }
   catch(Exception e)
   {
	   e.printStackTrace();
   }
	pstmt.close() ;
	conn.close() ;
%>

<%
	session.setAttribute("uname",null) ;
%>
	<center>
		<h1>应收帐管理范例 —— JSP + JDBC实现</h1>
		<hr>
		<br>
		<%
		   // 判断是否有错误信息，如果有则打印
		   // 如果没有此段代码，则显示时会直接打印null
		   if(request.getAttribute("err")!=null)
		   {
		%>
		       <h2><%=request.getAttribute("err")%></h2>
		    <%
		    }
		    %>
		<form action="login_conf.jsp" method="post">
			<div class="loginDiv" id="loginDiv" style="text-align: center;">
				<table>
					<tr>
					   <td colspan="2">用户登陆</td>
					</tr>
					<tr>
					   <td align="right">用户名：</td>
					   <td align="left"><input type="text" name="code" style="width: 120px;"></td>
					</tr>
					<tr>
					   <td align="right">密&nbsp;&nbsp;码：</td>
					   <td align="left"><input type="password" name="password"  style="width: 120px;"></td>
					</tr>
					<tr>
					   <td colspan="2">
					    <input type="submit" value="登陆" class="btn" style="margin-left: 35px;">
					    <input type="reset" value="重置" class="btn">
					    <span class="registSpan" id="regist"><u>注册</u></span>
					   </td>
					</tr>
				</table>
			</div>
		</form>
		
		<%-- 注册用户 --%>
		<div class="registDiv" id="registDiv">
			<form action="regist_do.jsp" method="post">
				<div class="registFormDiv" id="registFormDiv">
					<table>
						<tr>
						   <td colspan="2" align="right"><span class="return" id="return"><u>返回</u></span></td>
						</tr>
						<tr>
						   <td colspan="2" align="center">用户注册</td>
						</tr>
						<tr>
						   <td align="right">用户名：</td>
						   <td align="left"><input type="text" name="new_code" style="width: 100px;"></td>
						</tr>
						<tr>
						   <td align="right">姓&nbsp;&nbsp;名：</td>
						   <td align="left"><input type="text" name="new_name" style="width: 100px;"></td>
						</tr>
						<tr>
						   <td align="right">密&nbsp;&nbsp;码：</td>
						   <td align="left"><input type="password" name="new_password" style="width: 100px;"></td>
						</tr>
						<tr>
						   <td colspan="2" align="center">
						    <input type="submit" value="注册" class="btn">
						    <input type="reset" value="重置" class="btn">
						   </td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</center>
</body>
</html>