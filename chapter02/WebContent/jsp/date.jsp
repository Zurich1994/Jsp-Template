<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>javaScript时间测试</title>
</head>
<body>
<script type="text/javascript">
	var today = new Date();
	var day = today.getDate();	//获取日期
	var month = today.getMonth() + 1;	//获取月份
	var year = today.getFullYear();	//获取年份
	var week = today.getDay();	//获取星期几
	var vm = new Array("星期天","星期一","星期二","星期三","星期四","星期五","星期六");
	document.write("今天是"+year+"年"+month+"月"+day+"日"+vm[week]);
	document.title = "今天是"+year+"年"+month+"月"+day+"日"+vm[week]; 
</script>
</body>
</html>