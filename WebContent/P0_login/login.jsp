<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<%@ include file="../platform/include_title.jsp" %>   
	<%@ include file="../platform/include_start.jsp" %>  
	<!-- Bootstrap core CSS -->
	<!-- Custom styles for this template -->
	<link href="css/signin.css" rel="stylesheet">
	<script src="js/ie-emulation-modes-warning.js"></script>
  	<script src="../js/jquery-1.11.0.js"></script>	
  	<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
  	<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
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
	<nav class="navbar navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
            <%@ include file="../platform/include_A_href/toIndex.jsp" %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
               		<li>
               			<a href="../P0_login/login.jsp" id="indexLoginBtn">登入</a>
               	 	</li>
                	<%@ include file="../platform/include_A_href/P2_route.jsp" %>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %>
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp" %>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">聯絡我們<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../P6_ContactUs/ContactUs.jsp" class="noChange">聯絡我們</a>
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
        <!--  end row  -->
	</div>
    <!-- /.container -->
</nav>
<%@ include file="../platform/include_picture/include_picture.jsp" %>
    
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



    <div id="" class="">
      <div class="">
      	  <div class="col-xs-1"></div>
          <div class="modal-header col-xs-11">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
              <h2 class="modal-title" id="myModalLabel">會員登入   &nbsp; &nbsp;&nbsp; &nbsp;</h2><h4><span style="color:red;">${errorMSG }</span></h4>
          </div>
          <div class="modal-body">
              <div class="row">
              	  <div class="col-xs-1"></div>
                  <div class="col-xs-5">
                      <div class="well">
                          <form id="loginForm" method="POST" action="login" novalidate="novalidate">
                              <div class="form-group">
                                  <label for="username" class="control-label">Username</label>
                                  <input type="text" class="form-control" id="inputLoginId" name="inputLoginId" value="" required="" title="Please enter you username" placeholder="請輸入帳號"  autofocus ><span style="color:red;" id="errorId">${errorMsgId}</span>
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="inputPassword" name="inputPassword" value="" required="" title="Please enter your password"><span style="color:red;" id="errorPassword"> ${errorMsgPwd}</span>
                                  <span class="help-block glyphicon glyphicon-eye-open" style="margin-top:115px;margin-right:20px;"></span>
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>
                              <div class="checkbox">
                                  <label>
                                      <input type="checkbox" name="remember" id="remember"> Remember login
                                  </label>
                                  <p class="help-block">(if this is a private computer)</p>
                              </div>
                              <button type="submit" class="btn btn-success btn-block" id="loginBtn">Login</button>
                              <input type="hidden" name="action" value="LoginIdCheck">
                              
                              <a href="../P7_ForgetPassWord/ForgetPassWord.jsp" class="btn btn-default btn-block">忘記密碼</a>
                          </form>
                      </div>
                  </div>
                   
                  <div class="col-xs-5">
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
                  <div class="col-xs-1">
              </div>
          </div>
      </div>
  </div>




	
<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  
<!-- ***********************script************************** -->
   
<!-- jQuery Version 1.11.0 -->
<script src="../js/jquery-1.11.0.js"></script> 

<!-- Bootstrap Core JavaScript -->
<!-- <script src="js/bootstrap.min.js"></script>  -->
<script src="../js/bootstrap.js"></script>
<script src="../seetalertjs/sweet-alert.js"></script>
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
    if(<%=sionName%> == null){
		$(".navbar-right a[class != 'noChange']").prop("href","#");
	}
  	
    $("#loginBtn").click(function(){
    	
    	$("#errorId").html("");
    	$("#errorPassword").html("");
    	var loginId = $("#inputLoginId").val();
    	var password = $("#inputPassword").val();
    	if($.trim(loginId).length==0){
    		$("#errorId").html("&nbsp;帳號欄位不能空白!!");
    		return false;
    	}
    	else if($.trim(password).length == 0){
    		$("#errorPassword").html("&nbsp;密碼欄位不能空白!!");
    		return false;
    	}
    	
    	//return true;
    });
  	
  
  
  
	$(".noLogin").click(function(){	
		//alert("請先登入會員!!");
		sweetAlert("此功能需先行登入會員!!","","warning");
		$("#ok_btn123456").click(function(){
			window.location.href="http://localhost:8081/Project_1/P0_login/login.jsp";
		});
			
	});
	
	
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
