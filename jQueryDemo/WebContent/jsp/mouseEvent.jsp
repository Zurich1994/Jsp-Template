<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>鼠标事件</title>
<script type="text/javascript" src="../js/jQuery/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function() {
	//$("#div1").click(function() {
	//	alert("div被单击！");
	//});	
	//$("#div1").dblclick(function() {
	//	alert("div被双击！");
	//});
	//$("#div1").mousedown(function() {
	//	var e = e || window.event;
	//	if(e.button == 1) {
	//		alert("鼠标左键按下！");
	//	}else if(e.button == 2) {
	//		alert("鼠标右键按下！");
	//	}
	//});
	//$("#div1").mouseup(function() {
	//	var e = e || window.event;
	//	if(e.button == 1) {
	//		alert("鼠标左键松开！");
	//	}else if(e.button == 2) {
	//		alert("鼠标右键松开！");
	//	}
	//});
	//$("#div1").mouseout(function() {
	//	alert("鼠标离开div1！");
	//});
	$("body").mousemove(function() {
		var e = e || window.event;
		var xx = e.clientX;
		var yy = e.clientY;
		$("#div1Span").text("鼠标处坐标为：x:"+xx+",y:"+yy);
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