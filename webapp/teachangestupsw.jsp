<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.cookie.js"></script>
<script type="text/javascript" src="js/custom/general.js"></script>
<script src="js/jquery.js"></script>
<script type="text/javascript">

function searchnum(){
	var snum = document.getElementById("search11").value;
	if(snum==''){
		alert("查找的学号不能为空");
	}else{
		$.ajax({
			method : "POST",
			async : true,
			url : "SearchStuSnumController.mvc",
			contentType : "application/x-www-form-urlencoded",
			data : {
				"snum" : snum,
			},
			success : function(data) {
				if (data == "success") {
					top.location = "teacherupdatespecialpsw.jsp";
				}else if(data == "notdig"){
					alert("存在非法字符");
				}else{
					alert("该学号不存在");
				}
			}
		})
	}
}
	function change(snum){
		var psw = document.getElementById(snum+"a").value;
		if(psw==''){
			alert("修改的密码不能为空");
		}else{
			$.ajax({
				method : "POST",
				async : true,
				url : "UpdateStuPswController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"psw" : psw,
					"snum" : snum,
				},
				success : function(data) {
					if (data == "success") {
						alert("修改成功");
						top.location = "teachermainpage.jsp";
					}else{
						alert("------");
					}
				}
			})
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
					<span>${sessionScope.tnum}</span>
				</div>
				<!--userinfo-->

				<div class="userinfodrop">
					<div class="userdata">
						<h4>${sessionScope.tnum}</h4>
						<span class="email"></span>
						<ul>
							<li><a href="index.jsp">首页</a></li>
							<li><a href="">教学运行公告</a></li>
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
				<li><a href="teachermainpage.jsp"><span
						class="icon icon-flatscreen"></span>界面</a></li>
				<li><a href=""><span class="icon icon-pencil"></span>教学通知</a></li>
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
				<li><a href="#" class="editor">教学计划管理</a></li>
				<li><a href="TeacherSeeStuGradeController.mvc" class="editor">查看学生成绩</a></li>
				<li><a href="TeacherChangrStuPswController.mvc" class="editor">修改学生密码</a></li>
			</ul>
			<a class="togglemenu"></a> <br /> <br />
		</div>
		<!--leftmenu-->

		<div style="position: absolute; top: 200px; left: 600px">
			<c:if test="${sessionScope.reallyexiststu==0}">暂无学生</c:if>
			<c:if test="${sessionScope.reallyexiststu!=0}">
				搜索学号:<input type="text" id="search11" name="search11">
				<button onclick="searchnum()">搜索</button>
				<br />
				<table style="border: 1px ''">
					<tr>
						<th>学生学号</th>
						<th>学生密码</th>
						<th>修改学生密码</th>
						<th>修改按钮</th>
					</tr>
					<c:forEach var="up" items="${sessionScope.allstudent}">
						<tr>
							<th>${up.snum}</th>
							<th>${up.spassword}</th>
							<th><input type="text" id="${up.snum}a" name="${up.snum}a"></th>
							<th><button onclick="change(${up.snum})">修改</button></th>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
		<!-- centercontent -->


	</div>
</body>
</html>