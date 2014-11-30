<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="20000kb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<%@ include file="platform/include_title.jsp" %>
	<%@ page import="P1_iud.model.*,P2_route.model.*"%>
	<%
		if(sionName != null){
			MemberService memSvc = new MemberService();
		 	String userId = (String)session.getAttribute("userLoginId"); 
			MemberVO list = memSvc.getOneMem(userId);
			session.setAttribute("userName",list.getMember_name());
		}
		String imagesIdPK = session.getAttribute("changeImg").toString();
		String imagesID =imagesIdPK.substring(0, imagesIdPK.lastIndexOf("_"));
		String topName = session.getAttribute("top").toString();
		viewnameService vnSvc = new viewnameService();
		List<viewnameVO> vnVO = vnSvc.getImgDescript(imagesID);
		pageContext.setAttribute("vnVO",vnVO);
	%>
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- jQuery Version 1.11.0 -->
	<script src="js/jquery-1.11.0.js"></script> 
	
	<link rel="stylesheet" href="seeetalertcss/sweet-alert.css">
	
	<!-- footercss -->
	<link href="footercss/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  
  
<style>

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
    	background-image: url("Images/backgound.png");
	}
	#indexBtn > a {
		font-size:24px;color:#FFF;font-weight:bold;
	}
	#indexBtn > a:hover{
		color:black;
	}
	.rowHeader{
		background-color:#67B0D1;
	}
	#tooltip{
        position:absolute;
        /*border:3px outset black;*/
        background:#003377;
        padding:1px;
        color:white;
        display:none;
		font-size:26px;
		border-radius:15px;
	}
	.marquee {
/*   		 width: 300px; */
  		overflow: hidden;
/*  		 border: 1px solid #ccc; */
/*  		 background: #DDDDDD; */
  		color: #FF5511;
  		background-image: url("Images/backgound.png");
	}
	.hide-bullets {
		list-style:none;
		margin-left: -40px;
		margin-top:20px;
	}
</style>
<style>	
	.navbar-nav > li > a{
		color:#FFF;
	}
	
	.topNewsEgy{
		color:#FFF;
	}
	
	/*navbar btn hover過去方塊顏色 */	
	.nav .open > a,
	.nav .open > a:hover,
	.nav .open > a:focus {
 	 background-color: rgba(255, 255, 255, 0.2);
  	 border-color: #428bca;
	}
	/*navbar btn hover過去方塊顏色 */
	
	/*navbar btn 按下去方塊顏色*/
	.nav > li > a:hover,
	.nav > li > a:focus {
 		 text-decoration: none;
 		 background-color: rgba(255, 255, 255, 0.2);
	}
	/*/navbar btn 按下去方塊顏色*/
	
	/*因為navbar沒有用navbR-inverse並自己增加背景顏色所以漢堡顏色會被蓋去*/
	/*default navbar-toogle邊框、漢堡肉、背景、hover狀態*/
	.navbar-toggle{
  		border-color: #fff;
	}
	.navbar-toggle .icon-bar {
  		display: block;
  		width: 22px;
  		height: 2px;
 		border-radius: 1px;
 		background-color:#fff;
	}
	.navbar-toggle:hover{
		 background-color: #39a9d6;
	}
	/*/default navbar-toogle邊框、漢堡肉、背景、hover狀態*/

</style>

</head>

<body>

<!-- Navigation -->
<nav class="navbar  navbar-fixed-top" role="navigation">
	<div class="rowHeader">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header" id="indexBtn">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp" name="indexLoginBtn">下一站，幸福</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	<ul class="nav navbar-nav navbar-right">
                	<c:if test="<%=sionName == null%>">
                  		<li class="dropdown">
                  			<a href="P0_login/login.jsp" name="indexLoginBtn" class="noChange">登入</a>
                  	 	</li>
                  	</c:if>
                  	<li class="dropdown">
                  		<a href="P2_route/route_search.jsp" name="indexLoginBtn" class="noChange">景點介紹</a>
                  	</li>
                   	<li class="dropdown">
                       	<a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                       	<ul class="dropdown-menu">
                        	<li>
                            	<a href="P2_route/route_plan.jsp">路經規劃</a> 
                           	</li>
                           	<li>
