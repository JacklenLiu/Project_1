<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="P4_MessageBoard.model.*"%>
<%@ include file="../platform/include_title.jsp"%>
<%@ include file="../platform/include_start.jsp"%>


<%

// FrdDAO dao=new FrdDAO();
// String member_loginID=(String)session.getAttribute("userLoginId"); 
// List<FrdVO> list=dao.getPart(member_loginID);
// int invite_count = list.size();
// pageContext.setAttribute("list",list);
// pageContext.setAttribute("invite_count",invite_count);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" href="styles/buttons.css"> -->
<link rel="stylesheet" href="styles/showinvite.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script type="text/javascript" src="Scripts/buttons.js"></script>

<style>

#submitid {
	width:28px;
	height:28px;
	border-radius: 14px;
	background-color:#FF00CC;
	font-size:16px;
	text-align:center;
	position:relative; 
	float: right;
	
}

.acceptbtn {
	width:40px;
	height:24px;
	font-size:8px;
}


</style>
</head>
<body>
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

<h2>現在身分:<%=sionLoginId %></h2>

<!-- <input type="button" id="testid" value="test"/> -->

<!-- <a href="#" class="button button-circle button-flat-caution button-tiny">press me</a> -->


<script type="text/javascript">

var serverName = "<%= serverName %>"; //localhost
var serverPort = "<%= serverPort %>"; //8081
var contextPath = "<%= contextPath %>"; //Project_1

// setTimeout("location.reload();",10000);

(function($){
	   //jQuery的程式碼寫在這裡
	   	
	    setInterval(function(){
// $("#testid").click(function (){

		var ID = "<%=sionLoginId %>";	

 		$.ajax({ 
 			
 			"url": "ShowInviteCountServlet",
 			"type":"post",
 			"data":{'member_loginID':ID},
 			"dataType":"text",
 			"success":function(data){
//  				$('#div1').html("<h2>您有" + data + "個交友邀請</h2>");
 				$('#submitid').val(data);				
 			}
 			});
 		
//  		$.ajax({
// 				"url": "FrdServlet",
// 				"type":"post",
// 				"data":{'action':"show_invite",'vmember_loginID':ID},
// 				"dataType":"text",
// 				"asyn":false,
// 				"success":function(data){
// 					console.log(data);
// 					//alert("invite update successfully");
// 				}
// 			});
  		
//   		ajax的重導似乎有問題  先用window.location.href吧
  		window.location.href="http://"+serverName + ":" + serverPort + contextPath+ "/P4_MessageBoard/FrdServlet?action=" + "show_invite" + "&vmember_loginID="+ID;
  		
//   		window.location.href="http://localhost:8081/Project_1/P4_MessageBoard/FrdServlet?action=show_invite&vmember_loginID="+ID;
  				
			}, 20000);
// });	   
	   
})(jQuery)
</script>





	<!-- <ol class=""> -->

	<%-- <c:forEach var="list" items="${list}"> --%>
	<!-- 	<li> -->
	<%-- 	<p>DB中的流水號 :${list.friendNum}</p> --%>
	<%-- 	<p><span style="background-color:lightgrey;color:blue;font-weight: bolder;">${list.member_loginID}</span><span>想對你說:</span></p> --%>
	<%-- 	<p style="font-style: italic">${list.invite_msg}</p> --%>

	<!-- 	<form action="FrdServlet" method="post"> -->
	<!-- 		<input type="submit" value="接受邀請"> -->
	<%-- 		<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>"> --%>
	<%-- 		<input type="hidden" name="vfriendNum" value="${list.friendNum}"> --%>
	<!-- 		<input type="hidden" name="action" value="accept_invite">	 -->
	<!-- 	</form>	 -->
	<!-- 	</li> -->
	<!-- 	<hr> -->
	<%-- </c:forEach> --%>

	<!-- </ol> -->

	<!-- @@@@@@@@@@@@@@@@@@@@@@   改改看~~~    @@@@@@@@@@@@@@@ -->
<%-- ${list} --%>





	<div id="menu">
		<ul>
<%-- 			<li><span class=""><a href="">好友邀請<input type="button" id="submitid" value="${invite_count}" disabled="disabled" style="width:20px;height:20px;background-color:red;font-size:10px;text-align:center"></a></span> --%>
				
				<li><div class="" ><a href="">好友邀請<input type="button" id="submitid" value="${invite_count}" disabled="disabled" ></a></div>
					<ul>
					<c:forEach var="list" items="${list}">
						<li>
<!-- 						<a href=""> -->						
								<form action="FrdServlet" method="post">
									<span class="">${list.member_loginID} &nbsp&nbsp
									<input type="submit" class="acceptbtn" value="accept">
									<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>">
									<input type="hidden" name="vfriendNum" value="${list.friendNum}">
									<input type="hidden" name="action" value="accept_invite">	
								</span>	
								</form>	
<!-- 						</a> -->						
							<ul>
								<li>${list.invite_msg}</li>
							</ul></li>
					</c:forEach>
					</ul></li>			
		</ul>
	</div>
	

<!-- @@@@   顯示有多少則邀請   @@@@ -->

<%-- <h2><%=sionLoginId %>的世界~</h2> --%>

<!-- <form action="FrdServlet" method="post"> -->
<%-- 	<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>"> --%>
<!-- 	<input type="hidden" name="action" value="show_invite"> -->
<%-- 	<input type="submit" id="submitid" value="${invite_count}"> --%>
	
<!-- </form> -->

<!-- 已經把這個按鈕整合到下拉選單了~~~ -->
<%-- <input type="button" id="" value="${invite_count}" disabled="disabled"  style="background-color:red;"> --%>

<!-- @@@@   顯示有多少則邀請     END  @@@@ -->

<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>