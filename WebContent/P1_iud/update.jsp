<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<% 		
		Date date = new Date();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- -------jQuery核心檔------------------------------------ -->
<script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script> 

<!-- -------jQuery UI Datepicker.validation--------------- -->
<link rel="stylesheet" href="styles/jquery-ui.css">
<script type="text/javascript" src="js/jquery-ui.js"></script> 
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.ui.datepicker.validation.js"></script>


<!-- ---------jQuery CSS----------------------------------- -->
<link rel="stylesheet" type="text/css" href="styles/reset.css">
<link rel="stylesheet" type="text/css" href="styles/structure.css">

<style type="text/css">


#commentForm label.error { 
 
 font-size: 0.8em;
 color:#F00;
 font-weight:bold;
 display:block;
 margin-left:215px;
 }
</style>


<script>

$(function(){

//-------------------------欄位驗證---------------------------------------
	
	$("#commentForm").validate({
		rules: {
			member_loginID: {
				required: true,
	            rangelength: [4,12]
			},
	        member_password: {
		        required: true,
		        rangelength: [4,18]
	        },
	        confirm_password: {
		        equalTo: "#member_password"
	        },
			member_name: {
				required: true,
			},
			member_birthday: {
				required: true,
				dpDate: true
				
			},
			member_address: {
				required: true,
			},
			member_email: {
				required: true,
				email: true,
			},
		} // end rules
	});//end validate()
	
//------------------------datepicker--------------------------------------	
    $.datepicker.regional['zh-TW']={
       dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
       dayNamesMin:["日","一","二","三","四","五","六"],
       monthNames:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
       monthNamesShort:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
       prevText:"上月",
       nextText:"次月",
       weekHeader:"週"
       };
    $.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
	
	$( "#member_birthday" ).datepicker({
		dateFormat: "yy-mm-dd",
		yearRange:"-120:+0",
		maxDate:"0",
		changeMonth:true,
		changeYear:true,
	});
	

//------------------------hiden-------------------------------------------

    $('#divhide').hide();

 
});
 

</script>
</head>
<body>
			
<Form method="Post" action="update"  class="box" name="updateform" id="commentForm">

		<p>修改會員資料</p><br>
		
			<fieldset class="boxbody" >
			
			<font style="color:red;font-weight: bold; ">${errorMsgs}</font>
				
				<p>會員帳號：<input type="text" name="member_loginID" value="${memberVO.member_loginID}" readonly="readonly"  style="font-size: 13px;"></p>					
					
				<font style="color:red;font-weight: bold; ">${errorMsgs}</font>
				
				<p>會員密碼：<input type="text" id="member_password" name="member_password" value="${memberVO.member_password}"></p>
				
				<p>確認密碼：<input type="text" id="confirm_password" name="confirm_password"></p>
				
				<p>會員姓名：<input type="text" name="member_name" value="${memberVO.member_name}"></p><br><br>
				       
				<p>會員性別：<input type="radio" name="member_gender" value="男" checked>男
					   <input type="radio" name="member_gender" value="女">女</p><br><br>
				       
				<p>會員生日：<input type="text" id="member_birthday" name="member_birthday" value="${memberVO.member_birthday}"></p>
				
				<p>會員地址：<input type="text" id="member_address" name="member_address" value="${memberVO.member_address}"></p>
				
				<P>	電子郵件：<input  type="text" id="member_email"  name="member_email" value="${memberVO.member_email}"></P>
				
				
				<p><input class="submit btnLogin" type=submit value="送出" style="float: right;"></P>
				
			   <div id="divhide">
						
						<input type="text" name="action" value="Update">
						<input type="text" name="member_class" value="${memberVO.member_class}">
						<input type="text" name="member_stop" value="N">
						<input type="text" name="member_buildtime" value="<%= new java.sql.Date(date.getTime())%>">
                        <input type="text" name="member_type" value="${memberVO.member_type}">
				</div>	
						
			</fieldset>
		
	</Form>
</body>
</html>