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
<!-- 	<link rel="stylesheet" href="../Styles/jquery-ui.min.css"> 蕙齊link -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">
	<link rel="stylesheet" href="Jacklen_css/component.css"> <!--蕙齊css-->
    <link rel="stylesheet" href="Jacklen_css/demo.css"> <!--蕙齊css-->
    <link rel="stylesheet" href="Jacklen_css/normalize.css"> <!--蕙齊css-->
    <!-- 調整navbar btn -->
	<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
    		<%@ include file="../platform/include_A_href/toIndex.jsp" %> 
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<li class="dropdown">
                  		<a href="route_search.jsp" name="indexLoginBtn" class="noChange">景點介紹</a>
                  	</li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="route_plan.jsp">路經規劃</a>
                            </li>
                            <li>
                                <a href="#" id="cooperationLink">與好友同步規劃</a>
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

	
<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->


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
<!-- 路線協作平台 -->
<script type='text/javascript' src='../js/CoPlatform.js'  data-sionLoginId='<%= session.getAttribute("userLoginId") %>' data-serverPort = "<%= serverPort %>" data-serverName = "<%= serverName %>" data-contextPath = "<%= contextPath %>"></script>
<!-- 路線協作平台  --> 	   
</body>
</html>