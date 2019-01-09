<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务系统——教师登陆</title>
<!-- bootstrap —— 一个样式库 -->
<link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/public.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script type="text/javascript">
	function tr() {
		top.location = "teacherregister.jsp";
	}
	function login11() {
		var tnum = document.getElementById("tnum").value;
		var tpassword = document.getElementById("tpassword").value;
		var tcheck = document.getElementById("tcheck").value;
		if (tnum == "") {
			alert("教师号不能为空");
		} else if (tpassword == "") {
			alert("密码不能为空");
		} else if (tcheck == "") {
			alert("验证码不能为空");
		} else {
			$.ajax({
				method : "POST",
				async : true,
				url : "TeacherLoginController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"tnum" : tnum,
					"tpassword" : tpassword,
					"tcheck" : tcheck,
				},
				success : function(data) {
					if (data == "success") {
						top.location = "index.jsp";
					} else if (data == "poterror") {
						alert("密码或教师号错误");
					} else if (data == "notdig") {
						alert("教师号有非法字符");
					} else {
						alert("验证码输入错误");
					}
				}
			})
		}
	}
</script>
</head>
<body>
	<div class="container">
		<form class="login-form">
			<div class="title">教师登陆</div>
			<div class="form-group">
				<label for="username">教师登陆</label> <input type="text"
					class="form-control" name="tnum" id="tnum" placeholder="请输入教师号">
			</div>
			<div class="form-group">
				<label for="password">登录密码</label> <input type="password"
					class="form-control" id="tpassword" name="tpassword"
					placeholder="请输入登录密码">
			</div>
			验证码输入:<input type="text" class="form-control" id="tcheck"
				name="tcheck" placeholder="请输入登录密码"> <img id="pin"
				src="<%=request.getContextPath()%>/PIN.mvc" style="height: 30px;"><br />
			<input type="button" class="btn btn-default" value="登陆" onclick="login11()"/><br/><br/><br/>
			<input type="button" value="注册" onclick="tr()" class="btn btn-default"/>
			<div class="footer">&copy; 2019 Education System</div>
		</form>
	</div>

</body>
</html>