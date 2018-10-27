<%-- 
	page指令用来定义JSP页面中的全局属性，它主要描述了与页面相关的一些信息。
	一般该指令放在JSP的开头，放在其它位置也是可行的。
	在一个JSP页面中，可以有多个page指令。
	例如：
	language = "java" 表示脚本的语法必须符合JAVA的语法规则，默认为java,所以可以不指定。
	contentType = "mimeType[;charset=characterSet]" 指定返回浏览器的内容类型，同时可指定返回页面中所使用的字符编码。 常用格式为 "text/html;charset=UTF-8","text/html;charset=GB2312"
	pageEncoding = characterSet JSP页面本身的编码格式 常用UTF-8，GB2312
	session = "true|false" 设置session是否打开。默认是true
	buffer = "none|8kb|sizekb" 被out对象用于处理执行后的JSP对客户端的输出，默认是8kb，也可以指定大小，设置为none，则不使用缓冲区
	autoFlush = "true|false" 该属性设置 如果buffer溢出，是否需要强制输出，如果设置为true,则输出正常，如果为false，buffer溢出就会导致一个意外错误发生，所以如果把buffer设置为none,那么autoFlush必须设置为true。默认为true。
	info = "text" 设置一段字符串信息，可以使用Servlet.getServletInfo方法取回
	errorPage = "URL" 设置异常发生时，处理异常需要的JSP页面
	isErrorPage = "true|false" 设置此页面是否是错误处理页面，默认是false，如果设置为true，则表明在该页面中可以获取异常对象exception，并通过该对象取得从发生错误的页面传出的错误信息，获取错误信息的方法是<%=exception.getMessage()%>
	
	注意：以上属性在page指令中只准出现一次
	
	import = "{package}" 用于导入JSP页面中将要使用的Java类，一个import属性可以导入一个或者多个Java类的定义，中间用逗号隔开即可。
	另外import属性可以在page指令中出现多次。
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统导航</title>
</head>
<body>
<a href = "jsp/helloJSP.jsp">第一个JSP程序</a><br/>
<a href = "jsp/hidden-comment.jsp">注释测试</a><br/>
<a href = "jsp/dec-method.jsp">方法的声明</a><br/>
<a href = "jsp/scriptlet.jsp">混合静态HTML和scriptlet</a><br/>
<a href = "jsp/setCharset.jsp">演示page指令charset设置</a><br/>
<a href = "jsp/setInfo.jsp">info属性设置说明</a><br/>
<a href = "jsp/pageError.jsp">出错页面</a><br/>
<a href = "jsp/include.jsp">include指令实例</a><br/>
<a href = "jsp/jsp_include.jsp">include静态包含文件</a><br/>
<a href = "jsp/login.jsp">登陆-测试forward</a><br/>
<a href = "jsp/register.jsp">用户注册-测试JavaBean</a><br/>
<a href = "jsp/usingPlugin.jsp">演示Plugin</a>
</body>
</html>