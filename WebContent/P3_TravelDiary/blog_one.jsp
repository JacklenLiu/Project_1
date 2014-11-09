<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 的 RWD 套件 -->
    <!-- 載入Bootstrap css樣式 -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- 圖案icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <title>Hello Bootstrap</title>


		

<!-- wookmark -->
    <!-- CSS Reset -->
    <link rel="stylesheet" href="wookmarkcss/reset.css">

    <!-- Global CSS for the page and tiles -->
    <link rel="stylesheet" href="wookmarkcss/main.css">

    <!-- Specific CSS for the example -->
<!-- /wookmark -->



<!-- css設定 -->
    <style>
    /**
     * Grid items
     */
    
    #tiles li {
        -webkit-transition: all 0.3s ease-out;
        -moz-transition: all 0.3s ease-out;
        -o-transition: all 0.3s ease-out;
        transition: all 0.3s ease-out;
    }
    
    
    
    .boxer {
	box-shadow: 0px 3px 12px 1px rgba(0, 0, 0, 0.0980392);
	height: 1600px;
	weight: 2000px;
	border-radius: 25px;
	background-color: white;
	margin: 1px 50px 50px 50px;
	border: 1px #dedfe0 solid;
}
    
    
    </style>

<!-- /css設定 -->

</head>
<body>
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../index.jsp">下一站，幸福</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
<!--                         <a href="P0_login/login.jsp">登入</a> -->
                        <a href="#myModal" data-toggle="modal" data-target="#myModal">登入</a>
                    </li>
<!--                     <li> -->
<!--                         <a href="services.html">Services</a> -->
<!--                     </li>                    -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../P2_route/route_plan.jsp">路經規劃</a>
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
                                <a href="portfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                     <li>
                        <a href="../P4_MessageBoard/showALL.jsp">留言板</a>
                    </li>
                     <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../portfolio-1-col.html">1 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="../portfolio-2-col.html">2 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="../portfolio-3-col.html">3 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="../portfolio-4-col.html">4 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="../ortfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                   <a href="TravelDiaryServlet?action=blog.do">所有文章</a>
                            </li>
                            <li>
                                <a href="blog_editor.jsp">發表新文章</a>
                            </li>
                            <li>
                                <a href="blog_manage.jsp">管理我的文章</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../full-width.html">Full Width Page</a>
                            </li>
                            <li>
                                <a href="../sidebar.html">Sidebar Page</a>
                            </li>
                            <li>
                                <a href="../faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="../404.html">404</a>
                            </li>
                            <li>
                                <a href="../pricing.html">Pricing Table</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
<!--             <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!--             <li data-target="#myCarousel" data-slide-to="1"></li> -->
<!--             <li data-target="#myCarousel" data-slide-to="2"></li> -->
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('../Images/E_Changhong Bridge_01.bmp');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('../Images/E_Changhong Bridge_02.bmp');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('../Images/E_Changhong Bridge_03.bmp');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>
	<br><br><br><br><br><br><br>
    <!-- ************************載入 jQuery bootstrap  summernote js套件************************ -->
    <!--  <script src="http://code.jquery.com/jquery.js"></script> -->

    <!-- 存取google提供的jquery檔案 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- 網路存取jquery.min.js失效，換轉存取我資料夾內的js -->
    <script>
    !window.jQuery && document.write("<script src='js/jquery-2.1.1.min.js'><\/script>")
    </script>
    <!-- <script src="js/jquery-1.11.1.min.js"></script> -->
    <!-- 載入 Bootstrap 的 JavaScript 功能 -->
    <script src="js/bootstrap.min.js"></script>
   
	
	
	

    <!-- Include the imagesLoaded plug-in -->
    <script src="wookmarkjs/jquery.imagesloaded.js"></script>

    <!-- Include the plug-in -->
    <script src="wookmarkjs/jquery.wookmark.js"></script>
	
	
	   
    <!-- ************************/載入 jQuery bootstrap  summernote js套件************************ -->













<!-- 	foreach抓值 -->



