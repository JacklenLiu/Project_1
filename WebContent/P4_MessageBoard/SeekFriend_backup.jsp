<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../platform/include_title.jsp" %>        
<%@ include file="../platform/include_start.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 借用留言板的css js 要再改一下比較好 -->
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" href="styles/msg2.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="Scripts/msg.js"></script>

<style>    
        table
        {
            border:1px solid green;
            width:300px;
            border-collapse:collapse;
        }
        td,th
        {
            border:1px solid green;
            padding:4px;
        }
        
        .del{
          text-decoration:none;
        }
        .del:hover{
           text-decoration:underline;
        }

/* @@@@@分隔線@@@@@ */

#loader {
	display: none
}

#keyword {
	width: 300px
}

#div1 {
	width: 300px;
	border: 1px green solid
}

#div1 ul {
	list-style-type: none;
	padding: 0px;
	padding-left: 4px;
	margin: 0px;
}

#div1 li:hover {
	background-color: yellow;
	cursor: pointer;
}

.s1 {
	background-color: yellow;
	cursor: pointer;
	text-decoration: underline
}

.s2 {
	background-color: transparent;
}
</style>
</head>
<body>
<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
			<%@ include file="../platform/include_A_href/toIndex.jsp" %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <%@ include file="../platform/include_A_href/P2_route.jsp" %>
                    <li>
                        <a href="showALL.jsp">留言板</a>
                    </li>
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
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
	<%@ include file="../platform/include_picture/include_picture.jsp" %>

<!-- ****************************************************** -->
	<h2>現在身分 : <%=sionLoginId %></h2>

	<h4>搜尋朋友ID</h4>
	<form name="myData" method="post" action="TestSeekServlet">
		<input type="text" name="keyword" id="keyword"> <span id="loader"></span>
		<input type="submit" value="搜尋(換頁)">
		<input type="button" value="搜尋(不換頁)" id="but_seek">
		<input type="hidden" name="action" value="seek_friend">
	</form>
	<div id="div1"></div>
	<div id="show_seek_div"></div>
	<div id="divmsg"></div>
	<br>
	<input type="button" id="but_invite"  value="提出邀請">
	
	
	
	<table id="table1">
         <thead>
         <tr>
             <th>ID</th>
             <th>暱稱</th>
             <th>性別</th>
             <th>邀請狀態</th>
         </tr>
             </thead>
         <tbody>      
             </tbody>
    </table>
	
	<div id="dialog" title="交友邀請">
  		<p></p>
	</div>
	
	
<script>
	$(function(){
		$("#table1").hide();
		$("#but_seek").click(function(){
			$("#table1").show();
			var keyword=document.getElementById("keyword").value;			
	 		$.ajax({ 
	 			"url": "TestSeekServlet",
	 			"type":"post",
	 			"data":{'action':'seek_friend2','keyword':keyword},
	 			"dataType":"text",
	 			"success":function(datas){
	 				
	 				var myObject = JSON.parse(datas); //記得把字串轉成josn物件
	 				$.each(myObject,function(i,item){ 					
	 					$('#table1>tbody').append("<tr><td>" + item.member_loginID +"</td><td>"+ item.member_name + "</td><td>"+ item.member_gender +"</td><td>" + '<input type="button" class="testid" value="邀請" name="' + item.member_loginID + '/>"</td></tr>"');
	 				});
	 			}	 			
	 			});	 		
		});
		
		$(document).on("click",".testid",function(){
			//按下按鈕後~~~
			var ID = "<%=sionLoginId %>";	
//	 	    邀請   那個按鈕所屬的人 
			var invitedID = $(this).prop("name");
			//將按鈕更名 並設為disabled
			$(this).val("已邀請").prop("disabled",true);
	 		$.ajax({ 
	 			"url": "AjaxFrdServlet",
	 			"type":"post",
	 			"data":{'action':'invite_friend', 'vmember_loginID':ID, 'vfriend_loginID':$(this).prop("name")},
	 			"dataType":"text",
	 			"success":function(data){

						alert(invitedID);
						$( "#dialog" ).text("你已向"+ invitedID + "發送朋友邀請囉!").dialog();
	 			}
	 		});
		});
		   
		
	
		
		
		$(".comment_head").hide();

		$("#but_invite").click(function(){			
			var invited = $("#keyword").val();
// 			alert(invited);
	 		$.ajax({ 
	 			"url": "AccountCheck.jsp",
	 			"type":"post",
	 			"data":{'member_loginID':invited},
	 			"dataType":"text",
	 			"success":function(data){
	 				$('#divmsg').text(data);
	 			}
	 			
	 			});
						 		
			$("#vfriend_loginID").val(invited);
// 			$(this).hide();
			$(".comment_head").show();

			return false;
		});		
		
	});
