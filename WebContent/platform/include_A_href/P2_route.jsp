<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<li class="dropdown">
	<a href="../P2_route/route_search.jsp" name="indexLoginBtn" class="noChange">景點介紹</a>
</li>
<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
    <ul class="dropdown-menu">
    	 <li>
            <a href="../P10_Random/Random.jsp" name="indexLoginBtn" class="noChange">隨機景點</a>
         </li>
        <li>
            <a href="../P2_route/route_plan.jsp" class="noLogin">路徑規劃</a>
        </li>
        <li>
            <a href="#" id="cooperationLink" class="noLogin">與好友同步規劃</a>
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
<div id="dialog-addFriend" title="邀請好友" hidden>
		<span>
			<h4 style="display:inline">選擇好友</h4> 
			<select class="selectpicker show-menu-arrow" id="getFriends"></select>
			<input type="button" id="addToFriend" value="+" />
		</span>
		<br>
		<div id="friendDiv" style="width:90%;"></div>
		<h4>說些什麼...</h4>
  <textarea id="textareamsgID" rows="4" cols="25">快點進來~大家都在等你囉!</textarea>
</div>
<div id="dialog-checkCoFromFrd" title="你朋友找你" hidden>
		<h4>好友邀你</h4> 
</div>
<!-- 路線協作平台 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- 好友協作平台 -->
<script type='text/javascript' src='../js/CoPlatform.js'  data-sionLoginId='<%= session.getAttribute("userLoginId") %>' data-serverPort = "<%= request.getServerPort()%>" data-serverName = "<%= request.getServerName()%>" data-contextPath = "<%= request.getContextPath()%>"></script>
<!-- 好友協作平台 -->
<!-- 路線協作平台  -->