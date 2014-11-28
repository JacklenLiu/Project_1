<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../platform/include_title.jsp" %>
<%@ include file="../platform/include_start.jsp" %>
<script src="../js/jquery-1.11.0.js"></script>

<!-- wookmark -->
    <!-- CSS Reset -->
    <!-- wookmark的CSS跟navbar btn 相衝先diasble -->
	<link rel="stylesheet" href="wookmarkcss/reset.css">

    <!-- Global CSS for the page and tiles -->
    <link rel="stylesheet" href="wookmarkcss/main.css">
    
	<!-- 調整navbar btn -->
	<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">	
    <!-- Specific CSS for the example -->
<!-- /wookmark -->

<!-- css設定 -->
    <style>
    /**
     * Grid items
     */
    
    #tiles li {
        -webkit-transition: all 0.3s ease-out;
        -moz-transition: all 0.3s ease-out;
        -o-transition: all 0.3s ease-out;
        transition: all 0.3s ease-out;
    }
    
    .boxer {
	box-shadow: 0px 3px 12px 1px rgba(0, 0, 0, 0.0980392);
/* 	height: 1600px; */
	weight: 2000px;
	border-radius: 25px;
	background-color: white;
	margin: 1px 50px 50px 50px;
	border: 1px #dedfe0 solid;
}
    
    </style>

