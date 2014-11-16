<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*"%>
<%
	Date date = new Date();
	java.util.Date right = new java.util.Date();
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Bootstrap 的 RWD 套件 -->
<!-- 載入Bootstrap css樣式 -->

<%@ include file="../platform/include_start.jsp" %>


<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css" media="screen">
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">

<title>Insert title here</title>
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
                    <c:if test="<%=sionName != null %>">
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
	                </c:if>   
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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document.write(
						"<script src='js/jquery-2.1.1.min.js'><\/script>")
	</script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		(function($) {

					//     	$(function () {
					//     	  $('input, textarea').each(function() {
					//     	        $(this).on('focus', function() {
					//     	            $(this).parent('.input').addClass('active');
					//     	        });

					//     	        $(this).on('blur', function() {
					//     	            if ($(this).val().length == 0) {
					//     	                $(this).parent('.input').removeClass('active');
					//     	            }
					//     	        });
					//     	        if ($(this).val() != '') $(this).parent('.input').addClass('active');
					//     	    });
					//     	});

				})(jQuery);
	</script>



	<!-- ************************/script jQuery ************************ -->


	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>

	




	<!-- 	************************************************************** -->





	<div class="container">
	<div class="row">
      <div class="col-md-12">
        <div class="well well-sm">
          <form class="form-horizontal" method="post" action="ContactUsServlet">
          <fieldset>
            <legend class="text-center header">Contact us</legend>    
            
            <div class="form-group">              
              <span class="col-md-2 col-md-offset-2 text-center">Your Name</span>              
              <div class="col-md-4">
                <input id="fname" name="name" type="text" placeholder="John Stuart" class="form-control" required>
              	  <input type="hidden" name="frommail" size="30" value="cecj0601@gmail.com" />
      			  <input type="hidden"  id="date" name="date" value="<%=new java.sql.Timestamp(right.getTime())%>" readonly="<%=new java.sql.Timestamp(right.getTime())%>">
              </div>
            </div>    
               <div class="form-group">
              <span class="col-md-2 col-md-offset-2 text-center">E-mail</span>
              <div class="col-md-4">
                <input type="email" name="recipients" id="recipients" placeholder="XXXOOO@hotmail.com" class="form-control" required>
              </div>
            </div>    
            
            <div class="form-group">
              <span class="col-md-2 col-md-offset-2 text-center">Subject</span>
              <div class="col-md-4">
                <input name="subject" id="subject" type="text" placeholder="Questions" class="form-control" required>
              </div>
            </div>

         
    
            <div class="form-group">
              <span class="col-md-2 col-md-offset-2 text-center">Contact</span>
              <div class="col-md-4">
                <textarea class="form-control" id="contents" name="contents" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7" required></textarea>
              </div>
            </div>
    
            <div class="form-group">
              <div class="col-md-12 text-center">
              	<button class="btn btn-danger " type="reset">RESET</button>
                <button type="submit" name="Submit" class="btn btn-primary">Submit</button>
                <input type="hidden" name="action" value="contactus" />
              </div>
            </div>
          </fieldset>
          </form>
        </div>
      </div>
	</div>
</div>

<style>
    .header {
        color:#36A0FF;
        font-size:27px;
        padding:10px;
    }
    .bigicon {
        font-size:35px;
        color:#36A0FF;
    }
</style>




	<!-- 	<form action="SendMail" method="post"> -->
	<!-- 		收件人Email:<br /> <input type="text" name="recipients"><br /> -->
	<!-- 		发件人Mail：<br /> <input type="hidden" name="frommail" size="30" value="hotman0901@gmail.com" /> -->
	<!-- 				<br />  -->
	<!-- 		邮件标题 <br /> <input name="subject" type="text" size="50" /><br />  -->
	<!-- 		内容：<br /> -->
	<!-- 		<textarea name="contents" cols="50" rows="10"></textarea> -->
	<!-- 		<br />  -->
	<!-- 		<input type="submit" name="Submit" value="送出" />  -->
	<!-- 		<input type="hidden" name="action" value="contactus" /> -->
	<!-- 	</form> -->
    
<%@ include file="../platform/include_script.jsp" %>	
</body>
</html>