<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>演示plugin</title>
</head>
<body>

<%--
	<jsp:plugin>是从JSP页面中加载JAVA Applet 或者 JavaBean程序组件。
	使用语法
	<jsp:plugin 
	type="bean|applet" -----加载Java程序的类型，bean代表加载JavaBean类型，applet代表加载Java Applet类型
	code="classFileName" -----加载Java程序编译后的类名称
	codebase="classFileDirectoryName" ----编译后Java程序类所在的目录，可设置绝对路径也可设置相对路径，未设置，以当前执行页面所在目录为默认值
	name="instanceName" ----为加载的JavaBean或者Java Applet程序设置一个可以识别的名称
	align="left|right|top|middle|bottom" ----设置加载的程序在窗口的显示对齐方式
	width="width" height="height" ----窗口的宽度和高度
	hspace="horizontalSpace" ----与其他页面内容的水平间隔
	vspace="verticalSpace" ----与其他页面内容的垂直间隔
	>
		<jsp:params> ----传递参数时使用
			<jsp:param name="propertyName" value="propertyValue"/>
				……………………………… ----可设置多个param
		</jsp:params>
		<jsp:fallback>text message</jsp:fallback>
	</jsp:plugin>
 --%>

	<jsp:plugin code="com/showmsg.class" codebase="" type="applet" height="200" width="200">
		<jsp:params>
			<jsp:param value="C++" name="msg1"/>
			<jsp:param value="JAVA" name="msg2"/>
			<jsp:param value="C#" name="msg3"/>		
		</jsp:params>
	</jsp:plugin>
</body>
</html>