<%--                               	<a href="P8_Websocket/Cooperation.jsp?memID=${userLoginId}">與好友同步規劃</a> --%>
                              	<a href="#" id="cooperationLink">與好友同步規劃</a>
                           	</li>
                           	<li>
                              	<a href="portfolio-4-col.html">4 Column Portfolio</a>
                           	</li>
                           	<li>
                              	<a href="portfolio-item.html">Single Portfolio Item</a>
                           	</li>
                       	</ul>
                   	</li>
                    <li class="dropdown">
                    	<a href="P4_MessageBoard/showALL.jsp">留言板</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href=".portfolio-1-col.html">1 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-2-col.html">2 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-3-col.html">3 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-4-col.html">4 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="ortfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        	<li>
			                	<a href="P3_TravelDiary/TravelDiaryServlet?action=blog.do">所有文章 </a>
			                </li>                         
                            <li>
                                <a href="P3_TravelDiary/blog_editor.jsp">發表新文章</a>
                            </li>
                            <li>
                                <a href="P3_TravelDiary/blog_manage.jsp">管理我的文章</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="P6_ContactUs/ContactUs.jsp" class="dropdown-toggle noChange" data-toggle="dropdown" name="indexLoginBtn">聯絡我們<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="P6_ContactUs/ContactUs.jsp" class="noChange" name="indexLoginBtn">聯絡我們</a>
                            </li>
                            <li>
                                <a href="faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="404.html">404</a>
                            </li>
                            <li>
                                <a href="pricing.html">Pricing Table</a>
                            </li>
                        </ul>
                    </li>
                    <c:if test="<%=sionName != null%>">
                 		<li class="dropdown">
                    		<a href="#"  class="dropdown-toggle" data-toggle="dropdown">
                    		<i class="fa fa-user"></i><%=sionName%>你好<b class="caret"></b></a>
                 			<ul class="dropdown-menu">
		                       	<li>
		                           <a href="P1_iud/userProfile.jsp">會員基本資料</a>
		                       	</li>
		                      	<li>
		                           	<a href="P4_MessageBoard/SeekFriend2.jsp">會員好友管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                           		<span id="friendManage"></span>
		                           	</a>
		                       	</li>
		                        <li>
           							 <a href="http://<%=serverName%>:<%=serverPort%><%=contextPath%>/P2_route/viewnameServlet?action=GetRouteByMemID&memID=${userLoginId}">我的路線</a>
        					 	</li>
		                       	<li>
		                           <a href="LoginServlet?action=logOut">登出系統</a>
		                       	</li>
                  			</ul>
                     	</li>		
                  	</c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
		</div>
        <!--  end row  -->
    </div>
	<!-- /.container -->
</nav>

<!-- 照片輪播 -->
<%@ include file="platform/index_Use/include_picture.jsp" %> 
<!-- 照片輪播 -->

    <!-- Page Content -->
<!--     <div class="col-lg-12"> -->
<!-- 		<h1 class="page-header marquee">歡迎光臨<b style='color:red;'>下一站，幸福</b>網</h1> -->
<!--     </div> -->
   <div class="container">
		 <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="color:red;">景點熱搜排行榜，第&nbsp;<b><%=topName %></b>&nbsp;名
                </h1>
<!--                 <ol class="breadcrumb"> -->
<!--                     <li><a href="index.html">Home</a> -->
<!--                     </li> -->
<!--                     <li class="active">Portfolio Item</li> -->
<!--                 </ol> -->
            </div>
        </div>
        <!-- /.row -->

 		<div id="main_area">
                <!-- Slider -->
                <div class="row">
                    <div class="col-xs-12" id="slider">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-8" id="carousel-bounding-box">
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <div class="active item" data-slide-number="0">
                                        <img src='http://<%=serverName%>:<%= serverPort%><%= contextPath%>/GetLeaderServlet?leaderId=<%=imagesID%>_01' style="width:750px;height:400px;"></div>

                                        <div class="item" data-slide-number="1">
                                        <img src='http://<%=serverName%>:<%= serverPort%><%= contextPath%>/GetLeaderServlet?leaderId=<%=imagesID%>_02' style="width:750px;height:400px;"></div>

                                        <div class="item" data-slide-number="2">
                                        <img src='http://<%=serverName%>:<%= serverPort%><%= contextPath%>/GetLeaderServlet?leaderId=<%=imagesID%>_03' style="width:750px;height:400px;"></div>

                                    </div><!-- Carousel nav -->
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                    </div>
                            </div>

                            <div class="col-sm-4" id="carousel-text"></div>
							
	                            <div id="slide-content" style="display: none;">
	                            	<%int descript = 0; %>
	                             	<c:forEach var="vnVO" items="${vnVO}"> --%>
		                                <div id="slide-content-<%=descript%>">
		                                    <h1 style="color:red;"><b>${vnVO.viewname}</b></h1>
		                                    <p style="font-size:18px;"><b>${vnVO.img_Descript}</b></p>
		                                </div>
										<%descript++; %>
	                            	</c:forEach> 
	                            </div>
                        </div>
                    </div>
                </div><!--/Slider-->

                <div class="row hidden-xs" id="slider-thumbs">
                        <!-- Bottom switcher of slider -->
                        <ul class="hide-bullets">
                            <li class="col-sm-4">
                                <a class="thumbnail" id="carousel-selector-0"><img src='http://<%=serverName%>:<%= serverPort%><%= contextPath%>/GetLeaderServlet?leaderId=<%=imagesID%>_01' style="width:350px;height:150px;"></a>
                            </li>

                            <li class="col-sm-4">
                                <a class="thumbnail" id="carousel-selector-1"><img src='http://<%=serverName%>:<%= serverPort%><%= contextPath%>/GetLeaderServlet?leaderId=<%=imagesID%>_02' style="width:350px;height:150px;"></a>
                            </li>

                            <li class="col-sm-4">
                                <a class="thumbnail" id="carousel-selector-2"><img src='http://<%=serverName%>:<%= serverPort%><%= contextPath%>/GetLeaderServlet?leaderId=<%=imagesID%>_03' style="width:350px;height:150px;"></a>
                            </li>
                        </ul>                 
                </div>
        </div>
    <hr>
    
