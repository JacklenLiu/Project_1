<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 使用Date因為要抓建立文章的時期 -->
<%@ page import="java.util.*"%>
<% 		
		Date date = new Date();
		java.util.Date right=new java.util.Date(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 的 RWD 套件 -->
    <!-- 載入Bootstrap css樣式 -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- 使用 RWD 功能 -->
    <!-- 文字編輯器css樣式 -->
    <link rel="stylesheet" href="css/summernote.css">
    <link rel="stylesheet" href="css/codemirror.css">
    <!-- 圖案icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <title>Hello Bootstrap</title>

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
                    <li>
<!--                         <a href="P0_login/login.jsp">登入</a> -->
                        <a href="#myModal" data-toggle="modal" data-target="#myModal">登入</a>
                    </li>
<!--                     <li> -->
<!--                         <a href="services.html">Services</a> -->
<!--                     </li>                    -->
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
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../full-width.html">Full Width Page</a>
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







	<div style="visibility:hidden"><c:out value="${MSG}"></c:out>
	</div>

    <!-- ************************載入 jQuery bootstrap  summernote js套件************************ -->
    <!--  <script src="http://code.jquery.com/jquery.js"></script> -->

    <!-- 存取google提供的jquery檔案 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- 網路存取jquery.min.js失效，換轉存取我資料夾內的js -->
    <script>
    !window.jQuery && document.write("<script src='js/jquery-2.1.1.min.js'><\/script>")
    </script>
    <!-- <script src="js/jquery-1.11.1.min.js"></script> -->
    <!-- 載入 Bootstrap 的 JavaScript 功能 -->
    <script src="js/bootstrap.min.js"></script>
    <!-- 載入文字編輯器 -->
    <script src="js/summernote.min.js"></script>
    <!-- ************************/載入 jQuery bootstrap  summernote js套件************************ -->

 

	<br><br><br><br><br><br><br>
    <!-- ************************************************文字編輯器**************************************************** -->
    <!-- 編輯器 -->
    <div class="row" style="padding-top:50px">
        <div class="container">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <form method="post" action="TravelDiaryServlet">
                    <div class="form-group">
                        <label for="" style="">文章編輯</label>
                        <div class="post">
                            <img src="img/aa123.jpg" height="80" width="80" alt="aa123" title="aa123">
                        </div>
                        <!-- 寫入DB測試用假表格 -->
                        <div class="row">
                            <!-- ID獲取 -->
                            <label for="" class="col-xs-1">ID:</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control " id="member_loginID" name="member_loginID" value="${memberinfo}" readonly="${memberinfo}">
<!--                                 <input type="text" class="form-control " id="member_loginID" name="member_loginID" > -->
                            </div>
                            <!-- 文章標題 -->
                            <label for="" class="col-xs-1">Title:</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control " id="TravelDiary_Name" name="TravelDiary_Name" value="擎天崗一日遊超好玩">
<!--                                 <input type="text" class="form-control " id="TravelDiary_Name" name="TravelDiary_Name" > -->
                           
                            </div>
                            <!-- 建置日期 -->
                            <label for="" class="col-xs-1">Date:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control " id="publish_date" name="publish_date" value="<%= new java.sql.Timestamp(right.getTime())%>" readonly="<%= new java.sql.Timestamp(right.getTime())%>">        
                            </div>
							<input type="hidden" id="getcontent" name="getcontent">
                        </div>
                        <textarea name="content" id="summernote" rows="10" class="form-control active_textarea">
                        </textarea>
                        
                    </div>
                    <input type="submit" class="btn btn-submit pull-right" id="submit" value="送出">
                    <input type="hidden" name="action" value="InsertBlog">
                     <input type="button" class="btn btn-submit pull-right" id="cancel" value="取消">
                </form>
              	
<!--                 <button type="button" class="btn btn-submit pull-right" id="submit1">jquery post測試</button> -->
             
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
        $('#summernote').summernote({
            height: 300,
            focus: true,
            toolbar: [
                ['style', ['style']], // no style button
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['picture']], // no insert buttons
//                 ['table', ['table']], // no table button
//                 ['help', ['help']] //no help button
            ]

        });


        //測試讀取content內容資料
        var TravelDiary_Content;
        $('#submit').click(function(event) {
        	

        	
        	
        	
        	
      
            TravelDiary_Content = $('#summernote').code();

            
            
            

        });


    	$("#cancel").click(function(){	
			window.location.href = "blog_all.jsp";
			
		});

 

        // 下拉選單用
        $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });

		


	



    })(jQuery);
    </script>



    <!-- *********************************************/jQuery程式寫入 ************************************************-->





</body>

</html>

