<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Bootstrap 的 RWD 套件 -->
<!-- 載入Bootstrap css樣式 -->

<%@ include file="../platform/include_title.jsp" %>
<%@ include file="../platform/include_start.jsp" %>
<%
	Date date = new Date();
	java.util.Date right = new java.util.Date();
%>
<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
<script src="../js/jquery-1.11.0.js"></script>
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
                	<c:if test="<%= sionName == null %>">
                		<li>
                  			<a href="../P0_login/login.jsp" id="indexLoginBtn" class="noChange">登入</a>
                  	 	</li>
                	</c:if>
                	<%@ include file="../platform/include_A_href/P2_route.jsp" %>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %>
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp" %>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">聯絡我們<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="ContactUs.jsp" class="noChange">聯絡我們</a>
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
                    	<%@ include file="../platform/include_A_href/memberSession.jsp" %>
                    </c:if>   
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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document.write(
						"<script src='js/jquery-2.1.1.min.js'><\/script>")
	</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="../seetalertjs/sweet-alert.js"></script>
	



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
                <input id="fname" name="name" type="text" placeholder="John Stuart" class="form-control" value="${userName}" required>
              	  <input type="hidden"  id="frommail" name="frommail" size="30" value="cecj0601@gmail.com" />
      			  <input type="hidden"  id="date" name="date" value="<%=new java.sql.Timestamp(right.getTime())%>" readonly="<%=new java.sql.Timestamp(right.getTime())%>">
              	  <input type="hidden"  id="contactUsReply" name="contactUsReply" value="0" />
              	
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
              	<input type="button" class="btn btn-primary" name="send" id="send" value="送出">
<!--                 <button type="submit" name="Submit" class="btn btn-primary">Submit</button> -->
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

<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  


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
<script type="text/javascript">
	//******昱豪 登入處裡*****************************
		var serverName = "<%= request.getServerName()%>";
		var serverPort = "<%= request.getServerPort()%>";
		var contextPath = "<%= request.getContextPath()%>";
	var sionLog = "<%=sionLoginId%>";
	if(sionLog == "null"){
		//alert(sionName);
		$(".navbar-right a[class != 'noChange'] ").prop("href","#");
	
		$(".noLogin").click(function(){	
			//alert("請先登入會員!!");
			sweetAlert("此功能需先行登入會員!!","","warning");
			$("#ok_btn123456").click(function(){
				window.location.href="http://"+serverName+":"+ serverPort + contextPath+"/P0_login/login.jsp";
			});
				
		});
	}
	//******昱豪 登入處裡*****************************
		(function($) {
			
			$('#send').click(function(){
				var mail_check= /.+@.+\..+/;
				var fname=$('#fname').val();
				var recipients=$('#recipients').val();
				var frommail=$('#frommail').val();
				var date=$('#date').val();
				var subject=$('#subject').val();
				var contents=$('#contents').val();
				var contactUsReply=$('#contactUsReply').val();
				if(fname.length==0){
					sweetAlert("Sorry...", "請輸入姓名!", "error");
					return false;
				}
				else if(recipients.length==0){
					sweetAlert("Sorry...", "請輸入E-mail!", "error");
					return false;
				}else if(!recipients.match(mail_check)){
					sweetAlert("Sorry...", "請輸入正確E-mail格式!", "error");
					return false;
				}else if(subject.length==0){
					sweetAlert("Sorry...", "請輸入subject!", "error");
					return false;
				}else if(contents.length==0){
					sweetAlert("Sorry...", "請輸入contents!", "error");
					return false;
				}
				 $.ajax({
		                "url": "ContactUsServlet",
		                "type": "post",
		                "data": {'action': 'contactus','name':fname,'recipients':recipients,
		                	'frommail':frommail,'date':date,'subject':subject,'contents':contents,'contactUsReply':contactUsReply},
		                "dataType": "text", //json,xml
		                "success": function(data) {
		               		if($.trim(data)=="ok"){
		               			swal({ title: "已成功!",   
		         				   text: "3秒後自動關閉視窗",   
		         				   timer: 3000 ,
		         				   type:"success"});
		               			$('#fname').val("");
		        				$('#recipients').val("");
		        				$('#subject').val("");
		        				$('#contents').val("");
		               		}else{
		               			sweetAlert("申請失敗", "請確定網路是否順暢!", "error");
		               		}
		                }
		            });
				
				
				
			});
					

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
<%@ include file="../platform/include_script.jsp" %>	

</body>
</html>