</div><!-- end container -->
<!-- 把用到的超連結id="intro" 放到picture_body內 就可以動了..    要去修改margin 不然底下會空白 -->
	<footer>
        <div class="container" >
            <div class="row">
            <div class="col-md-3 col-lg-3">
             <div class="col-md-1 col-lg-1"><img src="Images/LineQRCode.png"></div>
             </div>
                <div class="col-md-6 col-lg-6">
                    <div class="wow shake" data-wow-delay="0.4s">
                    <div class="page-scroll marginbot-30">
                        <a href="#intro" id="totop" class="btn btn-circle noChange" name="indexLoginBtn">
                            <i class="fa fa-angle-double-up animated "></i>
                        </a>
                    </div>
                    </div>
                    <p>&copy;Copyright 2014 - Next Travel. All rights reserved.</p>
                </div>
            </div>  
        </div>
    </footer>  
 
<div id="dialog-message" title="註冊成功"  hidden>
  <h5>
    <span class="ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
   	恭喜您，註冊成功，請重新登入!
  </h5>
</div>
<div id="dialog-update" title="修改個人資料成功"  hidden>
  <h5>
    <span class="ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
   	您修改的個人資料已成功，請牢記您的密碼!!
  </h5>
</div>
<div id="dialog-addFriend" title="邀請好友" hidden>
		<span>
			<h4 style="display:inline">選擇好友</h4> 
			<select class="selectpicker show-menu-arrow" id="getFriends"></select>
			<input type="button" id="addToFriend" value="+" />
		</span>
		<br>
		<div id="friendDiv" style="width:90%;"></div>
		<h4>說些什麼...</h4>
  <textarea id="textareamsgID" rows="4" cols="25">快點進來~大家都在等你囉!</textarea>
</div>
<div id="dialog-checkCoFromFrd" title="你朋友找你" hidden>
		<h4>好友邀你</h4> 
</div>

<!-- 線上客服 -->
	<div id="abgne_float_ad" >
		<a href="" class="noChange" name="indexLoginBtn">
			<img src="platform/include_sticker/sticker_pic/onlinepic.png" id="openService" >
		</a>
	</div>

<%@ include file="platform/include_sticker/include_sticker_index.jsp" %> 	
<!-- 線上客服用 -->


<!-- Bootstrap Core JavaScript -->
<!-- <script src="js/bootstrap.min.js"></script>  -->
<script src="js/bootstrap.js"></script>
<script src="seetalertjs/sweet-alert.js"></script> 

<!-- footer可以往上rooler效果 -->
<script src="footerjs/wow.min.js"></script>
<script src="footerjs/custom.js"></script>
<script src="footerjs/jquery.easing.min.js"></script>
<!-- 可以往上rooler效果 -->
 
