

var socket = null;

function initialize() {
	console.log(sionLoginId);
	var rightDiv = document.getElementById("board");
	var leftDiv = document.getElementById("stickerContainer");
    //rightDiv.appendChild(imageObj);
    //var img = document.getElementById("background_img");
   // ctx.drawImage(img, 0, 0);
    
	console.log("open connect");
    socket = new WebSocket("ws://"+ serverName +':'+ serverPort + contextPath +"/story/notifications/"+memPlatform);
    
    socket.onmessage = onSocketMessage;
}         //處理收到的訊息  = 方法onSocketMessage↓↓↓

function clickedit(ev){
	if(ev.target.getAttribute("action") == "add"){
		 var bounds = document.getElementById("board").getBoundingClientRect();
		 var stickerToSend = { 
			 sticker: ev.target.getAttribute("data-sticker"),
			 viewname: ev.target.getAttribute("data-viewname"),
			 viewID: ev.target.getAttribute("data-viewID"),
			 draggable: ev.target.getAttribute("draggable"),
			 action: ev.target.getAttribute("action"),
			 x: ev.clientX - bounds.left,
			 y: ev.clientY - bounds.top
			 };
		 socket.send(JSON.stringify(stickerToSend));
		 log("Sending Object " + JSON.stringify(stickerToSend));
	}
	
	if(ev.target.getAttribute("action") == "back"){
		var leftDiv = document.getElementById("stickerContainer").getBoundingClientRect();
		var backToSend = { 
			 sticker: ev.target.getAttribute("data-sticker"),
			 viewname: ev.target.getAttribute("data-viewname"),
			 viewID: ev.target.getAttribute("data-viewID"),
			 draggable: ev.target.getAttribute("draggable"),
			 action: ev.target.getAttribute("action"),
			 x: ev.clientX - leftDiv.left,
			 y: ev.clientY - leftDiv.top
			 };
		 socket.send(JSON.stringify(backToSend));
		 log("Sending Object " + JSON.stringify(backToSend));
	}
};



// Drag and drop functionality
function drag(ev) {
	//取得滑鼠相對於瀏覽器頁面的位置
    
	
    if(ev.target.getAttribute("action") == "add"){
   
    
    var bounds = ev.target.getBoundingClientRect();
    var draggedSticker = { 
        sticker: ev.target.getAttribute("data-sticker"),
        viewname: ev.target.getAttribute("data-viewname"),
        viewID: ev.target.getAttribute("data-viewID"),
        draggable: ev.target.getAttribute("draggable"),
        action: ev.target.getAttribute("action"),
        offsetX: ev.clientX - bounds.left,
        offsetY: ev.clientY - bounds.top
        };
    
    var draggedText = JSON.stringify(draggedSticker);//轉換成JSON字串
    console.log(draggedText);
    ev.dataTransfer.setData("text", draggedText);//將拖移的元素id記錄起來 key:Text*/
    	
    	
    }
    if(ev.target.getAttribute("action") == "back"){
    	var leftDiv = ev.target.getBoundingClientRect();
    	console.log("333");
        var draggedSticker = { 
            sticker: ev.target.getAttribute("data-sticker"),
            viewname: ev.target.getAttribute("data-viewname"),
            viewID: ev.target.getAttribute("data-viewID"),
            draggable: ev.target.getAttribute("draggable"),
            action: ev.target.getAttribute("action"),
            offsetX: ev.clientX - leftDiv.left,
            offsetY: ev.clientY - leftDiv.top
            };
        
        var draggedText = JSON.stringify(draggedSticker);//轉換成JSON字串
        console.log(draggedText);
        ev.dataTransfer.setData("text", draggedText);//將拖移的元素id記錄起來 key:Text
        }
}

