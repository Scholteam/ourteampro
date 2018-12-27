<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/ProvinceandTown.js"></script>
<script type="text/javascript">
	function create() {
		var sigender = document.getElementById("sigender").value;
		var sination = document.getElementById("sination").value;
		var siacademy = document.getElementById("siacademy").value;
		var simajor = document.getElementById("simajor").value;
		var sitel = document.getElementById("sitel").value;
		var sitelcheck = document.getElementById("sitelcheck").value;
		var province = document.getElementById("province").value;
		var city = document.getElementById("city").value;
		var siaddress = document.getElementById("siaddress").value;
		var siidcard = document.getElementById("siidcard").value;
		if (sigender == "") {
			alert("性别不能为空");
		} else if (sination == "") {
			alert("民族不能为空");
		} else if (siacademy == "") {
			alert("学院不能为空");
		} else if (simajor == "") {
			alert("专业不能为空");
		} else if (sitel == "") {
			alert("手机号不能为空");
		} else if (sitelcheck == "") {
			alert("验证码不能为空");
		} else if (siaddress == "") {
			alert("详细地址不能为空");
		} else if (siidcard == "") {
			alert("身份证不能为空");
		} else {
			$.ajax({
				method : "POST",
				async : true,
				url : "WriteInfoController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"sigender" : sigender,
					"sination" : sination,
					"siacademy" : siacademy,
					"simajor" : simajor,
					"sitel" : sitel,
					"sitelcheck" : sitelcheck,
					"siprovince" : province,
					"sitown" : city,
					"siaddress" : siaddress,
					"siidcard" : siidcard,
				},
				success : function(data) {
					if (data == "success") {
						alert("请插入照片");
						top.location = "studentphoto.jsp";
					} else if(data=="carderror"){
						alert("身份证格式不正确");
					} else {
						alert("验证码输入错误");
					}
				}
			})
		}
	}
</script>
<script type="text/javascript">
	function dd() {
		var sitel = document.getElementById("sitel").value
		if (sitel != "") {
			$.ajax({
				method : "POST",
				async : true,
				url : "SendSms.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"sitel" : sitel,
				},
				success : function(data) {
					if (data == "success") {
						alert("发送成功");
					} else if(data == "failure") {
						alert("有非法字符");
					} else{
						alert("未知错误");
					}
				}
			})
			//提交操作
			var btn = document.getElementById("btn")
			btn.disabled = true
			c(60)
		} else {
			alert("请输入数值");
		}
	}
	function c(i) {
		var btn = document.getElementById("btn")
		i--;
		if (i == 0) {
			btn.value = "确定"
			btn.disabled = false
		} else {
			btn.value = "等待(" + i + ")秒后可以重新操作"
			setTimeout("c(" + i + ")", 1000)
		}
	}
</script>
</head>
<body>
	<div style="width: 100%; text-align: center;">
		${sessionScope.snum}<br />
		<form method="post">
			性别:  <input type="radio" id="sigender" name="sigender"
				value="男">男 <input type="radio" id="sigender"
				name="sigender" value="女">女 <br /> 民族:<select
				id="sination" name="sination">
				<option value="汉族">汉族</option>
				<option value="苗族">苗族</option>
				<option value="壮族">壮族</option>
				<option value="回族">回族</option>
			</select> <br />学院: <select id="siacademy" name="siacademy">
				<option value="计算机学院">计算机学院</option>
				<option value="纺织学院">纺织学院</option>
				<option value="数学学院">数学学院</option>
				<option value="汉语学院">汉语学院</option>
			</select> <br />专业: <select id="simajor" name="simajor">
				<option value="软件工程">软件工程</option>
				<option value="纺织">纺织学院</option>
				<option value="数学">数学学院</option>
				<option value="汉语">汉语学院</option>
			</select><br /> 手机号: <input id="sitel" name="sitel" type="text"
				placeholder="请输入你的手机号"> <br />手机验证码: <input id="sitelcheck"
				name="sitelcheck" type="text" placeholder="请输入你的手机号"><br />
			省市:<select id="province" name="province"></select>
    			<select id="city" name="city"></select><br/>
    		详细地址:	<input id="siaddress"
				name="siaddress" type="text" placeholder="请输入你的详细地址" style="width: 250px;"><br/>
			身份证:	<input id="siidcard"
				name="siidcard" type="text" placeholder="请输入你的身份证"><br/>
			<input type="button" value="提交" onclick="create()">
		</form>
		<input type="button" onclick="dd()" id="btn" value="请获取验证码">
	</div>
</body>
</html>