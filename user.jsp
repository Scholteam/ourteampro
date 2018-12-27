<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>用户登陆——教务系统</title>
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
			<div class="title">用户信息</div>
			<div class="form-group">
				<label for="username">登录用户名</label>
				<input type="text" readonly class="form-control" name="username">
			</div>
			<div class="form-group">
				<label for="password">登录密码</label>
				<input type="password" readonly class="form-control" name="password" value="别想偷看密码哦~">
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
			getUserInfo();
			$("#save").on('click', function(){
				saveUserInfo();
			})
		});
		function getUserInfo(){
			$.ajax({
				url: '${pageContext.request.contextPath}/getUserInfo.mvc',
				success: function(data){
					if(data.state == "OK"){
						$("input[name=username]").val(data.data.username);
						$("input[name=name]").val(data.data.name);
						$("select[name=subject]").val(data.data.subject);
					}
					else {
						console.log(data.message);
						location.href = "./login.jsp";
					}
				},
				error: function(a, b){
					console.log("出错了！！");
					console.log(a);
					console.log(b);
				}
			});
		}

		
		function saveUserInfo(){
			var user = {
				name: $("input[name=name]").val(),
				gender: $("select[name=subject]").val(),
			};
			if(isNull(user.name) || user.name.length < 2 || user.name.length > 10){
				alert("请再次输入您的姓名，长度为 2-10 位！");
				$("input[name=name]").focus();
			}
			else if(isNull(user.subject)){
				alert("请选择您的科目！");
				$("select[name=subject]").focus();
			}
			else {
				$.ajax({
					url: '${pageContext.request.contextPath}/saveUserInfo.mvc',
					type: 'post',
					data: user,
					dataType: 'json',
					success: function(data){
						if(data.state == "OK"){
							location.href = "index.jsp"
						}
						else {
							alert(data.message);
							location.href = "./login.jsp";
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