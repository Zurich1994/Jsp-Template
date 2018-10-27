<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>引用session方法</title>
</head>
<body>
<h2>session方法的第一个页面</h2>
<%
session.setAttribute("user1","sessionTest1");
session.setAttribute("user2","sessionTest2");
%>
<table border="1px">
<tr>
<td>session的建立时间</td>
<td><%=session.getCreationTime() %></td>
</tr>
<tr>
<td>session的标示符串</td>
<td><%=session.getId() %></td>
</tr>
<tr>
<td>session的最后被请求时间</td>
<td><%=session.getLastAccessedTime() %></td>
</tr>
<tr>
<td>session预计结束时间</td>
<td><%=session.getMaxInactiveInterval() %></td>
</tr>
<%
session.setMaxInactiveInterval(session.getMaxInactiveInterval()+100);
%>
<tr>
<td>session新的有效时间</td>
<td><%=session.getMaxInactiveInterval() %></td>
</tr>
<tr>
<td>是否为新建的session</td>
<td><%=session.isNew() %></td>
</tr>
<tr>
<td>session1对象取值</td>
<td><%=session.getAttribute("user1") %></td>
</tr>
<tr>
<td>session2对象取值</td>
<td><%=session.getAttribute("user2") %></td>
</tr>
</table>
</body>
<%
session.removeAttribute("user1");
//session.invalidate();
%>
<P><a href="sessionMethodInfo.jsp">转到下一页</a></P>
</html>