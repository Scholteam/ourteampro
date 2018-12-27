<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>

<script type="text/javascript">
	function loginjsp() {
		var snum = document.getElementById("snum").value;
		var spassword = document.getElementById("spassword").value;
		var scheck = document.getElementById("scheck").value;
			$.ajax({
				method : "POST",
				async : true,
				url : "StudentLoginController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"snum" : snum,
					"spassword" : spassword,
					"scheck" : scheck,
				},
				success : function(data) {
					if(data=="snumerror"){
						alert("学号为空");
						top.location="studentlogin.jsp";
					}else if(data=="spassworderror"){
						alert("密码为空");
						top.location="studentlogin.jsp";
					}else if (data == "snumorspassworderror") {
						alert("学号或密码输入错误");
						top.location="studentlogin.jsp";
					} else if (data == "scheckerror"){
						alert("验证码为空或输入错误");
						top.location="studentlogin.jsp";
					} else if (data == "nodig"){
						alert("学号为非法字符");
						top.location="studentlogin.jsp";
					} else {
						top.location="mainpage.jsp";
					}
				}
			})
	}
	function toregister(){
		top.location="register.jsp";
	}
</script>
<!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="css/artfont.css">
</head>
<body>
<div style="width: 100%; text-align: center; margin-top: 20px;">
	<a class="navbar-brand" id="logo" href="#">学校教务处</a>
</div>
	<div style="width: 100%; text-align: center; margin-top: 10px;">
		<form method="post" style="width: 100%; text-align: center; margin-top: 20px;">
			学号: <br /> <input id="snum" name="snum" type="text"> <br /><br />
			密码: <br /> <input id="spassword" name="spassword" type="password">
			<br /><br /> 验证码输入: <br /> <input id="scheck" name="scheck"
				type="text">
				<br/>
				 <input type="button" value="登录"
				onclick="loginjsp()">
		</form>
		<img id="pin" src="<%=request.getContextPath()%>/PIN.mvc" style="position: absolute;top: 401px;left: 850px;height: 30px;">
	</div>
	<button type="button" class="button gray" style="width: 150px;" onclick="toregister()">注册</button>
	<br/>
	<!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>
	
</body>
</html>