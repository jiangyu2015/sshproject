function register(){
	var username = $("#username").val();
	var password = $("#password").val();
	var surePassword = $("#sure_password").val();
	if(username == ""){
		alert("请输入用户名");
		return;
	}else if(password == ""){
		alert("请输入密码");
		return;
	}else if(surePassword == ""){
		alert("请输入确认密码");
		return;
	}else if(password != surePassword){
		alert("密码与确认密码不一致");
		return;
	}
	
	$.ajax({
		type : "POST",
		url : "sys/user/register.do",
		async : false,
		data : {
			username: username,
			password: password
		},
		success : function(data) {
			if(data == -1){
				alert("该用户名已经被注册过了~");
			}else if(data == 1){
				alert("注册成功！");
			}
		},
		dataType : "text" 
	}); 
};