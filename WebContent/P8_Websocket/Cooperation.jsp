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
      <h1>Sticker Story Book</h1>
    </header>
    <nav>
      Drag Images from the left bar to the right.
    </nav>
    <aside>
    

      <h2>多人協作平台</h2>
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
     <div id="board" style="width:100% ;height:50%; overflow:auto" ondrop="drop(event);" 
          ondragover="allowDrop(event);" >
          <ul id="boardulID" class="boardul"></ul>
      </div >
      
     <div id="chatDiv" ></div> 
     <span>
     <input id="chatinput" type="text"></input>
     <input id="chatbt" type="button" value="送出">
     </span>
     
    </div>
    <footer>
      <small></small>
      <ol>
        <li onclick="toggleLog();">Log</li>
      </ol>
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
			
			var viewimg = $('<li></li>')
		 	.attr("data-sticker", imgarea + item.viewID +'_01')
		 	.attr("data-viewname", item.viewname)
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
	
	  
	$('#chatbt').click(function(){
		var userchat = $('#chatinput').val();
		var chat = sionName +" : " + userchat;
		
		chatsend(chat);

	});

    	
    })(jQuery);
    
      </script>
  </body>
</html>
