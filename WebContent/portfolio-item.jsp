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
	
		viewnameService vnSvc = new viewnameService();
		int imgTop = vnSvc.getImgTop6Count();
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

    <!-- Header Carousel -->
<!--     <header id="myCarousel" class="carousel slide"> -->
<!--         Indicators -->
<!--         <ol class="carousel-indicators"> -->
<!--             <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!--             <li data-target="#myCarousel" data-slide-to="1"></li> -->
<!--             <li data-target="#myCarousel" data-slide-to="2"></li> -->
<!--         </ol> -->

<!--         <div class="carousel-inner"> -->
<!--             <div class="item active"> -->
<!--                 <div class="fill" style="background-image:url('Images/E_Changhong Bridge_01.bmp');"></div> -->
<!--                 <div class="carousel-caption"> -->
<!--                     <h2>Caption 1</h2> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="item"> -->
<!--                 <div class="fill" style="background-image:url('Images/E_Changhong Bridge_02.bmp');"></div> -->
<!--                 <div class="carousel-caption"> -->
<!--                     <h2>Caption 2</h2> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="item"> -->
<!--                 <div class="fill" style="background-image:url('Images/E_Changhong Bridge_03.bmp');"></div> -->
<!--                 <div class="carousel-caption"> -->
<!--                     <h2>Caption 3</h2> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->

<!--         <a class="left carousel-control" href="#myCarousel" data-slide="prev"> -->
<!--             <span class="icon-prev"></span> -->
<!--         </a> -->
<!--         <a class="right carousel-control" href="#myCarousel" data-slide="next"> -->
<!--             <span class="icon-next"></span> -->
<!--         </a> -->
<!--     </header> -->

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
                <h1 class="page-header">Portfolio Item
                    <small>Subheading</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">Portfolio Item</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Item Row -->
        <div class="row">
			<div class="col-md-1"></div>
            <div class="col-md-5">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-responsive" src="Images/N_Bali_01.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="Images/C_Oiwake_Station_01.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="Images/C_Dajiamazu_01.jpg" alt="">
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
			<div class="col-md-1"></div>
            <div class="col-md-4">
                <h3>Project Description</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
                <h3>Project Details</h3>
                <ul>
                    <li>Lorem Ipsum</li>
                    <li>Dolor Sit Amet</li>
                    <li>Consectetur</li>
                    <li>Adipiscing Elit</li>
                </ul>
            </div>

        </div>

        

        <hr>

        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-lg btn-default btn-block" href="#">Call to Action</a>
                </div>
            </div>
        </div>

        <hr>

    </div>


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

    </div><!-- end container -->

 
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


	})(jQuery);
	//***********昱豪***********
</script>
</body>
</html>