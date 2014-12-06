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
    <!-- voice -->
    <link rel="import" href="resource/voice-player.html">
    <link rel="import" href="resource/voice-recognition.html">
  </head>
  <body>
    <header>
      <!-- Navigation -->
<nav class="navbar  navbar-fixed-top" role="navigation">
	<div class="rowHeader">
        <div class="container">
            <%@ include file="../platform/include_A_href/toIndex.jsp" %> 	
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<%@ include file="../platform/include_A_href/P2_route.jsp" %> 	   
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %>  
<%--                     <%@ include file="../platform/include_A_href/Portfolio.jsp" %> --%>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp" %>
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
     <!-- voice -->
     <input id="micbt" type="button" value="Start">
     <voice-recognition id="recognition-element"></voice-recognition>
     <input id="saveRoutebt" type="button" value="儲存路線" class="savebt2" disabled>
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
<!-- voice -->
<script src="resource/webcomponentsjs/webcomponents.min.js"></script>

    
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
 			$('#saveRoutebt').prop("disabled", false)
 			                 .removeClass("savebt2").addClass("savebt");
 			
 			$('#mapdiv').tinyMap('clear','marker');
 			
       
 			var rightli = $('#boardulID').find("li");
 			var addrs = [], vname = [], markers = [];
 		    var nextmark ;
 			$.each(rightli, function(i,item){
 				var viewname = $(this).attr("data-viewname");
 				var lng = $(this).attr("lng");
 				var lag = $(this).attr("lag");
 				
 				
 				
 				var a = [lng,lag];
 	    		addrs[i] = a;
 	    		vname[i] = viewname;
 	    		
 	    		nextmark = addrs[i];
 			});
 			
 			for (var i = 0, max = addrs.length; i < max; i++) {
                markers[i] = { addr: addrs[i], text: vname[i]};
                
            };
 	    		 $('#mapdiv').tinyMap('modify',{
 	    			 marker: markers ,
 	    			 
 	    			 }).tinyMap('panto', nextmark);
 	

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
	 

	 //voice
	 var element = document.querySelector('#recognition-element');
	 $('#micbt').click(function(e){
		 e.preventDefault();
		 element.text="";//clear last content
		 element.start();
	 });
	 
	 element.addEventListener('result', function(e) {
		    alert(e.detail.result);
		    var addviewindex = e.detail.result.indexOf('want to');
		    var delviewindex = e.detail.result.indexOf('remove');
		    var frdindex = e.detail.result.indexOf('邀請');
		    
		    //判斷"要去"->將左邊景點移至中央
		    if(addviewindex != -1){
		    	var findViewStr = e.detail.result.substr(addviewindex+7,2);
		    	var liobjs = $('#viewulID').find('li');
		    	$.each(liobjs, function(i, liobj){
		    		var tarStr = $(liobj).attr("data-viewname").indexOf(findViewStr);
		    		if(tarStr != -1){
		    			console.log($(liobj).find('a'));
		    			$(liobj).find('a').trigger('click');
		    		}
		    	});
		    }else if(delviewindex != -1){
		    	//判斷"拿掉"->將中央景點移至左邊區塊
		    	var findViewStr = e.detail.result.substr(delviewindex+6,2);
		    	var liobjs = $('#boardulID').find('li');
		    	$.each(liobjs, function(i, liobj){
		    		var tarStr = $(liobj).attr("data-viewname").indexOf(findViewStr);
		    		if(tarStr != -1){
		    			console.log($(liobj).find('a'));
		    			$(liobj).find('a').trigger('click');
		    		}
		    	});
		    }else if(frdindex != -1){
		    	//邀請好友
		    	var url = "../P4_MessageBoard/FrdServlet";
		    	var findFrdStr = e.detail.result.substr(frdindex+2,3);
		    	console.log(findFrdStr);
		    	
		    	$.get(url, {"action":"GetFrdID","memName":findFrdStr}, function(data){
		    		console.log(data);
		    		var friendids = new Array();
		      		friendids[0]= data;
		      		console.log(friendids);
		    		$.ajax({
            			"type": 'POST',
              			"url": url,
              			"data": {"action":"UpdateCoNotify", "memID": memPlatform,"frdID":JSON.stringify(friendids),"msg":"快點進來~大家都在等你囉"},
              			"dataType":"text",
              			"async":false,
              			"success":function(datas){
              				console.log(datas);
             			}
             		});
		    	});
		    }		    
		    $('#chatinput').val(e.detail.result);
		    element.stop();
		});
	 

	 $('.nav .dropdown').hover(function() {
         $(this).addClass('open');
     }, function() {
         $(this).removeClass('open');
     });
    })(jQuery);
    
      </script>

  </body>
</html>
