<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <%@ include file="../platform/include_title.jsp" %>
    <title>Sticker Story</title>
    <link href="css/styles.css" rel="stylesheet" type="text/css" >
     <link href="css/images.css" rel="stylesheet" type="text/css" >
    <link rel="stylesheet" href="../Styles/jquery-ui.min.css"> <!-- 蕙齊link -->
    
  </head>
  <body>
    <header>
      <h1>多人協作平台</h1>
    </header>
    <nav>
      
    </nav>
    <aside>
    

      <h2>地區選擇</h2>
      <select  id="sel1">
		<option value="北部" id="N">北部</option>
  		<option value="中部" id="C">中部</option>
  		<option value="南部" id="S">南部</option>
  		<option value="東部" id="E">東部</option>
	  </select>
	  
      <div id="stickerContainer">
      	<ul id="viewulID" class="viewul"></ul>
      </div>
      
    </aside>
    
    <div id="content" style="width:70% ;height:95%;">
     <div id="board" style="width:100% ;height:50%;" ondrop="drop(event);" 
          ondragover="allowDrop(event);" >
          <ul id="boardulID" class="boardul"></ul>
      </div >
      
     <div id="chatDiv" ></div> 
     <span>
     <input id="chatinput" type="text"></input>
     <input id="chatbt" type="button" value="送出">
     </span>
     <input id="saveRoutebt" type="button" value="儲存路線">
    </div>
    
  <div id="dialog-save" title="儲存路線" >
     <h2 class="validateTips">路線名稱</h2>
     <input type="text" name="routeName" id="routeName" value="多人協作路線" class="text ui-widget-content ui-corner-all" >
   </div >
   
    <div id="dialog-saveSuccess" title="儲存成功" >
    <h2 class="validateTips">儲存成功</h2>
    </div>
    
    <footer>
     
     
    </footer>
    <div id="logContainer">
      <h2>log</h2>
      <div id="log"></div>
    </div>
    
    
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src='../Script/jquery-ui.js'></script>	
<script src="js/story-page.js" type="text/javascript"></script>
  
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
             console.log(datas);
           });
	   }

	   $('#sel1').change(function(){ //變更景點區域viewarea
		 	area = $(this).val();
		 	getViewDataByArea(area);
		});
	   
	function view(area ,datas){   //用each切割出datas裡每個object
		$('#viewulID').empty();
		$.each(datas,function(i,item){// i   -> index
			console.log(item);        //item -> item
			
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
			
			
			var imgtitle = $('<h5></h5>').text(item.viewname); //取得景點名稱　 
			var imgs = $('<img></img>')
			.attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+imgarea+ item.viewID + '_01')
		 	.addClass("viewimge");
			console.log(imgarea + item.viewID +'_01');
			console.log(item.viewID);
			var viewimg = $('<li></li>')
		 	.attr("data-sticker", imgarea + item.viewID +'_01')
		 	.attr("data-viewname", item.viewname)
		 	.attr("data-viewID", item.viewID)
		 	//.attr("draggable",'true').attr("ondragstart",'drag(event)')
		 	.attr("draggable",'true')
		 	.bind('dragstart', function(event){
		        drag(event);
		    })
		 	.addClass("fixli ui-widget-content ui-corner-tr")
		 	.append(imgtitle).append(imgs);
		    
			
		    $('#viewulID').append(viewimg);
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
         		window.location.href = "http://" + serverName + ":" + serverPort + contextPath +"/P2_route" + "/viewnameServlet?action=GetRouteByMemID&memID=" + sionLoginId;
           }
         },
         close: function() {
         }
       });

    })(jQuery);
    
      </script>
  </body>
</html>
