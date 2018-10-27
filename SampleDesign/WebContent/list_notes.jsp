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
<title>简单设计(主界面)</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/CSS/list_notes.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
<script type="text/javascript" src="<%=path %>/JS/list_notes.js"></script>
</head>
<body style="background-color: rgb(164,259,228);overflow: hidden;">
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
   String keyword = request.getParameter("keyword") ;
   //out.println(keyword) ;
   if(keyword==null)
   {
    // 没有任何查询条件
    sql = "SELECT id,name,address,phone,datetime,money FROM rec" ;
   }
   else
   {
    // 有查询条件
    sql = "SELECT id,name,address,phone,datetime,money FROM rec " +
    	"WHERE name like ? or address like ? or phone like ? or datetime like ? or money like ?" ;
   }
  
   try
   {
    Class.forName(DBDRIVER) ;
    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
    pstmt = conn.prepareStatement(sql) ;
   
    // 如果存在查询内容则需要设置条件
    if(keyword!=null)
    {
     //存在查询条件
    	pstmt.setString(1,"%"+keyword+"%") ;
        pstmt.setString(2,"%"+keyword+"%") ;
        pstmt.setString(3,"%"+keyword+"%") ;
        pstmt.setString(4,"%"+keyword+"%") ;
        pstmt.setString(5,"%"+keyword+"%") ;
    }
    rs = pstmt.executeQuery() ;
%>
<div style="width: 400px;position: absolute;height: 100%;float: left;">
<div class="queryFormDiv" id="queryFormDiv">
<form action="list_notes.jsp" method="post">
   <span>请输入查询内容：</span>
   <input type="text" name="keyword">
   <input type="submit" value="查询" class="btn">
</form>
</div>
<!--<h3><a href="insert.jsp">添加新留言</a></h3>-->
<div class="listTableDiv" id="listTableDiv">
<table width="80%" class="tableStyle">
<thead>
<tr>
   <th style="border-left: 0px;">ID</th>
   <th>账户</th>
   <th>地址</th>
   <th>电话</th>
   <th>日期</th>
   <th>金额</th>
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
     String name = rs.getString(2) ;
     String address = rs.getString(3) ;
     String phone = rs.getString(4) ;
     String datetime  = rs.getDate(5).toLocaleString().split(" ")[0] ;
     String money  = rs.getDouble(6)+"" ;
    
     if(keyword!=null)
     {
      // 需要将数据返回
      name = name.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
      address = address.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
      phone = phone.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
      datetime = datetime.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
      money = money.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
     }
%>
     <tr>
      <td><%=id%></td>
      <td><%=name%></td>
      <td><%=address%></td>
      <td><%=phone%></td>
      <td><%=datetime %></td>
      <td><%=money %></td>
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
</div>

<div style="left: 420px;width: 350px;height: 90%;position: absolute;float: left;top: 54px;background-color: rgb(164,259,228);">
<iframe src="" frameborder="0" scrolling="no" id="rec_users_iframe" class="rec_users_iframe">
</iframe>
</div>

<div class="contentDiv hide" id="contentDiv">
	<h3>新增账户</h3>
	<hr /><br />
	<form id="contentForm" action="">
		<table align="center">
			<tr class="hide">
				<td>ID：</td>
				<td align="left"><input type="text" id="new_id" name="new_id" /></td>
			</tr>
			<tr>
				<td>账户：</td>
				<td align="left"><input type="text" id="new_name" name="new_name" /></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td align="left"><input type="text" id="new_address" name="new_address" /></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td align="left"><input type="text" id="new_phone" name="new_phone" /></td>
			</tr>
			<tr>
				<td>日期：</td>
				<td align="left"><input type="text" id="new_datetime" name="new_datetime" /></td>
			</tr>
			<tr>
				<td>金额：</td>
				<td align="left"><input type="text" id="new_money" name="new_money" /></td>
			</tr>
			<tr>
				<td colspan="2" style="height: 60px;">
					<input type="submit" class="btn" value="确定" />
					<input type="reset" class="btn" value="重置" />
					<input type="button" class="btn" id="cancel" value="取消" />
					
				</td>
			</tr>
		</table>
	</form>
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