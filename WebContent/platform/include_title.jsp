<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<%
		Object sionName = session.getAttribute("userName");
		Object sionLoginId = session.getAttribute("userLoginId");
		Object serverName = request.getServerName();
		Object serverPort = request.getServerPort();
		Object contextPath = request.getContextPath();
	%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<%@ page import="java.util.*" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<title>Insert title here</title>
	<style type="text/css">
	body {
    	background-image: url("../Images/backgound.png");
	}
	.rowHeader{
		background-color:#DDDDDD;
	}
	#indexBtn > a {
		font-size:24px;color:blue;font-weight:bold;
	}
	#indexBtn > a:hover{
		color:yellow;
	}
	
	</style>
</head>
