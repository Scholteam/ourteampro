<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登陆——教务系统</title>
<!-- bootstrap —— 一个样式库 -->
<link href="./static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="./static/css/public.css" rel="stylesheet">
<link href="./static/css/register.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="register-form">
			<div class="title">用户注册</div>
			<div class="form-group">
				<label for="username">登录用户名</label>
				<input type="text" class="form-control" name="username" placeholder="请输入登录用户名">
			</div>
			<div class="form-group">
				<label for="password">登录密码</label>
				<input type="password" class="form-control" name="password" placeholder="请输入登录密码">
			</div>
			<div class="form-group">
				<label for="repassword">确认登陆密码</label>
				<input
					type="password" class="form-control" name="repassword" placeholder="请再次输入登录密码">
			</div>
			<div class="form-group">
				<label for="name">姓名</label>
				<input type="text" class="form-control" name="name" placeholder="请输入您的姓名">
			</div>
			<div class="form-group">
				<label for="subject">科目</label>
				<select class="form-control" name="subject" placeholder="请选择您的科目">
					<option value="Java">Java</option>
					<option value="Php">Php</option>
				</select>
			</div>
			<button type="button" class="btn btn-default" id="register">注册</button>
			<div class="footer">&copy; 2019 Education System</div>
		</form>
	</div>

	<!-- jquery —— 一个 JavaScript 库, 方便的进行 html dom  操作 -->
	<script src="./static/jquery/jquery-3.3.1.min.js"></script>
	<!-- bootstrap —— 一个样式库 -->
	<script src="./static/bootstrap/js/bootstrap.min.js"></script>

	<script>
		// 当页面加载完成之后，会执行这个方法
		$(function() {
			$("#register").on('click', function(){
				register();
			})
		})
		// 注册
		function register(){
			var user = {
				username: $("input[name=username]").val(),
				password: $("input[name=password]").val(),
				repassword: $("input[name=repassword]").val(),
				name: $("input[name=name]").val(),
				subject: $("select[name=subject]").val(),
			};
			if(isNull(user.username) || user.username.length < 2 || user.username.length > 10){
				alert("请输入正确的用户名，长度为 2-10 位！");
				$("input[name=username]").focus();
			}
			else if(isNull(user.password) || user.password.length < 6 || user.password.length > 16){
				alert("请输入正确的密码，长度为 6-16 位！");
				$("input[name=password]").focus();
			}
			else if(isNull(user.repassword)){
				alert("请再次输入密码");
				$("input[name=repassword]").focus();
			}
			else if(isNull(user.name) || user.name.length < 2 || user.name.length > 10){
				alert("请再次输入您的姓名，长度为 2-10 位！");
				$("input[name=name]").focus();
			}
			else if(isNull(user.subject)){
				alert("请选择您的科目！");
				$("select[name=subject]").focus();
			}
			else if(user.password != user.repassword){
				alert("两次密码输入的不一致，请重新输入！");
				$("input[name=password]").val('');
				$("input[name=repassword]").val('');
				$("input[name=password]").focus();
			}
			else {
				$.ajax({
					url: '${pageContext.request.contextPath}/register.mvc',
					type: 'post',
					data: user,
					dataType: 'json',
					success: function(data){
						if(data.state == "OK"){
							location.href = "login.jsp"
						}
						else {
							alert(data.message);
						}
					},
					error: function(a, b){
						console.log("出错了！！");
						console.log(a);
						console.log(b);
					}
				});
			}
		}
		function isNull(str){
			return str == null || str == "";
		}
	</script>

</body>
</html>
