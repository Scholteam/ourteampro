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
	function change(snum){
		var grade = document.getElementById(snum+"a").value;
		if(grade==''){
			alert("成绩不能为空");
		}else{
			$.ajax({
				method : "POST",
				async : true,
				url : "UpdateStuGradeController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"grade" : grade,
					"snum" : snum,
				},
				success : function(data) {
					if (data == "success") {
						alert("修改成功");
						top.location = "teachermainpage.jsp";
					}else{
						alert("存在非法字符");
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
				<li><a href="TeacherChangeStuPswController.mvc" class="editor">修改学生密码</a></li>
			</ul>
			<a class="togglemenu"></a> <br /> <br />
		</div>
		<!--leftmenu-->

		<div style="left: 650px;top: 160px;position: absolute;">
			<c:if test="${sessionScope.realthisteastu==0}">暂无学生</c:if>
			<c:if test="${sessionScope.realthisteastu!=0}">
				<c:forEach var="up" items="${sessionScope.thisteastu}">
					<div>学生学号:${up.GSnum}</div>
					<c:if test="${up.GSgrade=='a'}">暂无成绩</c:if>
					<c:if test="${up.GSgrade!='a'}">学生成绩:${up.GSgrade}</c:if>
					<div>修改学生成绩:<input type="text" id="${up.GSnum}a" name="${up.GSnum}a"></div>
					<div><button onclick="change(${up.GSnum})">修改</button></div>
				</c:forEach>
			</c:if>
		</div>
		<!-- centercontent -->


	</div>
</body>
</html>