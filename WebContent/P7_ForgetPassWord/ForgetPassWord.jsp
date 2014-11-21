<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>


<!-- Bootstrap 的 RWD 套件 -->
<!-- 載入Bootstrap css樣式 -->

<link rel="stylesheet" href="../P6_ContactUs/css/bootstrap.min.css">
<script src="../js/jquery-1.11.0.js"></script>
<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
<%@ include file="../platform/include_start.jsp" %>
<!-- 調整navbar btn-->
<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
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
	<nav class="navbar  navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
			<%@ include file="../platform/include_A_href/toIndex.jsp" %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<li>
                  		<a href="../P0_login/login.jsp" id="indexLoginBtn" class="noChange">登入</a>
                  	</li>
                	<%@ include file="../platform/include_A_href/P2_route.jsp" %>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %>
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp" %>
                    <%@ include file="../platform/include_A_href/P6_contactUs.jsp" %>
                </ul>
           </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
	</div>
    <!-- /.container -->
</nav>
		<%@ include file="../platform/include_picture/include_picture.jsp" %>
               

<!-- ************************載入 jQuery bootstrapjs套件************************ -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 	<script src="../P6_ContactUs/js/jquery-2.1.1.js"></script> -->
	<script>
		!window.jQuery
				&& document.write(
						"<script src='../P6_ContactUs/js/jquery-2.1.1.min.js'><\/script>")
	</script>
	<script src="../P6_ContactUs/js/bootstrap.min.js"></script>
	<script src="../seetalertjs/sweet-alert.js"></script>

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
							<input type="text" class="form-control" name="userid" id="userid"
								placeholder="UserID" id="checkid" required="" autofocus="" />
							
						</div>
						
					</div>
					<div class="form-group">
						<span class="col-md-2 col-md-offset-2 text-center">Your
							Email</span>
						<div class="col-md-4">
							<input type="email" class="form-control" name="email" id="email"
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
						<input type="button" class="btn btn-lg btn-primary btn-block" id="send" value="送出">
<!-- 							<button class="btn btn-lg btn-primary btn-block" type="submit">送出</button> -->
							<input type="hidden" name="action" value="forget">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  
<script>
(function($) {
	
	$('#send').click(function(){
		var mail_check= /.+@.+\..+/;
		var id=$('#userid').val();
		var email=$('#email').val();
		if(id.length==0){
			sweetAlert("Sorry...", "請輸入ID!", "error");
			return false;
		}
		else if(email.length==0){
			sweetAlert("Sorry...", "請輸入E-mail!", "error");
			return false;
		}else if(!email.match(mail_check)){
			sweetAlert("Sorry...", "請輸入正確E-mail格式!", "error");
			return false;
		}
				
				
				
				
		$.ajax({
            "url": "ForgetPassWordServlet",
            "type": "post",
            "data": {'action': 'forget','userid':id,'email':email},
            "dataType": "text", //json,xml
            "success": function(data) {
           		if($.trim(data)=="ok"){
           			swal({ title: "已成功!",   
     				   text: "3秒後自動關閉視窗",   
     				   timer: 3000 ,
     				   type:"success"});
           			$('#userid').val("");
           			$('#email').val("");
           		}else{
           			sweetAlert("申請失敗", "請確定帳號與Mail是否正確!", "error");
           		}
            }
        });
             
       
      });   
				
// 				 $.ajax({
// 							 "url":"ForgetPassWordServlet",
// 							 "type":"post",
// 							 "data":{'action':'forget'},
// 							 "dataType":"text",  //json,xml
// 							 "success":function(data){
								
// 							 }
// 						 });
				
// 				});
			
			
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
		
		//**********************昱豪  登入問題**********************
		var sionLog = "<%=sionLoginId%>";
		if(sionLog == "null"){
			//alert(sionName);
			$(".navbar-right a[class != 'noChange'] ").prop("href","#");
		}
		
		$(".noLogin").click(function(){	
			//alert("請先登入會員!!");
			sweetAlert("此功能需先行登入會員!!","","warning");
			$("#ok_btn123456").click(function(){
				window.location.href="http://localhost:8081/Project_1/P0_login/login.jsp";
			});
				
		});
		//**********************昱豪  登入問題**********************
		
})(jQuery);
</script>
<%@ include file="../platform/include_script.jsp" %>	
</body>
</html>