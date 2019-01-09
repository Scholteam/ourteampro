<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="">
<script src="js/jquery.js"></script>
<script type="text/css">
.button.gray{
	color: #8c96a0;
	text-shadow:1px 1px 1px #fff;
	border:1px solid #dce1e6;
	box-shadow: 0 1px 2px #fff inset,0 -1px 0 #a8abae inset;
	background: -webkit-linear-gradient(top,#f2f3f7,#e4e8ec);
	background: -moz-linear-gradient(top,#f2f3f7,#e4e8ec);
	background: linear-gradient(top,#f2f3f7,#e4e8ec);
	}
</script>
<script type="text/javascript">
	function registerjsp() {
		$("#registerform").submit();
	}
	function affirmnum() {
		var snum = document.getElementById("snum").value;
		if (snum == "") {
			alert("学号不能为空");
		} else {
			$.ajax({
				method : "POST",
				async : true,
				url : "AffirmNumController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"snum" : snum,
				},
				success : function(data) {
					if (data == "success") {
						alert("此学号已存在");
					} else if (data == "notreal") {
						alert("该学号长度错误");
						top.location="register.jsp";
					} else if (data == "notdig"){
						alert("有非法字符");
					} else {
						alert("该学号可注册");
					}
				}
			})
		}
	}	
		function check() {
			var a = 'a';
			var b = document.getElementById("snum");
			$.ajax({
				method : "POST",
				async : true,
				url : "RealAffirmNumController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"a" : a,
				},
				success : function(data) {
					if (data == "success") {
					} else {
						alert("请先确认学号");
						b=b.focus();
					}
				}
			})
			
	}
		function checkname() {
			var a = document.getElementById("spassword");
			var b = document.getElementById("sname");
			var c = document.getElementById("snum");
			if(b.value == ""){
				alert("姓名不能为空");
				c=c.focus();
			}
	}
		function tologin(){
			top.location="studentlogin.jsp";
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

		<!-- BuyUsers -->
		<form action="RegisterController1.mvc" method="post" id="registerform"
			style="width: 100%; text-align: center; margin-top: 20px;">
			学生学号: <br /> <input id="snum" name="snum" type="text"
				placeholder="请输入6-10位的学号">
			<a href="javascript:void(0)" onclick="affirmnum()"
				style="text-decoration: none;">确认学号</a> <br /><br /> 学生姓名: <br /> <input
				id="sname" name="sname" type="text" placeholder="请输入姓名" onclick="check()">
			<div style="display: none; color: red" id="buyun">请输入姓名</div>
			<br /><br /> 密码: <br /> <input id="spassword" name="spassword"
				type="password" onclick="checkname()"> <br /><br /> 确认密码: <br /> <input
				id="repassword" name="repassword" type="password"> <br /> <input
				id="r1" type="submit" value="注册" onclick="registerjsp()">
		</form>
		<button type="button" class="button gray" style="width: 150px;" onclick="tologin()">登陆</button>
	</div>
	        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>
</body>
</html>