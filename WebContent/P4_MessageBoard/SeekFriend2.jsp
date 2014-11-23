<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../platform/include_title.jsp" %>        
<%@ include file="../platform/include_start.jsp" %>

<%
	String friend_loginID=(String)session.getAttribute("userLoginId");
	FrdService frdSvc = new FrdService();
	List<FrdVO> list = frdSvc.getMyFrdStatus(friend_loginID);
	pageContext.setAttribute("list",list);//列出這個會員的所有好友
%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/start/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" href="styles/showinvite.css">
<!-- 調整navbar btn -->
<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="Scripts/msg.js"></script>

<!-- datatalbe css & js -->
<link href="http://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>


<style>    
        table
        {
            border:1px solid green;
            width:300px;
            border-collapse:collapse;
        }
        td,th
        {
            border:1px solid green;
            padding:4px;
        }
        
        .del{
          text-decoration:none;
        }
        .del:hover{
           text-decoration:underline;
        }
        
        
        
        
/*         #table2 */
/*         { */
/*             border:1px solid green; */
/*             width:300px; */
/*             border-collapse:collapse; */
/*         } */


/* 調整datatable的大小 */
			#div_DataTable{
				width: 500px;
 				float:left;
 				margin-right: 100px;
 				margin-left: 50px;
			}

/* 調整accordion的大小 */
			#accordion{
				width: 300px;
				margin-left: 50px;

			}
			
/* 調整搜尋列的大小 */
			#div_searchtext{
				float:left;
				width: 300px;
			}
			
			

</style>
</head>
<body>
<!-- Navigation -->
	<nav class="navbar navbar-fixed-top" role="navigation">
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
	<h2>現在身分 : <%=sionLoginId %></h2>
	


<!-- 來測試Accordion -->

<h1 id="accordion2">您有&nbsp;<b style="color:red">${invite_count}</b>&nbsp;筆好友邀請 </h1>
<div id="accordion">

<c:forEach var="listFriend" items="${listFriend}">

  <h3>${listFriend.member_loginID}</h3>
  <div>
    <p><span><b>想對你說:&nbsp;&nbsp;&nbsp;</b></span>${listFriend.invite_msg} </p>
    <div>
	 <form action="FrdServlet" method="post">
<!-- 	 	<br> -->
		<div class=""><input type="submit" class="acceptbtn" name="whataction" value="接受邀請">
		<input type="submit" class="rejectbtn" name="whataction" value="拒絕"></div>
		
		<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>">
<!-- 		value是假的!!!要再改 -->
   <%-- <input type="hidden" name="vfriendNum" value="${listFriend.friendNum}"> --%>
		<input type="hidden" name="vfriendNum" value="${listFriend.friendNum}">
		<input type="hidden" name="action" value="accept_invite2">
	</form>
    </div>
    
  </div>

</c:forEach>  

</div>




<!-- 舊的邀請清單~~~ 使用 -->
<!-- 	<div  id="menu" > -->
<!-- 		<ul> -->
				
<%-- 					<li><a href="">好友邀請&nbsp;&nbsp;&nbsp; <span style="color:white;font-size:16px"><b>${invite_count}</b></span></a> --%>
<!-- 					<ul> -->
<%-- 					<c:forEach var="listFriend" items="${listFriend}"> --%>
<!-- 						<li> -->
					
<!-- 								<form action="FrdServlet" method="post"> -->
<%-- 									<span class="">${listFriend.member_loginID} &nbsp;&nbsp; --%>
<!-- 									<input type="submit" class="acceptbtn" name="whataction" value="接受邀請"> -->
<!-- 									試試用兩個submit是否可行 -->
<!-- 									<input type="submit" class="rejectbtn" name="whataction" value="拒絕"> -->
									
<%-- 									<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>"> --%>
<%-- 									<input type="hidden" name="vfriendNum" value="${listFriend.friendNum}"> --%>
<!-- 									<input type="hidden" name="action" value="accept_invite2">	 -->
<!-- 								</span>	 -->
<!-- 								</form>	 -->
					
