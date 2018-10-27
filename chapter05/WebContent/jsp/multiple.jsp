<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
</head>
<body>
<form action="cityInfo.jsp" method="post" name="form1">
<p>
您喜欢的城市：
<select name="city" multiple size="4">
<option selected>郑州市</option>
<option>上海市</option>
<option>北京市</option>
<option>南京市</option>
<option>杭州市</option>
<option>济南市</option>
<option>重庆市</option>
</select>
</p>
<input type="submit" value="提交" />
<input type="reset" value="清除" />
</form>
</body>
</html>