<%--   <c:forEach var="travelDiaryVO" items="${travelDiaryVO}" > --%>
<!--             			<tr> -->
<%--             				<td>${travelDiaryVO.travelDiary_Name}</td> --%>
<%--             				<td>${travelDiaryVO.travelDiary_Content}</td> --%>
<%--             				<td>${travelDiaryVO.travelDiary_ID}</td> --%>
<!--             			</tr>	 -->
<%--  </c:forEach> --%>
 
 	<div class="boxer" id='primary-content'>
 	
 			<div id="container">


        <!-- 加到最前面 <li class="stamped-first"> -->
        <!-- 加到最後面<li class="stamped-fourth"> -->
        <!-- li有設定css功能 -->

        <div id="main" role="main">

            <div id="tiles">
            
            
            	<!-- ****************尚未有文章********************* -->
            
            	<c:if test="${empty travelDiaryVO}">
            		<h1 style="text-align:center">抱歉您還沒有文章唷!!</h1>
            		<br>
            		<h2 style="text-align:center">趕去快發表一篇新文章!!</h2>
            		
            	</c:if>
            	
            	<!-- ****************/尚未有文章********************* -->
            	
            	
            	
            	
				<!-- ****************已有文章********************* -->
            	 <c:forEach var="travelDiaryVO" items="${travelDiaryVO}" >
            
                <li id="${travelDiaryVO.travelDiary_ID}">
				
                        ${travelDiaryVO.travelDiary_Content}
						
                    <p>${travelDiaryVO.travelDiary_Name}</p>
                </li>
         		</c:forEach>
         		<!-- ****************/已有文章********************* -->
            </div>

        </div>
    </div>
 
 	
 	
 	
 	
 	</div>
 
 
 	
    
 
 
 
 
 
 
 
 
 
 
 
  <!-- *********************************************jQuery程式寫入 ************************************************-->
    <script>
    (function($) {
    	
    	//*************偵測按下CLICK選到哪個圖片*******************
    	 
    	$("li").click(function(){
    	//取照片ID
    	var picknum=$(this).attr("id");
    	//動態取網頁contextPath
    	
		
    	
    	//用一個作弊方法:因為無法在這使用.get .post等等，再使servlet做forward轉頁 會失敗
    	//window.location.href="http://localhost:8081/wookmark/P3_TravelDiary/TravelDiaryServlet?action=pickblog&picknum="+picknum;
    	window.location.href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P3_TravelDiary/TravelDiaryServlet?action=pickblog&picknum="+picknum;	
    	
    	//用json去呼叫Servlet
    		//var url="TravelDiaryServlet";
    		//$.get(url,{"picknum":picknum,"action":"pickblog"},html);
    		
//     		 $.ajax({
// 				 "url":url,
// 				 "type":"get",
// 				 "data":{"picknum":picknum,"action":"pickblog"},
// 				 "dataType":"html",  //json,xml
// 				 "success":function(html){
// 					 window.location.href="html";
// 				 }
// 			 });
    		
	
    	});
    	
    	
    	
    	//*************/偵測按下CLICK選到哪個圖片*******************
    	
    	
    	
    	
		//**********************jQuery文章外掛**********************************
    	  $('#tiles').imagesLoaded(function() {
              function comparatorIsStamped(a, b) {
                  var $a = $(a),
                      $b = $(b);
                  // Check if tile should be the first one
                  if (!$a.hasClass('stamped-first') && $b.hasClass('stamped-first'))
                      return 1;
                  // Check if tile should be the last one
                  if ($a.hasClass('stamped-last') && !$b.hasClass('stamped-last'))
                      return 1;
                  // Check if tile should the fourth one
                  if (!$a.hasClass('stamped-fourth') && $b.hasClass('stamped-fourth') && $a.index() >= 4)
                      return 1;
                  return -1;
              }

              // Prepare layout options.
              var options = {
                  autoResize: true, // This will auto-update the layout when the browser window is resized.
                  container: $('#main'), // Optional, used for some extra CSS styling
                  offset: 2, // Optional, the distance between grid items
                  itemWidth: 210, // Optional, the width of a grid item
                  comparator: comparatorIsStamped, // Used to sort the items
                  direction: 'left' // Set this to 'right' if you want to stamp the 'stamped-first' item to the right
              };

              // Get a reference to your grid items.
              var $handler = $('#tiles li');

              $handler.each(function(i) {
                  console.log($(this).index() + ':' + $(this).find('p').text());
              });

              // Call the layout function.
              $handler.wookmark(options);
          });
	
    	//**********************jQuery文章外掛**********************************


    })(jQuery);
    </script>
 
 
 
 
 
 
 
 
 
 
 
</body>

</html>