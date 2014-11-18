<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="20000kb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	 <%@ include file="../platform/include_title.jsp" %>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- jQuery Version 1.11.0 -->
	<script src="js/jquery-1.11.0.js"></script> 
	
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
	body {
    	background-image: url("Images/backgound.png");
	}
	#indexBtn > a {
		font-size:24px;color:blue;font-weight:bold;
	}
	#indexBtn > a:hover{
		color:yellow;
	}
	.rowHeader{
		background-color:#DDDDDD;
	}
	#tooltip{
        position:absolute;
        border:5px outset red;
        background:#f7f5d1;
        padding:1px;
        color:red;
        display:none;
		font-size:26px;
		border-radius:15px;
	}
</style>
	
</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
                  			<a href="P0_login/login.jsp" name="indexLoginBtn">登入</a>
                  	 	</li>
                  	</c:if>
                   	<li class="dropdown">
                       	<a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                       	<ul class="dropdown-menu">
                        	<li>
                            	<a href="P2_route/route_plan.jsp">路經規劃</a> 
                           	</li>
                           	<li>
                              	<a href="portfolio-3-col.html">3 Column Portfolio</a>
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
                        <a href="P6_ContactUs/ContactUs.jsp" class="dropdown-toggle" data-toggle="dropdown">聯絡我們<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="P6_ContactUs/ContactUs.jsp" class="noChange">聯絡我們</a>
                            </li>
                            <li>
                                <a href="sidebar.html">Sidebar Page</a>
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
                    		<a href="#"  class="dropdown-toggle" data-toggle="dropdown"  style="color:red;">
                    		會員，<%=sionName%>你好<b class="caret"></b></a>
                 			<ul class="dropdown-menu">
		                       <li>
		                           <a href="P1_iud/userProfile.jsp">會員基本資料修改</a>
		                       </li>
		                       <li>
		                           <a href="portfolio-2-col.html">會員好友管理</a>
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
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Welcome to Modern Business
                </h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> 熱門景點排行榜</h4>
                    </div>
                    <div class="panel-body leaderboard">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> 最新消息</h4>
                    </div>
                    <div class="panel-body news">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i>急救知識補給站</h4>
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

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Portfolio Heading</h2>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html" >
                    <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt=""  style="width:350px;height:270px;float:none;">
                	<img src="Images/1.png" style="margin-top:-325px;margin-left:-15px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html" >
                    <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt=""  style="width:350px;height:270px;float:none;">
                    <img src="Images/2.png" style="margin-top:-325px;margin-left:-15px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt="" style="width:350px;height:270px;">
                    <img src="Images/3.png" style="margin-top:-325px;margin-left:-15px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt="" style="width:350px;height:270px;">
                    <img src="Images/4.png" style="margin-top:-325px;margin-left:-15px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt="" style="width:350px;height:270px;">
                    <img src="Images/5.png" style="margin-top:-325px;margin-left:-15px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover img-circle tooltips " src="" alt="" style="width:350px;height:270px;">
                    <img src="Images/6.png" style="margin-top:-325px;margin-left:-15px;width:100px;hieght:100px;position:absolute;">
                </a>
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

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    

<!-- Bootstrap Core JavaScript -->
<!-- <script src="js/bootstrap.min.js"></script>  -->
<script src="js/bootstrap.js"></script>
     
<!-- <script type="text/javascript" src="P0_login/js/jquery.validate.js"></script>  -->


<!-- Script to Activate the Carousel -->
<script>
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
   
   //***********昱豪*********** 
	(function($){   
		
		//******昱豪 登入處裡*****************************
			
    	var sionLog = "<%=sionLoginId%>";
    	if(sionLog == "null"){
    		//alert(sionName);
    		$(".navbar-right a[class != 'noChange'] ").prop("href","P0_login/login.jsp");
    		$("a[name != 'indexLoginBtn']").click(function(){
    			alert("請先登入會員!!");
    		});
    	}
    	//******昱豪 登入處裡*****************************
    	
    	
    	//***************昱豪_抓排行榜圖片***************
    	var serverName = "<%= request.getServerName()%>";
		var serverPort = "<%= request.getServerPort()%>";
		var contextPath = "<%= request.getContextPath()%>";
    	//$('#gallery').empty();//clear images in maindiv
		var leaderboardUrl = "ImgTop6servlet";
       	$.getJSON(leaderboardUrl,{'action':'GetImgTop6'}, function(datas){
       		$.each(datas,function(i,item){
  				$('.col-sm-6:nth-child('+(i+2)+') > a > img:nth-child(1)').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ item.imagesID).attr("title",item.viewname);
       		});
       	});
      //***************昱豪_抓排行榜圖片***************
      
      
      //***************昱豪_抓排行榜文字欄***************
      $.getJSON(leaderboardUrl,{'action':'GetTop6'}, function(datas){
       		$.each(datas,function(i,item){
  				//$('.col-sm-6:nth-child('+(i+2)+') > a > img:nth-child(1)').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ item.imagesID);
  				$(".leaderboard").append("<a href='#'>");
       			//P3_TravelDiary/TravelDiaryServlet?action=blog.do
       			//<a href=""><p>※2014/10/10 陽明山海芋季，快來看看</p></a>
       			//$(".news > a:nth-child(1)").attr("href","http://tw.yahoo.com");
       			$(".leaderboard > a:nth-child(" + (i+1) + ")").attr("href",'http://'+ serverName +':'+ serverPort + contextPath +'/GetLeaderServlet?leaderId='+ item.imagesID);
       			$(".leaderboard > a:nth-child(" + (i+1) + ")").append("<p>※第"+(i+1)+"名&nbsp;&nbsp;" + item.viewname + "&nbsp;</p>");
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
       			$(".news > a:nth-child(" + (i+1) + ")").append("<p>※" + item.news_date + "&nbsp;&nbsp;" + item.news_title + "</p>");
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
       	
       	
       	
	 })(jQuery);
	//***********昱豪*********** 
    
    </script>

</body>

</html>
