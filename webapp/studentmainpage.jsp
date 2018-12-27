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
<c:if test="${sessionScope.realexistinfo==0}">
		<a href="writeinfo.jsp" >填写详细信息</a>
</c:if>
<c:if test="${sessionScope.realexistinfo==1}">
		<a href="searchstuinfo.jsp" >查看个人信息</a>
</c:if>
<a href="#" >查看个人课程</a> <br/>
<a href="#" >查看个人成绩</a> <br/>
<a href="#" >注销</a> <br/>

</body>
</html>