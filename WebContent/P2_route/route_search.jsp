<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="Big5"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
  <%@ include file="../platform/include_title.jsp" %>
  <%@ include file="../platform/include_start.jsp" %>
  <link rel="stylesheet" href="Jacklen_css/component.css"><!-- 蕙齊css--> 
  <link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
	
  <!-- 調整navbar btn -->
  <link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<!-- 路線協作平台 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- 好友協作平台 -->
    

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
			<%@ include file="../platform/include_A_href/toIndex.jsp" %> 
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<c:if test="<%=sionName == null%>">
                  		<li class="dropdown">
                  			<a href="../P0_login/login.jsp" name="indexLoginBtn" class="noChange">登入</a>
                  	 	</li>
                  	</c:if>
                	<li class="dropdown">
                  		<a href="route_search.jsp" name="indexLoginBtn" class="noChange">景點介紹</a>
                  	</li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        	<li>
                            	<a href="../P10_Random/Random.jsp" class="noChange"  name="indexLoginBtn">隨機旅程</a> 
                           	</li>
                            <li>
                                <a href="route_plan.jsp">路徑規劃</a>
                            </li>
                            <li>
                                <a href="#" id="cooperationLink">與好友同步規劃</a>
                            </li>
                        </ul>
                    </li>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %> 
<%--                     <%@ include file="../platform/include_A_href/Portfolio.jsp" %> --%>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp"%>
					<%@ include file="../platform/include_A_href/P6_contactUs.jsp"%>
                    <c:if test="<%=sionName != null%>">
                 		<li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    		<i class="fa fa-user"></i><%=sionName%>你好<b class="caret"></b></a>
                 			<ul class="dropdown-menu">
		                       	<li>
		                           <a href="../P1_iud/userProfile.jsp">會員基本資料</a>
		                       	</li>
		                      	<li>
		                           	<a href="../P4_MessageBoard/SeekFriend2.jsp">會員好友管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                           		<span id="friendManage"></span>
		                           	</a>
		                       	</li>
		                        <li>
           							 <a href="http://<%=serverName%>:<%=serverPort%><%=contextPath%>/P2_route/viewnameServlet?action=GetRouteByMemID&reflash=true&memID=${userLoginId}">我的路線</a>
        					 	</li>
		                       	<li>
		                           <a href="../LoginServlet?action=logOut">登出系統</a>
		                       	</li>
                  			</ul>
                     	</li>		
                  	</c:if>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
	</div>
    <!-- /.container -->
	</nav>
	<div id="dialog-addFriend" title="邀請好友" hidden>
		<span>
			<h4 style="display: inline">選擇好友</h4> <select
			class="selectpicker show-menu-arrow" id="getFriends"></select> <input
			type="button" id="addToFriend" value="+" />
		</span> <br>
		<div id="friendDiv" style="width: 90%;"></div>
		<h4>說些什麼...</h4>
		<textarea id="textareamsgID" rows="4" cols="25">快點進來~大家都在等你囉!</textarea>
	</div>
	<div id="dialog-checkCoFromFrd" title="你朋友找你" hidden>
		<h4>好友邀你</h4>
	</div>
	<%-- 	<%@ include file="../platform/include_picture.jsp"%> --%>
	<%@ include file="../platform/include_picture/include_picture.jsp" %>


<div class="container">
			<!-- Top Navigation -->
		
			<header>
				<center>
					<h1 >景點介紹 </h1>
				</center>
				<div class="col-sm-12">
					<h3 style="float:left;">搜尋景點:</h3>
				</div>
				<div class="col-md-4">
					<input type="text" id="search" class="form-control col-sm-5" name="search"><span id="loading" hidden><img src="../Images/ajax-loader.gif" /></span>
				</div>
			</header>
			<div class="col-sm-12">
			<br>         
			<center><img src="images/gears.gif" id="getAllEnd"></center>    
				<table id="example" class="display" cellspacing="0">
					<thead>
						<tr>
							<th>景點順序</th>
							<th>景點名稱</th>
							<th>景點區域</th>
							<th>景點照片</th>
							<th>詳細說明</th>
						</tr>
					</thead>
					<tfoot>
           				 <tr>
			                <th>景點順序</th>
							<th>景點名稱</th>
							<th>景點區域</th>
							<th>景點照片</th>
							<th>詳細說明</th>
			            </tr>
			        </tfoot>
					<tbody id="tbodyid" >
						
					</tbody>
				</table>
			</div>
