<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>子元素选择器</title>
<script type="text/javascript" src="../js/jQuery/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function() {
	$("ul li").css("font-size","48px");
	$("ul li:nth-child(3)").css("font-size","24px");
	$("ul li:first-child").css("color","red");
	$("ul li:last-child").css("color","blue");
	$("ul li:nth-child(2n)").css("backgroundColor","#999");
	$("ul li:nth-child(2n-1)").css("backgroundColor","#666");
//	$("ul li:only-child").css("backgroundColor","#333");
});
</script>

</head>
<body>
<ul>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>5</li>
	<li>6</li>
	<li>7</li>
	<li>8</li>
	<li>9</li>
	<li>10</li>
</ul>
<br>
<ul>
	<li>11</li>
</ul>
</body>
</html>