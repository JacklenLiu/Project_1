<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="../platform/include_title.jsp" %>
	<%@ include file="../platform/include_start.jsp" %>
	<script src="../js/jquery-1.11.0.js"></script>
    <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
    <link rel="stylesheet" href="Jacklen_css/Jacklen.css"> <!--蕙齊css-->
<!-- 	<link rel="stylesheet" href="../Styles/jquery-ui.min.css"> 蕙齊link -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">
	<!-- 調整navbar btn -->
	<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<style>
	.ui-dialog-titlebar-close {
  		visibility: hidden;
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
                	<li class="dropdown">
                  		<a href="route_search.jsp" name="indexLoginBtn" class="noChange">景點介紹</a>
                  	</li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
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
                    <%@ include file="../platform/include_A_href/memberSession.jsp"%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
	</div>
    <!-- /.container -->
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
	</nav>
<%-- 	<%@ include file="../platform/include_picture.jsp"%> --%>
<%@ include file="../platform/include_picture/include_picture.jsp" %>
<!-- ******************************************************************* -->
<div class="container">	
	<div class="row" style="padding-top:20px; padding-left:50px">	
        <div class="col-sm-5">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="concept" class="control-label pull-left" style="font-size:15px">My Friend's Route:</label>
                        <div class="col-sm-5">
                           <select class="form-control" name="expiry-year" id="routeselID">
              				  <option id="<%= sionLoginId %>" value="<%= sionLoginId %>" ><%= session.getAttribute("userName") %></option>
<!--               			   			<option value="def" id="def">------請選擇------</option> -->
              			   </select>
                        </div>
                         <button type="button" class="btn btn-success" id="routeSearchbtn">Search</button>
                    </div>
                </div>
        </div> 
     </div>
</div>      
	<div id="titlediv"><center><h2 id="routeH2">我的路線</h2></center></div>
	<div class="panel-body form-horizontal payment-form">
		<div id="memRouteDiv" class="form-group ui-widget ui-helper-clearfix">
			<ul id="memRouteGallery"
				class="form-control memRoute-gallery ui-helper-reset ui-helper-clearfix"  style="border-radius: 2em"></ul>
		</div>
	</div>
	<div id="dialog-delete" title="刪除路線" hidden>
		<h2 class="memRoute-validateTips">真的要刪除?</h2>
	</div>

<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->




	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src='../Script/jquery-ui.js'></script>
<script>
		var serverName = "<%= serverName %>"; //localhost
		var serverPort = "<%= serverPort %>"; //8081
		var contextPath = "<%= contextPath %>"; //Project_1
		var sionLoginId = "<%= sionLoginId %>"; //aa123
		var memRoutes = ${memRoute};//取得 會員路線
		//console.log(memRoute);
		(function ($) {
			//list self Route when window onload
			listAllRoute(memRoutes, true);
			bindAlinkToDetail();
			
			var url = "http://" + serverName +":" + serverPort + "/" + contextPath + "/P4_MessageBoard/FrdServlet";
			$.ajax({
    			"type": 'POST',
    			"url": url,
    			"data": {"action":"GetFriends", "memID": sionLoginId},
    			"dataType":"json",
    			"async":false,
    			"success":function(datas){
    				console.log(datas);
    				$.each(datas, function(i, friend){
    					var opobj = $("<option></option>").attr("id",friend.friendID)
    													  .val(friend.friendID)
    													  .text(friend.friendName);
    					$("#routeselID").append(opobj);
    				});
    			}
     		});
			
			$("#routeSearchbtn").click(function(){
				var nodeleteIcon = false;
				var url = "viewnameServlet";
				$.getJSON(url, {'action':'GetRouteByMemID','reflash':'false','memID':$("#routeselID").val()}, function(datas){
					if($('#routeselID').val()== sionLoginId){
						nodeleteIcon = true;
						$('#routeH2').text('我的路線');
					}else{
						nodeleteIcon = false;
						$('#routeH2').text($("#routeselID :selected").text()+'的路線');
					}
					console.log(datas);
					$("#memRouteGallery").empty();
					listAllRoute(datas, nodeleteIcon);
					bindAlinkToDetail();
				});
			});
			
			function listAllRoute(memRoutes, nodeleteIcon){
				$.each(memRoutes, function(i, route){
        			console.log(i);
        			console.log(route);
        		
				
					//<h3 class="ui-widget-header">墾丁一日遊</h3> 
					var routeName = $('<h3></h3>').text(route.routeName)
											  	  .addClass("ui-widget-content ui-corner-tr");
				
					var firstView = findFirstView(route.routeID);
					//console.log(firstView);
				
					//<a><img src="images/C_7fy_01.jpg" alt="The peaks of High Tatras" width="200" height="200"></a>
					var routeFirstimg = $('<img></img>').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id=' + firstView)
														.addClass("memRoute-viewimge");
				
					var alinkimg = $('<a></a>').attr("href","#")
										   		.attr("id", "aID#"+route.routeID)
										   		.addClass("link-to-detail")
										   		.append(routeFirstimg);
					
					if(nodeleteIcon== true){
					//<a href='#' title='移除景點' class='ui-icon ui-icon-close'>移除景點</a>
					var recycle_icon = $('<a></a>').attr("href", "#")
											   		.attr("title", "移除此路線")
											   		.addClass("ui-icon ui-icon-close")
											   		.text("移除此路線");
					}
					
					//<li class="ui-widget-content ui-corner-tr"></li>
					var liObj = $('<li></li>').append(routeName)
										  	  .append(alinkimg)
										  	  .append(recycle_icon)
										  	  .attr("id", "liID_" + route.routeID)
										  	  .addClass("ui-widget-content ui-corner-tr")
										  	  .css("margin","1em")
										  	  .click(function click(event){
            								        	 	var $item = $( this ),
            							                 	$target = $( event.target );
            							              	 	if ( $target.is( "a.ui-icon-close" ) ) {
            							              		 	dialog.data("self",$item)
            							              		 	   	  .dialog( "open" );
            							              	 	}
            							         			return false;
            								     	});
				
					$("#memRouteGallery").append(liObj);
				
        		});
			}//end of listAllRoute function
        	
			//ul mouseover mouseout
			$('#memRouteGallery').mouseover(function(){
										$(this).css("overflow","auto");
									})
								 .mouseout(function(){
									 	$(this).css("overflow","hidden");
								 	});
			
        	//a link to get detail
        	function bindAlinkToDetail(){
        	$("a.link-to-detail").click(function(event){
        		event.preventDefault();
        		//console.log($(this).attr("id").substr(4));
        		var routeID = $(this).attr("id").substr(4);
        		window.location.href="http://" + serverName + ":" + serverPort + contextPath +"/P2_route" + "/viewnameServlet?action=GetRouteDetail&routeID="+ routeID;
        	})
        	}
        	//找路線中的第一個景點
        	function findFirstView(routeID){
        		var firstViewInner = "";
				var url = "viewnameServlet";
				$.ajax({
        			"url": url,
        			"type":"get",
        			"data":{'routeID':routeID,'action':'GetRouteFisrtByRouteID'},
        			"dataType":"text",
        			"async":false,
        			"success":function(data){	
        				firstViewInner = data;			
        			}
        		});
				return firstViewInner;
			}
        	
        	//刪除路線
        	function deleteRoute($item){
        		//console.log($item.attr("id").substr(5));
        		var url = "viewnameServlet";
        		$.get(url, {'routeID':$item.attr("id").substr(5),'action':'DeleteRouteByRouteID'});
        		$item.fadeOut(function() {
                    $item
                      .find( "a.ui-icon-close" )
                        .remove()
                      .end();
        		});
        	}
        	
        	//刪除路徑
            var dialog = $( "#dialog-delete" ).dialog({
                  autoOpen: false,
                  height: 300,
                  width: 350,
                  modal: true,
                  buttons: {
                    "確定": function(){
                      deleteRoute($(this).data('self'));
                      dialog.dialog( "close" );
                    },
                    "取消": function() {
                      dialog.dialog( "close" );
                    }
                  },
                  close: function() {
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