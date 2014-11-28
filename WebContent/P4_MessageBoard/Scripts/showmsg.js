$(document).ready(function(){
	
	//hide message_body after the first one
	$(".message_list .message_body:gt(0)").hide();
	
	//hide message li after the 5th
	$(".message_list li:gt(4)").hide();

	//toggle message_body
	$(".message_head").click(function(){
		$(this).next(".message_body").slideToggle(500);
		return false;
	});
	
	//collapse all messages
	$(".collpase_all_message").click(function(){
		$(".message_body").slideUp(500);
		return false;
	});

	//show all messages
	$(".show_all_message").click(function(){
		$(this).hide();
		$(".show_recent_only").show();
		$(".message_list li:gt(4)").slideDown();
		return false;
	});

	//show recent messages only
	$(".show_recent_only").click(function(){
		$(this).hide();
		$(".show_all_message").show();
		$(".message_list li:gt(4)").slideUp();
		return false;
	});
	

	$(".reply_btn").click(function(){
		//var ta = document.getElementById("3").value;
		//alert("ta = "+ ta);
		var ta22 = $(this).prev().prev().prev().val();
// 		alert("回應內容 =" + ta22);
 		if(ta22==""){
 		}else{
 		
		var ta23 = $(this).prev().prev().prev().attr("name");
// 		alert("我是回應第   " + ta23 + "篇");
		var ta24 = $(this).prev().val();
// 		alert("我是回應哪一篇留言??RE:" + ta24);
		var ta25 = $(this).prev().prev().val();
// 		alert("回應的人" + ta25);
		//var picknum=$(this).attr("id");
		$("textarea").val("");
		 $.ajax({
			 "url":"leave_msg2.do",
			 "type":"post",
			 "data":{'reply_vuser':ta25,'reply_vfortitle':"RE:"+ta24,'reply_vcontent':ta22,'reply_vforwho':ta23},
			 "dataType":"text",  //json,xml
		 });
 		}
	});
	
	

});