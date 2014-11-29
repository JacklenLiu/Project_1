<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <script>
    (function($) {
    	
    	
    	//*********************************benny-線上客服開啟視窗抓ID***********************************
    	//抓IP用沒網路就GG
    	var userIP="";
    	 $.getJSON("http://jsonip.com?callback=?", function (data) {
		  		userIP=data.ip;
		});
 		
    	var OlineSvc="";
    	//按下去彈出對話視窗並給他一個小視窗(但還是可以調整視窗大小)
    	$("#openService").click(function(){
    		//產稱自己的url(後面多加自己ID 若不是會員則用IP位址)
    		//寫判別若沒有拿到登入ID就用IP當數字串
    		var url='';
    		if("${userLoginId}"==""){
    			OlineSvc="guest-"+userIP;
//     			alert(OlineSvc);
    			url="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P9_OnlineService/OnlineService.jsp?svcmember="+OlineSvc;
    		}else{
//     			alert(OlineSvc);
				OlineSvc="${userLoginId}";
    			url="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/P9_OnlineService/OnlineService.jsp?svcmember="+OlineSvc;
    		}
    		//另外開啟視窗便並給他視窗大小
    		window.open(url, "_blank", " top=5, left=50, width=660, height=600");
    	
    		
    		//1.當按下click時候insert資料庫 update資料 into onlineSvc (username,checkonline) values ('eee123','1');
        	//之後可用來計算使用過多少次線上客服的服務
        	console.log("OlineSvc:"+OlineSvc);
    		var url = "P9_OnlineService/OnlineServiceServlet";
      		$.ajax({
        		"type": 'post',
          		"url": url,
          		"data": {"action":"insertOnlineSvc", "memID": OlineSvc},
          		"dataType":"text",
          		"async":false,
          		"success":function(datas){
          			
         		}
         	});
    		
    	
    	});
    	/************************************製作gerSvc讓他不停地去掃資料******************************************************/
    	//SSE服務瀏覽器端實作
//     	var getSvcUrl="platform/getSvc.jsp?OlineSvc="+OlineSvc;
//     	var source = new EventSource(getSvcUrl);
// 		source.addEventListener('message', function(e) {
// 			  if((e.data).length!=0){
// 				  console.log(e.data);
// // 				  var notifymsg = JSON.parse(e.data);
// // 				  frdplatform = notifymsg.cooperation_friend;
// // 				  $('#dialog-checkCoFromFrd').dialog('option', 'title', notifymsg.frdName+' 邀請你一起規劃路線');
// // 				  $('#dialog-checkCoFromFrd > h4').text(notifymsg.invite_msg);
// // 				  dialogCoFromFrd.dialog("open");	


// 			  }
// 			}, false);
		
    	
		/************************************\製作gerSvc讓他不停地去掃資料******************************************************/
    	
    	
    	
    	
    	
    	//*********************************/benny-線上客服開啟視窗抓ID***********************************
    	
    	
    	//*********************************benny-線上客服辣妹圖片移動***********************************
    	// 當網頁載入完
    	  $(window).load(function(){
    	    var $win = $(window),
    	      $ad = $('#abgne_float_ad').css('opacity', 0).show(),  // 讓廣告區塊變透明且顯示出來
    	      _width = $ad.width(),
    	      _height = $ad.height(),
    	      _diffY = 20, _diffX = 20, // 距離右及下方邊距
    	      _moveSpeed = 800; // 移動的速度
    	    
    	    // 先把 #abgne_float_ad 移動到定點
    	    $ad.css({
    	      top: $(document).height(),
    	      left: $win.width() - _width - _diffX,
    	      opacity: 1
    	    });

    	    // 幫網頁加上 scroll 及 resize 事件
    	    $win.bind('scroll resize', function(){
    	      var $this = $(this);
    	      
    	      // 控制 #abgne_float_ad 的移動
    	      $ad.stop().animate({
    	        top: $this.scrollTop() + $this.height() - _height - _diffY,
    	        left: $this.scrollLeft() + $this.width() - _width - _diffX
    	      }, _moveSpeed);
    	    }).scroll();  // 觸發一次 scroll()
    	  });
    	//*********************************/benny-線上客服辣妹圖片移動***********************************
    })(jQuery);
    </script>