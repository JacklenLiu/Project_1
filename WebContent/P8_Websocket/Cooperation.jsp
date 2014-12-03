<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <%@ include file="../platform/include_title.jsp" %>
  <%@ include file="../platform/include_start.jsp" %>
    <title>Sticker Story</title>
    <link href="css/styles.css" rel="stylesheet" type="text/css" >
     <link href="css/images.css" rel="stylesheet" type="text/css" >
    <link rel="stylesheet" href="../Styles/jquery-ui.min.css"> <!-- 蕙齊link -->
    <link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
  </head>
  <body>
    <header>
      <!-- Navigation -->
<nav class="navbar  navbar-fixed-top" role="navigation">
	<div class="rowHeader">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header" id="indexBtn">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../index.jsp" name="indexLoginBtn">下一站，幸福</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	<ul class="nav navbar-nav navbar-right">
                	<c:if test="<%=sionName == null%>">
                  		<li class="dropdown">
                  			<a href="../P0_login/login.jsp" name="indexLoginBtn" class="noChange">登入</a>
                  	 	</li>
                  	</c:if>
                  	<li class="dropdown">
                  		<a href="../P2_route/route_search.jsp" name="indexLoginBtn" class="noChange">景點介紹</a>
                  	</li>
                   	<li class="dropdown">
                       	<a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                       	<ul class="dropdown-menu">
                        	<li>
                            	<a href="../P2_route/route_plan.jsp">路經規劃</a> 
                           	</li>
                           	<li>