<!-- 							<ul> -->
<%-- 								<li>${listFriend.invite_msg}</li> --%>
<!-- 							</ul></li> -->
<%-- 					</c:forEach> --%>
<!-- 					</ul></li>			 -->
<!-- 		</ul> -->
<!-- 	</div> -->



<!-- END 來測試Accordion -->

	
<!-- 	<div  id="menu" > -->
<!-- 		<ul> -->
				
<%-- 					<li><a href="">好友邀請&nbsp;&nbsp;&nbsp; <span style="color:white;font-size:16px"><b>${invite_count}</b></span></a> --%>
<!-- 					<ul> -->
<%-- 					<c:forEach var="listFriend" items="${listFriend}"> --%>
<!-- 						<li> -->
					
<!-- 								<form action="FrdServlet" method="post"> -->
<%-- 									<span class="">${listFriend.member_loginID} &nbsp;&nbsp; --%>
<!-- 									<input type="submit" class="acceptbtn" name="whataction" value="接受邀請"> -->
<!-- 									試試用兩個submit是否可行 -->
<!-- 									<input type="submit" class="rejectbtn" name="whataction" value="拒絕"> -->
									
<%-- 									<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>"> --%>
<%-- 									<input type="hidden" name="vfriendNum" value="${listFriend.friendNum}"> --%>
<!-- 									<input type="hidden" name="action" value="accept_invite2">	 -->
<!-- 								</span>	 -->
<!-- 								</form>	 -->
					
<!-- 							<ul> -->
<%-- 								<li>${listFriend.invite_msg}</li> --%>
<!-- 							</ul></li> -->
<%-- 					</c:forEach> --%>
<!-- 					</ul></li>			 -->
<!-- 		</ul> -->
<!-- 	</div> -->

<hr>


	<div id="div1"></div>
	<div id="show_seek_div"></div>

<!-- 	<br> -->

<!--     列出此會員所有的朋友 -->
		<h1>您的朋友列表</h1>


<div id = "div_DataTable">
	<table id="table2">
         <thead>
         <tr>
             <th>ID</th>
<!--              <th>暱稱</th> -->
<!--              <th>性別</th> -->
             <th>朋友狀態</th>
         </tr>
             </thead>
             
         <tbody>
         
        	 <c:forEach var="list" items="${list}">
         		<tr>
         			<td>${list.member_loginID}</td>
         			<c:if test="${list.relationship_status == '0'}">
         				<td>您尚未確認</td>
         			</c:if>
         			<c:if test="${list.relationship_status == '1'}">
         				<td>已是朋友</td>
         			</c:if>
<%--          			<td>${list.relationship_status}</td> --%>
        		</tr>
        	 </c:forEach>		
         </tbody>
    </table>
</div>


<div id = "div_searchtext">

<!-- 	<form name="myData" method="post" action="TestSeekServlet"> -->
		<input type="text" name="keyword" id="keyword" placeholder="搜尋人"> <span id="loader"></span>
<!-- 		<input type="submit" value="搜尋(換頁)"> -->
		<input type="button" value="搜尋" id="but_seek">
<!-- 		<input type="hidden" name="action" value="seek_friend"> -->
<!-- 	</form> -->

	<table id="table1">
         <thead>
         <tr>
             <th>ID</th>
             <th>暱稱</th>
             <th>性別</th>
             <th>邀請狀態</th>
         </tr>
             </thead>
         <tbody>      
             </tbody>
    </table>

</div>

	
<!-- 	對話方塊 -->
	<div id="dialog" title="交友邀請">
  		<p>
  			
  		</p>
	</div>
	
<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  
	
