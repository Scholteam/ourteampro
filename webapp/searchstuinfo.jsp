<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.table2excel.js"></script>
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
<body>
	<table border="1" cellspacing="0" width="500px;" height="500px"
		id="tableExcel" class="tableExcel">
		<tr>
			<th rowspan="2" style="width: 200px; height: 160px;"><img
				alt="暂无图片" src="http://localhost:8080/spring006/proimg/${sessionScope.snum}.jpg"
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
</body>
</html>