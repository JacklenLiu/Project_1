<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../platform/include_title.jsp"%>
<%@ page import="P4_MessageBoard.model.*"%>
<%@ include file="../platform/include_start.jsp" %>
<%
// 	FrdService frdSvc = new FrdService();
// 	//先抓假的login ID
// 	List<FrdVO> list = frdSvc.getPart("aa123");
	
// 	FrdDAO dao = new FrdDAO();
// 	List<FrdVO> list = dao.getPart("aa123");
// 	pageContext.setAttribute("list",list);
// 	System.out.println("test");
// 	System.out.println(list.size());
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles/showinvite.css">
<style>
	body{
	 background-color: #CCE8CC}
</style>
</head>
<body>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script type="text/javascript">

// setTimeout("location.reload();",10000);

(function($){
	   //jQuery的程式碼寫在這裡
	   	
	    setInterval(function(){
	    	var ID = "<%=sionLoginId %>";	
// 	    	alert("ID is "+ID);
 		$.ajax({ 
 			
 			"url": "ShowInviteCountServlet",
 			"type":"post",
 			"data":{'member_loginID':ID},
 			"dataType":"text",
 			"success":function(data){
 				$('#div1').html("<h2>您有" + data + "個交友邀請</h2>");
 				$('#submitid').val(data);
 			}
 			});
 			}, 15000);
	   
	   
})(jQuery)
</script>
<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
			<%@ include file="../platform/include_A_href/toIndex.jsp" %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <%@ include file="../platform/include_A_href/P2_route.jsp" %>
                    <li>
                        <a href="showALL.jsp">留言板</a>
                    </li>
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp" %>
                    <%@ include file="../platform/include_A_href/P6_contactUs.jsp" %>
                    <%@ include file="../platform/include_A_href/memberSession.jsp" %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
	</div>
    <!-- /.container -->
</nav>
	<%@ include file="../platform/include_picture/include_picture.jsp" %>

<!-- ****************************************************** -->


<h2><%=sionLoginId %>的世界~</h2>

<form action="FrdServlet" method="post">
	<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>">
	<input type="hidden" name="action" value="show_invite">
<!-- 	<input type="submit" value="查詢"> -->
	<input type="submit" id="submitid" value="${invite_count}">
<%-- 	<p>您有 ${invite_count} 個交友邀請</p> --%>
	
</form>


<!-- 以下是顯示有哪些邀請~~~~ -->

<!-- 	<div id="menu" class="test123"> -->
<!-- 		<ul> -->
			
<!-- 				<li><span class=""><a href="">好友邀請</a></span> -->
<!-- 					<ul> -->
<%-- 					<c:forEach var="list" items="${list}"> --%>
<!-- 						<li> -->
<!-- <!-- 						<a href=""> -->						
<!-- 								<form action="FrdServlet" method="post"> -->
<%-- 									<span class="">${list.member_loginID} &nbsp&nbsp --%>
<!-- 									<input type="submit" style="width:50px;height:30px;font-size:8px;" class="testbtn" value="accept"> -->
<%-- 									<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>"> --%>
<%-- 									<input type="hidden" name="vfriendNum" value="${list.friendNum}"> --%>
<!-- 									<input type="hidden" name="action" value="accept_invite">	 -->
<!-- 								</span>	 -->
<!-- 								</form>	 -->
<!-- <!-- 						</a> -->						
<!-- 							<ul> -->
<%-- 								<li>${list.invite_msg}</li> --%>
<!-- 							</ul></li> -->
<%-- 					</c:forEach> --%>
<!-- 					</ul></li>			 -->
<!-- 		</ul> -->
<!-- 	</div> -->

<!-- 以上是顯示有哪些邀請 END~~~~ -->

<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>