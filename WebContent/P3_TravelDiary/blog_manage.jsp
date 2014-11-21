<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="P3_TravelDiary.model.*"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>
<script src="../js/jquery-1.11.0.js"></script>
<!-- 採用EL取值 -->
<% 
	//建立service去呼叫getll方法
	TravelDiaryService travelDiarySvc=new TravelDiaryService();
 	String memberid=(String)session.getAttribute("userLoginId"); 
	List<TravelDiaryVO> list=travelDiarySvc.getAll(memberid);
	pageContext.setAttribute("list",list);
%>
	<%@ include file="../platform/include_start.jsp" %>	
	 <!-- 調整navbar btn -->
	<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
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
	<nav class="navbar navbar-fixed-top" role="navigation">
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
	
<%-- 	<%@ include file="../platform/include_picture/include_picture.jsp" %> --%>
    <%@ include file="../platform/include_picture/include_picture.jsp" %>
   
    <!-- ************************載入 jQuery bootstrap  summernote js套件************************ -->
    <!--  <script src="http://code.jquery.com/jquery.js"></script> -->

    <!-- 存取google提供的jquery檔案 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    
    <!-- 網路存取jquery.min.js失效，換轉存取我資料夾內的js -->
    <script>!window.jQuery && document.write("<script src='js/jquery-2.1.1.min.js'><\/script>")</script>
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
                	 				<input type="submit" class="btn btn-submit btn-warning" value="修改">
                	 				<input type="hidden" name="TravelDiary_ID" value="${travelDiaryVO.travelDiary_ID}">
                	 				<input type="hidden" name="action" value="GetOneForUpdate">
                	 			</form>
                	 		</td>
                	 		
                	 		<td>
                	 			<form method="post" action="<%=request.getContextPath()%>/P3_TravelDiary/TravelDiaryServlet">
                	 				<input type="submit" class="btn btn-submit btn-danger" value="刪除">
                	 				<input type="hidden" name="TravelDiary_ID" value="${travelDiaryVO.travelDiary_ID}">
                	 				<input type="hidden" name="action" value="GetOneForDelete">             	 			
                	 			</form>
                	 		</td>	
            			</tr>
            		</c:forEach>
      			</tbody>
    		</table>
    		<%@ include file="page2.file" %>
		</div>
	</div>
<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  
<!---------------------------------/全部文章show出------------------------------------------->

<%@ include file="../platform/include_script.jsp" %>
</body>
</html>