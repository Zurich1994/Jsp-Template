var OPER = "";//ADD增加，MOD修改，DEL删除
var bgcolor = "";//行背景色
var listId = 0;//要操作的信息的id
var COL = 6;
$(document).ready(function() {
	$(function(){
		//$("#listTableDiv tbody tr:nth-child(odd)").addClass("odd");
		$("#listTableDiv tbody tr:nth-child(even)").addClass("even");
	});
	//添加按钮，显示div
	$("#insertBtn").click(function() {
		$("#contentDiv input[type='text']").val("");
		$(this).removeClass("mouseoverBtn");//鼠标离开，去掉样式
		$(".clickBtn").removeClass("clickBtn");//上一个按钮去掉点击样式
		$(this).addClass("clickBtn");//增加单击样式
		$("#contentDiv h3").text("新增账户");//标题
		$("#contentForm").attr("action","insert_do.jsp");//增加action
		$("#contentDiv").removeClass("hide");//显示div
		$("#operBtnDiv input,#queryFormDiv input").attr("disabled","disabled");//下层按钮不可用
	});
	//修改按钮，显示div
	$("#updateBtn").click(function() {
		if(listId != 0) {
			$(this).removeClass("mouseoverBtn");
			$(".clickBtn").removeClass("clickBtn");
			$(this).addClass("clickBtn");
			$("#contentDiv h3").text("修改账户");
			$("#contentForm").attr("action","update_do.jsp");
			$("#operBtnDiv input,#queryFormDiv input").attr("disabled","disabled");
			$("#contentDiv").removeClass("hide");
		}else {
			alert("请选择一条信息进行修改！");
		}
	});
	//删除按钮
	$("#deleteBtn").click(function() {
		if(listId != 0) {
			$(".clickBtn").removeClass("clickBtn");
			$(this).addClass("clickBtn");
			$("#contentForm").attr("action","delete_do.jsp");
			if(confirm("是否删除'"+$("#new_name").val()+"'账户信息？")) {
				$("#contentForm").submit();
			}
		}else {
			alert("请选择一条信息进行删除！");
		}
	});
	//取消按钮，隐藏div
	$("#cancel").click(function() {
		$("#contentDiv input[type='text'],#contentDiv textarea").val("");
		$("#contentDiv").addClass("hide");
		$("#operBtnDiv input,#queryFormDiv input").removeAttr("disabled");
	});
	
	//点击表中行，变色，获取当前行的信息id
	$("#listTableDiv table tbody tr").click(function() {
		if(bgcolor == "even") {
			$(".clickTr").addClass("even");
		}
		$(".clickTr").removeClass("clickTr");
		if($(this).hasClass("even")) {
			$(this).removeClass("even");
			$(this).addClass("clickTr");
			bgcolor = "even";
		}else {
			$(this).addClass("clickTr");
			bgcolor = "odd";
		}
		$(this).find("td").each(function(i) {
			if(i%COL==0) {
				listId = $(this).text();
			}
		});
		//将要修改的内容写入div
		insertForUpdate();
		//查询当前账户下的用户信息
		$("#rec_users_iframe").attr("src","list_rec_users.jsp?rec_user_id="+listId);
	});
});

//插入要修改的信息
function insertForUpdate() {
	var clickTr = $(".clickTr");
	clickTr.find("td").each(function(i) {
		if(i%COL==0) {
			$("#new_id").val($(this).text());
		}
		if(i%COL==1) {
			$("#new_name").val($(this).text());
		}
		if(i%COL==2) {
			$("#new_address").val($(this).text());
		}
		if(i%COL==3) {
			$("#new_phone").val($(this).text());
		}
		if(i%COL==4) {
			$("#new_datetime").val($(this).text());
		}
		if(i%COL==5) {
			$("#new_money").val($(this).text());
		}
	});
}