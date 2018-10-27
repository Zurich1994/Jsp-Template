<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本选择器</title>
<script type="text/javascript" src="../js/jQuery/jquery-1.4.2.js"></script>
<script>
$(function(){
	$("p").css("color","red").css("font-size","20px");
	$("#idDiv").css("border","5px solid green");
	$(".classDiv").css("border","5px solid blue");
});

</script> 
<style>  
div {    
width: 290px;    
height: 290px;    
float:left;    
padding: 5px;    
margin: 5px;    
background-color: #EEEEEE;  
}  	
</style>  

</head>
<body>  
<div>
<p>p内容</p>
</div>   
<div id="idDiv">id="idDiv"</div>
<div class="classDiv">class="classDiv"</div>
</body>
</html>