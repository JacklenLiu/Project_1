<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap 的 RWD 套件 -->
<!-- 載入Bootstrap css樣式 -->

<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<!-- 使用 RWD 功能 -->
<!-- 文字編輯器css樣式 -->
<link rel="stylesheet" href="css/summernote.css">
<link rel="stylesheet" href="css/codemirror.css">
<!-- 圖案icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<title>Hello Bootstrap</title>


<style type="text/css">
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
</head>

<body>
	<!-- ************************載入 jQuery bootstrap  summernote js套件************************ -->
	<!--  <script src="http://code.jquery.com/jquery.js"></script> -->

	<!-- 存取google提供的jquery檔案 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<!-- 網路存取jquery.min.js失效，換轉存取我資料夾內的js -->
	<script>
		!window.jQuery
				&& document
						.write("<script src='js/jquery-2.11.1.min.js'><\/script>")
	</script>
	<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
	<!-- 載入 Bootstrap 的 JavaScript 功能 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- 載入文字編輯器 -->
	<script src="js/summernote.min.js"></script>
	<!-- ************************/載入 jQuery bootstrap  summernote js套件************************ -->




	










	<!----------------------------------login------------------------------------------->

		<center>
			<form method="post" action="TravelDiaryServlet">
				<P>帳號:<input type="text" id="account" name="account" value="bb123"><br></P>
				<P>密碼:<input type="text" id="account" name="account" value="123"><br></P>
				<p>
				<input type="submit" value="送出">
				<input type="reset" value="清除">
				<input type="hidden" name="action" value="login">
				</p>
			</form>
		</center>







	<!----------------------------------/login------------------------------------------->




















<!-- *********************************************jQuery程式寫入 ************************************************-->
    <script>
    (function($) {
    	






    })(jQuery);
    </script>



    <!-- *********************************************/jQuery程式寫入 ************************************************-->


</body>

</html>