function drop(ev) {
    ev.preventDefault();//取消預設功能
    
    
    var draggedText = ev.dataTransfer.getData("text");//取得拖移的元素
    console.log(draggedText);
    var draggedSticker = JSON.parse(draggedText);//將JSON字串轉換為物件
    console.log(draggedSticker.action);
    
    
    //再打包送Server
    if(draggedSticker.action == "add"){
    var bounds = document.getElementById("board").getBoundingClientRect();//取得放圖div於瀏覽器頁面的位置
    var stickerToSend = {
    	//取得JSON物件的屬性↓  -> 物件.屬性 名稱   = 屬性值
        action: "add",//StickerEncoder.java
        x: ev.clientX - draggedSticker.offsetX - bounds.left,
        y: ev.clientY - draggedSticker.offsetY - bounds.top,
        sticker: draggedSticker.sticker,
        viewname: draggedSticker.viewname,
        viewID: draggedSticker.viewID,
        draggable: draggedSticker.draggable
        
        };
    socket.send(JSON.stringify(stickerToSend));
    log("Sending Object " + JSON.stringify(stickerToSend));
    }
    
    if(draggedSticker.action == "back"){
    var leftDiv = document.getElementById("viewulID").getBoundingClientRect();	
    	console.log("444");	
    var backToSend = {
    	
    	action: "change",//StickerEncoder.java
        x: ev.clientX - draggedSticker.offsetX - leftDiv.left,
        y: ev.clientY - draggedSticker.offsetY - leftDiv.top,
        sticker: draggedSticker.sticker,
        viewname: draggedSticker.viewname,
        viewID: draggedSticker.viewID,
        draggable: draggedSticker.draggable	
        };
    socket.send(JSON.stringify(backToSend));
    log("Sending Object " + JSON.stringify(backToSend));
    }
    /* var leftviewID = draggedSticker.viewID;
    var rightviewID = stickerToSend.viewID;
    
    //將左邊的img 拖到右邊時  移除左邊的<li data-viewID><img>...</li>
    if(leftviewID == rightviewID){
    	
    	var leftUL = document.getElementById("viewulID");
    	var jsonviewID = JSON.stringify(rightviewID);
    	var leftview  = document.querySelector('[data-viewID='+ jsonviewID +']');
    	leftUL.removeChild(leftview);
    	
    };*/
    
    
    
}
function dropback(ev) {
ev.preventDefault();//取消預設功能
    
    
    var draggedText = ev.dataTransfer.getData("text");//取得拖移的元素id
    var draggedSticker = JSON.parse(draggedText);//將JSON字串轉換為物件
	
	if(draggedSticker.action == "back"){
	    var leftDiv = document.getElementById("stickerContainer").getBoundingClientRect();	
	    	console.log("444");	
	    var backToSend = {
	    	
	    	action: "back",//StickerEncoder.java
	        x: ev.clientX - draggedSticker.offsetX - leftDiv.left,
	        y: ev.clientY - draggedSticker.offsetY - leftDiv.top,
	        sticker: draggedSticker.sticker,
	        viewname: draggedSticker.viewname,
	        viewID: draggedSticker.viewID,
	        draggable: draggedSticker.draggable	
	        };
	    socket.send(JSON.stringify(backToSend));
	    log("Sending Object " + JSON.stringify(backToSend));
	    }
	
}

function chatsend(chat){
	var chatToSend = {
			action:"addchat",
			chat: chat,//userchat
	};
	socket.send(JSON.stringify(chatToSend));//object轉成字串送出
	console.log(JSON.stringify(chatToSend));
	console.log(chatToSend);
}






function allowDrop(ev) {
    ev.preventDefault();
}

