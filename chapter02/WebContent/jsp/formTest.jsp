<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证表单</title>
<script type="text/javascript">
function check(vform) {
	for(var i=0;i<vform.elements.length;i++) {
		if(vform.elements[i].type == "text") {
			var checkResult = checkTextBox(vform.elements[i]);
			var name = vform.elements[i].getAttribute("name");
			if(checkResult) {
				document.getElementById(name+"Msg").className = "feedbackHide";
			}else {
				document.getElementById(name+"Msg").className = "feedbackShow";
				vform.elements[i].focus();
				return false;
			}
		}
	}
	return true;
}

function checkTextBox(vTextBox) {
	var validChar = vTextBox.getAttribute("validChar");
	var isRequired = vTextBox.getAttribute("isRequired");
	var inputValue = vTextBox.value;
	if(isRequired!="true" && inputValue.length < 1) {
		return true;
	}else {
		var regexStr = "^"+validChar+"$";
		var regex = new RegExp(regexStr);
		return regex.test(inputValue);
	}
}
</script>

<style type="text/css">
.feedbackHide {
	visibility: visible;
}
.feedbackHide {
	visibility: hidden;
}
</style>
</head>
<body>
<form action="#" onSubmit="return check(this);">
	<table width="530px" border="1px" align="center" bordercolor="#0D5675">
		<tr>
			<td colspan="2" bgcolor="#CEDDEC">请填写个人信息</td>
		</tr>
		<tr>
			<td width="70px">员工号：</td>
			<td width="460px">
				<input type="text" name="id" validChar="\d{4}" isRequired="true">
				<font color=red size="2" class="feedbackHide" id="idMsg">(员工号必须输入四位数字)</font>
				<br>
				<font color="#666" size="2">必填,四位数字</font>
			</td>
		</tr>
		<tr>
			<td width="70px">姓名：</td>
			<td width="460px">
				<input type="text" name="name" validChar="[\u4E00-\u9FA5]{2,3}" isRequired="true">
				<font color=red size="2" class="feedbackHide" id="nameMsg">(姓名必须输入两到三位汉字)</font>
				<br>
				<font color="#666" size="2">必填,两到三位汉字</font>
			</td>
		</tr>
		<tr>
			<td width="70px">邮件：</td>
			<td width="460px">
				<input type="text" name="mail" validChar="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" isRequired="true">
				<font color=red size="2" class="feedbackHide" id="mailMsg">(请输入正确格式的邮件)</font>
				<br>
				<font color="#666" size="2">必填</font>
			</td>
		</tr>
		<tr>
			<td width="70px">费用：</td>
			<td width="460px">
				<input type="text" name="expense" validChar="\d+(\.\d{0,2})*" isRequired="false">
				<font color=red size="2" class="feedbackHide" id="expenseMsg">(请输入合法的费用格式,如1.23)</font>
			</td>
		</tr>
		<tr>
			<td width="70px">&nbsp;</td>
			<td width="460px">
				<input type="submit" value="提交">
			</td>
		</tr>
	</table>
</form>
</body>
</html>