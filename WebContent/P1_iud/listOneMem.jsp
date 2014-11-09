<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="P1_iud.model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>會員帳號管理 - listOneEmp.jsp</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='600'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>會員帳號管理 </h3>
				<a href="next.jsp">回首頁</a>
			</td>
	</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員姓名</th>
		<th>會員性別</th>
		<th>會員生日</th>
		<th>會員地址</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<tr align='center' valign='middle'>
		<td>${memberVO.member_loginID}</td>
		<td>${memberVO.member_password}</td>
		<td>${memberVO.member_name}</td>
		<td>${memberVO.member_gender}</td>
		<td>${memberVO.member_birthday}</td>
		<td>${memberVO.member_address}</td>
	</tr>
</table>

</body>
</html>
