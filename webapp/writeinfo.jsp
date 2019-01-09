<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/ProvinceandTown.js"></script>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.cookie.js"></script>
<script type="text/javascript" src="js/custom/general.js"></script>
<script src="js/jquery.js"></script>
<script type="text/javascript">
	function createclass() {
		var check = '';
		$.ajax({
			method : "POST",
			async : true,
			url : "CreateStuClassController.mvc",
			contentType : "application/x-www-form-urlencoded",
			data : {
				"check" : check,
			},
			success : function(data) {
				if (data == "success") {
					alert("已成功生成课表");
					top.location = "studentmainpage.jsp";
				} else if(data == "existclass") {
					alert("已存在课表");
				} else{
					alert("请先完善个人信息");
				}
			}
		})
	}
	
	function addvise() {
		var asa = '';
		$.ajax({
			method : "POST",
			async : true,
			url : "AddviseController.mvc",
			contentType : "application/x-www-form-urlencoded",
			data : {
				"asa" : asa,
			},
			success : function(data) {
				if (data == "success") {
					alert("恭喜您已完成评教，请继续浏览");
				} else {
					top.location = "studentaddvisetea.jsp";
				}
			}
		})
	}
	
	function chooseclass(){
		var asa = '';
		$.ajax({
			method : "POST",
			async : true,
			url : "SearchChooseClassController.mvc",
			contentType : "application/x-www-form-urlencoded",
			data : {
				"asa" : asa,
			},
			success : function(data) {
				if (data == "success") {
					top.location = "studentchooseclass.jsp";
				} else if(data == "noinfo"){
					alert("请先完善个人信息");
				} else if(data == "noclass"){
					alert("请先生成专业课课表");
				}else{
					alert("您已选完两门课程");
				}
			}
		})
	}
	
	function searchclass() {
		var search = '';
		$.ajax({
			method : "POST",
			async : true,
			url : "SearchStuClassController.mvc",
			contentType : "application/x-www-form-urlencoded",
			data : {
				"search" : search,
			},
			success : function(data) {
				if (data == "success") {
					top.location = "searchstuclass.jsp";
				}else{
					alert("请先生成课表");
				}
			}
		})
	}
</script>
<script type="text/javascript">
	function create() {
		var sigender = $('input[name="sigender"]:checked').val();
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
					} else if (data == "carderror") {
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
					} else if (data == "failure") {
						alert("有非法字符");
					} else {
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
<body class="withvernav">

	<div class="bodywrapper">
		<div class="topheader">
			<div class="left">
				<h1 class="logo">
					Jiao<span>Wu</span>
				</h1>
				<span class="slogan">教务管理系统</span>

				<div class="search">
					<form action="" method="post">
						<input type="text" name="keyword" id="keyword" value="输入关键词" />
						<button class="submitbutton"></button>
					</form>
				</div>
				<!--search-->

				<br clear="all" />

			</div>
			<!--left-->

			<div class="right">
				<div class="userinfo">
					<span>${sessionScope.snum}</span>
				</div>
				<!--userinfo-->

				<div class="userinfodrop">
					<div class="userdata">
						<h4>${sessionScope.snum}</h4>
						<span class="email"></span>
						<ul>
							<li><a href="mainpage.jsp">首页</a></li>
							<li><c:if test="${sessionScope.realexistinfo==0}">
						<a href="writeinfo.jsp">填写详细信息</a>
					</c:if> <c:if test="${sessionScope.realexistinfo==1}">
						<a href="searchstuinfo.jsp">查看个人信息</a>
					</c:if></li>
							<li><a href="n2Detail.html">教学运行公告</a></li>
							<li><a href="PeopleSignOutController.mvc">退出</a></li>
						</ul>
					</div>
					<!--userdata-->
				</div>
				<!--userinfodrop-->
			</div>
			<!--right-->
		</div>
		<!--topheader-->


		<div class="header">
			<ul class="headermenu">
				<li><a href="studentmainpage.jsp"><span class="icon icon-flatscreen"></span>界面</a></li>
				<li><a href="n2Detail.html"><span class="icon icon-pencil"></span>教学通知</a></li>
			</ul>

			<div class="headerwidget">
				<div class="earnings">
					<div class="one_half">
						<h4>今天的 日期是</h4>
						<h3>
							<script type="text/javascript">
								today = new Date();
								document.write(today.getFullYear(), ".", "",
										today.getMonth() + 1, ".", "", today
												.getDate(), "");
								var week = today.getDay();
								document.write(getWeek(week));
								function getWeek(week) {
									if (week == 0)
										return "星期日";
									if (week == 1)
										return "星期一";
									if (week == 2)
										return "星期二";
									if (week == 3)
										return "星期三";
									if (week == 4)
										return "星期四";
									if (week == 5)
										return "星期五";
									if (week == 6)
										return "星期六";
								}
							</script>
						</h3>
					</div>
					<!--one_half-->
					<div class="one_half last alignright">
						<h4>访问次数:</h4>
						<h3>
							<script type="text/javascript">
								if (localStorage.pagecount) {
									localStorage.pagecount = Number(localStorage.pagecount) + 1;
								} else {
									localStorage.pagecount = 1;
								}
								document.write(localStorage.pagecount + "次");
							</script>
						</h3>
					</div>
					<!--one_half last-->
				</div>
				<!--earnings-->
			</div>
			<!--headerwidget-->

		</div>
		<!--header-->

		<div class="vernav2 iconmenu">
			<ul>
				<!--当li 的 class="current" 时即 该选项被选择-->
				<li><a href="n2Detail.html">教学计划管理</a></li>
				<li><c:if test="${sessionScope.realexistinfo==0}">
						<a href="writeinfo.jsp">填写详细信息</a>
					</c:if> <c:if test="${sessionScope.realexistinfo==1}">
						<a href="searchstuinfo.jsp">查看个人信息</a>
					</c:if></li>
				<li><a href="javascript:void(0);" onclick="searchclass()">查看本学期课表</a></li>
				<li><a href="javascript:void(0);" onclick="createclass()">学生创建课表</a></li>
				<li><a href="StudentLookGradeController.mvc" class="edit">个人成绩查询</a></li>
				<li><a href="javascript:void(0);" onclick="chooseclass()">个人选课</a></li>
				<li><a href="javascript:void(0);" onclick="addvise()">评教</a></li>
				<li><a href="StudentEXController.mvc" class="edit">学生交流</a></li>
			</ul>
			<a class="togglemenu"></a> <br /> <br />
		</div>
		<!--leftmenu-->

		<div style="position: absolute;top: 200px;left: 600px	">
			<form method="post">
				性别: <input type="radio" id="sigender1" name="sigender" value="男">男
				<input type="radio" id="sigender2" name="sigender" value="女">女
				<br /> 民族:<select id="sination" name="sination">
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
					placeholder="请输入你的手机号" style="width: 160px"> <br />手机验证码: <input
					id="sitelcheck" name="sitelcheck" type="text"
					placeholder="请输入你的手机验证码" style="width: 160px"><input type="button" onclick="dd()" id="btn" value="请获取验证码"><br /> 省市:<select id="province"
					name="province"></select> <select id="city" name="city"></select><br />
				详细地址: <input id="siaddress" name="siaddress" type="text"
					placeholder="请输入你的详细地址" style="width: 250px;"><br /> 身份证:
				<input id="siidcard" name="siidcard" type="text"
					placeholder="请输入你的身份证" style="width: 250px;"><br /> <hr /> <input type="button"
					value="提交" onclick="create()">
			</form>
			
			</div>


		</div>
		<!-- centercontent -->
</body>
</html>