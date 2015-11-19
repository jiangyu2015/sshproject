function login(){
	var username = $("#username").val();
	var password = $("#password").val();
	if(username == ""){
		alert("请输入用户名");
		return;
	}else if(password == ""){
		alert("请输入密码");
		return;
	}
	
	$.ajax({
		type : "POST",
		url : "sys/user/login.do",
		async : false,
		data : {
			username: username,
			password: password
		},
		success : function(data) {
			console.log(data);
			if(data == -1){
				alert("用户名不存在");
			}else if(data == "error"){
				alert("密码错误");
			}else if(data == "succeed"){
				window.location.href = "pages/index.html";
			}
		},
		dataType : "text" 
	}); 
};