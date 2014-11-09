<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- -------jQuery核心檔------------------------------------ -->
<script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script> 


<!-- -------jQuery validation--------------- -->
<script type="text/javascript" src="js/jquery.validate.js"></script>



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
	$('#commentForm').validate({
		rules:{
			userId:{
				required: true,
	            
			},
			pswd:{
				required: true,
			}
		}
	});
});


</script>
<body>

	
	<Form method="Post" action="login" class="box login" id="commentForm" name="myform">
		<fieldset class="boxBody">
		
		
		帳號：<input type="text" name="userId" id="userId" title="請輸入帳號" >
		密碼：<input type="text" name="pswd" id="pswd" title="請輸入密碼">
				
			
			<input type="hidden" name="action" value="LoginIdCheck">
		</fieldset>
		<footer>
		<input type="checkbox" name="rememberMe" 
               <c:if test='${param.rememberMe==true}'>
                  checked
               </c:if> 
             value="true"><small>記住我</small>
		<input type=submit value="登入" class="btnLogin">
		<font color="red">${errorMSG} <br> <%! int count=0;%><%= count++ %></font>
		
		</footer>
	</Form>
	
</body>
</html>