<!-- <script type="text/javascript" src="P0_login/js/jquery.validate.js"></script>  -->
<!-- Script to Activate the Carousel -->
<script type='text/javascript' src='js/1.3.1_jquery.marquee.min.js'></script>
<!-- 路線協作平台 -->
<%-- <script type='text/javascript' src='js/CoPlatform.js'  data-sionLoginId='<%= sionLoginId %>'></script> --%>
<!-- 路線協作平台  -->
<script>
$(function() {
	$('.marquee').marquee({duration: 12000});	
    
  
	//照片輪播間格秒數
//     $('.carousel').carousel({
//         interval: 5000 //changes the speed
//     });
  //照片輪播間格秒數
  
  //上方工具列滑鼠滑入自動彈出
    $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });
  //上方工具列滑鼠滑入自動彈出
});

   //***********昱豪*********** 
	(function($){   
		var serverName = "<%= request.getServerName()%>";
		var serverPort = "<%= request.getServerPort()%>";
		var contextPath = "<%= request.getContextPath()%>";
		var sionLoginId = "<%= sionLoginId %>"; //aa123

//*************JKL 好友路徑規劃協作平台  START*************
		
		//檢查是否有帶規劃協作平台事件
		var frdplatform = "";
		var dialogCoFromFrd= $("#dialog-checkCoFromFrd").dialog({
			  autoOpen: false,
		      modal: true,
		      buttons: {
		      	 "加入GO": function() {
		      		 		source.close();
		      		 		var url = "P4_MessageBoard/FrdServlet";
		        			$.post(url, {"action":"FrdclearCoNotify","memID":"${userLoginId}"},function(data){
		        				$("#dialog-checkCoFromFrd").dialog("close");
		        				window.location.href="P8_Websocket/Cooperation.jsp?memID="+ frdplatform;
		        			});
		      			},
		        "我才不想去咧": function(){
		        			source.close();
		        			var url = "P4_MessageBoard/FrdServlet";
		        			$.post(url, {"action":"FrdclearCoNotify","memID":"${userLoginId}"},function(data){
		        				$("#dialog-checkCoFromFrd").dialog("close");
		        			});
		        	   }
		      }
		  });	
		
		var source = new EventSource('platform/getRes.jsp?memID=${userLoginId}');
		source.addEventListener('message', function(e) {
			  if((e.data).length!=0){
				  console.log(e.data);
				  var notifymsg = JSON.parse(e.data);
				  frdplatform = notifymsg.cooperation_friend;
				  $('#dialog-checkCoFromFrd').dialog('option', 'title', notifymsg.frdName+' 邀請你一起規劃路線');
				  $('#dialog-checkCoFromFrd > h4').text(notifymsg.invite_msg);
				  
				  dialogCoFromFrd.dialog("open");	  
			  }
			}, false);
		
		
		//開啟好友路徑規劃協作平台
		var dialogfriend= $("#dialog-addFriend").dialog({
			  autoOpen: false,
		      modal: true,
		      buttons: {
		      	 "開始討論GO": function() {
		      		var friendids = new Array();
		      		var friends = $('#friendDiv label');
		      		console.log(friends);
		      		$.each(friends, function(i, friend){
		      			friendids[i] = $(friend).attr("id");
		      		});
		      		var url = "P4_MessageBoard/FrdServlet";
		      		$.ajax({
	            		"type": 'POST',
	              		"url": url,
	              		"data": {"action":"UpdateCoNotify", "memID": "${userLoginId}","frdID":JSON.stringify(friendids),"msg":$('#textareamsgID').val()},
	              		"dataType":"text",
	              		"async":false,
	              		"success":function(datas){
	              			console.log(datas);
	              			
	             		}
	             	});
		      		$('#getFriends').empty();
		      		$('#friendDiv').empty();
		      		$( this ).dialog( "close" );
          			window.location.href="P8_Websocket/Cooperation.jsp?memID=${userLoginId}";
		      			},
		        	 "取消": function(){
		        		    $('#getFriends').empty();
		        		 	$('#friendDiv').empty();
		        			$( this ).dialog( "close" );
		        	   }
		      }
		  });
		
		//加入協作好友列表
		$('#addToFriend').click(function(e){
			var labObj = $('<label></label>').attr("id", $('#getFriends :selected').val())
											 .text($('#getFriends :selected').text())
											 .css("margin","2px");
			$('#getFriends :selected').remove();
			$('#friendDiv').append(labObj);
		});
		
		$('#cooperationLink').click(function(e){
			if("${userLoginId}".length!=0){		
				e.preventDefault();
				var friendslist = new Array();
				var url = "P4_MessageBoard/FrdServlet";
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
   
	//***********昱豪***********
	
	
	 jQuery(document).ready(function($) {
 
        $('#myCarousel').carousel({
                interval: 5000
        });
 
        $('#carousel-text').html($('#slide-content-0').html());
 
        //Handles the carousel thumbnails
        $('[id^=carousel-selector-]').click( function(){
                var id_selector = $(this).attr("id");
                var id = selectorId.substr(selectorId.lastIndexOf("-") + 1);
                var id = parseInt(id);
                $('#myCarousel').carousel(id);
        });
 
 
        // When the carousel slides, auto update the text
        $('#myCarousel').on('slid.bs.carousel', function (e) {
                 var id = $('.item.active').data('slide-number');
                $('#carousel-text').html($('#slide-content-'+id).html());
        });
	});
</script>
</body>
</html>