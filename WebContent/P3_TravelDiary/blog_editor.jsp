<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>
<script src="../js/jquery-1.11.0.js"></script>
<%
	Date date = new Date();
	java.util.Date right = new java.util.Date();
%>
<!-- Bootstrap 的 RWD 套件 -->
<!-- 載入Bootstrap css樣式 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- 使用 RWD 功能 -->
<!-- 文字編輯器css樣式 -->
<link rel="stylesheet" href="css/summernote.css">
<link rel="stylesheet" href="css/codemirror.css">
<!-- 圖案icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- sweetalert -->
<!-- <link rel="stylesheet" href="css/font-awesome.min.css"> -->
<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
	<script src="js/summernote.min.js"></script>
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
	<div class="row" style="padding-top: 50px">
		<div class="container">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<form method="post" action="TravelDiaryServlet">
					<div class="form-group">
						<label for="" style="">文章編輯</label>
						<div class="post">
							<img src="img/aa123.jpg" height="80" width="80" alt="aa123"
								title="aa123">
						</div>
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
									name="TravelDiary_Name" value="擎天崗一日遊超好玩">
								<!-- <input type="text" class="form-control " id="TravelDiary_Name" name="TravelDiary_Name" > -->
							</div>
							<!-- 建置日期 -->
							<label for="" class="col-xs-1">Date:</label>
							<div class="col-md-4">
								<input type="text" class="form-control " id="publish_date"
									name="publish_date"
									value="<%=new java.sql.Timestamp(right.getTime())%>"
									readonly="<%=new java.sql.Timestamp(right.getTime())%>">
							</div>
							<input type="hidden" id="getcontent" name="getcontent">
						</div>
						<textarea name="content" id="summernote" rows="10"
							class="form-control active_textarea"></textarea>
					</div>
					<input type="submit" class="btn btn-submit pull-right" id="submit"
						value="送出"> <input type="hidden" name="action"
						value="InsertBlog"> <input type="button"
						class="btn btn-submit pull-right" id="cancel" value="取消">
				</form>
				<!-- <button type="button" class="btn btn-submit pull-right" id="submit1">jquery post測試</button> -->

			</div>
		</div>
	</div>




	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	<!-- ************************************************文字編輯器**************************************************** -->

	<!-- *********************************************jQuery程式寫入 ************************************************-->
	<script>
		(function($) {
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

		})(jQuery);
	</script>

	<!-- *********************************************/jQuery程式寫入 ************************************************-->

<%@ include file="../platform/include_script.jsp" %>
</body>
</html>
