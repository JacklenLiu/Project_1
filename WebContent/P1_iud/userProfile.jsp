<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="P1_iud.model.*"%>
<%@ include file="../platform/include_start.jsp" %>
<%
	MemberService memSvc = new MemberService();
 	String userId = (String)session.getAttribute("userLoginId"); 
	MemberVO list = memSvc.getOneMem(userId);
	pageContext.setAttribute("list",list);
%>

</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
        	<%@ include file="../platform/include_A_href/toIndex.jsp" %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <%@ include file="../platform/include_A_href/P2_route.jsp" %>
                    <%@ include file="../platform/include_A_href/P4_MessageBoard.jsp" %>
                    <%@ include file="../platform/include_A_href/Portfolio.jsp" %>
                    <%@ include file="../platform/include_A_href/P3_TravelDiary.jsp" %>
					<%@ include file="../platform/include_A_href/P6_contactUs.jsp" %>
                    <%@ include file="../platform/include_A_href/memberSession.jsp" %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
<!--             <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!--             <li data-target="#myCarousel" data-slide-to="1"></li> -->
<!--             <li data-target="#myCarousel" data-slide-to="2"></li> -->
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('../Images/E_Changhong Bridge_01.bmp');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('../Images/E_Changhong Bridge_02.bmp');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('../Images/E_Changhong Bridge_03.bmp');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

<br/>
<!-- 個人資料編輯 -->
<div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Sheena Kristin A.Eschor</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100" class="img-circle"> </div>
                
                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>會員帳號:</td>
                        <td>${list.member_loginID}</td>
                      </tr>
                      <tr>
                        <td>Hire date:</td>
                        <td>06/23/2013</td>
                      </tr>
                      <tr>
                        <td>會員信箱:</td>
                        <td>${list.member_email}</td>
                      </tr>
                      <tr>
                        <td>會員姓名:</td>
                        <td>${list.member_name}</td>
                      </tr>
                      <tr>
                        <td>會員姓名:</td>
                        <td>${list.member_gender}</td>
                      </tr>
                      <tr>
                        <td>會員生日:</td>
                        <td>${list.member_birthday}</td>
                      </tr>
                      <tr>
                        <td>會員地址:</td>
                        <td>${list.member_address}</td>
                      </tr>
                      <tr>
                        <td>會員興趣種類:</td>
                        <td>${list.typeName}</td>
                      </tr>
                    </tbody>
                  </table>
                  
                  <a href="#" class="btn btn-primary">My Sales Performance</a>
                  <a href="#" class="btn btn-primary">Team Sales Performance</a>
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="../index.jsp" data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
        </div>
      </div>
    </div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
    
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>