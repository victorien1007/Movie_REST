$(function() {
	// Waves初始化
	Waves.displayEffect();
	// 输入框获取焦点后出现下划线
	$('.form-control').focus(function() {
		$(this).parent().addClass('fg-toggled');
	}).blur(function() {
		$(this).parent().removeClass('fg-toggled');
	});
});
Checkbix.init();
$(function() {
	// 点击登录按钮
	$('#login-bt').click(function() {
		login();
	});
	// 回车事件
	$('#username, #password').keypress(function (event) {
		if (13 == event.keyCode) {
			login();
		}
	});
	//自动获取焦点
	$('#username').blur();
});
// 登录
function login() {
	var username = $("#username").val();
	var password = $("#password").val();
	var requestURL = "/movieProject/user/login/"+username+"/"+password;
	$.ajax({
		type : "GET",
		url : requestURL,
		async : false,
		cache : false,
		success : function(resultData, textStatus) {
			if(resultData == null){
				alert("用户名或密码错误!");
			}
			else{
				location.href = "/movieProject/index.jsp";
			}
		}
	});
}