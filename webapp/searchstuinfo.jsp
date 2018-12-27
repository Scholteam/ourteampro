<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.table2excel.js"></script>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.cookie.js"></script>
<script type="text/javascript" src="js/custom/general.js"></script>

<script type="text/javascript">
	$(document).on('click', '.excelButton', function() {
		$(".tableExcel").table2excel({
			exclude : ".noExl",
			name : "Excel Document Name",
			filename : "myinfo",
			exclude_img : false,
			exclude_links : false,
			exclude_inputs : false
		});
	})
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
					<span>NAME</span>
				</div>
				<!--userinfo-->

				<div class="userinfodrop">
					<div class="userdata">
						<h4>NAME</h4>
						<span class="email"></span>
						<ul>
							<li><a href="">首页</a></li>
							<li><a href="">我的信息</a></li>
							<li><a href="">教学运行公告</a></li>
							<li><a href="">退出</a></li>
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
				<li><a href=""><span class="icon icon-flatscreen"></span>界面</a></li>
				<li><a href=""><span class="icon icon-pencil"></span>教学通知</a></li>
				<li><a href=""><span class="icon icon-message"></span>使用说明</a></li>
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
				<li><a href="">教学计划管理</a></li>
				<li><a href="">修改密码</a></li>
				<li><a href="">学籍信息</a></li>
				<li><a href="">本学期课表</a></li>
				<li><a href="">学生选课</a></li>
				<li><a href="#">个人成绩查询</a> <span class="arrow"></span>
					<ul id="error">
						<li><a href="">课程成绩</a></li>
						<li><a href="">成绩审查</a></li>
						<li><a href="">修读进程</a></li>
						<li><a href="">不及格考试次数</a></li>
					</ul></li>
			</ul>
			<a class="togglemenu"></a> <br /> <br />
		</div>
		<!--leftmenu-->
	</div>
	<!--bodywrapper-->
	<div style="position: absolute;top: 200px;left: 500px">
	<table cellspacing="0" width="500px;" height="500px"
		id="tableExcel" class="tableExcel" style="border:1">
		<tr>
			<th rowspan="2" style="width: 200px; height: 160px;"><img
				alt="暂无图片"
				src="http://localhost:8080/ourteampro/proimg/${sessionScope.snum}.jpg"
				style="width: 200px; height: 160px;"></th>
			<th>${sessionScope.sname}</th>
			<th colspan="2">${sessionScope.snum}</th>
		</tr>
		<tr>
			<th>${sessionScope.stuinfo.SIgender}</th>
			<th colspan="2">${sessionScope.stuinfo.SInation}</th>
		</tr>
		<tr>
			<td>学院</td>
			<td>${sessionScope.stuinfo.SIacademy}</td>
			<td>专业</td>
			<td>${sessionScope.stuinfo.SImajor}</td>
		</tr>
		<tr>
			<td>地址</td>
			<td colspan="3">${sessionScope.stuinfo.SIprovince}
				${sessionScope.stuinfo.SItown}</td>
		</tr>
		<tr>
			<td>详细地址</td>
			<td colspan="3">${sessionScope.stuinfo.SIaddress}</td>
		</tr>
		<tr>
			<td>身份证号</td>
			<td colspan="3">${sessionScope.stuinfo.SIidcard}</td>
		</tr>
		<tr>
			<td>手机号</td>
			<td colspan="3">${sessionScope.stuinfo.SItel}</td>
		</tr>
	</table>
	<button class="excelButton">导出excel</button>
	</div>
	<br/>
	<br/>
</body>
</html>