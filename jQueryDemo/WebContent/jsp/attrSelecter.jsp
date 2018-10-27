<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>属性选择器</title>
<script type="text/javascript" src="../js/jQuery/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function() {
	$("div[id]").css("border","3px solid red");		
	//$("input[name='text']").val("text");
	$("input[name!='text']").val("noText");	
	//$("input[name^='text']").val("text开始");	
	$("input[name$='text']").val("text结尾");	
	$("input[name*='text']").css("background","yellow");	

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

.div2 {
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

</style>
</head>
<body>
<form>
	<div id="div1">
		div1<br>
		<input type="text" name="text1"/><br><br>
		<input type="text" name="text"/><br><br>
		<input type="text" name="text2"/><br><br>
		<input type="text" name="3text"/>
	</div>
	<div class="div2">
		div2<br>
		<input type="text" name="noName"/><br><br>
		<input type="text" name="4text"/><br><br>
		<input type="text" name="text5"/><br><br>
		<input type="text" name="6text"/>
	</div>
	<div id="div3">
		<input type="text"/><br><br>
		<input type="text"/><br><br>
		<input type="text"/><br><br>
		<input type="text"/>
	</div>
	
</form>
</body>
</html>