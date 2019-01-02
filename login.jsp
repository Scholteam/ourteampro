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
<link href="./static/css/login.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="login-form">
			<div class="title">用户登陆</div>
			<div class="form-group">
				<label for="username">登录用户名</label>
				<input type="text" class="form-control" name="username" placeholder="请输入登录用户名">
			</div>
			<div class="form-group">
				<label for="password">登录密码</label>
				<input type="password" class="form-control" name="password" placeholder="请输入登录密码">
			</div>
			<button type="button" class="btn btn-default" id="login">登陆</button>
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
			$("#login").on('click', function(){
				login();
			})
		})
		// 注册
		function login(){
			var user = {
				username: $("input[name=username]").val(),
				password: $("input[name=password]").val()
			};
			if(isNull(user.username)){
				alert("请输入用户名");
				$("input[name=username]").focus();
			}
			else if(isNull(user.password)){
				alert("请输入密码");
				$("input[name=password]").focus();
			}
			else {
				$.ajax({
					url: '${pageContext.request.contextPath}/login.mvc',
					type: 'post',
					data: user,
					dataType: 'json',
					success: function(data){
						if(data.state == "OK"){
							location.href = "index.jsp"
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
