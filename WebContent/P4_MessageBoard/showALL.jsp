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
<style>
	.aa123 {
  -ms-word-break: break-all;
  word-break: break-all;

  /* Non standard for webkit */
  word-break: break-word;

  -webkit-hyphens: auto;
  -moz-hyphens: auto;
  hyphens: auto;
}

</style>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/start/jquery-ui.css" rel="stylesheet">

<link rel="stylesheet" href="styles/msg.css">
<!-- <link rel="stylesheet" href="styles/showmsg.css"> -->
<%@ include file="../platform/include_start.jsp" %>
<!-- 調整navbar btn -->
<link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>

<script type="text/javascript" src="Scripts/msg.js"></script>
<script type="text/javascript" src="Scripts/showmsg.js"></script>
<link rel="stylesheet" href="styles/buttons.css" >
<script type="text/javascript" src="Scripts/buttons.js"></script>

<!-- sweetalert -->
<link rel="stylesheet" href="styles/sweet-alert.css" >
<script type="text/javascript" src="Scripts/sweet-alert.min.js"></script>

<script type="text/javascript">


function ShowReply(x){
	//alert("第"+ x); // 第x個textarea
	var ta = document.getElementById(x);
	var ta2 = document.getElementById("resp"+x);
	var theDIV3 = document.getElementById("div"+x); //找到div3所在的<div>
	//alert(ta.value);
	
	var content = ta.value;
// 	var rr = ta2.value;
	var rr = "<%=sionName %>";
	
	if(content==""){
		swal("回覆不要空白喔!");
	}else{
		
	
	
	//cite0
	//img
	var cite0=document.createElement("cite");
	var eleImg = document.createElement("img");//想放進去的圖片
	var temp = "images/pic" +Math.floor((Math.random() * 5)) + ".jpg";
	eleImg.setAttribute("src", temp);
	eleImg.setAttribute("width", "35");
	eleImg.setAttribute("height", "35");
	cite0.appendChild(eleImg); //把圖片放在<cite>下   把<img>放在<cite>下
	//回應者姓名
	// var responser=document.createTextNode("回應者的姓名:");//想放進去的文字內容    請動態抓姓名~~~  ${myinfo}
	var responser=document.createTextNode(rr);
	cite0.appendChild(responser); //放姓名

	var br0=document.createElement("br");
	cite0.appendChild(br0); //換行

	var txtP=document.createTextNode(content);//想放進去的文字內容
	cite0.setAttribute("style", "color:blue;font-size:18px;"); //設定class屬性
	cite0.appendChild(txtP); //放回應內容
	

	//span0
	var span0=document.createElement("span");
	var nowtime = new Date();//現在時間
	var nowtime2 = nowtime.getFullYear()+"-" +(nowtime.getMonth()+1)+"-"+nowtime.getDate();
	var nowtime3=document.createTextNode(nowtime2);//想放進去的文字內容
	//alert(nowtime2);
// 	span0.setAttribute("class", "timestamp"); //設定class屬性
	span0.setAttribute("style", "float:right"); //設定class屬性

	span0.appendChild(nowtime3);
	
	var p0=document.createElement("P");   //把cite和span放在p之中
	p0.appendChild(cite0);
	p0.appendChild(span0);
	p0.setAttribute("class", "message_head message_replycolor");
	
	
	theDIV3.insertBefore(p0, theDIV3.childNodes[0]);
	}
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
<%--                     <%@ include file="../platform/include_A_href/Portfolio.jsp" %> --%>
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
	
		<br>
<div class="container">
<div id="myTest" style="width:800px;">
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
      <textarea class='itx' cols='16' name='vcontent' rows='4' required placeholder="內容....."></textarea>
    </div>
    <div class='comment_write_block'>
      <input class='sb btn __top_space' type='submit' value='送出' >
      <input type="hidden" name="action" value="leave_msg">
    </div>
  </div>
</form>

	<hr width="100%">
	
</div>


<!-- 來測試Accordion -->

<div id="accordion" style="width:600px;">

<c:forEach var="list" items="${list}">
<c:if test="${list.replyfrom == '0'}">
	<c:if test="${list.message_stop == '0'}">
	<% int j = (int)( Math.random() * 5); %>
	
  <h3><cite><span style="weigh:10px"><img src="images/pic<%=j %>.jpg" width="35" height="35"> ${list.member_name}</span><span style="position:absolute;left:180px;"><b><c:out value="${list.title}" /></b></span></cite><span style="float:right;" >${list.build_time}</span></h3>
  <div class="aa123">
    <p><span style="position:relative;left:30px;"><b><c:out value="${list.content}"/></b></span> </p>
    <hr>
    <%
		MsgService msgSvc2 = new MsgService();
		List<MsgVO> list2 = msgSvc2.getAll();	 
		pageContext.setAttribute("list2",list2); 
	%>
				<div id="div${list.messageNum}">
					<c:forEach var="list2" items="${list2}">
						<c:if test="${list2.replyfrom == list.messageNum}">
						<c:if test="${list2.message_stop == '0'}">
							<% int jj = (int)( Math.random() * 5); %>	
							<div style="color:blue;font-size: 18px"><img src="images/pic<%=jj %>.jpg" width="35" height="35"><b>${list2.member_name}:</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${list2.content}" />
							<span style="float:right;" >${list2.build_time}</span><hr width="80%"></div>
						</c:if>
						</c:if>
				    </c:forEach>
				</div>
				<br>
    					<textarea name="${list.messageNum}"  id="${list.messageNum}" cols="30" rows="4"  placeholder="我想回覆..."></textarea>		
						<input type="hidden" id=resp${list.messageNum} value="<%=sionLoginId %>">
						<input type="hidden" name="reply_vfortitle" value="${list.title}">
						<input type="button"  onclick="ShowReply(${list.messageNum})" value="回覆" class="reply_btn button button-3d-action button-pill" id = "btn${list.messageNum}">
    
<!--     <div> -->
<!-- 	 <form action="FrdServlet" method="post"> -->
<!-- 		<div class=""> -->
<!-- 		<input type="submit" class="acceptbtn" name="whataction" value="接受邀請"> -->
<!-- 		<input type="submit" class="rejectbtn" name="whataction" value="拒絕"></div> -->
		
<%-- 		<input type="hidden" name="vmember_loginID" value="<%=sionLoginId %>"> --%>
<!-- 		<input type="hidden" name="vfriendNum" value=""> -->
<!-- 		<input type="hidden" name="action" value="accept_invite2"> -->
<!-- 	</form> -->
<!--     </div> -->
    
  </div>
</c:if>
</c:if>
</c:forEach>  

</div>

</div>
<br><br>






<script type="text/javascript">

var serverName = "<%= serverName %>"; //localhost
var serverPort = "<%= serverPort %>"; //8081
var contextPath = "<%= contextPath %>"; //Project_1

(function($){
	   //jQuery的程式碼寫在這裡
	   $( "#accordion" ).accordion({
		   collapsible: true,
		   });
	   
})(jQuery);
</script>	


<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  

<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
<!-- 好友協作平台 -->
<script type='text/javascript' src='../js/CoPlatform.js'  data-sionLoginId='<%= session.getAttribute("userLoginId") %>' data-serverPort = "<%= request.getServerPort()%>" data-serverName = "<%= request.getServerName()%>" data-contextPath = "<%= request.getContextPath()%>"></script>
<!-- 好友協作平台 -->
</body>
</html>