<!-- /css設定 -->
<!-- JKL使用jquery-ui -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- JKL使用jquery-ui -->
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
	
    <%@ include file="../platform/include_picture/include_picture.jsp" %>
    
	<!-- 觀看好友網誌 -->
	
    <div class="container">
    	 <div class="row" style="padding-top:20px">
    		 <div class="col-sm-5">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="concept" class="control-label pull-left" style="font-size:15px">My Friend's Blog:</label>
                        <div class="col-sm-5">
                           <select class="form-control" name="expiry-year" id="select_id">
              				  <option value="def" id="def">------請選擇------</option>
              				  <option value="<%=sionLoginId%>" id="def"><%=sionName%></option>
              			   </select>
                        </div>
                         <button type="button" class="btn btn-success" id="getfriendblog">Search</button>
                    </div>
                </div>
        </div> <!-- / panel preview -->
    				
   		</div>
    </div>
	<!-- /觀看好友網誌 -->
	<br><br><br><br>
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

    <!-- Include the imagesLoaded plug-in -->
    <script src="wookmarkjs/jquery.imagesloaded.js"></script>

    <!-- Include the plug-in -->
    <script src="wookmarkjs/jquery.wookmark.js"></script>
	
	
	   
    <!-- ************************/載入 jQuery bootstrap  summernote js套件************************ -->


	<p id="sionname" style="text-align:center;font-size:2em">我的文章</p>
 	
 	
 	<div id="container" >
 		<div id="nobloglist">
 			<!-- ****************尚未有文章********************* -->
            	<c:if test="${empty travelDiaryVO}">
            		<h1 style="text-align:center">抱歉您還沒有文章唷!!</h1>
            	</c:if>
            		<!-- ****************/尚未有文章********************* -->
 		</div><br><br>
 	</div>
 	<div class="boxer" id='primary-content' hidden>
		<div id="container">
        <!-- li有設定css功能 -->
        <div id="main" role="main">
            <div id="tiles">
            	
            		<!-- ****************/已有文章********************* -->
            	 <c:forEach var="travelDiaryVO" items="${travelDiaryVO}" >
               	 	<li id="${travelDiaryVO.travelDiary_ID}">${travelDiaryVO.travelDiary_Content}
                    	<p>${travelDiaryVO.travelDiary_Name}</p>
                	</li>
         		 </c:forEach>
         		<!-- ****************/已有文章********************* -->
            </div>
        </div>
    </div>
 	</div>
 
 <!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 --> 
 
 
  <!-- *********************************************jQuery程式寫入 ************************************************-->
    <script>
    (function($) {
    	var checkempty="${empty travelDiaryVO}";
    	if(checkempty =="true"){
    		$("#primary-content").prop("hidden",true);
    	}
    	else {
    		$("#primary-content").prop("hidden",false);
    	}
    	//用ajax抓好友ID	    	
    	//************一開啟這一頁先刪除option內容再重新用json抓好友名單
    	$("select>option[id!='def']").remove();
    	var member_loginID="<%=sionLoginId%>";
    	$.ajax({ 
 			"url": "TravelDiaryServlet",
 			"type":"post",
 			"data":{'action':'findMyFriends','member_loginID':member_loginID},
 			"dataType":"text",
 			"success":function(datas){
 				var myObject = JSON.parse(datas); 
 				$.each(myObject,function(i,item){
 					//取出放在json欄位是{"friend_loginID":XXX,"friend_loginID":OOO}
 					$('#def').after("<option value='"+item.friend_loginID+"'>"+item.friend_loginID+"</option>");
			
 				});
 			}	 			
 		});	 
    	
    	var selectedID="";
		var selectedVal="";
		var getID="<%=sionLoginId%>";
    	//按下送出時候我要把好友的部落格append上去
    	$('#getfriendblog').click(function(){
    		//當選到要的名單文字改變成XX的文章
    	
    		//被選到的val值
    		 selectedID=$('.form-control').val();
    		 selectedVal=$("#select_id").find("option:selected").text();
    		if(selectedID=="def"){
    			return;
    		}
    		if(selectedID==getID){
    			$('#sionname').html("我的文章");
    		}else{
    			$('#sionname').html(selectedID+"的文章");
    		}
    		
    		//按下送出後清除掉我原本的內容用來之後放我選到的文章
			$("div>p").remove();
			$("div>li").remove();
    		//若不是選到----請選擇的時候------才去撈好朋友ID
    		if(selectedID!='def'){
    			$.ajax({ 
    	 			"url": "TravelDiaryServlet",
    	 			"type":"post",
    	 			"data":{'action':'MyFriendBlog','myFriendID':selectedID},
    	 			"dataType":"text",
    	 			"success":function(datas){
    	 				var myObject = JSON.parse(datas); 
    	 				if(datas=="[]"){
    	 					$('#nobloglist>h1').remove();
    	 					$('#nobloglist').append("<h1 style='text-align:center'>抱歉您還沒有文章唷!!</h1>");
    	 					$('#primary-content').prop("hidden",true);
    	 				}else{
    	  	 				$('#nobloglist>h1').remove();
    	  	 				$('#primary-content').prop("hidden",false);
        	 				$.each(myObject,function(i,item){
//         	 					console.log("here");
//        	  					console.log(item.TravelDiary_ID);
//        	  					console.log(item.TravelDiary_Name);
//        	  					console.log(item.TravelDiary_Content);
       	  					
     							$('#tiles').append("<li id='"+item.TravelDiary_ID+"'>"+item.TravelDiary_Content+"<p>"+item.TravelDiary_Name+"</p></li>");
     									   
     							//再重新宣告新的按下click事件
     							$("#tiles>li").click(function(){
     							var picknum=$(this).attr("id");
//      							alert(picknum);
     							window.location.href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P3_TravelDiary/TravelDiaryServlet?action=pickblog&picknum="+picknum;	
     						    
     							});
        	 				});
        	 				
        	 				  $('#tiles').imagesLoaded(function() {
        	 		              function comparatorIsStamped(a, b) {
        	 		                  var $a = $(a),
        	 		                      $b = $(b);
        	 		                  // Check if tile should be the first one
        	 		                  if (!$a.hasClass('stamped-first') && $b.hasClass('stamped-first'))
        	 		                      return 1;
        	 		                  // Check if tile should be the last one
        	 		                  if ($a.hasClass('stamped-last') && !$b.hasClass('stamped-last'))
        	 		                      return 1;
        	 		                  // Check if tile should the fourth one
        	 		                  if (!$a.hasClass('stamped-fourth') && $b.hasClass('stamped-fourth') && $a.index() >= 4)
        	 		                      return 1;
        	 		                  return -1;
        	 		              }

        	 		              // Prepare layout options.
        	 		              var options = {
        	 		                  autoResize: true, // This will auto-update the layout when the browser window is resized.
        	 		                  container: $('#main'), // Optional, used for some extra CSS styling
        	 		                  offset: 2, // Optional, the distance between grid items
        	 		                  itemWidth: 210, // Optional, the width of a grid item
        	 		                  comparator: comparatorIsStamped, // Used to sort the items
        	 		                  direction: 'left' // Set this to 'right' if you want to stamp the 'stamped-first' item to the right
        	 		              };

        	 		              // Get a reference to your grid items.
        	 		              var $handler = $('#tiles li');
        	 		              $handler.each(function(i) {
        	 		                  console.log($(this).index() + ':' + $(this).find('p').text());
        	 		              });
        	 		              // Call the layout function.
        	 		              $handler.wookmark(options);
        	 		          });
    	 				}
    	 			}	 	
    	 		});	 
    		}else{
    			
    		}
		});
    	
    	//***********一開啟這一頁先刪除option內容再重新用json抓好友名單

    	
    	//*************偵測按下CLICK選到哪個圖片*******************
    	 
    	$("#tiles>li").click(function(){
    	//取照片ID
    	var picknum=$(this).attr("id");
    	//動態取網頁contextPath
    	
    	//用一個作弊方法:因為無法在這使用.get .post等等，再使servlet做forward轉頁 會失敗
    	//window.location.href="http://localhost:8081/wookmark/P3_TravelDiary/TravelDiaryServlet?action=pickblog&picknum="+picknum;
    	window.location.href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P3_TravelDiary/TravelDiaryServlet?action=pickblog&picknum="+picknum;	
	
    	});
    	
    	
    	
    	//*************/偵測按下CLICK選到哪個圖片*******************
    	
		//**********************jQuery文章外掛**********************************
    	  $('#tiles').imagesLoaded(function() {
              function comparatorIsStamped(a, b) {
                  var $a = $(a),
                      $b = $(b);
                  // Check if tile should be the first one
                  if (!$a.hasClass('stamped-first') && $b.hasClass('stamped-first'))
                      return 1;
                  // Check if tile should be the last one
                  if ($a.hasClass('stamped-last') && !$b.hasClass('stamped-last'))
                      return 1;
                  // Check if tile should the fourth one
                  if (!$a.hasClass('stamped-fourth') && $b.hasClass('stamped-fourth') && $a.index() >= 4)
                      return 1;
                  return -1;
              }

              // Prepare layout options.
              var options = {
                  autoResize: true, // This will auto-update the layout when the browser window is resized.
                  container: $('#main'), // Optional, used for some extra CSS styling
                  offset: 2, // Optional, the distance between grid items
                  itemWidth: 210, // Optional, the width of a grid item
                  comparator: comparatorIsStamped, // Used to sort the items
                  direction: 'left' // Set this to 'right' if you want to stamp the 'stamped-first' item to the right
              };

              // Get a reference to your grid items.
              var $handler = $('#tiles li');

              $handler.each(function(i) {
                  console.log($(this).index() + ':' + $(this).find('p').text());
              });

              // Call the layout function.
              $handler.wookmark(options);
          });
	
    	//**********************/jQuery文章外掛**********************************
		
    	

    })(jQuery);
    </script>
 
 <%@ include file="../platform/include_script.jsp" %>
</body>
</html>