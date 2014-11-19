<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../platform/include_title.jsp" %>        
<%@ include file="../platform/include_start.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 借用留言板的css js 要再改一下比較好 -->
<link rel="stylesheet" href="styles/msg2.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script type="text/javascript" src="Scripts/msg.js"></script>

<style>
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
		<input type="submit">
		<input type="hidden" name="action" value="seek_friend">
	</form>
	<div id="div1"></div>
	<div id="divmsg"></div>
	<br>
	<input type="button" id="but_invite"  value="提出邀請">
<!-- 	disabled="disabled" 關掉按鈕功能-->
<script>
	$(function(){
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