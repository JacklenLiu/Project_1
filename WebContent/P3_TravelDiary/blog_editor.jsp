<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>
<script src="../js/jquery-1.11.0.js"></script>
<%
	Date date = new Date();
	java.util.Date right = new java.util.Date();
	java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime()); 
	String todate=timestamp.toString();	
	String today=todate.substring(0, todate.lastIndexOf("."));
%>

<!-- Bootstrap 的 RWD 套件 -->
<!-- 載入Bootstrap css樣式 -->
<!-- footercss -->
<%@ include file="../platform/include_start.jsp" %>	
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 使用 RWD 功能 -->
<!-- 文字編輯器css樣式 -->
<link rel="stylesheet" href="css/summernote.css">
<!-- Custom Fonts -->
<!-- sweetalert -->
<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
<link rel="stylesheet" href="../footercss/style.css">
<!-- 調整navbar btn -->
<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<!-- JKL使用jquery-ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- JKL使用jquery-ui -->
<style>
 	/*button*/
    .between{ 
    	position:relative ; 
    	left:-20px;
    }
    /*/button*/

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
<%--                     <%@ include file="../platform/include_A_href/Portfolio.jsp" %> --%>
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
	<div style="visibility: hidden">
		<c:out value="${MSG}"></c:out>
	</div>

	<!-- ************************載入 jQuery bootstrap  summernote js套件************************ -->
	<!--  <script src="http://code.jquery.com/jquery.js"></script> -->

	<!-- 存取google提供的jquery檔案 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<!-- 網路存取jquery.min.js失效，換轉存取我資料夾內的js -->
	<script>!window.jQuery&&document.write("<script src='js/jquery-2.1.1.min.js'><\/script>")</script>
	<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
	<!-- 載入 Bootstrap 的 JavaScript 功能 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- 載入文字編輯器 -->
<!-- 	<script src="js/summernote.min.js"></script> -->
<script src="js/summernote.js"></script>

	<!-- sweetalert -->
	<script src="../seetalertjs/sweet-alert.js"></script>

	<!-- ************************/載入 jQuery bootstrap  summernote js套件************************ -->
	<script type="text/javascript">
	   $('.carousel').carousel({
	        interval: 5000 //changes the speed
	    });
	    
		//上方工具列滑鼠滑入自動彈出
		$('.nav .dropdown').hover(function() {
			$(this).addClass('open');
		}, function() {
			$(this).removeClass('open');
		});
		//上方工具列滑鼠滑入自動彈出
	</script>
	<!-- ************************************************文字編輯器**************************************************** -->
	<!-- 編輯器 -->
	
		<div class="container">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<form method="post" action="TravelDiaryServlet">
					<div class="form-group">
						<h2>文章編輯</h2>
						<br>
						<!-- 寫入DB測試用假表格 -->
						<div class="row">
							<!-- ID獲取 -->
							<label for="" class="col-xs-1">ID:</label>
							<div class="col-md-2">
								<input type="text" class="form-control " id="member_loginID"
									name="member_loginID" value="${userLoginId}"
									readonly="${userLoginId}">
								<!--                                 <input type="text" class="form-control " id="member_loginID" name="member_loginID" > -->
							</div>
							<!-- 文章標題 -->
							<label for="" class="col-xs-1">Title:</label>
							<div class="col-md-3">
								<input type="text" class="form-control " id="TravelDiary_Name"
									name="TravelDiary_Name" value="">
								<!-- <input type="text" class="form-control " id="TravelDiary_Name" name="TravelDiary_Name" > -->
							</div>
							<!-- 建置日期 -->
							<label for="" class="col-xs-1">Date:</label>
							<div class="col-md-4">
								<input type="text" class="form-control " id="publish_date"
									name="publish_date"
									value="<%=today%>"
									readonly="<%=today%>">
							</div>
							<input type="hidden" id="getcontent" name="getcontent">
						</div>
						<textarea name="content" id="summernote" rows="10"
							class="form-control active_textarea"></textarea>
					</div>
					<input type="submit" class="btn btn-submit btn-primary pull-right" id="submit"
						value="送出"> <input type="hidden" name="action"
						value="InsertBlog"> <input type="button"
						class="between btn btn-submit btn-danger pull-right" id="cancel" value="取消">
						 <input type="button" class="btn btn-warning " id="autodata" value="data">
				</form>
				<!-- <button type="button" class="btn btn-submit pull-right" id="submit1">jquery post測試</button> -->

			</div>
		</div>
		<br>
		<br>




	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	
