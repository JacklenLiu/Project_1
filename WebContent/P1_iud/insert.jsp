<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.util.*"%>

<% 		
		Date date = new Date();

%>
 

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

<!-- -------jQueryCaptcha-------------------------------- -->



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

<script type="text/javascript">
function data(){	
	member_loginID.value="ii123";	
	member_password.value="kk123";	
	member_name.value="周劫輪";	
	member_birthday.value="2014-10-10";
	member_address.value="台北市內湖區";
	member_email.value="qq123@yahoo.com.tw";
}

function rst(){	
	member_loginID.value="";	
	member_password.value="";	
	member_name.value="";	
	member_birthday.value="";
	member_address.value="";
	member_email.value="";
}


</script>

</head>
<body>


	
	<Form class="box" id="commentForm" method="Post" action="insert"  name="myform" >
		
			<fieldset class="boxbody" >
				
				
			<p>	會員帳號：<input type="text" id="member_loginID" name="member_loginID" >				
				       <font style="color:red;font-weight: bold; ">${errorMsgs}</font></p><br>
			<p>	會員密碼：<input type="text" id="member_password" name="member_password"></p>
				
			<p>	確認密碼：<input type="text" id="confirm_password" name="confirm_password"></p>
				
			<p>	會員姓名：<input type="text" id="member_name"  name="member_name" ></p><br><br>
				
			<p>	會員性別 	<input type="radio" name="member_gender" value="男" checked>男
							   	<input type="radio" name="member_gender" value="女">女</p>
				<br><br>	
			<p>	會員生日：<input type="text" id="member_birthday"  name="member_birthday"></p>
				
			<p>	會員地址：<input type="text" id="member_address"  name="member_address" ></p>
				
			<P>	電子郵件：<input  type="text" id="member_email"  name="member_email"></P>
							
               
				
					
			</fieldset>
			<footer style="height:220px">
			<p>
			<font style="color:red;font-weight: bold; ">${capMsgs}</font><br>
			<%
			
              ReCaptcha c = ReCaptchaFactory
              .newReCaptcha("6LdlHOsSAAAAAM8ypy8W2KXvgMtY2dFsiQT3HVq-", "6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY", false);
              out.print(c.createRecaptchaHtml(null, null));
              
            %>
          
            </p> 
            
            
            <div id="divhide">	
						<input type="text" name="action" value="actionInsert">
						<input type="text" name="member_class" value="1">
						<input type="text" name="member_stop" value="N">
						<input type="text" name="member_buildtime" value="<%= new java.sql.Date(date.getTime())%>">
                        <input type="text" name="member_type" value="A">			
			</div>	
		<input type=button value="自動資料" onclick="data()" class="btnLogin">
		<input type=button value="清除" onclick="rst()" class="btnLogin" >
        <input class="submit btnLogin" type=submit value="送出" style="float: right;">
	</footer>
	</Form>
	
	<font color="red">${errorMSG} <br> <%! int count=0;%><%= count++ %></font>
</body>
</html>