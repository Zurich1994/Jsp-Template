<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>定位过滤器</title>
<script type="text/javascript" src="../js/jQuery/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function() {
	$("tr :first").css("font-size","28px");
	$("tr :eq(0)").css("backgroundColor","#999");
	$("tr :even").css("border","5px solid #666");
	$("tr :gt(3)").css("background","#999");
	$("tr :lt(4)").css("color","red");
});
</script>
<style type="text/css">
table {
	position: absolute;
	top: 20%;
	left: 20%;
	width: 50%;
	height: 40%;
}
</style>
</head>
<body>
<table>
	<tr>
		<td>1</td>
		<td>11</td>
		<td>111</td>
	</tr>
	<tr>
		<td>2</td>
		<td>22</td>
		<td>222</td>
	</tr>
	<tr>
		<td>3</td>
		<td>33</td>
		<td>333</td>
	</tr>
	<tr>
		<td>4</td>
		<td>44</td>
		<td>444</td>
	</tr>
	<tr>
		<td>5</td>
		<td>55</td>
		<td>555</td>
	</tr>
	<tr>
		<td>6</td>
		<td>66</td>
		<td>666</td>
	</tr>
	<tr>
		<td>7</td>
		<td>77</td>
		<td>777</td>
	</tr>
</table>
</body>
</html>