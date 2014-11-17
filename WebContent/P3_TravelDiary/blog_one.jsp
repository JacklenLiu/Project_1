<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../platform/include_start.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
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
            <%@ include file="../platform/include_A_href/toIndex.jsp" %> 	
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<%@ include file="../platform/include_A_href/P2_route.jsp" %> 	   
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %>  
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
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
                    <%@ include file="../platform/include_A_href/P6_contactUs.jsp" %>
                    <%@ include file="../platform/include_A_href/memberSession.jsp" %>	
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	
	<%@ include file="../platform/include_picture.jsp" %>
    
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
	<script type="text/javascript">
	 //上方工具列滑鼠滑入自動彈出
    $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });
  	//上方工具列滑鼠滑入自動彈出
	
	</script>












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
    	 
    	$("#tiles>li").click(function(){
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
 
 
 
 
 
 
 
 
 
 
 <%@ include file="../platform/include_script.jsp" %>
</body>

</html>