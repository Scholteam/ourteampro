<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<div style="position: absolute;margin-left:550px;top: 71px;font-size: 18px">
	<c:if test="${sessionScope.snum==null}">
		<c:if test="${sessionScope.tnum==null}">
			<a href="studentlogin.jsp">学生</a>/<a href="teacherlogin.jsp">教师</a>
		</c:if>
	</c:if>
	<c:if test="${sessionScope.snum!=null}">
		欢迎<a href="AffirmStuInfoController.mvc" >${sessionScope.snum}</a>登陆
	</c:if>
	<c:if test="${sessionScope.tnum!=null}">
		欢迎<a href="teachermainpage.jsp" >${sessionScope.tnum}</a>登陆
	</c:if>
</div>


<!--header-->
		<div class="top_wrap">
			<!--top index-->
			<div class="top">
				<span class="welcome">欢迎您访问教务处！</span>
				<div class="corner">
					<a onclick=SetHome(this,window.location) title="设为首页" href="javascript:void(0);">设为首页</a>
					<span>|</span>
					<a onclick=addFavorite(window.location,document.title) title="添加收藏" href="javascript:void(0);">加入收藏</a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!--logo and nav-->
		<div class="header_wrap">
			<div class="header">
				<a href="index.jsp" class="logo"><img src="images/logo.jpg" /></a>
				<div class="nav_list">
					<ul id="nav" class="nav clearfix">
						<li class="nLi" style="display: none;"></li>
						<li class="nLi">
							<h3><a href="teachers.html">师资与科研</a></h3>
							<ul class="sub">
								<li><a href="teachers.html">师资力量</a></li>
								<li><a href="technology.html">科研成果</a></li>
							</ul>
						</li>
						<li class="nLi">
							<h3><a href="study.html">文秘学子</a></h3>
							<ul class="sub">
								<li><a href="study.html">学习成果</a></li>
								<li><a href="student.html">优秀毕业生</a></li>
							</ul>
						</li>
						<li class="nLi">
							<h3><a href="serve.html">社会服务</a></h3>
							<ul class="sub">
								<li><a href="serve.html">对外培训</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!--banner-->
		<div class="banner">
			<div class="bd">
				<ul>
					<li class="first"><a href="javascript:void(0);"></a></li>
					<li class="second"><a href="javascript:void(0);"></a></li>
					<li class="third"><a href="javascript:void(0);"></a></li>
                    <li class="fourth"><a href="javascript:void(0);"></a></li>
					<li class="fifth"><a href="javascript:void(0);"></a></li>
				</ul>
			</div>
			<div class="hd"><ul></ul></div>
		</div>
		<!--content-->
		<div class="content">
			<div class="left_tab">
				<div class="hd">
					<ul><li class="first">专业简介</li><li class="second">教师风采</li><li class="third">各专业新闻</li></ul>
				</div>
				<div class="bd">
					<div class="box">
						<a href="about1.html" class="more">MORE+</a>
						<ul class="clearfix">
							<li><a href=""><img src="images/a1.jpg" /><h4>外语学院全体教师宣讲大会</h4><span class="date">2018-12-17</span></a></li>
							<li><a href=""><img src="images/a2.jpg" /><h4>XXX名师演讲</h4><span class="date">2018-12-11</span></a></li>
							<li><a href=""><img src="images/a3.jpg" /><h4>预期授课会议</h4><span class="date">2018-12-01</span></a></li>
							<li><a href=""><img src="images/a4.jpg" /><h4>校领导视察会议</h4><span class="date">2018-11-25</span></a></li>
							<li><a href=""><img src="images/a5.jpg" /><h4>学校宣讲会</h4><span class="date">2018-11-20</span></a></li>
							<li><a href=""><img src="images/a6.jpg" /><h4>校方合作文件</h4><span class="date">2018-11-12</span></a></li>
						</ul>
					</div>
					<div class="box">
						<a href="secret.html" class="more">MORE+</a>
						<ul class="clearfix">
							<li><a href=""><img src="images/s1.jpg" /><h4>艺术学院老师工作日常</h4><span class="date">2018-12-14</span></a></li>
							<li><a href=""><img src="images/s2.jpg" /><h4>XXX老师演讲式课堂风格</h4><span class="date">2018-12-13</span></a></li>
							<li><a href=""><img src="images/s3.jpg" /><h4>机电学院老师调研会</h4><span class="date">2018-12-11</span></a></li>
						</ul>
					</div>
					<div class="box">
						<a href="news.html" class="more">MORE+</a>
						<ul class="clearfix">
							<li><a href=""><img src="images/n1.jpg" /><h4>标准化学院研讨会合影</h4><span class="date">2018-12-20</span></a></li>
							<li><a href=""><img src="images/n2.jpg" /><h4>体育学院地市级运动会</h4><span class="date">2018-12-02</span></a></li>
							<li><a href=""><img src="images/n3.jpg" /><h4>医学院临床实习</h4><span class="date">2018-11-29</span></a></li>
							<li><a href=""><img src="images/n4.jpg" /><h4>软件工程学院XX公司宣讲会</h4><span class="date">2018-11-02</span></a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="right_box">
				<!--notice-->
				<div class="notice">
					<div class="n_title">
						<b>最新通知</b>
						<a href="notice.html">MORE+</a>
					</div>
					<div class="bd">
						<ul class="infoList">
							<li><a href="">青岛大学学士学位授予工作补充规定 </a><span class="date">2018-12-20</span></li>
							<li><a href="">关于开展2018年新入职教师教学能力培训的通知</a><span class="date">2018-12-14</span></li>
							<li><a href="">关于召开2018年秋季学期期末本科教学工作会议的通知</a><span class="date">2018-12-11</span></li>
							<li><a href="">关于教务维护的通知</a><span class="date">2018-12-03</span></li>
							<li><a href="">关于转专业通告</a><span class="date">2018-11-30</span></li>
							<li><a href="">关于XX园卫生检查通告</a><span class="date">2018-11-28</span></li>
						</ul>
					</div>
				</div>
				<!--code-->
			</div>
			<div class="clear"></div>
			<div class="friend_link">
				<b>友情链接：</b><a href="" target="_blank">XX研究中心</a><a href="" target="_blank">XX研究所</a>
			</div>
		</div>
		<!--footer-->
		<div class="footer_wrap">
			<div class="line"></div>
			<div class="footer">
				<div class="f_left">
					<div class="contact">
						<p><a href="contact.html">联系我们</a><a href="javascrip:void(0);">站长统计</a></p>
						<p>XX校区&nbsp;&nbsp;&nbsp;&nbsp;所在地址：XXXXXXXXXXXX</p>
						<p>版权所有：  XX大学&nbsp;&nbsp;&nbsp;&nbsp;电话：029-8888888&nbsp;&nbsp;&nbsp;&nbsp;</p>
					</div>
				</div>
				<div class="f_right">
					<p><a href="" style="text-decoration: underline;">XX官网入口</a></p>
					<p><a href=""></a></p>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-1.11.0.min.js" ></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js" ></script>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript">
			//banner滚动效果
			jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });
			//tab切换效果
			jQuery(".left_tab").slide();
			//news滚动效果
			jQuery(".notice").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true,vis:3});
		</script>
</body>
</html>