</div><!-- /container -->




<!-- 多加這個讓地圖不會吃到footer -->
<div class="row"></div>	

<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  
<script src="../seetalertjs/sweet-alert.js"></script> 

<script type="text/javascript">   



(function ($){
	//******昱豪 登入處裡*****************************
	
	var sionLog = "<%=sionLoginId%>";
	if(sionLog == "null"){
 		//$(".navbar-right a[class != 'noChange'] ").prop("href","P0_login/login.jsp");
		$(".navbar-right a[class != 'noChange'] ").prop("href","#");
		$("a[name != 'indexLoginBtn']").click(function(){
			//alert("請先登入會員!!");
			sweetAlert("此功能需先行登入會員!!","","warning");
			$("#ok_sweetAlert").click(function(){
				window.location.href='http://'+ serverName +':'+ serverPort + contextPath +'/P0_login/login.jsp';
			});
				
		});
	}
	//******昱豪 登入處裡*****************************
	var serverName = "<%= request.getServerName()%>";
	var serverPort = "<%= request.getServerPort()%>";
	var contextPath = "<%= request.getContextPath()%>";

	var imgUrl = "viewnameServlet";
   	$.getJSON(imgUrl,{'action':'getAll'}, function(datas){
   		$.each(datas,function(i,item){
   			$("#tbodyid").append("<tr class='addView'>");
   			$("#tbodyid").append("<td>"+(i+1)+"</td>");
   			$("#tbodyid").append("<td>"+item.viewname+"</td>");
   			$("#tbodyid").append("<td>"+item.viewArea+"</td>");
			$('#tbodyid').append('<td><img src='+'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageAllServlet?id='+item.imagesid+' style="height:100px;width:200px;" /></td>');
			$('#tbodyid').append("<td>"+item.imgdescript+"</td");
			$("#tbodyid").append("</tr>");
   			
   		});
   		$("#getAllEnd").prop("hidden",true);
   	});
   	
	var imagesID="";
	$("#search").keyup(function(){
		$("#loading").prop("hidden",false);
		imagesID= $.trim($(':text[id="search"]').val());
		if(imagesID != ""){
			var imgSearchdUrl = "viewnameServlet";
	       	$.getJSON(imgSearchdUrl,{'action':'getSearch','search':imagesID}, function(datas){
	       		$("#tbodyid").empty();
	       		$.each(datas,function(i,item){
	       			$("#tbodyid").append("<tr>");
	       			$("#tbodyid").append("<td>"+(i+1)+"</td>");
	       			$("#tbodyid").append("<td>"+item.viewname+"</td>");
	       			$("#tbodyid").append("<td>"+item.viewArea+"</td>");
	       			$('#tbodyid').append('<td><img src='+'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageSearchServlet?viewid='+item.viewname+' style="height:100px;width:200px;" /></td>');
	    			$('#tbodyid').append("<td>"+item.imgdescript+"</td");
	    			$("#tbodyid").append("</tr>");
	       		
	       		});
	       		$("#loading").prop("hidden",true);
	       	});
		}else{
			$("#loading").prop("hidden",false);
			$.getJSON(imgUrl,{'action':'getAll'}, function(datas){
				$("#tbodyid").empty();
		   		$.each(datas,function(i,item){
		   			$("#tbodyid").append("<tr class='addView'>");
		   			$("#tbodyid").append("<td>"+(i+1)+"</td>");
		   			$("#tbodyid").append("<td>"+item.viewname+"</td>");
		   			$("#tbodyid").append("<td>"+item.viewArea+"</td>");
					$('#tbodyid').append('<td><img src='+'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageAllServlet?id='+item.imagesid+' style="height:100px;width:200px;" /></td>');
					$('#tbodyid').append("<td>"+item.imgdescript+"</td");
					$("#tbodyid").append("</tr>");
		   		});
		   		$("#loading").prop("hidden",true);
		   	});
		}
	});
})(jQuery);

</script>
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
<!-- 路線協作平台 -->
<script type='text/javascript' src='../js/CoPlatform.js'  data-sionLoginId='<%= session.getAttribute("userLoginId") %>' data-serverPort = "<%= serverPort %>" data-serverName = "<%= serverName %>" data-contextPath = "<%= contextPath %>"></script>
<!-- 路線協作平台  --> 
</body>
</html>