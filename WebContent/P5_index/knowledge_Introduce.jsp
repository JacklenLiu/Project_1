<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
  <%@ include file="../platform/include_title.jsp" %>
  <%@ include file="../platform/include_start.jsp" %>
  <%@ page import="P5_index.model.*"%>
  <%
  
    String knowledgeIdentity = session.getAttribute("knowledgeIdentity").toString();
  	knowledgeService klSvc = new knowledgeService();
  	knowledgeVO klVO = klSvc.getOne(knowledgeIdentity); 
  %>
  <%!public String turn(String str){while(str.indexOf("\n")!=-1){str = str.substring(0,str.indexOf("\n"))+"<br>"+str.substring(str.indexOf("\n")+1);}return str;}%>
　
  <!-- 調整navbar btn -->
  <link rel="stylesheet" href="../navbar-adjcss/navbar-adj.css">
<link rel="stylesheet" href="../seeetalertcss/sweet-alert.css">

<!-- 路線協作平台 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- 好友協作平台 -->
    

<body>
	<!-- Navigation -->
<nav class="navbar navbar-fixed-top" role="navigation">
		<div class="rowHeader">
        	<div class="container">
			<%@ include file="../platform/include_A_href/toIndex.jsp" %> 
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<c:if test="<%=sionName == null%>">
                  		<li class="dropdown">
                  			<a href="../P0_login/login.jsp" name="indexLoginBtn" class="noChange">登入</a>
                  	 	</li>
                  	</c:if>
                	<%@ include file="../platform/include_A_href/P2_route.jsp" %>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %> 
<%--                     <%@ include file="../platform/include_A_href/Portfolio.jsp" %> --%>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp"%>
					<%@ include file="../platform/include_A_href/P6_contactUs.jsp"%>
                     <c:if test="<%=sionName != null%>">
                 		<li class="dropdown">
                    		<a href="#"  class="dropdown-toggle" data-toggle="dropdown">
                    		<i class="fa fa-user"></i><%=sionName%>你好&nbsp;&nbsp;<i id ="InviteIcon"></i><span id="YouHasInvite" style="vertical-align: top"></span><b class="caret"></b></a>
<%--                     		<i class="fa fa-user"></i><%=sionName%>你好<b class="caret"></b></a> --%>
                 			<ul class="dropdown-menu">
		                       	<li>
		                           <a href="P1_iud/userProfile.jsp">會員基本資料</a>
		                       	</li>
		                      	<li>
		                           	<a href="P4_MessageBoard/SeekFriend2.jsp">會員好友管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                           		<span id="friendManage"></span>
		                           	</a>
		                       	</li>
		                        <li>
           							 <a href="http://<%=serverName%>:<%=serverPort%><%=contextPath%>/P2_route/viewnameServlet?action=GetRouteByMemID&reflash=true&memID=${userLoginId}">我的路線</a>
        					 	</li>
		                       	<li>
		                           <a href="LoginServlet?action=logOut">登出系統</a>
		                       	</li>
                  			</ul>
                     	</li>		
                  	</c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!--  end row  -->
	</div>
    <!-- /.container -->
</nav>
	<div id="dialog-addFriend" title="邀請好友" hidden>
		<span>
			<h4 style="display: inline">選擇好友</h4> <select
			class="selectpicker show-menu-arrow" id="getFriends"></select> <input
			type="button" id="addToFriend" value="+" />
		</span> <br>
		<div id="friendDiv" style="width: 90%;"></div>
		<h4>說些什麼...</h4>
		<textarea id="textareamsgID" rows="4" cols="25">快點進來~大家都在等你囉!</textarea>
	</div>
	<div id="dialog-checkCoFromFrd" title="你朋友找你" hidden>
		<h4>好友邀你</h4>
	</div>
	<%-- 	<%@ include file="../platform/include_picture.jsp"%> --%>
	<%@ include file="../platform/include_picture/include_picture.jsp" %>

