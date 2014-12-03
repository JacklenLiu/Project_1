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
	
	<!--   lightbox js -->
  		<script src="js/lightbox.min.js"></script>
  	<!--   lightbox css -->	
  		<link href="css/lightbox.css" rel="stylesheet" />
	
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
                            	<a href="P10_Random/Random.jsp" class="noChange"  name="indexLoginBtn">隨機旅程</a> 
                           	</li>
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
           							 <a href="http://<%=serverName%>:<%=serverPort%><%=contextPath%>/P2_route/viewnameServlet?action=GetRouteByMemID&reflash=true&memID=${userLoginId}">我的路線</a>
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
		<!-- Portfolio Section -->
		<center>
        <div class="row">
            <div class="col-lg-12">
               	 <h3 class="page-header"> ＊~景點熱搜排行榜~＊</h3>
            </div>
            <div class="col-md-2">
            
            	<a class="example-image-link noChange" href="" data-lightbox="example-set" data-title="" name="indexLoginBtn">
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none;"/>
                	<img src="Images/1.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/1.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/1.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
            
            
            
<!--                 <a href="portfolio-item.html" > -->
<!--                     <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt=""  style="width:170px;height:170px;float:none;"> -->
<!--                 	<img src="Images/1.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;"> -->
<!--                 </a> -->
            </div>
            <div class="col-md-2">
            
            	<a class="example-image-link noChange" href="" data-lightbox="example-set2" data-title="" name="indexLoginBtn">
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none;"/>
                	<img src="Images/2.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set2" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/2.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set2" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/2.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
            
<!--                 <a href="portfolio-item.html" > -->
<!--                     <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt=""  style="width:170px;height:170px;float:none;"> -->
<!--                     <img src="Images/2.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;"> -->
<!--                 </a> -->
            </div>
            <div class="col-md-2">
            
            	<a class="example-image-link noChange" href="" data-lightbox="example-set3" data-title="" name="indexLoginBtn">
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none;"/>
                	<img src="Images/3.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set3" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/3.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set3" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/3.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
            
<!--                 <a href="portfolio-item.html"> -->
<!--                     <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt="" style="width:170px;height:170px;"> -->
<!--                     <img src="Images/3.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;"> -->
<!--                 </a> -->
            </div>
            <div class="col-md-2">
            
            	<a class="example-image-link noChange" href="" data-lightbox="example-set4" data-title="" name="indexLoginBtn">
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none;"/>
                	<img src="Images/4.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set4" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/4.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set4" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/4.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
            
<!--                 <a href="portfolio-item.html"> -->
<!--                     <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt="" style="width:170px;height:170px;"> -->
<!--                     <img src="Images/4.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;"> -->
<!--                 </a> -->
            </div>
            <div class="col-md-2">
            
            	<a class="example-image-link noChange" href="" data-lightbox="example-set5" data-title="" name="indexLoginBtn">
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none;"/>
                	<img src="Images/5.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set5" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/5.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set5" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/5.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
            
<!--                 <a href="portfolio-item.html"> -->
<!--                     <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt="" style="width:170px;height:170px;"> -->
<!--                     <img src="Images/5.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;"> -->
<!--                 </a> -->
            </div>
            <div class="col-md-2">
            
            	<a class="example-image-link noChange" href="" data-lightbox="example-set6" data-title="" name="indexLoginBtn">
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none;"/>
                	<img src="Images/6.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set6" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/6.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
                <a class="example-image-link noChange" href="" data-lightbox="example-set6" data-title="" name="indexLoginBtn" hidden>
                	<img class="img-responsive img-portfolio img-hover img-circle tooltips example-image" src="" alt="" style="width:170px;height:170px;float:none; hidden"/>
                	<img src="Images/6.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute; hidden">
                </a>
            
<!--                 <a href="portfolio-item.html"> -->
<!--                     <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt="" style="width:170px;height:170px;"> -->
<!--                     <img src="Images/6.png" style="margin-top:-215px;margin-left:-85px;width:60px;hieght:60px;position:absolute;"> -->
<!--                 </a> -->
            </div>
        </div>
        </center>
        
        <!-- Marketing Icons Section -->
        <div class="row">
<!--             <div class="col-lg-12"> -->
<!--                 <h1 class="page-header"></h1> -->
<!--             </div> -->
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color:#67B0D1">
                        <h4 class="topNewsEgy"><i class="fa fa-thumbs-up "></i> 熱門景點排行榜</h4>
                    </div>
                    <div class="panel-body leaderboard">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color:#67B0D1">
                        <h4 class="topNewsEgy"><i class="fa fa-bullhorn"></i> 最新消息</h4>
                    </div>
                    <div class="panel-body news">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color:#67B0D1">
                        <h4 class="topNewsEgy"><i class="fa fa-plus-square"></i> 急救知識補給站</h4>
                    </div>
                    <div class="panel-body knowledge">
<!--                        <a href="#"><p>※濕搓沖捧擦</p></a> -->
<!--                        <a href="#"><p>※沖脫泡蓋送</p></a> -->
<!--                        <a href="#"><p>※叫叫ABC</p></a> -->
                       
