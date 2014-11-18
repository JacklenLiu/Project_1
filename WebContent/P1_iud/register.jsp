<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/jquery-ui.css" rel="stylesheet">
	<%@ include file="../platform/include_title.jsp" %>   
	<%@ include file="../platform/include_start.jsp" %>  
	<script src="../js/jquery-1.11.0.js"></script>
    
<style>
	body{
		/*font: 100% "Trebuchet MS", sans-serif;*/
		margin: 50px;
	}
	.demoHeaders {
		margin-top: 2em;
	}
	#dialog-link {
		padding: .4em 1em .4em 20px;
		text-decoration: none;
		position: relative;
	}
	#dialog-link span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -8px;
	}
	#icons {
		margin: 0;
		padding: 0;
	}
	#icons li {
		margin: 2px;
		position: relative;
		padding: 4px 0;
		cursor: pointer;
		float: left;
		list-style: none;
	}
	#icons span.ui-icon {
		float: left;
		margin: 0 4px;
	}
	.fakewindowcontain .ui-widget-overlay {
		position: absolute;
	}
	select {
		width: 200px;
	}
	</style>
</head>

<body >
   	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
			<%@ include file="../platform/include_A_href/toIndex.jsp" %> 
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="route_plan.jsp">路經規劃</a>
                            </li>
                            <li>
                                <a href="portfolio-2-col.html">2 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-3-col.html">3 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-4-col.html">4 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %> 
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp"%>
					<%@ include file="../platform/include_A_href/P6_contactUs.jsp"%>
                    <%@ include file="../platform/include_A_href/memberSession.jsp"%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
    </div>
    <!-- /.container -->
</nav>
<%-- 	<%@ include file="../platform/include_picture.jsp"%> --%>
<%@ include file="../platform/include_picture/include_picture.jsp" %>


<!-- ******************************************************************* -->



    <div id="body" style=" width:600px;padding:100px;margin-top:0px; margin-left:150px;">
        <form >
             <fieldset style="border-radius:20px;margin-top:20px;" >
                  <legend style="color:black;margin-left:20px; ">註冊會員</legend>
                     <div class="tabletxt" style="margin:20px;">
                       <p>
                          	帳號: <input type="text" id="idName"  placeholder="請輸入帳號" />
                            <img src="images/ajax-loader.gif" id="loadding"><span id="checkAccount" style="font-size:16px;"></span>
                            <br/>
                            <label class="lable">(不可空白，至少兩個中文字以上)</label>  
                       </p>
                    </div>
                     
                    <div class="tabletxt" style="width:600px;margin:20px;">                  
                         <p>
                           	 密碼: <input type="text" id="idPwd"  placeholder="請輸入密碼"/>
                            <span id="pwdOk" style="font-size:4px;color:red;"></span> 
                            <br />
                            <label class="lable" >(不可空白，不可為中文字，至少六個字且包含英文字母、數字)</label>
                         </p>
                    </div>
                     <div class="tabletxt" style="width:600px;margin:20px;">                  
                         <p>
                           	 確認密碼: <input type="text" id="doubleIdPwd"  placeholder="請再次輸入密碼"/>
                            <span id="pwdOk2" style="font-size:4px;color:red;"></span> 
                         </p>
                    </div>
                    
                    <div class="tabletxt" style="margin:20px;">
						<p>生日: <input type="text" id="datepicker" readonly>&nbsp;</p>
                    </div>
                    
                    
                    <div class="tabletxt1" style="margin:30px;">
                        <p>
                            <input type="reset" id="clean" value="Reset" onclick="ret()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" id="button" value="確    認" onclick="but()"/></p>
                    </div>
             </fieldset>
        </form>

    </div>
    
<!--     <script src="external/jquery/jquery.js"></script> -->
   	<script src="../js/jquery-1.11.0.js"></script>
	<script src="js/jquery-ui.js"></script>
    <script type="text/javascript">
    
    $(function() {
    	
    	
		// ***************帳號*****************
    	$("#loadding").prop("hidden",true);
    	
    	$(':text[id="idName"]').focus(function(){
    		$("#chkAccount").remove();
    		$("#checkAccount").empty();
    	});
    	$(':text[id="idName"]').blur(function(){
    		$("#chkAccount").remove();
    		$("#checkAccount").empty();
    		
    		$("#loadding").prop("hidden",false);
    		var name = $(this).val();
    		var reV1 = /^(?=.*\d)(?=.*[a-zA-Z]).{6,30}$/;
            if (!reV1.test(name)) {
    			$("#loadding").prop("hidden",true);
    			$("#checkAccount").html("<img src=images/errorImg.png />  帳號需填寫6碼包含英文、數字且不能空格!!\n");
    			return;
    		}    
            
    		$.get("checkAccount.jsp",{"name":name},function(data){
    			//$("#errName").text(data);
    			
    			if(data==1){
    				$("#checkAccount").html("<span id='chkAccount' style='color:red;'><img src=images/errorImg.png />此組帳號已有人使用</span>");
    			}else
    				$("#checkAccount").html("<span id='chkAccount' style='color:blue;'><img src=images/OK.png />此組帳號可以使用</span>");
				$("#loadding").prop("hidden",true);
    		});
    	});
    	// ***************帳號*****************
    	
    	
    	
    	// ***************密碼*****************
    	$(':text[id="idPwd"]').focus(function(){
    		$("#pwdOk").html("");
			$("#pwdOk2").html("");
    	});
    	
    	$(':text[id="doubleIdPwd"]').focus(function(){
			$("#pwdOk2").html("");
    	});
    	
    	$(':text[id="idPwd"]').blur(function(){
    		
    		var pwd = $(this).val();
    		
    		var doublePwd = $("#doubleIdPwd").val();
    		if(pwd.length == 0){
    			$("#pwdOk").html("<img src=images/errorImg.png />密碼不可以空白");
    			return;
    		}
    		var reV1 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*\w).{6,30}$/;
            if (!reV1.test(pwd)) {
            	$("#pwdOk").html("<img src=images/errorImg.png />密碼格式錯誤");
            	return;
    		}
            
    		if(pwd == doublePwd){
    			$("#pwdOk").html("<img src=images/OK.png />");
    			$("#pwdOk2").html("<img src=images/OK.png />");
    		}else{
    			if(doublePwd.length == 0 ){
    				$("#pwdOk").html("<img src=images/OK.png />");
    			}else{
    				$("#pwdOk").html("<img src=images/OK.png />");
    				$("#pwdOk2").html("<img src=images/errorImg.png />");
    			}
    		}	
    	});
    	$(':text[id="doubleIdPwd"]').blur(function(){
    		var doublePwd = $(this).val();
    		var pwd = $("#idPwd").val();
    		if(pwd == doublePwd){
    			$("#pwdOk").html("<img src=images/OK.png />");
    			$("#pwdOk2").html("<img src=images/OK.png />");
    		}else{
    			$("#pwdOk2").html("<img src=images/errorImg.png />請重新確認密碼");
    		}
    			
    		
    	});
    
    	     
    	// ***************密碼*****************
    	
    	
    	
    	// ***************生日*****************
    	$("#datepicker").datepicker();      
    	// ***************生日*****************
    });
    
        txt = new Array("idName", "idPwd", "Date");
        msg = new Array("errName", "errPwd", "errDate");
        msg1 = new Array("curName", "curPwd", "curDate");
