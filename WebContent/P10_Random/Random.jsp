<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
  <%@ include file="../platform/include_title.jsp" %>
  <%@ include file="../platform/include_start.jsp" %>
  <link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
  <link rel="stylesheet" href="Jacklen_css/component.css"> <!--蕙齊css-->
  <!-- 調整navbar btn -->
  <link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">

<!-- 路線協作平台 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- 好友協作平台 -->
<style>
	#dog {
		
        position: absolute;
        z-index: -1;
    }
    #yyyy {
        z-index: 0;
    }
    .ui-dialog-titlebar-close {
  		visibility: hidden;
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
                <c:if test="<%=sionName == null%>">
                  		<li class="dropdown">
                  			<a href="../P0_login/login.jsp" name="indexLoginBtn" class="noChange">登入</a>
                  	 	</li>
                  	</c:if>
                	<li class="dropdown">
                  		<a href="../P2_route/route_search.jsp" name="indexLoginBtn" class="noChange">景點介紹</a>
                  	</li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        	 <li>
                                <a href="Random.jsp" class="noChange"  name="indexLoginBtn">隨機旅程</a>
                            </li>
                            <li>
                                <a href="../P2_route/route_plan.jsp">路徑規劃</a>
                            </li>
                            <li>
                                <a href="#" id="cooperationLink">與好友同步規劃</a>
                            </li>
                        </ul>
                    </li>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %> 
<%--                     <%@ include file="../platform/include_A_href/Portfolio.jsp" %> --%>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp"%>
					<%@ include file="../platform/include_A_href/P6_contactUs.jsp"%>
                   <c:if test="<%=sionName!=null %>"> <%@ include file="../platform/include_A_href/memberSession.jsp"%>
                   </c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
	</div>
    <!-- /.container -->
	</nav>
	<div id="dialog-addFriend" title="邀請好友" hidden>
		<span>
			<h4 style="display: inline">選擇好友</h4> <select
			class="selectpicker show-menu-arrow" id="getFriends"></select> <input
			type="button" id="addToFriend" value="+" />
		</span> <br>
		<div id="friendDiv" style="width: 90%;"></div>
		<h4>說些什麼...</h4>
		<textarea id="textareamsgID" rows="4" cols="25">快點進來~大家都在等你囉!</textarea>
	</div>
	<div id="dialog-checkCoFromFrd" title="你朋友找你" hidden>
		<h4>好友邀你</h4>
	</div>
	<%-- 	<%@ include file="../platform/include_picture.jsp"%> --%>
	<%@ include file="../platform/include_picture/include_picture.jsp" %>


<!-- 隨機畫面 -->
<center>
		<div class="container">
			<h1>Random Game</h1>
	        <div class='row'>
	        	<div class="col-md-3"></div>
	       		<div class="col-md-3">
	            	<img src="../Images/taiwan/map.png" id="taiwan" height="343" width="189" alt="">
	            </div>
	       	 	<div class="col-md-3">
	        	<div style="position:relative;margin-top:70px" > 
   					<img src="../Images/taiwan/button-red.png" style="width:160px;height:128px;" id="dog">
					<img src="../Images/taiwan/button.png" style="width:160px;height:128px;" id="yyyy">
				</div>
	        </div>
	       
	    </div>
	    </div>
</center>	    		

<!-- 隨機畫面 -->


<script src="../seetalertjs/sweet-alert.js"></script> 

<!-- 多加這個讓地圖不會吃到footer -->
<div class="row"></div>	

<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  


<script type="text/javascript">   
(function ($) {
	//******昱豪 登入處裡*****************************
	
	var sionLog = "<%=sionLoginId%>";
	if(sionLog == "null"){
 		//$(".navbar-right a[class != 'noChange'] ").prop("href","P0_login/login.jsp");
		$(".navbar-right a[class != 'noChange'] ").prop("href","#");
		$("a[name != 'indexLoginBtn']").click(function(){
			//alert("請先登入會員!!");
			sweetAlert("此功能需先行登入會員!!","","warning");
			$("#ok_sweetAlert").click(function(){
				window.location.href='http://'+ serverName +':'+ serverPort + contextPath +'/P0_login/login.jsp';
			});
				
		});
	}
	//******昱豪 登入處裡*****************************
	
	
	
	
	
	
	
	    var interval = null;
	    var cnt = 'false';
	    var radnum = 0;
	    $('#yyyy').click(function() {
            $('#dog').animate({top:10,}, 500);
            if (cnt == 'false') {
	            $('#taiwan').prop('src', '../Images/taiwan/map.png');

	            cnt = 'true';
	            interval = setInterval(function() {
// 	                radnum = radnum + 1;
					radnum=Math.floor(Math.random()*(100-0));
// 	                console.log(radnum % 16);

	                if (radnum % 16 == 1) {
	                  $('#taiwan').prop('src', '../Images/taiwan/map01.png');


	                } else if (radnum % 16 == 2) {
	                    $('#taiwan').prop('src', '../Images/taiwan/map02.png');


	                } else if (radnum % 16 == 3) {
	                    $('#taiwan').prop('src', '../Images/taiwan/map03.png');


	                } else if (radnum % 16 == 4) {
	                    $('#taiwan').prop('src', '../Images/taiwan/map04.png');

	               
              		} else if (radnum % 16 == 5) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map05.png');

               		}else if (radnum % 16 == 6) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map06.png');

               		}else if (radnum %16 == 7) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map07.png');

               		}else if (radnum % 16 == 8) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map08.png');

               		}else if (radnum %16 == 9) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map09.png');

               		}else if (radnum %16 == 10) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map10.png');

               		}else if (radnum %16 == 11) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map11.png');

               		}else if (radnum %16 == 12) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map12.png');

               		}else if (radnum % 16 == 13) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map13.png');

               		}else if (radnum % 16 == 14) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map14.png');

               		}else if (radnum % 16 == 15) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map15.png');

               		}else if (radnum % 16 == 0) {
                    	$('#taiwan').prop('src', '../Images/taiwan/map16.png');

               		}

	            }, 100);
	        }
	        timer=setTimeout("window.location.href='<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P10_Random/Random_Rute.jsp'",3000);
	
        });
		
	    
	  //ScrollBar 畫面停留位置方法
    	$({myScrollTop:window.pageYOffset}).animate({myScrollTop:250}, {
    		  duration: 600,
    		  easing: 'swing',
    		  step: function(val) {
    		    window.scrollTo(0, val);
    		  }
    		});
    	//ScrollBar 畫面停留位置方法
    	
    	
    	
    	
    	$('#cooperationLink').click(function(e){
			if("${userLoginId}".length!=0){		
				e.preventDefault();
				var friendslist = new Array();
				var url = "../P4_MessageBoard/FrdServlet";
				//增加景點hitRate
				$.ajax({
					"type" : 'POST',
					"url" : url,
					"data" : {
						"action" : "GetFriends",
						"memID" : "${userLoginId}"
					},
					"dataType" : "json",
					"async" : false,
					"success" : function(datas) {
						friendslist = datas;
					}
				});
				$.each(friendslist, function(i, friend) {
					console.log(friend.friendID);
					console.log(friend.friendName);
					var friendop = $('<option></option>').val(
							friend.friendID).text(friend.friendName);
					$('#getFriends').append(friendop);
				});
				$('#textareamsgID').val("快點進來~大家都在等你囉!");
				dialogfriend.dialog("open");
			}
			//*************JKL 好友路徑規劃協作平台  END*************
		});
	
})(jQuery);

</script>
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
<!-- 路線協作平台 -->
<script type='text/javascript' src='../js/CoPlatform.js'  data-sionLoginId='<%= session.getAttribute("userLoginId") %>' data-serverPort = "<%= serverPort %>" data-serverName = "<%= serverName %>" data-contextPath = "<%= contextPath %>"></script>
<!-- 路線協作平台  --> 
</body>
</html>