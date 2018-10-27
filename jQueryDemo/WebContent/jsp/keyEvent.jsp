<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>键盘事件</title>
<script type="text/javascript" src="../js/jQuery/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function() {
	$("body").keydown(function() {
		var e = e || window.event;
		var str = $("#div1Span").html();
		alert(e.keyCode);
		for(var i=48;e.keyCode>47 && e.keyCode<58;) {
			$("#div1Span").html(str+(e.keyCode - 48)+"-键盘码："+e.keyCode+"；<br/>");
			break;
		}
		for(var i=96;e.keyCode>95 && e.keyCode<106;) {
			$("#div1Span").html(str+"小键盘"+(e.keyCode - 96)+"-键盘码："+e.keyCode+"；<br/>");
			break;
		}
	});
		
	

});
</script>
<style type="text/css">
#div1 {
	position: relative;
	top: 20px;
	left: 20px;
	width: 200px;
	height: 200px;
	background-color: #999;
}

</style>
</head>
<body>
<div id="div1">
	<span id="div1Span"></span>
</div>
</body>
</html>