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
							<li><a href="index.jsp">首页</a></li>
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
				<li><a href="n2Detail.html" class="editor">教学计划管理</a></li>
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

		<div style="position: absolute;top: 200px;left: 550px;">
			<c:if test="${sessionScope.reallyhavegrade==0}">请先生成课表</c:if>
			<c:if test="${sessionScope.reallyhavegrade!=0}">
			<c:forEach var="up" items="${sessionScope.thisstugrade}">
				学科: ${up.GTclass}  老师: ${up.GTname}  成绩:<c:if test="${up.GSgrade=='a'}">暂无成绩</c:if><c:if test="${up.GSgrade!='a'}">${up.GSgrade}</c:if>
			<br/>
			</c:forEach>
			</c:if>
		</div>
		<!-- centercontent -->


	</div>

</body>
</html>