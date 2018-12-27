<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.table2excel.js"></script>
<script type="text/javascript" src="js/jquery.table2excel.min.js"></script>
<script type="text/javascript">
$(function(){
        $("#excelButton").click(function(){
            $("#tableExcel").table2excel({
                // 不被导出的表格行的CSS class类
                exclude: ".noExl",
                // 导出的Excel文档的名称，（没看到作用）
                name: "Excel Document Name",
                // Excel文件的名称
                filename: "myExcelTable"
            });
        });
    });
</script>
</head>
<body>
<table border="1" cellspacing="0" width="500px;" height="500px" id="tableExcel" class="tableExcel">
  <tr>
    <th rowspan="2" style="width: 200px;height: 160px;">123<img src="bg1.jpg" style="width: 200px; height: 160px;"></th>
    <th>姓名</th>
    <th colspan="2">学号</th>
  </tr>
  <tr>
    <th>性别</th>
    <th colspan="2">民族</th>
  </tr>
  <tr>
    <td>学院</td>
    <td>填写学院</td>
    <td>专业</td>
    <td>填写专业</td>
  </tr>
  <tr>
    <td >地址</td>
    <td colspan="3">填写地址</td>
  </tr>
  <tr>
    <td >详细地址</td>
    <td colspan="3">填写详细地址</td>
  </tr>
  <tr>
    <td >身份证号</td>
    <td colspan="3">填写身份证号</td>
  </tr>
  <tr>
    <td >手机号</td>
    <td colspan="3">填写手机号</td>
  </tr>
</table>

<button class="excelButton" id="excelButton">导出excel</button>
</body>
</html>