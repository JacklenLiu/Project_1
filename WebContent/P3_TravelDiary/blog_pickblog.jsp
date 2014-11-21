<%@page import="P3_TravelDiary.model.TravelDiaryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="../platform/include_title.jsp" %>
<script src="../js/jquery-1.11.0.js"></script>
<%
	TravelDiaryVO travelDiaryVO = (TravelDiaryVO) request
			.getAttribute("travelDiaryVO");
%>
<%@ include file="../platform/include_start.jsp"%>
<!-- 調整navbar btn -->
<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<style>
.boxer {
	box-shadow: 0px 3px 12px 1px rgba(0, 0, 0, 0.0980392);
	width: 1000px;
	border-radius: 25px;
	background-color: white;
	margin: 1px 50px 50px 50px;
	border: 1px #dedfe0 solid;
	position: relative;
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
        <!--  end row  -->
	</div>
    <!-- /.container -->
</nav>
	
	<%@ include file="../platform/include_picture/include_picture.jsp" %>
    
	<br>
	<br>

	<div style="visibility: hidden">
		<c:out value="${MSG}"></c:out>
	</div>

	<!-- ************************載入 jQuery bootstrap  summernote js套件************************ -->
	<!--  <script src="http://code.jquery.com/jquery.js"></script> -->

	<!-- 存取google提供的jquery檔案 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<!-- 網路存取jquery.min.js失效，換轉存取我資料夾內的js -->
	<script>
		!window.jQuery
				&& document
						.write("<script src='js/jquery-2.1.1.min.js'><\/script>")
	</script>
	<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
	<!-- 載入 Bootstrap 的 JavaScript 功能 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- 載入文字編輯器 -->
	<script src="js/summernote.min.js"></script>
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




	<!-- ***********************撈出文章 *********************************-->
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h4>
					發表日期:<%=travelDiaryVO.getPublish_date()%></h4>
				會員:<%=travelDiaryVO.getMember_loginID()%>
				<br> <br> <br>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div style="border: 1px solid gray; border-radius: 15px;background-color:white">
					<h2><%=travelDiaryVO.getTravelDiary_Name()%></h2>
					<%=travelDiaryVO.getTravelDiary_Content()%>

					<br> <br> <br>
				</div>
			</div>
		</div>
	</div>

	<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 --> 
	<!-- ***********************/撈出文章 *********************************-->

	<%-- <c:if test="${not empty errorMsgs}"> --%>
	<!-- 	<font color='red'>請修正以下錯誤: -->
	<!-- 	<ul> -->
	<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
	<%-- 			<li>${message}</li> --%>
	<%-- 		</c:forEach> --%>
	<!-- 	</ul> -->
	<!-- 	</font> -->
	<%-- </c:if> --%>
	<!-- ************************************************文字編輯器**************************************************** -->


	<!-- *********************************************jQuery程式寫入 ************************************************-->
	<script>
		(function($) {

			$(window).load(function() {

				$('img').attr({
					class : 'img-responsive',
				});

			});

			//             $( document ).ready(function() {
			//             	   $('img').attr({
			//                        class: 'img-responsive',
			//                    });
			//             });

		})(jQuery);
	</script>



	<!-- *********************************************/jQuery程式寫入 ************************************************-->




<%@ include file="../platform/include_script.jsp" %>
</body>
</html>