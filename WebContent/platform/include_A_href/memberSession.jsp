<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<li class="dropdown">
   	<a href="#"  class="dropdown-toggle" data-toggle="dropdown">
   		<i class="fa fa-user"></i><%= session.getAttribute("userName") %>你好<b class="caret"></b></a>
	<ul class="dropdown-menu">
         <li>
             <a href="../P1_iud/userProfile.jsp">會員基本資料</a>
         </li>
         <li>
             <a href="../P4_MessageBoard/SeekFriend2.jsp">會員好友管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		<span id="friendManage"></span>
           	</a>
         </li>
         <li> 
             <a href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P2_route/viewnameServlet?action=GetRouteByMemID&memID=${userLoginId}">我的路線</a>
         </li>
         <li>
             <a href="../LoginServlet?action=logOut">登出系統</a>
         </li>
 	</ul>
</li>

<script>
(function($){
	var test = '<%= session.getAttribute("userName") %>';
	console.log('test');
	console.log(test);
	var inviteCount = "${invite_count}";
	if(inviteCount != 0 ){
		$("#friendManage").html("<b>${invite_count}</b>").css("color","blue");
	}
})(jQuery);
</script>