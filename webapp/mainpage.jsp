<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div style="width: 100%;text-align: center;">
	<c:if test="${sessionScope.snum==null}">
		<c:if test="${sessionScope.tnum==null}">
			<a href="register.jsp">学生注册</a><br/>
			<a href="studentlogin.jsp">学生登陆</a><br/>
			<a href="teacherregister.jsp">教师注册</a><br/>
			<a href="teacherlogin.jsp">教师登陆</a>
		</c:if>
	</c:if>
	<c:if test="${sessionScope.snum!=null}">
		欢迎<a href="AffirmStuInfoController.mvc" >${sessionScope.snum}</a>登陆
	</c:if>
	<c:if test="${sessionScope.tnum!=null}">
		欢迎<a href="AffirmStuInfoController.mvc" >${sessionScope.tnum}</a>登陆
	</c:if>

</div>
</body>
</html>