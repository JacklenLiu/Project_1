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
	<%@ page import="P4_MessageBoard.model.*"%>
    <%
        FrdDAO dao=new FrdDAO();
        String member_loginID=(String)session.getAttribute("userLoginId"); 
        List<FrdVO> listFriend = dao.getPart(member_loginID);
        int invite_count = listFriend.size();
        pageContext.setAttribute("listFriend",listFriend);
        pageContext.setAttribute("invite_count",invite_count);
    %>
	
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<title>Insert title here</title>
	<style type="text/css">
	
	/* 線上客服用 */
	#abgne_float_ad {
    	display: none;
    	position: absolute;
  	}
  		
 	#abgne_float_ad img {
  		border: none;
  	}
	/* 線上客服用 */
	
	
	body {
    	background-image: url("../Images/backgound.png");
	}
	.rowHeader{
		background-color:#67B0D1;
	}
	#indexBtn > a {
		font-size:24px;color:#FFF;font-weight:bold;
	}
	#indexBtn > a:hover{
		color:black;
	}
	
	</style>
<!-- 舊的客服系統 要寫在<head>內 -->
<script type="text/javascript">
// (function(){
// 	var c = document.createElement("script");
// 	c.type = "text/javascript";
// 	c.src = ("https:" == document.location.protocol ? "https" : "http") + "://29.cami.yesing.com.tw/patrol/slide/department/image/hotman0901?ft=rd";
// 	var s = document.getElementsByTagName("script")[0];
// 	s.parentNode.insertBefore(c, s);
// })();
</script>
</head>
