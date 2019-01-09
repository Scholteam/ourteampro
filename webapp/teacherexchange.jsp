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
	function create() {
		var txword = document.getElementById("txword").value;
		if (txword == "") {
			alert("输入不能为空");
		}
		else{
			$.ajax({
				method : "POST",
				async : true,
				url : "TeacherExchangeController.mvc",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"txword" : txword,
				},
				success : function(data) {
					if (data == "success") {
						alert("输入成功");
						top.location = "teacherexchange.jsp";
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
				<li><a href="teachermainpage.jsp"><span
						class="icon icon-flatscreen"></span>界面</a></li>
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
				<li><a href="n2Detail.html" class="editor">教学计划管理</a></li>
				<li><a href="TeacherSeeStuGradeController.mvc" class="editor">查看学生成绩</a></li>
				<li><a href="TeacherChangrStuPswController.mvc" class="editor">修改学生密码</a></li>
				<li><a href="TeacherChangeStuInfoController.mvc" class="editor">修改学生信息</a></li>
				<li><a href="TeacherEXController.mvc" class="editor">教师交流</a></li>
			</ul>
			<a class="togglemenu"></a> <br /> <br />
		</div>
		<!--leftmenu-->

		<div style="position: absolute; top: 200px; left: 600px">
			<c:if test="${sessionScope.ateacher==0}">
				没有交流
			</c:if>
			<c:if test="${sessionScope.ateacher != 0}">
				<c:forEach var="up" items="${sessionScope.teacherex1}">
					${up.TXnum}-${up.TXname}:${up.TXword}<br>
				</c:forEach>
			</c:if>
			<br>
			${sessionScope.tnum}请发表你的言论：
				<input id="txword" name="txword" type="text" placeholder="请输入你想说的话" style="width: 250px;">
				<input type="button" value="提交" onclick="create()">
		</div>
		<!-- centercontent -->


	</div>
</body>
</html>