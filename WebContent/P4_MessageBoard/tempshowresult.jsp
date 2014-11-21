<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../platform/include_title.jsp"%>
<%@ include file="../platform/include_start.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='Scripts/jquery-2.1.1.min.js'><\/script>")</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<!-- <script type="text/javascript" src="Scripts/dialog.js"></script> -->


<title>Insert title here</title>
<style type="text/css">
#css_table {
      display:table;
  }
.css_tr {
      display: table-row;
  }
.css_td {
      display: table-cell;
  }
</style>
</head>
<body>


<!-- 表格 -->
<div id="css_table">
      <div class="css_tr">
      	  <div class="css_td">id</div>
          <div class="css_td">姓名</div>
          <div class="css_td">性別</div>
          <div class="css_td">狀態</div>
          <div class="css_td">邀請</div>
      </div>
      
      <c:forEach var="list" items="${list}">
      <div class="css_tr">
      	  <div class="css_td">${list.member_loginID}</div>
          <div class="css_td">${list.member_name}</div>
          <div class="css_td">${list.member_gender}</div>
          
<!--           要再查另一表格  等等再來做............-->
          <div class="css_td">已是好友</div>
          
                        
<!--           好友邀請 -->
          <div class="css_td">
				<c:choose>
					<c:when test="${list.member_loginID == 'ee123'}">
						<input type="button" class="testid" value="已邀請" disabled="disabled" name="${list.member_loginID} "/>
					</c:when>
					<c:otherwise>
					<input type="button" class="testid" value="邀請" name="${list.member_loginID}"/>
					</c:otherwise>
				</c:choose>
     	
          </div>
      </div>
      </c:forEach>
      <hr>
      <a href="SeekFriend2.jsp">回前頁</a>
</div>


<div id="dialog" title="交友邀請">
  <p></p>
</div>

<script type="text/javascript">

var serverName = "<%= serverName %>"; //localhost
var serverPort = "<%= serverPort %>"; //8081
var contextPath = "<%= contextPath %>"; //Project_1

(function($){
	   //jQuery的程式碼寫在這裡   	

$(".testid").click(function (){
//    現在是ID的主場
		var ID = "<%=sionLoginId %>";	
// 	    邀請   那個按鈕所屬的人 
		var invitedID = $(this).prop("name");
		//將按鈕更名 並設為disabled
		$(this).val("已邀請").prop("disabled",true);
 		$.ajax({ 
 			"url": "AjaxFrdServlet",
 			"type":"post",
 			"data":{'action':'invite_friend', 'vmember_loginID':ID, 'vfriend_loginID':$(this).prop("name")},
 			"dataType":"text",
 			"success":function(data){

//  				$('#submitid').val(data);
					//alert("到底要加多少人= =");
					alert(invitedID);
// 					$( "#dialog" ).dialog();
					$( "#dialog" ).text("你已向"+ invitedID + "發送朋友邀請囉!").dialog();
 			}
 		});
});	   
	   
})(jQuery)
</script>
</body>
</html>