//         window.onload = function () {
            
//             for (var i = 0; i < txt.length; i++) {
//                 document.getElementById(txt[i]).onfocus = focus;
//                 document.getElementById(txt[i]).onblur = blur;
//             }
//         }

        function chkName() {
            var txtV1 = document.getElementById("idName").value;
            var errMsg1 = "";
            var reV1 = /^(?!.*[\s])[\u4E00-\u9FFF]{2,}$/;
            if (!reV1.test(txtV1)) {
                errMsg1 += "姓名需填寫至少2個中文字且不能空格!!\n";
                document.getElementById("errName").innerHTML = "<img src=images/errorImg.png />  姓名需填寫至少2個中文字且不能空格!!\n";
                return errMsg1;
            } else {
                document.getElementById("curName").innerHTML = "<img src=images/OK.png /> OK!!\n";
                return errMsg1;
            }
        }
        function chkPwd() {
            var txtV2 = document.getElementById("idPwd").value;
            var errMsg2 = "";
            var reV2 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{6,30}$/;
            if (!reV2.test(txtV2)) {
                errMsg2 += "密碼需達6位數且須包含英文、數字、特殊符號!!\n";
                document.getElementById("errPwd").innerHTML = "<img src=images/errorImg.png /> 密碼需達6位數且須包含英文、數字、特殊符號!!\n";
                return errMsg2;
            } else {
                document.getElementById("curPwd").innerHTML = "<img src=images/OK.png /> OK!!\n";
                return errMsg2;
            }
        }
        function chkDate() {
            var txtV3 = document.getElementById("Date").value;
            var errMsg3 = "";
            var userDate = txtV3.split('/');            
            var userM = parseInt(userDate[0] - 1);
            var userD = parseInt(userDate[1]);
            var userY = parseInt(userDate[2]);
            var date = new Date(userY, userM, userD);
            if (!(date.getFullYear() == userY && date.getMonth() == userM && date.getDate() == userD) || txtV3 == "" || txtV3.length > 10) {
                errMsg3 += "日期格式輸入錯誤!!\n";
                document.getElementById("errDate").innerHTML = "<img src=images/errorImg.png />  日期格式錯誤!!\n";
                return errMsg3;
            } else {
                document.getElementById("curDate").innerHTML = "<img src=images/OK.png /> OK!!\n";
                return errMsg3;
            }
        }
        function but() {
            var errMsg = "";
            chkName();
            chkPwd();
            chkDate();
            if (chkName() != "")
                errMsg += chkName();
            if (chkPwd() != "")
                errMsg += chkPwd();;
            if (chkDate() != "")
                errMsg += chkDate();
            if (errMsg == "")
                errMsg = "您輸入的資料皆正確!!"
            alert(errMsg);
       
        }

        function blur(e) {
            if (e.target.id == "idName") chkName();
            if (e.target.id == "idPwd") chkPwd();
            if (e.target.id == "Date") chkDate();
        }
	function focus(e) {
        if (e.target.id == "idName") {
            document.getElementById("errName").innerHTML = "";
            document.getElementById("curName").innerHTML = "";
        }
        if (e.target.id == "idPwd") {
            document.getElementById("errPwd").innerHTML = "";
            document.getElementById("curPwd").innerHTML = "";
        }
        if (e.target.id == "Date") {
            document.getElementById("errDate").innerHTML = "";
            document.getElementById("curDate").innerHTML = "";
        }
    }

    function ret() {
         
         for (var i = 0; i < msg.length; i++) {
             document.getElementById(msg[i]).innerHTML = "";
         }
        
         for (var i = 0; i < msg1.length; i++) {
             document.getElementById(msg1[i]).innerHTML = "";
         }
    };

	
</script>
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>