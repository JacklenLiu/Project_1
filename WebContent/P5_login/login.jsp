<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="../platform/include_start.jsp" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
		<!-- Bootstrap core CSS -->
  		<!-- Custom styles for this template -->
  		<link href="css/signin.css" rel="stylesheet">
  		<script src="js/ie-emulation-modes-warning.js"></script>
  		
<style>

	.form-group .glyphicon {
     display:none; 
    right: 30px;
    position: absolute;
    top: 12px;
    cursor:pointer;
    
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
                   <c:if test="<%=sionName != null%>">
                 	 <li class="dropdown">
                    	<a href="#"  class="dropdown-toggle" data-toggle="dropdown"  style="color:red;">
                    		會員，<%=sionName%>你好<b class="caret"></b></a>
                 			 <ul class="dropdown-menu">
		                       <li>
		                           <a href="../P2_route/route_plan.jsp">會員基本資料修改</a>
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
                  
                
                  <c:if test="<%=sionName == null%>">
                  	 <li>
                  		<a href="#myModal" data-toggle="modal" data-target="#myModal" id="abcd">登入</a>
                  	 </li>
                  </c:if>
                   <li class="dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                       <ul class="dropdown-menu">
                          		<c:if test="<%=sionName!=null%>">
                                	<a href="../P2_route/route_plan.jsp">路經規劃</a> 
                               	</c:if>
                           </li>
                           <li>
                               <a href="portfolio-2-col.html">路經規劃</a>
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
                   		<c:if test="<%=sionName!=null%>">
                         	 <a href="P4_MessageBoard/showALL.jsp">留言板</a>
                        </c:if>
<!--                     <a href="P4_MessageBoard/showALL.jsp">留言板</a> -->
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
                           	
                        	
                        	<c:if test="<%=sionName!=null%>">
	                        	<li>
				                     <a href="../P3_TravelDiary/TravelDiaryServlet?action=blog.do">所有文章 </a>
				                </li>                         
	                            <li>
	                                <a href="../P3_TravelDiary/blog_editor.jsp">發表新文章</a>
	                            </li>
	                            <li>
	                                <a href="../P3_TravelDiary/blog_manage.jsp">管理我的文章</a>
	                            </li>
                             </c:if>    
                        </ul>
                        
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="full-width.html">Full Width Page</a>
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
    
    
<!-- ************************** 昱豪登入     ************************** -->
<!-- 	<div class="container" style="float:left;width:400px;margin-left:250px;"> -->
	
<!-- 	    <form class="form-signin" role="form" method="post" action="login"> -->
<!-- 	      <h2 class="form-signin-heading">Please sign in</h2> -->
<!-- 	      <label for="inputEmail" class="sr-only">Email address </label> -->
<%-- 	      <input type="text" id="inputEmail" name="inputLoginId" class="form-control" placeholder="Email address" required autofocus ><span style="color:red;">${errorMsgId}</span> --%>
<!-- 	      <label for="inputPassword" class="sr-only">Password</label> -->
<%-- 	      <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>${errorMsgPwd} --%>
<!-- 	      <div class="checkbox"> -->
<!-- 	        <label> -->
<!-- 	          <input type="checkbox" value="remember-me"> Remember me -->
<!-- 	        </label> -->
<!-- 	      </div> -->
<%-- 	      <button class="btn btn-lg btn-primary btn-block" type="submit" id="loginBtn">Sign in</button><span>${errorMSG }</span> --%>
<!-- 	      <input type="hidden" name="action" value="LoginIdCheck"> -->
<!-- 	    </form> -->
	
<!-- 	</div> /container -->
	<!-- Standard button -->

<!--  form-horizontal -->



<!-- 	<form class=" form-horizontal form-signin" role="form" action="login" style="width:800px;float:left;margin-left:500px;"> -->
<!-- 	 <h2 class="form-signin-heading">Please sign in</h2> -->
<!-- 	  <div class="form-group"> -->
<!-- 	    <label for="inputEmail3" class="col-sm-2 control-label">Email</label> -->
<!-- 	    <div class="col-sm-10"> -->
<%-- 	      <input type="text" id="inputEmail" name="inputLoginId" class="form-control" placeholder="Email address" required autofocus ><span style="color:red;">${errorMsgId}</span> --%>
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	  <div class="form-group"> -->
<!-- 	    <label for="inputPassword3" class="col-sm-2 control-label">Password</label> -->
<!-- 	    <div class="col-sm-10"> -->
<%-- 				<input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>${errorMsgPwd} --%>
<!-- 	    		<span class="glyphicon glyphicon-eye-open"></span> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	  <div class="form-group"> -->
<!-- 	    <div class="col-sm-offset-2 col-sm-10"> -->
<!-- 	      <div class="checkbox"> -->
<!-- 	        <label> -->
<!-- 	          <input type="checkbox"> Remember me -->
<!-- 	        </label> -->
<!-- 	      </div> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	  <div class="form-group"> -->
<!-- 	    <div class="col-sm-offset-2 col-sm-10"> -->
<!-- 	<!--       <button type="submit" class="btn btn-default">Sign in</button> --> 
<%-- 	      <button class="btn btn-lg btn-primary btn-block" type="submit" id="loginBtn">Sign in</button><span>${errorMSG }</span> --%>
<!-- 		  <input type="hidden" name="action" value="LoginIdCheck"> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
	
		
<!-- 	</form> -->
<!-- <div style="margin-top:80px;margin-left:950px;"> -->
<!-- 	  	<button type="button" class="btn btn-warning" style="width:150px;height:70px;border-radius:20px;background:-webkit-linear-gradient(50deg,#FF8800,#DDDDDD);color:red;font-size:26px;font-weight:bold;">註&nbsp;冊</button> -->
<!-- 			<br> -->
<!-- 			<br> -->
<!-- 		<a href="../P7_ForgetPassWord/ForgetPassWord.jsp"><button type="button" class="btn btn-warning" style="width:150px;height:70px;border-radius:20px;background:-webkit-linear-gradient(50deg,#FF8800,#DDDDDD);color:red;font-size:26px;font-weight:bold;">忘記密碼</button></a> -->
<!-- </div> -->




<!-- ************************** 昱豪登入     ************************** -->



<form action="login" method="post">
    <div id="login-overlay" class="modal-dialog">
      <div class="">
          <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
              <h2 class="modal-title" id="myModalLabel">會員登入   &nbsp; &nbsp;&nbsp; &nbsp;</h2><h4><span style="color:red;">${errorMSG }</span></h4>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-xs-6">
                      <div class="well">
                          <form id="loginForm" method="POST" action="/login/" novalidate="novalidate">
                              <div class="form-group">
                                  <label for="username" class="control-label">Username</label>
                                  <input type="text" class="form-control" id="inputEmail" name="inputLoginId" value="" required="" title="Please enter you username" placeholder="請輸入帳號"  autofocus ><span style="color:red;">${errorMsgId}</span>
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="inputPassword" name="inputPassword" value="" required="" title="Please enter your password"> ${errorMsgPwd}
                                  <span class="help-block glyphicon glyphicon-eye-open" style="margin-top:115px;margin-right:20px;"></span>
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>
                              <div class="checkbox">
                                  <label>
                                      <input type="checkbox" name="remember" id="remember"> Remember login
                                  </label>
                                  <p class="help-block">(if this is a private computer)</p>
                              </div>
                              <button type="submit" class="btn btn-success btn-block">Login</button>
                              <input type="hidden" name="action" value="LoginIdCheck">
                              
                              <a href="../P7_ForgetPassWord/ForgetPassWord.jsp" class="btn btn-default btn-block">忘記密碼</a>
                          </form>
                      </div>
                  </div>
                  <div class="col-xs-6">
                      <p class="lead">Register now for <span class="text-success">FREE</span></p>
                      <ul class="list-unstyled" style="line-height: 2">
                          <li><span class="fa fa-check text-success"></span> 功能最齊全</li>
                          <li><span class="fa fa-check text-success"></span> 旅遊景點一覽無遺</li>
                          <li><span class="fa fa-check text-success"></span> 儲存您的最愛景點</li>
                          <li><span class="fa fa-check text-success"></span> 快速指引您的旅途</li>
<!--                           <li><span class="fa fa-check text-success"></span> Get a gift <small>(only new customers)</small></li> -->
<!--                           <li><a href="/read-more/"><u>Read more</u></a></li> -->
                      </ul>
                      <p><a href="../P1_iud/register.jsp" class="btn btn-info btn-block">Yes please, register now!</a></p>
                  </div>
              </div>
          </div>
      </div>
  </div>
</form>





<!-- ***********************script************************** -->
   
<!-- jQuery Version 1.11.0 -->
<script src="../js/jquery-1.11.0.js"></script> 

<!-- Bootstrap Core JavaScript -->
<!-- <script src="js/bootstrap.min.js"></script>  -->
<script src="../js/bootstrap.js"></script>
   

<script type="text/javascript">
   
(function ($) {
	//照片輪播間格秒數
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });
  //照片輪播間格秒數
  
  //上方工具列滑鼠滑入自動彈出
    $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });
  //上方工具列滑鼠滑入自動彈出
  
  //登入處裡*****************************
	var css1 = {"color":"red"};
	$(".abab").click(function(){	    	
		$("#abc123").prop("hidden",false).html("請先行登入會員系統!!").css(css1);
	});
	$("#abcd").click(function(){	    	
		$("#abc123").prop("hidden",true);;
	});	    	
	
	if(<%=sionName%>== null){
		//alert(sionName);
		$(".navbar-right a").prop("href","login.jsp");
	}
	//登入處裡*****************************
	

	$("#inputPassword").on("keyup",function(){
	    if($(this).val())
	        $(".glyphicon-eye-open").show();
	    else
	        $(".glyphicon-eye-open").hide();
	    });
	$(".glyphicon-eye-open").mousedown(function(){
	                $("#inputPassword").attr('type','text');
	            }).mouseup(function(){
	            	$("#inputPassword").attr('type','password');
	            }).mouseout(function(){
	            	$("#inputPassword").attr('type','password');
	            });
	
	
	
})(jQuery);

		
 	
</script>

</body>
</html>
