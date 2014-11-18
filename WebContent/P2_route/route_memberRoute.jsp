<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@ include file="../platform/include_start.jsp" %>

<head>
    <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
    <link rel="stylesheet" href="Jacklen_css/Jacklen.css"> <!--蕙齊css-->
	<link rel="stylesheet" href="../Styles/jquery-ui.min.css">
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
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="route_plan.jsp">路經規劃</a>
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
                                <a href="../P3_TravelDiary/TravelDiaryServlet?action=blog.do">所有文章 </a>
                            </li>
                            <li>
                                <a href="../P3_TravelDiary/blog_editor.jsp">發表新文章</a>
                            </li>
                            <li>
                                <a href="../P3_TravelDiary/blog_manage.jsp">管理我的文章</a>
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
                    <li class="dropdown">
                    	<a href="#"  class="dropdown-toggle" data-toggle="dropdown"  style="color:red;">
                    		會員，<%= sionName %>你好<b class="caret"></b></a>
                 			 <ul class="dropdown-menu">
			                       <li>
			                           <a href="P2_route/route_plan.jsp">會員基本資料修改</a>
			                       </li>
			                       <li>
			                           <a href="portfolio-2-col.html">會員好友管理</a>
			                       </li>
			                       <li>
			                           <a href="../LoginServlet?action=logOut">登出系統</a>
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

<!-- ******************************************************************* -->
<%-- 	${memRoute} --%>
	
	<div id="titlediv"><h2>我的路線</h2></div>
	<div id="memRouteDiv" class="ui-widget ui-helper-clearfix">
		<ul id="memRouteGallery" class="memRoute-gallery ui-helper-reset ui-helper-clearfix"></ul>
	</div>
	<div id="dialog-delete" title="刪除路線">
		<h2 class="memRoute-validateTips">真的要刪除?</h2>
	</div>






	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src='../Script/jquery-ui.js'></script>
	
<script>
		var serverName = "<%= serverName %>"; //localhost
		var serverPort = "<%= serverPort %>"; //8081
		var contextPath = "<%= contextPath %>"; //Project_1
		var sionLoginId = "<%= sionLoginId %>"; //aa123
		var memRoutes = ${memRoute};//取得 會員路線
		//console.log(memRoute);
		(function ($) {      	
        	$.each(memRoutes, function(i, route){
        		console.log(i);
        		console.log(route);
        		
				
				//<h3 class="ui-widget-header">墾丁一日遊</h3> 
				var routeName = $('<h3></h3>').text(route.routeName)
											  .addClass("ui-widget-content ui-corner-tr");
				
				var firstView = findFirstView(route.routeID);
				//console.log(firstView);
				
				//<img src="images/C_7fy_01.jpg" alt="The peaks of High Tatras" width="200" height="200">
				var routeFirstimg = $('<img></img>').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id=' + firstView)
													.addClass("memRoute-viewimge");
				
				//<a href='#' title='移除景點' class='ui-icon ui-icon-close'>移除景點</a>
				var recycle_icon = $('<a></a>').attr("href", "#")
											   .attr("title", "移除此路線")
											   .addClass("ui-icon ui-icon-close")
											   .text("移除此路線");
				
				//<li class="ui-widget-content ui-corner-tr"></li>
				var liObj = $('<li></li>').append(routeName)
										  .append(routeFirstimg)
										  .append(recycle_icon)
										  .attr("id", "liID_" + route.routeID)
										  .addClass("ui-widget-content ui-corner-tr")
										  .click(function click(event){
            								        	 var $item = $( this ),
            							                 $target = $( event.target );
            							              	 if ( $target.is( "a.ui-icon-close" ) ) {
            							              		 dialog.data("self",$item)
            							              		 	   .dialog( "open" );
            							              	 }
            							         		 return false;
            								     });
				
				$("#memRouteGallery").append(liObj);
				
        	});
        	
        	//找路線中的第一個景點
        	function findFirstView(routeID){
        		var firstViewInner = "";
				var url = "viewnameServlet";
				$.ajax({
        			"url": url,
        			"type":"get",
        			"data":{'routeID':routeID,'action':'GetRouteFisrtByRouteID'},
        			"dataType":"text",
        			"async":false,
        			"success":function(data){	
        				firstViewInner = data;			
        			}
        		});
				return firstViewInner;
			}
        	
        	//刪除路線
        	function deleteRoute($item){
        		//console.log($item.attr("id").substr(5));
        		var url = "viewnameServlet";
        		$.get(url, {'routeID':$item.attr("id").substr(5),'action':'DeleteRouteByRouteID'});
        		$item.fadeOut(function() {
                    $item
                      .find( "a.ui-icon-close" )
                        .remove()
                      .end();
        		});
        	}
        	
        	//刪除路徑
            var dialog = $( "#dialog-delete" ).dialog({
                  autoOpen: false,
                  height: 300,
                  width: 350,
                  modal: true,
                  buttons: {
                    "確定": function(){
                      deleteRoute($(this).data('self'));
                      dialog.dialog( "close" );
                    },
                    "取消": function() {
                      dialog.dialog( "close" );
                    }
                  },
                  close: function() {
                  }
                });
        	
        	
        })(jQuery);
        
    </script>
</body>
</html>