$(document).ready(function() {
	$("input[type='text'],input[type='password']").focus(function() {
		$(this).addClass("focus");
	});
	$("input[type='text'],input[type='password']").blur(function() {
		$(this).removeClass("focus");
	});
	$(".btn").mouseover(function() {
		$(this).addClass("mouseoverBtn");
	});
	$(".btn").mouseout(function() {
		$(this).removeClass("mouseoverBtn");
	});
});

function login() {
	window.top.location.href = "login.jsp";
}