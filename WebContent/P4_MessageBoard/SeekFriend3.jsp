<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../platform/include_title.jsp" %>        
<%@ include file="../platform/include_start.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="Scripts/msg.js"></script>


<!-- @@@@@@@@@@對話方塊@@@@@@@@@@@ -->
<script>

// $(function() {
// 	$( "#dialog_div" ).dialog({
// 		autoOpen: false,
// 		show: "blind",
// 		hide: "explode",
// 		modal: "true",
// 		buttons: {
// 			"Ok": function() {
// 			$(this).dialog("close");
// 			},
// 			"Cancel": function() {
// 			$(this).dialog("close");
// 			}
// 		}
// 	});

// 	$( "#opener" ).click(function() {
// 	$( "#dialog_div" ).dialog( "open" );
// 	return false;
// 	});
// });
</script>
<!-- END   @@@@@@@@@@對話方塊  @@@@@@@@@@@ -->







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
	<h2>現在身分 : <%=sionLoginId %></h2>
	
	<div  id="menu" >
		<ul>
				
<%-- 				<li><a href="">好友邀請<input type="button" id="submitid" value="${invite_count}"  ></a> --%>
					<li><a href="">好友邀請</a>
					<ul>
					<c:forEach var="listFriend" items="${listFriend}">
						<li>
<!-- 						<a href=""> -->						
								<form action="FrdServlet" method="post">
									<span class="">${listFriend.member_loginID} &nbsp;&nbsp;
									<input type="submit" class="acceptbtn" name="whataction" value="接受邀請">
									<!-- 試試用兩個submit是否可行 -->
									<input type="submit" class="rejectbtn" name="whataction" value="拒絕">
									
									<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>">
									<input type="hidden" name="vfriendNum" value="${listFriend.friendNum}">
									<input type="hidden" name="action" value="accept_invite2">	
								</span>	
								</form>	
<!-- 						</a> -->						
							<ul>
								<li>${listFriend.invite_msg}</li>
							</ul></li>
					</c:forEach>
					</ul></li>			
		</ul>
	</div>
	<h4>搜尋朋友ID</h4>
<!-- 	<form name="myData" method="post" action="TestSeekServlet"> -->
		<input type="text" name="keyword" id="keyword"> <span id="loader"></span>
<!-- 		<input type="submit" value="搜尋(換頁)"> -->
		<input type="button" value="搜尋(不換頁)" id="but_seek">
<!-- 		<input type="hidden" name="action" value="seek_friend"> -->
<!-- 	</form> -->
	<div id="div1"></div>
	<div id="show_seek_div"></div>

	<br>

	
	
	
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
	
	
<!-- 	對話方塊 -->
	<div id="dialog" title="交友邀請">
  		<p>
  			
  		</p>
	</div>
	
<!-- 	<div id = "dialog_div" title="視窗的標題"> -->
<!-- 		<p>內容，亦可為form</p> -->
<!-- 	</div> -->
	
<script>
	$(function(){
		
		// 搜尋朋友  不轉頁
		$("#table1").hide();
		$("#but_seek").click(function(){					
			$("#table1").show();			
			$("td").remove();
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
							$("tr:last").css('background-color','red');
	 					}
	 					else{
	 						$('#table1>tbody').append("<tr><td>" + item.member_loginID +"</td><td>"+ item.member_name + "</td><td>"+ item.member_gender +"</td><td>" + '<input type="button" class="testid" value="邀請" name="' + item.member_loginID + '"/></td></tr>"');

	 					}
	 					
// 	 					$('#table1>tbody').append("<tr><td>" + item.member_loginID +"</td><td>"+ item.member_name + "</td><td>"+ item.member_gender +"</td><td>" + '<input type="button" class="testid" value="邀請" name="' + item.member_loginID + '"/></td></tr>"');
	 				});
	 			}	 			
	 			});	 		
		});
		
		
		// 按下搜尋列表中的邀請朋友按鈕
		$(document).on("click",".testid",function(){
			//按下邀請按鈕後~~~  !!!!! 要注意需要用 "on"來為動態新增的Elements綁定事件
						
			var ID = "<%=sionLoginId %>";	
			//alert(ID);
				//邀請   那個按鈕所屬的人 
			var invitedID = $(this).prop("name");
				

// 			$( "#dialog_div" ).dialog( "open" );
				
			
				//將按鈕更名 並設為disabled
			$(this).val("已邀請").prop("disabled",true);
	 		$.ajax({ 
	 			
				
	 			"url": "AjaxFrdServlet",
	 			"type":"post",
	 			"data":{'action':'invite_friend', 'vmember_loginID':ID, 'vfriend_loginID':$(this).prop("name")},
	 			"dataType":"text",
	 			"success":function(data){

// 						$( "#dialog" ).text("你已向"+ invitedID + "發送朋友邀請囉!").dialog();
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
 				$('#submitid2').val(data);
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
  		
//   		若ajax的重導似乎有問題  先用window.location.href吧
//   		window.location.href="http://"+serverName + ":" + serverPort + contextPath+ "/P4_MessageBoard/FrdServlet?action=" + "show_invite2" + "&vmember_loginID="+ID;
  		
  		window.location.href="http://localhost:8081/Project_1/P4_MessageBoard/FrdServlet?action=show_invite2&vmember_loginID="+ID;
  				
			}, 160000);
// });	   
<%-- 	    var confirmSend = "<%=session.getAttribute("sendFrined")%>"; --%>
	    var confirmSend= "<%=pageContext.getAttribute("invite_count")%>";
	   if(confirmSend != 0){
			//alert("按下按鈕想做啥");
			$("#menu").prop("hidden",false);
	   }else{
		  	$("#menu").prop("hidden",true);
		  	//$("#submitid").hide();
	   }
})(jQuery);
</script>	

<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>