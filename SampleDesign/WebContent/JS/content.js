$(document).ready(function() {
	$(".messgesManageDiv, .usersManageDiv").mouseover(function() {
		$(this).addClass("mouseover");
	}).mouseout(function() {
		$(this).removeClass("mouseover");
	}).click(function() {
		$("#iframe").attr("src",$("#path").val()+"/"+$(this).attr("node")+".jsp");
	});
	$(".quitDiv").mouseover(function() {
		$(this).addClass("mouseover");
	}).mouseout(function() {
		$(this).removeClass("mouseover");
	}).click(function() {
		window.top.location.href = "login.jsp";
	});
});