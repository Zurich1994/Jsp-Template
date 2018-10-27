<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容过滤器</title>
<script type="text/javascript" src="../js/jQuery/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function() {
	//$("ul :empty").text("空的li");
	$("div li:parent").css("background","#999");
	$("h2:contains(content)").css("color","red");
	$("p:has(span)").css("color","green");
});
</script>
<style type="text/css">
#div {
	position: relative;
	top: 220px;
	left: 220px;
	width: 400px;
	height: 400px;
}

</style>
</head>
<body>
<ul>
	<li>1</li>
	<li>2</li>
	<li></li>
	<li>4</li>
	<li>5</li>
	<li></li>
</ul>
<div>
	<ul>
		<li>11</li>
		<li>22</li>
		<li></li>
		<li>44</li>
		<li></li>
	</ul>
</div>
<h2>h2中内容包括content</h2>
<h2>h2中包括内容</h2>
<p>p段落符号</p>
<p><span>span包含在P中</span></p>
</body>
</html>