<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  
	<!-- ************************************************文字編輯器**************************************************** -->

	<!-- *********************************************jQuery程式寫入 ************************************************-->
	<script>
		(function($) {
			
			
			//ScrollBar 畫面停留位置方法
	    	$({myScrollTop:window.pageYOffset}).animate({myScrollTop:200}, {
	    		  duration: 600,
	    		  easing: 'swing',
	    		  step: function(val) {
	    		    window.scrollTo(0, val);
	    		  }
	    		});
	    	//ScrollBar 畫面停留位置方法
			
			$('#summernote').code();
			//設定summernote的工具有哪些
			$('#summernote').summernote(
					{
						height : 300,
						focus : true,
						toolbar : [
								[ 'style', [ 'style' ] ], // no style button
								[ 'style',[ 'bold', 'italic', 'underline','clear' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								[ 'color', [ 'color' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'height', [ 'height' ] ],
								[ 'insert', [ 'picture' ] ], // no insert buttons
								//                 ['table', ['table']], // no table button
								//                 ['help', ['help']] //no help button
						]

					});

			//為了讓編輯器一開始內容清空因為一開始產生出來會有<p></br></p>佔了空間導致無法偵測是否有字串
			$(window).load(function() {
				$('#summernote').code("");
				$('.note-editable').css("background-color","white");
			});
			//測試讀取content內容資料
			//         var TravelDiary_Content;
			//         $('#submit').click(function(event) {
			//             TravelDiary_Content = $('#summernote').code();
			//             alert(TravelDiary_Content.length);
			//         });

			$("#submit").click(function(event) {
				var title = $("#TravelDiary_Name").val().trim().length;
				var content = $('#summernote').code().trim().length;
				if (title > 10) {
					sweetAlert("Sorry...", "文章標題字數限制10個字唷!", "error");

					return false;
				} else if (title == 0 && content == 0) {
					sweetAlert("Sorry...", "請輸入文章標題與文章內容!", "error");
					return false;
				} else if (content == 0) {
					sweetAlert("Sorry...", "請輸入文章內容!", "error");
					return false;
				}

				else if (title == 0) {
					sweetAlert("Sorry...", "請輸入文章標題!", "error");
					return false;
				}

			});

			//取消功能
			$("#cancel").click(function() {
				window.location.href = "TravelDiaryServlet?action=blog.do";

			});
			
			$('#autodata').click(function(){
			var content="這次到墾丁入住的是H會館<br>房間是Ｊ前一個月就偷偷訂了<br>出發前幾天我才知道，很驚喜︿︿<br>雖然房價不便宜<br>但Ｊ訂完後，中秋幾天就呈現客滿狀態<br>不管是想增加天數或是改日期都困難（沒料後來”天兔”居然變強颱！<br>想必墾丁很多民宿都被退到手軟吧(只有我們是打電話去加訂，老闆一定有偷偷拭淚吧)<br>入住的頭一兩天，感覺上Ｈ會館的房客還是一樣很多<br>天氣超好的<br>還好我們有先見之明請假提早一天出發   也多玩了一天<br>一路上車少，開起來輕鬆多了<br>比預計的時間還快到達";
			$('#TravelDiary_Name').val("墾丁一日遊");
			$('#summernote').code(content);
			});
			
		})(jQuery);
	</script>

	<!-- *********************************************/jQuery程式寫入 ************************************************-->

<%@ include file="../platform/include_script.jsp" %>
</body>
</html>
