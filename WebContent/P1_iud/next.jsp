<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="P1_iud.model.*"%>
<%@ page import="java.util.*"%>
<%
	MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){	
	if (confirm("確認刪除此筆資料嗎?")) {
		return true;
	} else {
		return false;
	}	
}
</script>
</head>
<body>

		<font color="red"> 會員  ${userId} ，登入成功 !!<br></font>
		<font color="blue">下一站幸福，歡迎您!!</font><br><br>
		<a href='insert.jsp'>新增會員</a> <br><br>
		
<table border='1' bordercolor='#CCCCFF' width='800'>
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
	<%@ include file="page1.file" %> 
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${memberVO.member_loginID}</td>
			<td>${memberVO.member_password}</td>
			<td>${memberVO.member_name}</td>
			<td>${memberVO.member_gender}</td>
			<td>${memberVO.member_birthday}</td>
			<td>${memberVO.member_address}</td>
			
			<td>
			   <FORM METHOD="post" ACTION="update">
			     <input type="submit" value="修改">
			     <input type="hidden" name="member_loginID" value="${memberVO.member_loginID}">
			     <input type="hidden" name="action"	value="actionUpdate">
			     
			     </form>
			</td>
			<td>
			  <FORM METHOD="post" action="delete">
			    <input type="submit" value="刪除" onclick="return check()">
			    <input type="hidden" name="member_loginID" value="${memberVO.member_loginID}">			  
			    <input type="hidden"  name="action" value="actionDelete"></FORM>
			  
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</body>
</html>