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
<title>简单设计(底部界面)</title>
<link href="<%=path %>/CSS/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/JS/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path %>/JS/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//设置当前时间
	setCurrentTime();
});
//设置当前时间
function setCurrentTime(){
	var now = new Date();
	var hours = now.getHours();
	var minutes = now.getMinutes();
	var seconds = now.getSeconds();
	var timeValue = "当前时间："+now.getFullYear()+"年"+(now.getMonth()+1)+"月"+now.getDate()+"日   " ;
	timeValue += ((hours < 10) ? "0" : "") + hours;
	timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
	timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
	$("#currentTimeSpan").html(timeValue);
	setTimeout("setCurrentTime()",1000);
}
</script>
</head>
<body>
<center>
<%
	String uname = (String)session.getAttribute("uname");
%>
<div style="margin-top: 8px;">
<span>操作员：<%=uname %></span>
<span id="currentTimeSpan"></span>
</div>
</center>
</body>
</html>