<%--                               	<a href="P8_Websocket/Cooperation.jsp?memID=${userLoginId}">與好友同步規劃</a> --%>
                              	<a href="#" id="cooperationLink">與好友同步規劃</a>
                           	</li>
                           	<li>
                              	<a href="../portfolio-4-col.html">4 Column Portfolio</a>
                           	</li>
                           	<li>
                              	<a href="../portfolio-item.html">Single Portfolio Item</a>
                           	</li>
                       	</ul>
                   	</li>
                    <li class="dropdown">
                    	<a href="../P4_MessageBoard/showALL.jsp">留言板</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href=".portfolio-1-col.html">1 Column Portfolio</a>
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
                                <a href="ortfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        	<li>
			                	<a href="P3_TravelDiary/TravelDiaryServlet?action=blog.do">所有文章 </a>
			                </li>                         
                            <li>
                                <a href="../P3_TravelDiary/blog_editor.jsp">發表新文章</a>
                            </li>
                            <li>
                                <a href="../P3_TravelDiary/blog_manage.jsp">管理我的文章</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="P6_ContactUs/ContactUs.jsp" class="dropdown-toggle noChange" data-toggle="dropdown" name="indexLoginBtn">聯絡我們<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="P6_ContactUs/ContactUs.jsp" class="noChange" name="indexLoginBtn">聯絡我們</a>
                            </li>
                            <li>
                                <a href="faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="404.html">404</a>
                            </li>
                            <li>
                                <a href="pricing.html">Pricing Table</a>
                            </li>
                        </ul>
                    </li>
                    <c:if test="<%=sionName != null%>">
                 		<li class="dropdown">
                    		<a href="#"  class="dropdown-toggle" data-toggle="dropdown">
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
		                           <a href="LoginServlet?action=logOut">登出系統</a>
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
    </header>
    

    <aside>
    

      <h2>地區選擇</h2>
      <select  id="sel1">
		<option value="北部" id="N">北部</option>
  		<option value="中部" id="C">中部</option>
  		<option value="南部" id="S">南部</option>
  		<option value="東部" id="E">東部</option>
	  </select>

      <div id="stickerContainer" ondrop="dropback(event)" ondragover="allowDrop(event);">
      	<ul id="viewulID" class="viewul" ></ul>
      </div>
      
    </aside>
    
   
     <div id="board"  ondrop="drop(event);" 
          ondragover="allowDrop(event);" >
          <ul id="boardulID" class="boardul"></ul>
      </div >
      
      <div id="mapdiv" >
		
	</div>
      
    <div id="editchat">
     <div id="chatDiv" ></div> 
     <div id="btdiv">
     <textarea id="chatinput" ></textarea>
     <span>
     <input id="chatbt" type="button" value="送出">
     
     <input id="saveRoutebt" type="button" value="儲存路線" class="savebt">
     </span>
    </div>
    </div>
    
  <div id="dialog-save" title="儲存路線" >
     <h2 class="validateTips">路線名稱</h2>
     <input type="text" name="routeName" id="routeName" value="多人協作路線" class="text ui-widget-content ui-corner-all" >
   </div >
   
    <div id="dialog-saveSuccess" title="儲存成功" >
    <h2 class="validateTips">儲存成功</h2>
    </div>
    
   
    <div id="logContainer">
      <h2>log</h2>
      <div id="log"></div>
    </div>
    
    
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src="http://maps.google.com/maps/api/js?sensor=false&libraries=geometry"></script>
<script src='../Script/jquery-ui.js'></script>	
<script src="js/story-page.js" type="text/javascript"></script>
<script src='../Script/jquery.tinyMap.js'></script>
    <script>
    var sionName = "<%= sionName %>";//username
    var serverName = "<%= serverName %>"; //localhost
	var serverPort = "<%= serverPort %>"; //8081
	var contextPath = "<%= contextPath %>"; //Project_1
	var sionLoginId = "<%= sionLoginId %>"; //aa123
	var memPlatform = "<%= request.getParameter("memID")%>";
	console.log("here!!");
	console.log(memPlatform);
	
   (function ($){
	   
	   jQuery.event.props.push('dataTransfer');
	   
	   $(window).load(function() {
		$('#sel1').val("北部");   //預設北部
		area =  "北部" ;
       	getViewDataByArea(area);
		});
	   

	   function getViewDataByArea(area){  //連接servlet 呼叫GerAllJSON的方法 帶區域參數 給servlet;
   		var url = "http://"+ serverName +':'+ serverPort + contextPath +"/P2_route/viewnameServlet";
           $.getJSON(url, {'area':area,'action':'GetAllByArea'}, function(datas){
        	 view(area ,datas);//呼叫view並帶區域參數
            
           });
	   }

	   $('#sel1').change(function(){ //變更景點區域viewarea
		 	area = $(this).val();
		 	getViewDataByArea(area);
		});
	   
	function view(area ,datas){   //用each切割出datas裡每個object
		$('#viewulID').empty();
		$('#mapdiv').tinyMap();
		var addrs = [];
		
		$.each(datas,function(i,item){// i   -> index
			console.log(datas);        //item -> item
			
			var a = [item.viewlng,item.viewlat];
    		addrs[i] = a;
    		console.log(item.viewlng);
			
			var imgarea="E_";

			switch(area){
				case "北部":
					imgarea="N_";
					break;
				case "中部":
					imgarea="C_";
					break;
				case "南部":
					imgarea="S_";
					break;
				case "東部":
					imgarea="E_";
					break;
			}
			
			
			var alinkaddroute = $('<a></a>').attr("title", "加入行程")
			.addClass("ui-icon ui-icon-plus")
			.attr("href",'#')
			.attr("data-sticker", imgarea + item.viewID +'_01')
		 	.attr("data-viewname", item.viewname)
		 	.attr("data-viewID", item.viewID)
		 	.attr("action", "add")
		 	.attr("lng",item.viewlng)
		 	.attr("lag",item.viewlat)
		 	.attr("draggable",'true')
			.text("加入行程")
			.bind('click', function(event){
				clickedit(event);
			});
			
			var imgtitle = $('<h5></h5>').text(item.viewname); //取得景點名稱　 
			var imgs = $('<img></img>')
			.attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+imgarea+ item.viewID + '_01')
			.attr("data-sticker", imgarea + item.viewID +'_01')
		 	.attr("data-viewname", item.viewname)
		 	.attr("data-viewID", item.viewID)
		 	.attr("action", "add")
		 	.attr("lng",item.viewlng)
		 	.attr("lag",item.viewlat)
		 	.addClass("viewimge").attr("draggable",'true')
			.bind('dragstart', function(event){
		        drag(event);
		    }).addClass("fixli ui-widget-content ui-corner-tr");
			console.log(item.viewID);
			var viewimg = $('<li></li>')
		 	.attr("data-sticker", imgarea + item.viewID +'_01')
		 	.attr("data-viewname", item.viewname)
		 	.attr("data-viewID", item.viewID)
		 	.attr("action", "add")
		 	.attr("lng",item.viewlng)
		 	.attr("lag",item.viewlat)
		 	.attr("draggable",'true')
		 	.bind('dragstart', function(event){
		        drag(event);
		    })
		 	.addClass("fixli ui-widget-content ui-corner-tr")
		 	.append(imgtitle).append(imgs).append(alinkaddroute);
			
		//	$(document).ready(function() {
		//      $('img').hoverpulse({
		//          size: 40,  // number of pixels to pulse element (in each direction)
		//         speed: 400 // speed of the animation 
		//        });
		//    });
			
		    $('#viewulID').append(viewimg);
		    //選擇地區時 刪掉 已拖移至右區的圖
		    if($('#boardulID').find("li").attr("id") != null){
		    var rightliID = $('#boardulID').find("li");
		       $.each(rightliID,function(i, item){
		    	  var liID = $(this).attr("id");
		    	  
		    	  var leftliID = $('#viewulID').find("li");
		    	  $.each(leftliID,function(i, item){
		    		var liID2 = $(this).attr("data-viewID");
		    		console.log(liID2);
		    		if(liID == liID2){
		    			$(this).remove();
		    		}
		    	  });
		     });
		    
		    }
		    
		});

	}   
	
	//送出文字事件 
	$('#chatbt').click(function(){  //送出 -> click事件
		var userchat = $('#chatinput').val();//讀取chatinput所輸入的值-> 並放入userchat
		$('#chatinput').val("");//將值拿掉
		var chat = sionName +" : " + userchat; //將使用者(sionName) 跟 userchat 串在一起
		chatsend(chat);//呼叫story-page.js 的 chatsend並帶參數
	});
	//Enter送出文字事件(Keypress keycode = 13　→enter)
	$("#chatinput").keypress(function(event){       
        if (event.keyCode == 13) {
        	var userchat = $('#chatinput').val();
    		$('#chatinput').val("");
    		var chat = sionName +" : " + userchat; 
    		chatsend(chat);
        }
    });
	//儲存路線事件
	$('#saveRoutebt').click(function(){
		
		dialog.dialog( "open" );

	});
	//彈出dialog -> 讓使用者輸入景點名稱 並確定儲存或取消
	var dialog = $( "#dialog-save" ).dialog({
		autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: {
          "儲存": function(){
	//儲存 -> 將viewsID陣列打包成物件
		var viewsObj = new Array();
		viewsObj = $('#board li');
		var viewsID = new Array();
		
		// 將抓到的li(viewsObj) 用each切割 出id屬性 並放入陣列viewsID[]
		$.each(viewsObj,function(i, item){
			viewsID[i] = $(item).attr("id");
		});
		console.log(viewsID);
		//將 userID 及輸入的 路線名稱 及陣列viewsID 打包
		var detailToServlet = {
				"memID": sionLoginId,
				"routeName": $('#dialog-save :text').val(),
				"routeResult":viewsID,
		};
		console.log(JSON.stringify(detailToServlet));
		
		var url = "../P2_route/viewnameServlet";
        //將打包好的物件(detailToServlet)送viewnameServlet
		$.ajax({
			"type":"POST",
			"url":url,
			"data": {"action":"saveRoute", "routeJSONStr": JSON.stringify(detailToServlet)},
			"async":false,
			"success":function(data){
				$.ajax({
					"type": 'POST',
      		  		"url": url,
      		  		"data": {"action":"increaseHitRate", "routeResult": JSON.stringify(viewsID)},
      		  		"async":false,
      		  	    "success":function(data){
      		  	    dialog.dialog( "close" );
    				dialog1.dialog( "open" );
      		  	    }
				});
			  }//end of success function
		  });
				viewsID = [];
			},
            "取消": function() {
              dialog.dialog( "close" );
            }
          },
          close: function() {
          }
        });
	 var dialog1 = $( "#dialog-saveSuccess" ).dialog({
         autoOpen: false,
         height: 300,
         width: 350,
         modal: true,
         buttons: {
           "確定": function(){
         		//產生json字串送到server
         		dialog1.dialog( "close" );
         		//'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+imgarea+ item.viewID + '_01'
         		window.location.href = "http://" + serverName + ":" + serverPort + contextPath +"/P2_route" + "/viewnameServlet?action=GetRouteByMemID&reflash=true&memID=" + sionLoginId;
           }
         },
         close: function() {
         }
       });
	 
	 $('#boardulID').bind('DOMNodeInserted DOMNodeRemoved', function(event){
  		
  		
 		if(event.type == 'DOMNodeInserted'){
 			$('#mapdiv').tinyMap('clear','marker');
 			
       
 			var rightli = $('#boardulID').find("li");
 			var addrs = [], vname = [], markers = [];
 		    var center ;
 			$.each(rightli, function(i,item){
 				var viewname = $(this).attr("data-viewname");
 				var lng = $(this).attr("lng");
 				var lag = $(this).attr("lag");
 				
 				
 				
 				var a = [lng,lag];
 	    		addrs[i] = a;
 	    		vname[i] = viewname;
 	    		center = addrs[i];
 			});
 			
 			for (var i = 0, max = addrs.length; i < max; i++) {
                markers[i] = { addr: addrs[i], text: vname[i]};
                
            };
 	    		 $('#mapdiv').tinyMap('modify',
 	    			 {marker: markers})
 	                 .tinyMap('panto', center);
 			

    		
 		}
 		if(event.type == 'DOMNodeRemoved'){

 			var tar = $(event.target);
 			
 			var tarlng = tar.attr('lng');
 			var tarlag = tar.attr('lag');
 			var tarvname = tar.attr('data-viewname');
 			//var taraddr = [tarlng,tarlag];
 			
 			//var tarobj = {"addr":taraddr,"text":tarvname}
 			
 			
            $('#mapdiv').tinyMap('clear','marker');
 			
 			var rightli = $('#boardulID').find("li");
 			
 			
 			var addrs = [], vname = [], markers = [];
 			$.each(rightli, function(i,item){
 				var viewname = $(this).attr("data-viewname");
 				var lng = $(this).attr("lng");
 				var lag = $(this).attr("lag");
 				console.log(viewname);
 				
 				var a = [lng,lag];
 	    		addrs[i] = a;
 	    		vname[i] = viewname;
 			});
 			
 			for (var i = 0, max = addrs.length; i < max; i++) {
                markers[i] = { addr: addrs[i], text: vname[i]};
                
            }
 			function arrayObjectIndexOf(markers, tarvname) {
                for(var i = 0, len = markers.length; i < len; i++) {
                    if (markers[i].text === tarvname) return i;
                }
                return -1;
            }
 			
 			
 			var targetindex  = arrayObjectIndexOf(markers, tarvname);
 			
 	    		
 	    		markers.splice(targetindex,1);//移除陣列中被選中的index ,刪除 = 1;
 	    		
 	    		 $('#mapdiv').tinyMap('modify',{
 	                 marker: markers

 			});
 		}
 		
 	   });
	 

		
    })(jQuery);
    
      </script>

  </body>
</html>
