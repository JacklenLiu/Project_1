<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../platform/include_title.jsp" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="P4_MessageBoard.model.*"%>

<%
	MsgService msgSvc = new MsgService();
	List<MsgVO> list = msgSvc.getAll();
	pageContext.setAttribute("list",list);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link rel="stylesheet" href="styles/msg.css">
<link rel="stylesheet" href="styles/showmsg.css">
<%@ include file="../platform/include_start.jsp" %>
<!-- 調整navbar btn -->
<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script type="text/javascript" src="Scripts/msg.js"></script>
<script type="text/javascript" src="Scripts/showmsg.js"></script>
<script type="text/javascript">


function ShowReply(x){
	//alert("第"+ x); // 第x個textarea
	var ta = document.getElementById(x);
	var ta2 = document.getElementById("resp"+x);
	var theDIV3 = document.getElementById("div"+x); //找到div3所在的<div>
	//alert(ta.value);
	
	var content = ta.value;
	var rr = ta2.value;
	
	//cite0
	//img
	var cite0=document.createElement("cite");
	var eleImg = document.createElement("img");//想放進去的圖片
	eleImg.setAttribute("src", "images/pic0.jpg");
	eleImg.setAttribute("width", "25");
	eleImg.setAttribute("height", "25");
	cite0.appendChild(eleImg); //把圖片放在<cite>下   把<img>放在<cite>下
	//回應者姓名
	// var responser=document.createTextNode("回應者的姓名:");//想放進去的文字內容    請動態抓姓名~~~  ${myinfo}
	var responser=document.createTextNode(rr);
	cite0.appendChild(responser); //放姓名

	var br0=document.createElement("br");
	cite0.appendChild(br0); //換行

	var txtP=document.createTextNode(content);//想放進去的文字內容
	cite0.appendChild(txtP); //放回應內容


	//span0
	var span0=document.createElement("span");
	var nowtime = new Date();//現在時間
	var nowtime2 = nowtime.getFullYear()+"-" +(nowtime.getMonth()+1)+"-"+nowtime.getDate();
	var nowtime3=document.createTextNode(nowtime2);//想放進去的文字內容
	//alert(nowtime2);
	span0.setAttribute("class", "timestamp"); //設定class屬性
	span0.appendChild(nowtime3);
	
	var p0=document.createElement("P");   //把cite和span放在p之中
	p0.appendChild(cite0);
	p0.appendChild(span0);
	p0.setAttribute("class", "message_head message_replycolor");
	
	
	theDIV3.insertBefore(p0, theDIV3.childNodes[0]);

}

</script>


</head>

<body>
	
<body>
    <!-- Navigation -->
	<nav class="navbar navbar-fixed-top" role="navigation">
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
	
<%-- 		<h1>${myinfo}，來留言喔~~</h1> --%>
		<br>
		<br>

<form action="<c:url value="leave_msg.do" />" method="post">
  <div class='comment_head'>
    <a class='comment_add' href=''> 
      	留個言吧...
    </a>
  </div>
  <div class='comment_write __add' id='users_comment'>
    <a class='comment_close' href=''>
      <i class='fa fa-times'></i>
    </a>
    <div class='comment_write_block'>
      <p><input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>" readonly></p>
      <p><input type="text" name="vtitle" value="" id="vtitle" required placeholder="主題..."></p>
      <textarea class='itx' cols='20' name='vcontent' rows='8' required placeholder="內容....."></textarea>
    </div>
    <div class='comment_write_block'>
      <input class='sb btn __top_space' type='submit' value='送出' >
      <input type="hidden" name="action" value="leave_msg">
    </div>
  </div>
</form>

<!-- old version -->

<%-- 	<form action="<c:url value="leave_msg.do" />" method="post"> --%>
<!-- 		<blockquote> -->
<%-- 			<p>帳號:<input type="text" name="vmember_loginID" value="<%=sionLoginId %>" readonly><br>	</p> --%>
<!-- 			<p>標題:<input type="text" name="vtitle" value="" id="vtitle" required><br></p> -->
<!-- 				我有話要說...<br> -->
<!-- 			<textarea rows="4" cols="50" name="vcontent" required></textarea> -->
<!-- 			<input type="submit" value="送出"> -->
<!-- 			<input type="hidden" name="action" value="leave_msg"> -->
<!-- 		</blockquote> -->
<!-- 	</form> -->

<!-- old version -->
	
	<hr width="100%">
	<br>
	
<div class="showallmsg">


<h3>全部留言結果</h3>
<br>	

	<ol class="message_list">
	
	<c:forEach var="list" items="${list}">
	<c:if test="${list.replyfrom == '0'}">
	
	<li>
		<p class="message_head"><cite><img src="images/pic4.jpg" width="25" height="25"> ${list.member_loginID}&nbsp&nbsp&nbsp&nbsp${list.title}</cite><span class="timestamp">${list.build_time}</span></p>
		
		<div class="message_body" >
<!-- 		留言者的留言 -->
			<p>${list.content}</p>
<!-- 			回應者的回覆 -->

				<%
					MsgService msgSvc2 = new MsgService();
					List<MsgVO> list2 = msgSvc2.getAll();	
					pageContext.setAttribute("list2",list2);
				%>
				
				<div id="div${list.messageNum}">
					<c:forEach var="list2" items="${list2}">
						<c:if test="${list2.replyfrom == list.messageNum}">
							<p class="message_head message_replycolor"><cite><img src="images/pic0.jpg" width="25" height="25">${list2.member_loginID}:<br>${list2.content}</cite> <span class="timestamp">${list2.build_time}</span></p>
						</c:if>
				    </c:forEach>
				</div>
				
							
							
<%-- 					<form action="<c:url value="reply.do" />" method="post"> --%>
<%-- 						<textarea rows="3" cols="20" id="${list.messageNum}" name="vcontent${list.messageNum}" ></textarea> --%>
						
<!-- 						<input type="submit" value="回覆" onclick="ShowReply()">  -->
						
						
<!-- 						<input type="button" value="try ajax">  -->
						
						
<%-- 						<input type="hidden" name="reply_vcontent" value="vcontent${list.messageNum}"> --%>
<%-- 						<input type="hidden" name="reply_vforwho" value="${list.messageNum}"> --%>
<%-- 						<input type="hidden" name="reply_vfortitle" value="${list.title}"> --%>
<%-- 						<input type="hidden" name="reply_vuser" value="${myinfo}"> --%>
						
<!-- 						<input type="hidden" name="action" value="reply_msg"> -->
<!-- 					</form> -->
				
				
						<textarea name="${list.messageNum}" id="${list.messageNum}" cols="30" rows="4"></textarea>		
<%-- 						<input type="hidden" id=resp${list.messageNum} value="${myinfo}"> --%>
						<input type="hidden" id=resp${list.messageNum} value="<%=sionLoginId %>">
						<input type="hidden" name="reply_vfortitle" value="${list.title}">
						<input type="button"  onclick="ShowReply(${list.messageNum})" value="回覆" class="reply_btn" id = "btn${list.messageNum}">

		</div>
	</li>
	
	</c:if>
	</c:forEach>

</ol>
<p class="collapse_buttons"><a href="#" class="show_all_message">顯示全部留言</a> <a href="#" class="show_recent_only">只顯示最新5筆留言</a> <a href="#" class="collpase_all_message">只顯示留言標題</a></p>

</div>		
<br>
<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  

<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>