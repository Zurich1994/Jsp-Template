<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关系选择器</title>
<script type="text/javascript" src="../js/jQuery/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function() {
	$("form div").css("font-size","24px");
	$("form > div").css("border","5px solid red");
	$("label + input").css("backgroundColor","yellow");
	$("form ~ input").css("backgroundColor","red");
});
</script>
<style type="text/css">
#div1 {
	position: relative;
	top: 20px;
	left: 20px;
	width: 200px;
	height: 200px;
}
#div11 {
	position: absolute;
	top:20px;
	left: 20px;
	width: 80px;
	height: 80px;
	background-color: #999;
}
#div2 {
	position: relative;
	top: 60px;
	left: 20px;
	width: 200px;
	height: 200px;
}
#div3 {
	position: relative;
	top: 80px;
	left: 20px;
	width: 200px;
	height: 200px;
}
#formDownText {
	position: relative;
	top:120px;
}
</style>
</head>
<body>
<form>
	<div id="div1">
		div1
		<div id="div11">
			div11
		</div>
	</div>
	<div id="div2">
		div2
	</div>
	<div id="div3">
	<label>text文本框1：</label>
	<input type="text"/><br><br>
	<input type="text"/>
	<br>
	<label>text文本框2：</label>
	<input type="text"/><br><br>
	<input type="text"/>
	</div>
	
</form>
<input type="text" id="formDownText"/>
</body>
</html>