</script>	
	
<!-- 	按下選擇鍵後   準備到哪支servlet-->
	
	
<form action="FrdServlet" method="post">
  <div class='comment_head'>
    <a class='comment_add' href=''> 
      	交個朋友吧...
    </a>
  </div>
  <div class='comment_write __add' id='users_comment'>
    <a class='comment_close' href=''>
      <i class='fa fa-times'></i>
    </a>
    <div class='comment_write_block'>
      <p><input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>" readonly></p>
<!--       想對誰  (vfriend_loginID)  發出好友邀請   -->
      <p>TO :<input type="text" name="vfriend_loginID" value="" id="vfriend_loginID" readonly></p>
      <textarea class='itx' cols='10' name='vinvite_msg' rows='5' required placeholder="嗨我是<%=sionLoginId %>，好久不見....."></textarea>
    </div>
    <div class='comment_write_block'>
      <input class='sb btn __top_space' type='submit' value='送出' >
<!--       hidden for servlet的 String action = req.getParameter("action"); -->
      <input type="hidden" name="action" value="invite_friend">
      
    </div>
  </div>
</form>
	
	
<!-- 	按下選擇鍵後   END -->	
	
	
	<script>
		myData.keyword.addEventListener("keyup", load, false);
		var xhr;
		var myDiv = document.getElementById("div1");
		
		function load() {
			//步驟一建立XMLHttpRequest物件	
			//步驟二對server端發出要求
			xhr = new XMLHttpRequest();
			var keyword = document.getElementById("keyword").value;
			
			if (xhr != null) {
				xhr.addEventListener("readystatechange", callback, false);
				var url = "SeekFriendServlet?keyword=" + keyword;
				xhr.open("get", url, true);
				xhr.send();

			} else {
				alert("您的瀏覽器不支援Ajax的功能!");
			}
		}

		//這個function用來接收Server端回應的資料
		function callback() {
			if (xhr.readyState == 1) {
				loader.style.display = "inline";
			}

			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var data = xhr.responseText;
					
					//data = eval('(' + data + ')');//第一種轉型方式
					data=JSON.parse(data);//第二種轉型方式
					
					//console.log(data);
					clearResult();
					
					var textValue = document.getElementById("keyword").value.trim();
					if(textValue == "")						 
						 myDiv.style.display="none";
					else
						myDiv.style.display="block";
					
					var eleUl = document.createElement("ul");
					for (var i = 0, max = data.length; i < max; i++) {

						var txtLi = document.createTextNode(data[i]);
						var eleLi = document.createElement("li");
						eleLi.appendChild(txtLi);

						eleLi.addEventListener("mouseover", function() {
							this.className = 's1'}, false)
						eleLi.addEventListener("mouseout", function() {
							this.className = 's2'}, false)
						eleLi.addEventListener("click",function() {
							document.myData.keyword.value = this.firstChild.nodeValue;
							myDiv.style.display = "none";}, false)
						eleUl.appendChild(eleLi);	
					}
					myDiv.appendChild(eleUl);
				
				} else {
					myDiv.innerHTML = xhr.status + ":" + xhr.statusText;
				}
			}
		}

		//刪除目前顯示的資料
		function clearResult() {
			//先刪除目前顯示資料
			var myDiv = document.getElementById("div1");
			if (myDiv.childNodes.length > 0) {
				myDiv.removeChild(myDiv.firstChild);

			}
		}
	</script>
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>