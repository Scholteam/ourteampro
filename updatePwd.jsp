<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>密码修改——教务系统</title>
	<!-- bootstrap —— 一个样式库 -->
	<link href="./static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="./static/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="./static/css/public.css" rel="stylesheet">
	<link href="./static/css/user.css" rel="stylesheet">
</head>
<body>
	<%@ include file="./public/header.jsp" %>
	
	<div id="container" class="container">
		<form class="user-form">
			<div class="title">密码修改</div>
			<div class="form-group">
				<label for="password">原密码</label>
				<input type="password" class="form-control" name="oldPassword" placeholder="请输入登录密码">
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
			<button type="button" class="btn btn-default" id="save">保存</button>
		</form>
	</div>
	
	<%@ include file="./public/footer.jsp" %>
	
	<script src="./static/jquery/jquery-3.3.1.min.js"></script>
	<script src="./static/bootstrap/js/bootstrap.min.js"></script>
	<script src="./static/js/public.js"></script>
	<script>
		$(function() {
			var islogin = initUserInfo("${username}");
			if(islogin){
				$("#logout").on("click", function(){
					logout('${pageContext.request.contextPath}/logout.mvc');
				});
			}
			initSearch();
		});
	</script>
	
	<script>
		$(function() {
			$("#save").on('click', function(){
				updatePwd();
			})
		});
		
		function updatePwd(){
			var user = {
				oldPassword: $("input[name=oldPassword]").val(),
				password: $("input[name=password]").val(),
				repassword: $("input[name=repassword]").val(),
			};
			if(isNull(user.oldPassword) || user.oldPassword.length < 2 || user.oldPassword.length > 10){
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
			else if(user.password != user.repassword){
				alert("两次密码输入的不一致，请重新输入！");
				$("input[name=password]").val('');
				$("input[name=repassword]").val('');
				$("input[name=password]").focus();
			}
			else {
				$.ajax({
					url: '${pageContext.request.contextPath}/updatePwd.mvc',
					type: 'post',
					data: user,
					dataType: 'json',
					success: function(data){
						if(data.state == "OK"){
							location.href = "login.jsp"
						}
						else if(data.state == "NULL") {
							alert(data.message);
							location.href = "./login.jsp";
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
	</script>

</body>
</html>