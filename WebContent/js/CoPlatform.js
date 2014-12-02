//*************JKL 好友路徑規劃協作平台  START*************
		// 取得所有 tag名稱為script的 element
		var scripts = document.getElementsByTagName('script' );
		// 取得最後一個 (也就是現在執行的這一個 )element
		var currentScript;
			for(var i=0; i< scripts.length; i++){
				if(scripts[i].hasAttribute("data-sionLoginId")){
					currentScript = scripts[i];
					break;
				}
			}
		// 將sionLoginId屬性的值取出
		var sionLoginId = currentScript.getAttribute('data-sionLoginId' );
		var serverName = currentScript.getAttribute('data-serverName' );
		var serverPort =  currentScript.getAttribute('data-serverPort' );
		var contextPath =  currentScript.getAttribute('data-contextPath' );
		console.log(serverName);
		console.log(serverPort);
		console.log(contextPath);
		console.log(sionLoginId);
		var url = "http://" + serverName +":" + serverPort + "/" + contextPath + "/P4_MessageBoard/FrdServlet";
		
		//檢查是否有帶規劃協作平台事件
		var frdplatform = "";
		var dialogCoFromFrd= $("#dialog-checkCoFromFrd").dialog({
			  autoOpen: false,
		      modal: true,
		      buttons: {
		      	 "加入GO": function() {
		      		 		source.close();
		      		 		$.post(url, {"action":"FrdclearCoNotify","memID":sionLoginId},function(data){
		      		 			dialogCoFromFrd.dialog("close");
		        				window.location.href="http://" + serverName +":" + serverPort + contextPath+"/" + "P8_Websocket/Cooperation.jsp?memID="+ frdplatform;
		        				//window.open("http://" + serverName +":" + serverPort + "/" + contextPath+"/" + "P8_Websocket/Cooperation.jsp?memID="+ frdplatform);
		      		 		});
		      			},
		        "我才不想去咧": function(){
		        			source.close();
		        			$.post(url, {"action":"FrdclearCoNotify","memID":sionLoginId},function(data){
		        				dialogCoFromFrd.dialog("close");
		        			});
		        	   }
		      }
		  });	
		
		var source = new EventSource('../platform/getRes.jsp?memID='+ sionLoginId);
		source.addEventListener('message', function(e) {
			  if((e.data).length!=0){
				  console.log(e.data);
				  var notifymsg = JSON.parse(e.data);
				  frdplatform = notifymsg.cooperation_friend;
				  dialogCoFromFrd.dialog('option', 'title', notifymsg.frdName+' 邀請你一起規劃路線');
				  dialogCoFromFrd.find("h4").text(notifymsg.invite_msg);
				  
				  dialogCoFromFrd.dialog("open");	  
			  }
			}, false);
		
		
		//開啟好友路徑規劃協作平台
		var dialogfriend= $("#dialog-addFriend").dialog({
			  autoOpen: false,
		      modal: true,
		      buttons: {
		      	 "開始討論GO": function() {
		      		var friendids = new Array();
		      		var friends = $('#friendDiv label');
		      		console.log(friends);
		      		$.each(friends, function(i, friend){
		      			friendids[i] = $(friend).attr("id");
		      		});
		      		$.ajax({
	            		"type": 'POST',
	              		"url": url,
	              		"data": {"action":"UpdateCoNotify", "memID": sionLoginId,"frdID":JSON.stringify(friendids),"msg":$('#textareamsgID').val()},
	              		"dataType":"text",
	              		"async":false,
	              		"success":function(datas){
	              			console.log(datas);
	              			
	             		}
	             	});
		      		$('#getFriends').empty();
		      		$('#friendDiv').empty();
		      		dialogfriend.dialog( "close" );
          			window.location.href="http://" + serverName +":" + serverPort + contextPath+"/" + "P8_Websocket/Cooperation.jsp?memID="+ sionLoginId;
          			//window.open("http://" + serverName +":" + serverPort + "/" + contextPath+"/" + "P8_Websocket/Cooperation.jsp?memID="+ sionLoginId);
		      			},
		        	 "取消": function(){
		        		    $('#getFriends').empty();
		        		 	$('#friendDiv').empty();
		        		 	//$("#dialog-addFriend").dialog( "close" );
		        		 	dialogfriend.dialog( "close" );
		        	   }
		      }
		  });
		
		//加入協作好友列表
		$('#addToFriend').click(function(e){
			var labObj = $('<label></label>').attr("id", $('#getFriends :selected').val())
											 .text($('#getFriends :selected').text())
											 .css("margin","2px");
			$('#getFriends :selected').remove();
			$('#friendDiv').append(labObj);
		});
		
		$('#cooperationLink').click(function(e){
			if(sionLoginId!="null"){
				e.preventDefault();
				var friendslist = new Array();
				//增加景點hitRate
				$.ajax({
            			"type": 'POST',
            			"url": url,
            			"data": {"action":"GetFriends", "memID": sionLoginId},
            			"dataType":"json",
            			"async":false,
            			"success":function(datas){
            				friendslist = datas;
            			}
             		});
				$.each(friendslist, function(i, friend){
					console.log(friend.friendID);
					console.log(friend.friendName);
					var friendop = $('<option></option>').val(friend.friendID)
									  				 	.text(friend.friendName);
					$('#getFriends').append(friendop);
				});
				$('#textareamsgID').val("快點進來~大家都在等你囉!");
				dialogfriend.dialog("open");
			}
      	//*************JKL 好友路徑規劃協作平台  END*************
		});