<!--                        <a href="#" class="btn btn-default">Learn More</a> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        

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

		var inviteCount = "${invite_count}";
    	if(inviteCount != 0 ){
    		$("#friendManage").html("<b>${invite_count}</b>").css("color","blue");
    	}

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
    	
    	//********昱豪   註冊處裡********
    	var register = "<%=session.getAttribute("current")%>";
    	
    	if(register != "null" ){
    		$("#dialog-message").dialog({
  		      modal: true,
  		      buttons: {
  		        Ok: function() {
  		          $( this ).dialog( "close" );
  		        }
  		      }
  		    });
    		$(".ui-dialog-titlebar-close").html("<img src='Images/dialog_close.png' />");
// 			sweetAlert("此功能需先行登入會員!!","","warning");
    		<%session.setAttribute("current",null);%>
    	}
    	//********昱豪   註冊處裡********
    	
    	//********昱豪  修改個人資料處裡********
		var updateSession = "<%=session.getAttribute("updateCurrent")%>";
    	
    	if(updateSession != "null" ){
    		$("#dialog-update").dialog({
  		      modal: true,
  		      buttons: {
  		        Ok: function() {
  		          $( this ).dialog( "close" );
  		        }
  		      }
  		    });
    		$(".ui-dialog-titlebar-close").html("<img src='Images/dialog_close.png' />");
    		<%session.setAttribute("updateCurrent",null);%>
    	}
    	
    	//********昱豪  修改個人資料處裡********
    	
    	//***************昱豪_抓排行榜圖片***************
    	
