<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<script src="js/TeacherMajor.js"></script>
<script type="text/javascript">
	function create() {
		var tnum = document.getElementById("tnum").value;
		var tpassword = document.getElementById("tpassword").value;
		var retpassword = document.getElementById("retpassword").value;
		var tname = document.getElementById("tname").value;
		var tmajor = document.getElementById("tmajor").value;
		var tclass = document.getElementById("tclass").value;
		if (tnum == "") {
			alert("教师号不能为空");
		} else if (tpassword == "") {
			alert("密码不能为空");
		} else if (retpassword == "") {
			alert("请确认密码");
		} else if (tname == "") {
			alert("姓名不能为空");
		} else {
			$.ajax({
				method : "POST",
				async : true,
				url : "TeacherRegisterController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"tnum" : tnum,
					"tpassword" : tpassword,
					"retpassword" : retpassword,
					"tname" : tname,
					"tmajor" : tmajor,
					"tclass" : tclass,
				},
				success : function(data) {
					if (data == "success") {
						top.location = "teacherlogin.jsp";
					} else if(data=="pwderror"){
						alert("密码错误不正确");
					} else if(data=="notdig"){
						alert("学号有非法字符");
					}  else {
						alert("该学号已存在");
					}
				}
			})
		}
	}
</script>
</head>
<body>
	<div class="container">
		<form class="register-form">
			<div class="title">教师注册</div>
			<div class="form-group">
				<label for="username">注册教师号</label> <input type="text"
					class="form-control" id="tnum" name="tnum" placeholder="请输入教师号">
			</div>
			<div class="form-group">
				<label for="password">登录密码</label> <input type="password"
					class="form-control" id="tpassword" name="tpassword" placeholder="请输入登录密码">
			</div>
			<div class="form-group">
				<label for="repassword">确认登陆密码</label> <input type="password"
					class="form-control" id="retpassword" name="retpassword" placeholder="请再次输入登录密码">
			</div>
			<div class="form-group">
				<label for="name">姓名</label> <input type="text" class="form-control"
					name="tname" id="tname" placeholder="请输入您的姓名">
			</div>
			<div class="form-group">
				<label for="subject">教学课程</label>
				 <select class="form-control"
					name="tmajor" id="tmajor">
				</select>
				<select class="form-control"
					name="tclass" id="tclass">
				</select>
			</div>
			<input type="button" value="提交" onclick="create()" id="register" class="btn btn-default" ON>
			<div class="footer">&copy; 2019 Education System</div>
		</form>
	</div>

</body>
</html>