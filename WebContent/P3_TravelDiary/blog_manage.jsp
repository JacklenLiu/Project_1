<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="P3_TravelDiary.model.*"%>
<!-- 採用EL取值 -->
<% 
	//建立service去呼叫getll方法
	TravelDiaryService travelDiarySvc=new TravelDiaryService();
	String memberid=(String)session.getAttribute("memberinfo"); 
	List<TravelDiaryVO> list=travelDiarySvc.getAll(memberid);
	pageContext.setAttribute("list",list);
	//System.out.println("抓ID測試:"+member);
// 	測試抓值
//  	System.out.println("1:"+list.get(0).getMember_loginID());
//  	System.out.println("2:"+list.get(0).getTravelDiary_Name());
//  	System.out.println("3:"+list.get(0).getPublish_date());
//  	System.out.println("4:"+list.get(0).getTravelDiary_ID());
// 	測試抓值
%>





<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 使用 RWD 功能 -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen"> <!-- 載入 Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen"> <!-- Bootstrap 的 RWD 套件 -->
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
   <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 使用 RWD 功能 -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen"> <!-- 載入 Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen"> <!-- Bootstrap 的 RWD 套件 -->
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

<!---------------------------------全部文章show出------------------------------------------->


	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="row" >
			<div class="col-xs-1"></div>
			<div class="col-xs-1"></div>
			
		</div>
		<div class="boxer" id='primary-content'>
			<table class="table table-hover">
        		<thead>
            		<tr align='center' valign='middle'>
<!--             			<th style="text-align: center">篇數</th> -->
            			<th style="text-align: center">標題</th>
            			<th style="text-align: center">日期</th>
              		  	<th style="text-align: center">會員</th> 	
                	  	<th style="text-align: center">修改</th>
                	  	<th style="text-align: center">刪除</th>
            		</tr>
            		
            	</thead>
        		<%@ include file="page1.file" %>
 
       			<tbody>
				<c:forEach var="travelDiaryVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				
            			<tr align='center' valign='middle'>
            			<!-- 記得用EL取一定要把變數開頭字母變小寫(無關資料庫的欄位名稱) -->
<%--             				<td>${travelDiaryVO.travelDiary_ID}</td> --%>
            				<td>${travelDiaryVO.travelDiary_Name}</td>
            				<td>${travelDiaryVO.publish_date}</td>           		 	
               		 		<td>${travelDiaryVO.member_loginID}</td>  	 		
                	 		<td>
                	 			<form method="post" action="<%=request.getContextPath()%>/P3_TravelDiary/TravelDiaryServlet">
                	 				<input type="submit" value="修改">
                	 				<input type="hidden" name="TravelDiary_ID" value="${travelDiaryVO.travelDiary_ID}">
                	 				<input type="hidden" name="action" value="GetOneForUpdate">
                	 			</form>
                	 		</td>
                	 		
                	 		<td>
                	 			<form method="post" action="<%=request.getContextPath()%>/P3_TravelDiary/TravelDiaryServlet">
                	 				<input type="submit" value="刪除">
                	 				<input type="hidden" name="TravelDiary_ID" value="${travelDiaryVO.travelDiary_ID}">
                	 				<input type="hidden" name="action" value="GetOneForDelete">             	 			
                	 			</form>
                	 		</td>	
            			</tr>
            		</c:forEach>
      			</tbody>
    		</table>
    		<div class="col-xs-5"></div><%@ include file="page2.file" %>
		</div>
	</div>






















<!---------------------------------/全部文章show出------------------------------------------->


</body>
</html>