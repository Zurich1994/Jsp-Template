<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
</head>
<body>
<form action="hobbyInfo.jsp" name="form1" method="post">
<p>
兴趣：
<input type="checkbox" name="Habit" value="Read" />看书
<input type="checkbox" name="Habit" value="Football" />足球
<input type="checkbox" name="Habit" value="Travel" />旅游
<input type="checkbox" name="Habit" value="Music" />听音乐
<input type="checkbox" name="Habit" value="TV" />看电视
</p>
<p>
<input type="submit" value="提交" />
<input type="reset" value="清除" />
</p>
</form>
</body>
</html>