<div class="container">
	<div class="row">
            <div class="col-lg-12">
               	 <h3 class="page-header"> ＊~急救小知識~＊</h3>
            </div>
            <div class="col-md-12" style="float:left;display:inline;">
            	<h1><%=klVO.getKnowledge_title() %></h1>
            	<img style="float:right;margin:15px;width:450px;height:300px;" src="GetKnowledgeImgServlet?knowledge_Identity=<%=knowledgeIdentity%>" align="right" />
            	<h3 style="  letter-spacing:4px;  line-height:30px; ">
            		<%=turn(klVO.getKnowledge_content()) %>
            		<!-- 「悅讀陽明山」（續）2014年12月6日將發表14式環境教育課程

					為擴大民眾參與，提供更系統化的環境教育服務，陽明山國家公園推動整體規劃，
					延續去年規劃內容實施了「環境教育課程方案設計編撰」，12月6日（星期六）將舉辦成果發表會，
					新發表14式「悅讀陽明山」（續）戶外環境教育課程，為環境教育推廣立下新里程。<br>
	
					該成果發表會將於當日上午9點起於臺北市教師研習中心舉行，
					將提供200位關心環境教育的學校老師與環境教育推廣志工參與。新發表的14式課程，
					係依照國小低年級、中年級、高年級、國中、高中、教師與機關團體等7類對象的學習需求來設計，
					並融合陽明山的資源特色與環境教育意涵，提供生動豐富的環境學習機會。
					下午將邀請與會者一同體驗其中4式精采課程，從不同面向來感受陽明山，向大自然學習。<br>
	
					環境教育是全民終身教育，不同學習階段需要不同的教學方法，今年本處規劃的這14式課程，
					採用了自然體驗、環境解說、觀察探索、價值澄清、科學調查、角色扮演、說故事等多元的教學方法，
					期待能引發學員對自然的熱愛、對生態保育的關心，並從中啟發自然的智慧。
					未來，這些課程方案都將公開於陽明山國家公園網頁，也將出版課程手冊與電子書，
					成為最佳的環境教育課程實務參考書，歡迎學校教師與環境教育人員多加利用陽明山國家公園來進行環境教育。
				 --></h3>
            </div>
     </div><!-- end row -->
</div><!-- end container -->


<!-- 多加這個讓地圖不會吃到footer -->
<div class="row"></div>	

<!-- footer用 -->    
<%@ include file="../platform/include_footer.jsp" %>    
<!-- /footer用 -->  
<script src="../seetalertjs/sweet-alert.js"></script> 


<script type="text/javascript">   
(function ($) {
	var serverName = "<%= serverName %>"; //localhost
	var serverPort = "<%= serverPort %>"; //8081
	var contextPath = "<%= contextPath %>"; //Project_1
	
//******昱豪 登入處裡*****************************
	
	var sionLog = "<%=sionLoginId%>";
	if(sionLog == "null"){
 		//$(".navbar-right a[class != 'noChange'] ").prop("href","P0_login/login.jsp");
		$(".navbar-right a[class != 'noChange'] ").prop("href","#");
		$("a[name != 'indexLoginBtn']").click(function(){
			//alert("請先登入會員!!");
			sweetAlert("此功能需先行登入會員!!","","warning");
			$("#ok_sweetAlert").click(function(){
				window.location.href='http://'+ serverName +':'+ serverPort + contextPath +'/P0_login/login.jsp';
			});
				
		});
	}
})(jQuery);

</script>
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
<!-- 路線協作平台 -->
<script type='text/javascript' src='../js/CoPlatform.js'  data-sionLoginId='<%= session.getAttribute("userLoginId") %>' data-serverPort = "<%= serverPort %>" data-serverName = "<%= serverName %>" data-contextPath = "<%= contextPath %>"></script>
<!-- 路線協作平台  --> 
</body>
</html>