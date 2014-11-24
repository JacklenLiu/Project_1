

var socket = null;

function initialize() {
	console.log(sionLoginId);
	var rightDiv = document.getElementById("board");
    //rightDiv.appendChild(imageObj);
    //var img = document.getElementById("background_img");
   // ctx.drawImage(img, 0, 0);
    
	console.log("open connect");
    socket = new WebSocket("ws://"+ serverName +':'+ serverPort + contextPath +"/story/notifications/"+memPlatform);
    
    socket.onmessage = onSocketMessage;
}         //處理收到的訊息  = 方法onSocketMessage↓↓↓


// Drag and drop functionality
function drag(ev) {
	//取得滑鼠相對於瀏覽器頁面的位置
    var bounds = ev.target.getBoundingClientRect();
    var draggedSticker = { 
        sticker: ev.target.getAttribute("data-sticker"),
        viewname: ev.target.getAttribute("data-viewname"),
        viewID: ev.target.getAttribute("data-viewID"),
        offsetX: ev.clientX - bounds.left,
        offsetY: ev.clientY - bounds.top
    };
    var draggedText = JSON.stringify(draggedSticker);//轉換成JSON字串
    console.log(draggedText);
    ev.dataTransfer.setData("text", draggedText);//將拖移的元素id記錄起來 key:Text
    
}

function drop(ev) {
    ev.preventDefault();//取消預設功能
    var bounds = document.getElementById("board").getBoundingClientRect();//取得放圖div於瀏覽器頁面的位置
    var draggedText = ev.dataTransfer.getData("text");//取得拖移的元素id
    var draggedSticker = JSON.parse(draggedText);//將JSON字串轉換為物件
    console.log(draggedSticker+" = draggedSticker");
    //再打包送Server
    var stickerToSend = {
    	//取得JSON物件的屬性↓  -> 物件.屬性 名稱   = 屬性值
        action: "add",//StickerEncoder.java
        x: ev.clientX - draggedSticker.offsetX - bounds.left,
        y: ev.clientY - draggedSticker.offsetY - bounds.top,
        sticker: draggedSticker.sticker,
        viewname: draggedSticker.viewname,
        viewID: draggedSticker.viewID
        
    };
    
    socket.send(JSON.stringify(stickerToSend));//轉成JSON字串並send
    log("Sending Object " + JSON.stringify(stickerToSend));//轉成JSON字串並將Sending座標log
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
      console.log(receivedSticker.viewname);
      
      console.log(receivedSticker.chat);
      
      if (receivedSticker.action == "add") {
    	 var eleH = document.createElement("h5");
    	 var txtName = document.createTextNode(receivedSticker.viewname);
    	 eleH.appendChild(txtName);
         var imageObj = new Image();

         imageObj.src = "http://"+ serverName +":"+ serverPort + contextPath +"/GetImageServlet?id=" + receivedSticker.sticker;//放上images sources
         imageObj.className = imageObj.className + "viewimge";
         
         var eleli = document.createElement("li");
         eleli.setAttribute("id", receivedSticker.viewID);//取得viewID 並給<li>新屬性  = id
         console.log(eleli);
         eleli.appendChild(eleH).appendChild(imageObj);// <li id=".."> <h5>viewname</h5> <img></img>> </li> 
         eleli.className = eleli.className + "ui-widget-content ui-corner-tr";
    	 
         var boardscol = document.getElementById("board");
         var rightUL = document.getElementById("boardulID"); 
         rightUL.appendChild(eleli);//<div> <ul><li> <h5>viewname</h5> <img></img> </li></ul></div>
         boardscol.scrollTop = boardscol.scrollHeight;
      }
      if(receivedSticker.action == "addchat"){
    	  
    	  var chatdiv = document.getElementById("chatDiv");
    	  chatdiv.insertAdjacentHTML("BeforeEnd" ,receivedSticker.chat+"<br>");
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