//接收Server發出的訊息
function onSocketMessage(event) { 
   if (event.data) {
      var receivedSticker = JSON.parse(event.data);//建立接收sticker的物件 <- data轉成JSON物件 
      log("Received Object: " + JSON.stringify(receivedSticker));//轉成JSON字串並將Received座標log
      console.log(receivedSticker.sticker);
      
      console.log(receivedSticker.chat);
      
      if (receivedSticker.action == "add") {
    	 var eleH = document.createElement("h5");
    	 var txtName = document.createTextNode(receivedSticker.viewname);
    	 eleH.appendChild(txtName);
         var imageObj = new Image();

         imageObj.src = "http://"+ serverName +":"+ serverPort + contextPath +"/GetImageServlet?id=" + receivedSticker.sticker;//放上images sources
         imageObj.className = imageObj.className + "viewimge";
         imageObj.setAttribute("action", "back");
         imageObj.setAttribute("draggable",'true');
         imageObj.setAttribute("data-sticker",receivedSticker.sticker);
         imageObj.setAttribute("data-viewname",receivedSticker.viewname);
         imageObj.setAttribute("data-viewID",receivedSticker.viewID);
         imageObj.setAttribute("ondragstart","drag(event)");
         console.log(imageObj);
         
         var eleli = document.createElement("li");
         eleli.setAttribute("id", receivedSticker.viewID);//取得viewID 並給<li>新屬性  = id
         eleli.setAttribute("action", "back");
         eleli.setAttribute("draggable","true");
         eleli.setAttribute("data-sticker",receivedSticker.sticker);
         eleli.setAttribute("data-viewname",receivedSticker.viewname);
         eleli.setAttribute("data-viewID",receivedSticker.viewID);
         eleli.setAttribute("ondragstart","drag(event)");
         console.log(eleli);
         
         var elelink = document.createElement("a");
         elelink.setAttribute("title","移除景點");
         elelink.setAttribute("href","#");
         elelink.setAttribute("class","ui-icon ui-icon-close");
         elelink.setAttribute("id", receivedSticker.viewID);//取得viewID 並給<li>新屬性  = id
         elelink.setAttribute("action", "back");
         elelink.setAttribute("draggable","true");
         elelink.setAttribute("data-sticker",receivedSticker.sticker);
         elelink.setAttribute("data-viewname",receivedSticker.viewname);
         elelink.setAttribute("data-viewID",receivedSticker.viewID);
         elelink.setAttribute("onclick", "clickedit(event)");
         
         eleli.appendChild(eleH).appendChild(imageObj);
         eleli.appendChild(elelink);
         // <li id=".."> <h5>viewname</h5> <img></img>> </li> 
         eleli.className = eleli.className + "ui-widget-content ui-corner-tr";
    	 
         var boardscol = document.getElementById("board");
         var rightUL = document.getElementById("boardulID"); 

         //將已拖曳過的左圖拿掉(所有使用者);
         var jsonviewID = JSON.stringify(eleli.id);
         console.log(jsonviewID);
         var leftUL = document.getElementById("viewulID");
         var leftview  = document.querySelector('[data-viewID='+ jsonviewID +']');

         //先appendChild 再removeChild
         rightUL.appendChild(eleli);//<div> <ul><li> <h5>viewname</h5> <img></img> </li></ul></div>
         leftUL.removeChild(leftview);//增加 "X" 來移除景點
         boardscol.scrollTop = boardscol.scrollHeight;
         
  
      }
      if(receivedSticker.action == "back"){
    	  console.log("555back");
    	  var eleH2 = document.createElement("h5");
     	  var txtName2 = document.createTextNode(receivedSticker.viewname);
     	  eleH2.appendChild(txtName2);
          var imageObj2 = new Image();

          imageObj2.src = "http://"+ serverName +":"+ serverPort + contextPath +"/GetImageServlet?id=" + receivedSticker.sticker;//放上images sources
          imageObj2.className = imageObj2.className + "viewimge";
          imageObj2.setAttribute("action", "add");
          imageObj2.setAttribute("draggable",'true');
          imageObj2.setAttribute("data-sticker",receivedSticker.sticker);
          imageObj2.setAttribute("data-viewname",receivedSticker.viewname);
          imageObj2.setAttribute("data-viewID",receivedSticker.viewID);
          imageObj2.setAttribute("ondragstart","drag(event)");
          console.log(imageObj2);
          var eleli2 = document.createElement("li");
          eleli2.setAttribute("id", receivedSticker.viewID);//取得viewID 並給<li>新屬性  = id
          eleli2.setAttribute("action", "add");
          eleli2.setAttribute("draggable","true");
          eleli2.setAttribute("data-sticker",receivedSticker.sticker);
          eleli2.setAttribute("data-viewname",receivedSticker.viewname);
          eleli2.setAttribute("data-viewID",receivedSticker.viewID);
          eleli2.setAttribute("ondragstart","drag(event)");
          console.log(eleli2);
          
          
          var elelink2 = document.createElement("a");
          elelink2.setAttribute("title","加入行程");
          elelink2.setAttribute("href","#");
          elelink2.setAttribute("class","ui-icon ui-icon-plus");
          elelink2.setAttribute("id", receivedSticker.viewID);//取得viewID 並給<li>新屬性  = id
          elelink2.setAttribute("action", "add");
          elelink2.setAttribute("draggable","true");
          elelink2.setAttribute("data-sticker",receivedSticker.sticker);
          elelink2.setAttribute("data-viewname",receivedSticker.viewname);
          elelink2.setAttribute("data-viewID",receivedSticker.viewID);
          elelink2.setAttribute("onclick", "clickedit(event)");
          
          eleli2.appendChild(eleH2).appendChild(imageObj2);
          eleli2.appendChild(elelink2);
          // <li id=".."> <h5>viewname</h5> <img></img>> </li> 
          eleli2.className = eleli2.className + "fixli ui-widget-content ui-corner-tr";
          
          var leftUL2 = document.getElementById("viewulID");

          //將拖曳圖拿掉(所有使用者);
          var jsonviewID2 = JSON.stringify(eleli2.id);
          console.log(jsonviewID2);
          var rightUL2 = document.getElementById("boardulID");
          var rightview  = document.querySelector('[data-viewID='+ jsonviewID2 +']');

          //先appendChild 再removeChild
          leftUL2.appendChild(eleli2);//<div> <ul><li> <h5>viewname</h5> <img></img> </li></ul></div>
          rightUL2.removeChild(rightview);
          
      }
      
      if(receivedSticker.action == "addchat"){
 
    	 var chatdiv = document.getElementById("chatDiv");
    	 chatdiv.insertAdjacentHTML("BeforeEnd" ,"<div id="+"tt"+" contenteditable="+"true"+">"+receivedSticker.chat+"</div>");
    	 chatdiv.scrollTop = chatdiv.scrollHeight;
    	  
      }
   }
}


//Logger


var logCount = 0;

function log(logstr) {
    var logElement = document.getElementById("log");//取得切換logContainer的Div;
    logElement.innerHTML = "<b>[" + logCount + "]: </b>" + logstr + "<br>" + logElement.innerHTML;
    logCount++;//每當有新元素加入 -> 則將新元素座標innerHTML頁面
}

window.onload = initialize;
