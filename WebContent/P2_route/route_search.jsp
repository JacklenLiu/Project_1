<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="Big5"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
  <%@ include file="../platform/include_title.jsp" %>
  <%@ include file="../platform/include_start.jsp" %>
  <link rel="stylesheet" href="Jacklen_css/component.css"><!-- ����css--> 
  <link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">
	
  <!-- �վ�navbar btn -->
  <link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<!-- ���u��@���x -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- �n�ͨ�@���x -->
    

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
                  			<a href="../P0_login/login.jsp" name="indexLoginBtn" class="noChange">�n�J</a>
                  	 	</li>
                  	</c:if>
                	<li class="dropdown">
                  		<a href="route_search.jsp" name="indexLoginBtn" class="noChange">���I����</a>
                  	</li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">���|�W�� <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        	<li>
                            	<a href="../P10_Random/Random.jsp" class="noChange"  name="indexLoginBtn">�H���ȵ{</a> 
                           	</li>
                            <li>
                                <a href="route_plan.jsp">���|�W��</a>
                            </li>
                            <li>
                                <a href="#" id="cooperationLink">�P�n�ͦP�B�W��</a>
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
                    		<i class="fa fa-user"></i><%=sionName%>�A�n<b class="caret"></b></a>
                 			<ul class="dropdown-menu">
		                       	<li>
		                           <a href="../P1_iud/userProfile.jsp">�|���򥻸��</a>
		                       	</li>
		                      	<li>
		                           	<a href="../P4_MessageBoard/SeekFriend2.jsp">�|���n�ͺ޲z&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                           		<span id="friendManage"></span>
		                           	</a>
		                       	</li>
		                        <li>
           							 <a href="http://<%=serverName%>:<%=serverPort%><%=contextPath%>/P2_route/viewnameServlet?action=GetRouteByMemID&reflash=true&memID=${userLoginId}">�ڪ����u</a>
        					 	</li>
		                       	<li>
		                           <a href="../LoginServlet?action=logOut">�n�X�t��</a>
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
	<div id="dialog-addFriend" title="�ܽЦn��" hidden>
		<span>
			<h4 style="display: inline">��ܦn��</h4> <select
			class="selectpicker show-menu-arrow" id="getFriends"></select> <input
			type="button" id="addToFriend" value="+" />
		</span> <br>
		<div id="friendDiv" style="width: 90%;"></div>
		<h4>���Ǥ���...</h4>
		<textarea id="textareamsgID" rows="4" cols="25">���I�i��~�j�a���b���A�o!</textarea>
	</div>
	<div id="dialog-checkCoFromFrd" title="�A�B�ͧ�A" hidden>
		<h4>�n���ܧA</h4>
	</div>
	<%-- 	<%@ include file="../platform/include_picture.jsp"%> --%>
	<%@ include file="../platform/include_picture/include_picture.jsp" %>


<div class="container">
			<!-- Top Navigation -->
		
			<header>
				<center>
					<h1 >���I���� </h1>
				</center>
				<div class="col-sm-12">
					<h3 style="float:left;">�j�M���I:</h3>
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
							<th>���I����</th>
							<th>���I�W��</th>
							<th>���I�ϰ�</th>
							<th>���I�Ӥ�</th>
							<th>�Բӻ���</th>
						</tr>
					</thead>
					<tfoot>
           				 <tr>
			                <th>���I����</th>
							<th>���I�W��</th>
							<th>���I�ϰ�</th>
							<th>���I�Ӥ�</th>
							<th>�Բӻ���</th>
			            </tr>
			        </tfoot>
					<tbody id="tbodyid" >
						
					</tbody>
				</table>
			</div>
</div><!-- /container -->




<!-- �h�[�o�����a�Ϥ��|�Y��footer -->
<div class="row"></div>	

<!-- footer�� -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer�� -->  
<script src="../seetalertjs/sweet-alert.js"></script> 

<script type="text/javascript">   



(function ($){
	//******�R�� �n�J�B��*****************************
	
	var sionLog = "<%=sionLoginId%>";
	if(sionLog == "null"){
 		//$(".navbar-right a[class != 'noChange'] ").prop("href","P0_login/login.jsp");
		$(".navbar-right a[class != 'noChange'] ").prop("href","#");
		$("a[name != 'indexLoginBtn']").click(function(){
			//alert("�Х��n�J�|��!!");
			sweetAlert("���\��ݥ���n�J�|��!!","","warning");
			$("#ok_sweetAlert").click(function(){
				window.location.href='http://'+ serverName +':'+ serverPort + contextPath +'/P0_login/login.jsp';
			});
				
		});
	}
	//******�R�� �n�J�B��*****************************
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
<!-- ���u��@���x -->
<script type='text/javascript' src='../js/CoPlatform.js'  data-sionLoginId='<%= session.getAttribute("userLoginId") %>' data-serverPort = "<%= serverPort %>" data-serverName = "<%= serverName %>" data-contextPath = "<%= contextPath %>"></script>
<!-- ���u��@���x  --> 
</body>
</html>