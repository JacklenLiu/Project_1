<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<li class="dropdown">
   	<a href="#"  class="dropdown-toggle" data-toggle="dropdown"  style="color:red;">
   		會員，<%= session.getAttribute("userName") %>你好<b class="caret"></b></a>
	<ul class="dropdown-menu">
         <li>
             <a href="../P1_iud/userProfile.jsp">會員基本資料修改</a>
         </li>
         <li>
             <a href="portfolio-2-col.html">會員好友管理</a>
         </li>
         <li>
             <a href="../LoginServlet?action=logOut">登出系統</a>
         </li>
 	</ul>
</li>