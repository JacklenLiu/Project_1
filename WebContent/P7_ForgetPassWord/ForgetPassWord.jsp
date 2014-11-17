<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<%@ include file="../platform/include_start.jsp" %>

<!-- Bootstrap 的 RWD 套件 -->
<!-- 載入Bootstrap css樣式 -->

<link rel="stylesheet" href="../P6_ContactUs/css/bootstrap.min.css">
<link rel="stylesheet" href="../P6_ContactUs/css/bootstrap-theme.min.css">
<title>ForgetPassWord</title>

<style>

body {
	background: #eee !important;
}

.wrapper {
	margin-top: 80px;
	margin-bottom: 80px;
}

.form-signin {
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-signin-heading
	,
	.checkbox
	{
	margin-bottom
	:
	30px;
}

.checkbox {
	font-weight: normal;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
}

}
input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}


}
</style>



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
                	<c:if test="<%=sionName == null%>">
                		<li>
                		  <a href="../P5_login/login.jsp">登入 </a>
                		</li>
                	</c:if>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">聯絡我們<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="ContactUs.jsp">聯絡我們</a>
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



























<!-- ************************載入 jQuery bootstrapjs套件************************ -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 	<script src="../P6_ContactUs/js/jquery-2.1.1.js"></script> -->
	<script>
		!window.jQuery
				&& document.write(
						"<script src='../P6_ContactUs/js/jquery-2.1.1.min.js'><\/script>")
	</script>
	<script src="../P6_ContactUs/js/bootstrap.min.js"></script>


	<!-- ************************/script jQuery ************************ -->




	

	<!-- 	************************************************************** -->
	<div class="container">
		<div class="row">
			<div class="wrapper">
				<form class="form-horizontal" method="post" action="ForgetPassWordServlet">
					<center><h3 class="form-signin-heading ">Forget
						PassWord</h3></center>
					<div class="form-group">
						<span class="col-md-2 col-md-offset-2 text-center">Your
							ID</span>
						<div class="col-md-4">
							<input type="text" class="form-control" name="userid"
								placeholder="UserID" id="checkid" required="" autofocus="" />
							
						</div>
						
					</div>
					<div class="form-group">
						<span class="col-md-2 col-md-offset-2 text-center">Your
							Email</span>
						<div class="col-md-4">
							<input type="email" class="form-control" name="email"
								placeholder="Email" required="" autofocus="" />
						</div>
					</div>
					
					
						<%-- 錯誤表列 --%>
<center>
<c:if test="${not empty errorMsgs}">
	<font color='red' id="errorMsg">
	
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	
	</font>
</c:if>
</center>
	<%-- /錯誤表列 --%>
	
					
					<div class="form-group">
						<div class="col-md-4 col-md-offset-4">
							<button class="btn btn-lg btn-primary btn-block" type="submit">送出</button>
							<input type="hidden" name="action" value="forget">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	

	

	

	
	
	
	
		<script>
		(function($) {
			
// 			   $('#checkid').blur(function(){
// 				   var name=$('#checkid').val();
// 					 $.ajax({
// 						 "url":"ForgetPassWord",
// 						 "type":"post",
// 						 "data":{'name':name,"action":"blur"},
// 						 "dataType":"text",  //json,xml
// 						 "success":function(data){
							 
// 						 }
// 					 });


// 			   });
			
			
		$('#checkid').blur(function(){
			
			$('#errorMsg').hide();
			
		});
			
			
			
			
		})(jQuery);
	</script>
	<%@ include file="../platform/include_script.jsp" %>	
</body>
</html>