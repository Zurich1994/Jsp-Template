$(document).ready(function() {
	//注册
	$("#regist").click(function() {
		$("#loginDiv").css("display","none");
		$("#registDiv").css("display", "block");
	});
	$("#return").click(function() {
		$("#registDiv").css("display","none");
		$("#loginDiv").css("display", "block");
	});
});