<script>
	$(function(){
		
		// 搜尋朋友  不轉頁
// 		$("#table1").hide();
		$("#but_seek").click(function(){					
			$("#table1").show();			
			$("#table1 td").remove();
			var keyword=document.getElementById("keyword").value;			
	 		$.ajax({ 
	 			"url": "TestSeekServlet",
	 			"type":"post",
	 			"data":{'action':'seek_friend2','keyword':keyword},
	 			"dataType":"text",
	 			"success":function(datas){
	 				
	 				var myObject = JSON.parse(datas); //記得把字串轉成josn物件
	 				$.each(myObject,function(i,item){
	 				
	 					var ID = "<%=sionLoginId %>";
	 					if(item.member_loginID == ID){
	 						$('#table1>tbody').append("<tr><td>" + item.member_loginID +"</td><td>"+ item.member_name + "</td><td>"+ item.member_gender +"</td><td>" + '<input type="button" class="testid" value="沒看過這種請求" disabled="disabled" title="加自己做什麼啦" name=" ' + item.member_loginID + '"/></td></tr>"');
// 							$("tr:last").css('background-color','red');
	 					}
	 					else{
	 						$('#table1>tbody').append("<tr><td>" + item.member_loginID +"</td><td>"+ item.member_name + "</td><td>"+ item.member_gender +"</td><td>" + '<input type="button" class="testid" value="邀請" name="' + item.member_loginID + '"/></td></tr>"');

	 					}
	 					
	 				});
	 			}	 			
	 			});	 		
		});
		
		
		// 按下搜尋列表中的邀請朋友按鈕
		$(document).on("click",".testid",function(){
			//按下邀請按鈕後~~~  !!!!! 要注意需要用 "on"來為動態新增的Elements綁定事件
						
			var ID = "<%=sionLoginId %>";	
				//邀請   那個按鈕所屬的人 
			var invitedID = $(this).prop("name");
			
				//將按鈕更名 並設為disabled
			$(this).val("已邀請").prop("disabled",true);
	 		$.ajax({ 
	 			
				
	 			"url": "AjaxFrdServlet",
	 			"type":"post",
	 			"data":{'action':'invite_friend', 'vmember_loginID':ID, 'vfriend_loginID':$(this).prop("name")},
	 			"dataType":"text",
	 			"success":function(data){
						$("#dialog").text(data).dialog();

	 			}
	 		});
		});
		
	});
</script>	
<script type="text/javascript">

var serverName = "<%= serverName %>"; //localhost
var serverPort = "<%= serverPort %>"; //8081
var contextPath = "<%= contextPath %>"; //Project_1

// setTimeout("location.reload();",10000);

(function($){
	   //jQuery的程式碼寫在這裡

// 	   使用datatalbe
	   $('#table2').dataTable({

	   });

	   $( "#accordion" ).accordion({
		   collapsible: true
	   
		   });
	   
	   
	    setInterval(function(){
// $("#testid").click(function (){

		var ID = "<%=sionLoginId %>";	

 		$.ajax({ 
 			
 			"url": "ShowInviteCountServlet",
 			"type":"post",
 			"data":{'member_loginID':ID},
 			"dataType":"text",
 			"success":function(data){
 				$('#submitid').val(data);
 				$('#submitid2').val(data);
 			}
 			});
  		
//   		若ajax的重導似乎有問題  先用window.location.href吧
//   		window.location.href="http://"+serverName + ":" + serverPort + contextPath+ "/P4_MessageBoard/FrdServlet?action=" + "show_invite2" + "&vmember_loginID="+ID;
  		
  		window.location.href="http://localhost:8081/Project_1/P4_MessageBoard/FrdServlet?action=show_invite2&vmember_loginID="+ID;
  				
			}, 10000000);

	    var confirmSend= "<%=pageContext.getAttribute("invite_count")%>";
	   if(confirmSend != 0){
			//alert("按下按鈕想做啥");
			$("#menu").prop("hidden",false);
	   }else{
		  	$("#menu").prop("hidden",true);
		  	$("#accordion2").prop("hidden",true);
		  	
		  	//$("#submitid").hide();
	   }
})(jQuery);
</script>	

<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>