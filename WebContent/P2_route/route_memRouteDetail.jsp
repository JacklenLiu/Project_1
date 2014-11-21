<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="../platform/include_title.jsp" %>
	<%@ include file="../platform/include_start.jsp" %>
	<script src="../js/jquery-1.11.0.js"></script>
    <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
    <link rel="stylesheet" href="Jacklen_css/Jacklen.css"> <!--蕙齊css-->
	<link rel="stylesheet" href="../Styles/jquery-ui.min.css"> <!-- 蕙齊link-->
	<link rel="stylesheet" href="Jacklen_css/component.css"> <!--蕙齊css-->
    <link rel="stylesheet" href="Jacklen_css/demo.css"> <!--蕙齊css-->
    <link rel="stylesheet" href="Jacklen_css/normalize.css"> <!--蕙齊css-->
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
    		<%@ include file="../platform/include_A_href/toIndex.jsp" %> 
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
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %> 
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp"%>
					<%@ include file="../platform/include_A_href/P6_contactUs.jsp"%>
                    <%@ include file="../platform/include_A_href/memberSession.jsp"%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
	</div>
    <!-- /.container -->
</nav>
<%-- 	<%@ include file="../platform/include_picture.jsp"%> --%>
<%@ include file="../platform/include_picture/include_picture.jsp" %>
<!-- ******************************************************************* -->

<div class="container">
			<!-- Top Navigation -->
			<header>
				<h1>路線詳細資訊 </h1>	
				<nav class="codrops-demos">	</nav>
			</header>
			<div class="component">
				<h2 id="h2titleid">Basic usage</h2>
<%-- 				${viewDetails}<!-- jkl --> --%>
				<table id="detailtable">
					<thead>
						<tr>
							<th>景點順序</th>
							<th>景點名稱</th>
							<th>景點照片</th>
							<th>詳細說明</th>
						</tr>
					</thead>
					<tbody id="tbodyid"></tbody>
				</table>
	</div>
</div><!-- /container -->




	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src='../Script/jquery-ui.js'></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
	
<script>
		var serverName = "<%= serverName %>"; //localhost
		var serverPort = "<%= serverPort %>"; //8081
		var contextPath = "<%= contextPath %>"; //Project_1
		var sionLoginId = "<%= sionLoginId %>"; //aa123
		var viewDetails = ${viewDetails};//取得 各路線的詳細資訊
		
		(function ($) {
			$('#h2titleid').text(viewDetails.routeName);
			$.each(viewDetails.views, function(i, oneViewDetail){
				console.log(oneViewDetail);
				var viewOrder = $('<td></td>').text(i+1)
											  .addClass("detailorder");
				var viewName = $('<td></td>').text(oneViewDetail.viewname)
											 .addClass("detailname");
				console.log(oneViewDetail.viewID);
				var viewPic = $('<td></td>').html("<img src='http://"+serverName + ':' + serverPort + contextPath +'/GetImageServlet?id='+ oneViewDetail.viewID +"' class='detailimg'></img>");
				//'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id=' + firstView
				var viewDesc = $('<td></td>').html("<h4 class='desctitle'>地址:</h4>"+ oneViewDetail.viewaddr + "<br>" + "<h4 class='desctitle'>景點說明:</h4>" + oneViewDetail.imgDescript);
				var viewtr = $('<tr></tr>').append(viewOrder)
										   .append(viewName)
										   .append(viewPic)
										   .append(viewDesc);
				$('#tbodyid').append(viewtr);
			});
					
        	
        	
        })(jQuery);
        
    </script>
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>    
</body>
</html>