//     	//$('#gallery').empty();//clear images in maindiv
// 		var leaderboardUrl = "ImgTop6servlet";
//        	$.getJSON(leaderboardUrl,{'action':'GetImgTop6'}, function(datas){
//        		$.each(datas,function(i,item){
//   				$('.col-md-2:nth-child('+(i+2)+') > a > img:nth-child(1)').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ item.imagesID).attr("title",item.viewname);
//        		});
//        	});

		    	//$('#gallery').empty();//clear images in maindiv
		var leaderboardUrl = "ImgTop6servlet";
       	$.getJSON(leaderboardUrl,{'action':'GetImgTop6'}, function(datas){
       		$.each(datas,function(i,item){
       			
       			var string			= item.imagesID; //字串
       			var target 			= "1"; //準備替代的文字, 可用 | 代表or
       			var myRegExp 		= new RegExp(target, 'g'); //轉換成正規表示
       			var replaceText 	= "2"; //準備替換成的文字
       			var new_string 		= string.replace(myRegExp, replaceText); //開始替換
//        			alert(new_string);
       			
//        			var string			= item.imagesID; //字串
       			var target 			= "2"; //準備替代的文字, 可用 | 代表or
       			var myRegExp2 		= new RegExp(target, 'g'); //轉換成正規表示
       			var replaceText 	= "3"; //準備替換成的文字
       			var new_string2 		= new_string.replace(myRegExp2, replaceText); //開始替換
//        			alert(new_string2);
       			
       			
       			$('.col-md-2:nth-child('+(i+2)+') > a:nth-child(1)').attr("href",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ item.imagesID).attr("title",item.viewname);
       			$('.col-md-2:nth-child('+(i+2)+') > a:nth-child(2)').attr("href",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ new_string).attr("title",item.viewname);
       			$('.col-md-2:nth-child('+(i+2)+') > a:nth-child(3)').attr("href",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ new_string2).attr("title",item.viewname);
  				
  				$('.col-md-2:nth-child('+(i+2)+') > a > img:nth-child(1)').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ item.imagesID).attr("title",item.viewname);
       		});
       	});
    
      //***************昱豪_抓排行榜圖片***************
      
      //***************昱豪_Server Send Event***************
    	var sourceTop6 = new EventSource('P2_route/getIndexTop6.jsp?count='+<%=imgTop%>);
      	sourceTop6.addEventListener('message', function(e) {
			  if((e.data)!=<%=imgTop%>){
				  $.getJSON(leaderboardUrl,{'action':'GetImgTop6'}, function(datas){
			       		$.each(datas,function(i,item){
			       			$('.col-md-2:nth-child('+(i+2)+') > a > img:nth-child(1)').empty();
			  				$('.col-md-2:nth-child('+(i+2)+') > a > img:nth-child(1)').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ item.imagesID).attr("title",item.viewname);
			       		});
			       	});
			  }
			}, false);
      //***************昱豪_Server Send Event***************
      
      //***************昱豪_抓排行榜文字欄***************
      $.getJSON(leaderboardUrl,{'action':'GetTop6'}, function(datas){
       		$.each(datas,function(i,item){
  				//$('.col-sm-6:nth-child('+(i+2)+') > a > img:nth-child(1)').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ item.imagesID);
  				$(".leaderboard").append("<a href='#'>");
  				$(".leaderboard > a:nth-child(" + (i+1) + ")").attr("name","indexLoginBtn");
       			//P3_TravelDiary/TravelDiaryServlet?action=blog.do
       			//<a href=""><p>※2014/10/10 陽明山海芋季，快來看看</p></a>
       			//$(".news > a:nth-child(1)").attr("href","http://tw.yahoo.com");
//        			$(".leaderboard > a:nth-child(" + (i+1) + ")").attr("href",'http://'+ serverName +':'+ serverPort + contextPath +'/GetLeaderServlet?leaderId='+ item.imagesID);
				$(".leaderboard > a:nth-child(" + (i+1) + ")").attr("href",'http://'+ serverName +':'+ serverPort + contextPath +'/P2_route/viewnameServlet?action=imgCarousel&changeImg=' + item.imagesID+'&top='+(i+1));
       			$(".leaderboard > a:nth-child(" + (i+1) + ")").append("<p>※&nbsp;&nbsp;第"+(i+1)+"名&nbsp;&nbsp;" + item.viewname + "&nbsp;</p>");
       			//$(".news").append("</a>");	
       		});
       	});
      //***************昱豪_抓排行榜文字欄***************
      
      //***************昱豪_抓急救小知識***************
      var knowledgeUrl = "getKnowledgeServlet";
      $.getJSON(knowledgeUrl,{'action':'getKnowledge'}, function(datas){
       		$.each(datas,function(i,item){
  				$(".knowledge").append("<a href='#'>");
       			$(".knowledge > a:nth-child(" + (i+1) + ")").attr("href",'http://'+ serverName +':'+ serverPort + contextPath +'/knowledgeServlet?knowledge='+ item.knowledge_identity);
       			$(".knowledge > a:nth-child(" + (i+1) + ")").append("<p>※&nbsp;&nbsp;" + item.knowledge_title + "&nbsp;</p>");
       		});
       	});
      //***************昱豪_抓急救小知識***************
      
       	//***************昱豪_抓最新消息***************
       	var newsUrl = "newsTop6Servlet";
       	$.getJSON(newsUrl,{'action':'GetNewsTop6'}, function(datas){
       		$.each(datas,function(i,item){
       			$(".news").append("<a href='#'>");
       			//P3_TravelDiary/TravelDiaryServlet?action=blog.do
       			//<a href=""><p>※2014/10/10 陽明山海芋季，快來看看</p></a>
       			//$(".news > a:nth-child(1)").attr("href","http://tw.yahoo.com");
       			$(".news > a:nth-child(" + (i+1) + ")").attr("href",'http://'+ serverName +':'+ serverPort + contextPath +'/newsServlet?newsId=' + (i+1));
       			$(".news > a:nth-child(" + (i+1) + ")").append("<p>※&nbsp;&nbsp;" + item.news_date + "&nbsp;&nbsp;" + item.news_title + "</p>");
       			//$(".news").append("</a>");
       		});
       	});
       	//****************昱豪_抓最新消息***************
       	
       	
       	
       	
      	//***********昱豪_滑鼠移入出現div***********
	    /*設定tooltip的div區塊和滑鼠指標之間的距離,x軸距及y軸距,避免tooltip的div和滑鼠指標太接近*/
			var x = 10;
	        var y = -45;
        
        /*指定TagName為a且其CalssName=tooltip的Tag,當滑鼠移到其上面時進行函式動作*/
        $(".tooltips").mouseover(function(e){
			
        /*將此Tag的title的值給予到newTitle,接著將title的值空白,避免滑鼠移到Tag時,同時出現tooltip及title的效果*/
            this.newTitle = this.title;
        	if(this.newTitle != ""){
        		this.title = "";
        	}
        /*建立tooltip用來儲存你要顯示的內容,而內容就是由div區塊所組成;這範例是用文字來作,你要的圖片效果,只要在div中加入<img src>*/
            var tooltip = "<div id='tooltip'>"+ this.newTitle +"<\/div>";

        /*利用.append()把這段div加到body,而條件就是: 當滑鼠指標移動你指定的Tag的範圍時,才會加入*/
            $("body").append(tooltip);

        /*利用.css()設定tooltip的css,其中e.pageY及e.pageX就是滑鼠指標的座標,避免tooltip和滑鼠指標太靠近,後面加上前面設定的x及y*/
             $("#tooltip").css({
                                "top": 	(e.pageY+y)  + "px" ,
                                "left": (e.pageX+x)  + "px"
                        /*利用.show()讓tooltip這段div區塊顯示*/
                        	}).show("fast");

        /*當滑鼠移開時,將newTitle的值還給title,並且利用.remove()將tooltip這段div區塊移除*/
        }).mouseout(function(){
        	if(this.newTitle != ""){
             	this.title = this.newTitle;
        	}
            $("#tooltip").remove();

        /*當滑鼠指標在指定的Tag範圍內移動時,tooltip的div區塊也會隨著滑鼠指標作移動*/
        }).mousemove(function(e){
             $("#tooltip").css({
                                "top":  (e.pageY+y)  + "px" ,
                                "left": (e.pageX+x)  + "px"
                       		 });
        });
		//***********昱豪_滑鼠移入出現div*********** 
       	
		
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
</script>
</body>
</html>