<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<%	
	Object sionName = session.getAttribute("userName");
	Object sionLoginId = session.getAttribute("userLoginId");
%>
<style>
	
	#tooltip{
        position:absolute;
        border:5px outset red;
        background:#f7f5d1;
        padding:1px;
        color:red;
        display:none;
		font-size:26px;
		border-radius:15px;
	}
</style>
	
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">下一站，幸福</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                  <c:if test="<%=sionName == null%>">
                  	 <li>
                  		<a href="#myModal" data-toggle="modal" data-target="#myModal" id="abcd">登入</a>
                  	 </li>
                  </c:if>
                  <c:if test="<%=sionName != null%>">
                 	 <li class="dropdown">
                    	<a href="#"  class="dropdown-toggle" data-toggle="dropdown"  style="color:red;">
                    		會員，<%=sionName%>你好<b class="caret"></b></a>
                 			 <ul class="dropdown-menu">
		                       <li>
		                           <a href="P2_route/route_plan.jsp">會員基本資料修改</a>
		                       </li>
		                       <li>
		                           <a href="portfolio-2-col.html">會員好友管理</a>
		                       </li>
		                       <li>
		                           <a href="portfolio-3-col.html">登出系統</a>
		                       </li>
                  			</ul>
                    </li>		
                  </c:if>
<!--                     <li> -->
<!--                         <a href="services.html">Services</a> -->
<!--                     </li>                    -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">路徑規劃 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                           		<c:if test="<%=sionName==null%>">
                           			<a href="#myModal" data-toggle="modal" data-target="#myModal" id="abab">路經規劃</a>
                           			<input type="text"  class="aaa" hidden value="aaa">
                           		</c:if>
                           		<c:if test="<%=sionName!=null%>">
                                 	<a href="P2_route/route_plan.jsp">路經規劃</a> 
                                </c:if>
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
                     <li>
                        <a href="P4_MessageBoard/showALL.jsp">留言板</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href=".portfolio-1-col.html">1 Column Portfolio</a>
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
                                <a href="ortfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="P3_TravelDiary/TravelDiaryServlet?action=blog.do">所有文章</a>
                            </li>
                            <li>
                                <a href="P3_TravelDiary/blog_editor.jsp">發表新文章</a>
                            </li>
                            <li>
                                <a href="P3_TravelDiary/blog_manage.jsp">管理我的文章</a>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="full-width.html">Full Width Page</a>
                            </li>
                            <li>
                                <a href="sidebar.html">Sidebar Page</a>
                            </li>
                            <li>
                                <a href="faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="404.html">404</a>
                            </li>
                            <li>
                                <a href="pricing.html">Pricing Table</a>
                            </li>
                        </ul>
                    </li>
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
                <div class="fill" style="background-image:url('Images/E_Changhong Bridge_01.bmp');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('Images/E_Changhong Bridge_02.bmp');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('Images/E_Changhong Bridge_03.bmp');"></div>
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

    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Welcome to Modern Business
                </h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> 熱門景點排行榜</h4>
                    </div>
                    <div class="panel-body">
                        <h4><a href="#">※2014/10/10 陽明山</a></h4>
                        <h4><a href="#">※2014/10/10 五指山</a></h4>
                        <h4><a href="#">※2014/10/10 大同山</a></h4>
                        <h4><a href="#">※2014/10/10 象山海</a></h4>
<!--                    <h4><a href="#" class="btn btn-default">Learn More</a> -->
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> 最新消息</h4>
                    </div>
                    <div class="panel-body">
                   		<a href="#"><p>※2014/10/10 陽明山海芋季，快來看看</p></a>
                        <a href="#"><p>※2014/10/10 五指山海芋季，快來看看</p></a>
                        <a href="#"><p>※2014/10/10 大同山海芋季，快來看看</p></a>
                        <a href="#"><p>※2014/10/10 象山海芋季，快來看看</p></a>
<!--                    <a href="#" class="btn btn-default">Learn More</a> -->
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i>急救知識補給站</h4>
                    </div>
                    <div class="panel-body">
                       <a href="#"><p>※濕搓沖捧擦</p></a>
                       <a href="#"><p>※沖脫泡蓋送</p></a>
                       <a href="#"><p>※叫叫ABC</p></a>
                       
<!--                        <a href="#" class="btn btn-default">Learn More</a> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Portfolio Heading</h2>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html" >
                    <img class="img-responsive img-portfolio img-hover tooltips " src="" alt=""  style="width:350px;height:270px;float:none;">
                	<img src="Images/1.png" style="margin-top:-340px;margin-left:-45px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html" >
                    <img class="img-responsive img-portfolio img-hover tooltips " src="" alt=""  style="width:350px;height:270px;float:none;">
                    <img src="Images/2.png" style="margin-top:-340px;margin-left:-45px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover tooltips " src="" alt="" style="width:350px;height:270px;">
                    <img src="Images/3.png" style="margin-top:-340px;margin-left:-45px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover tooltips " src="" alt="" style="width:350px;height:270px;">
                    <img src="Images/4.png" style="margin-top:-340px;margin-left:-45px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover tooltips " src="" alt="" style="width:350px;height:270px;">
                    <img src="Images/5.png" style="margin-top:-340px;margin-left:-45px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover tooltips " src="" alt="" style="width:350px;height:270px;">
                    <img src="Images/6.png" style="margin-top:-340px;margin-left:-45px;width:100px;hieght:100px;position:absolute;">
                </a>
            </div>
        </div>
        <!-- /.row -->

        <!-- Features Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Modern Business Features</h2>
            </div>
            <div class="col-md-6">
                <p>The Modern Business template by Start Bootstrap includes:</p>
                <ul>
                    <li><strong>Bootstrap v3.2.0</strong>
                    </li>
                    <li>jQuery v1.11.0</li>
                    <li>Font Awesome v4.1.0</li>
                    <li>Working PHP contact form with validation</li>
                    <li>Unstyled page elements for easy customization</li>
                    <li>17 HTML pages</li>
                </ul>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
            </div>
            <div class="col-md-6">
                <img class="img-responsive" src="http://placehold.it/700x450" alt="">
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-lg btn-default btn-block" href="#">Call to Action</a>
                </div>
            </div>
        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    
    
    <!-- /.container -->
    <Form method="Post" action="login" class="box login" id="commentForm" name="myform">
	<div class="modal fade" id="myModal">
      	<div class="modal-dialog" style="margin-top: 200px ">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"  aria-hidden="true">×</button>
               <h3 id="abc123" align="center" hidden></h3>
               <h4 class="modal-title" >Log-in</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                 <label for="exampleInputEmail1">account</label>
                   <input class="form-control" id="exampleInputEmail1" name="userId" placeholder="account" type="text" title="請輸入帳號" focus>
               </div>
               <div class="form-group">
                 <label for="exampleInputPassword1">Password</label>
                   <input class="form-control" id="exampleInputPassword1" name="pswd" placeholder="Password" type="password" title="請輸入密碼">
                   <input type="hidden" name="action" value="LoginIdCheck">
               </div>
               <div>
	               	
	               		<input type="checkbox" name="rememberMe"  
	                	<c:if test='${param.rememberMe==true}'> 
	                  	 checked 
	                	</c:if>  
	            			 value="true"><small>記住我</small>
	            			 <font color="red">${errorMSG} <br></font> 
			
	 				
               </div>
                   <p class="text-right"><a href="#">忘記密碼?</a></p>
                   <input type="hidden" name="action" value="LoginIdCheck">
            </div>
               <div class="modal-footer">
                   <a href="#" data-dismiss="modal" class="btn">結束</a>
                   <input type="submit" value="登入" class="btn btn-primary">
               </div>
           </div>
        </div>
    </div> 
  </form>
    
    
  
    
    <!-- jQuery Version 1.11.0 -->
     <script src="js/jquery-1.11.0.js"></script> 

    <!-- Bootstrap Core JavaScript -->
<!--      <script src="js/bootstrap.min.js"></script>  -->
    <script src="js/bootstrap.js"></script>
    
 	<script type="text/javascript" src="P0_login/js/jquery.validate.js"></script> 


    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });
    
    $('.nav .dropdown').hover(function() {
            $(this).addClass('open');
        }, function() {
            $(this).removeClass('open');
        });
    
    //子暘登入Script
   
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
   
    	
    //子暘登入Script
		(function ($) {   
			//登入處裡*****************************
			var css1 = {"color":"red"};
	    	$("#abab").click(function(){	    	
	    		$("#abc123").prop("hidden",false).html("請先行登入會員系統!!").css(css1);
	    	});
	    	$("#abcd").click(function(){	    	
	    		$("#abc123").prop("hidden",true);;
	    	});
	    	
	    	//登入處裡*****************************
	    	
	    	//$(".col-sm-6").empty();
	    	//抓排行榜
	    	var serverName = "<%= request.getServerName()%>";
			var serverPort = "<%= request.getServerPort()%>";
			var contextPath = "<%= request.getContextPath()%>";
	    	//$('#gallery').empty();//clear images in maindiv
 			var url = "ImgTop6servlet";
        	$.getJSON(url,{'action':'GetImgTop6'}, function(datas){
        		$.each(datas,function(i,item){
        			
        			//alert(item.imagesID);
        			//alert(i);
            		//i->index
   					//item -> item
   					//console.log(item.viewID);
   					//console.log(item.viewname);
            		            			//.col-sm-6:nth-child(1) > a > img
   					 $('.col-sm-6:nth-child('+(i+2)+') > a > img:nth-child(1)').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+ item.imagesID).attr("title",item.viewname);
//   											.attr("id", imgarea+ item.viewID + '_01')
//    									   		.addClass("viewimge")
//    									   		.attr("alt",item.viewname);
   						
        		});
        	});
        	
        	
        	
        	
		 })(jQuery);
    
    
    //滑鼠移入出現div
	(function($){
	        /*設定tooltip的div區塊和滑鼠指標之間的距離,x軸距及y軸距,
	          避免tooltip的div和滑鼠指標太接近*/
		var x = 10;
        var y = -45;
        
        /*指定TagName為a且其CalssName=tooltip的Tag,
          當滑鼠移到其上面時進行函式動作*/
        $(".tooltips").mouseover(function(e){
			
            /*將此Tag的title的值給予到newTitle,接著將title的值空白,
                避免滑鼠移到Tag時,同時出現tooltip及title的效果*/
            this.newTitle = this.title;
            //this.title = "";

            /*建立tooltip用來儲存你要顯示的內容,而內容就是由div區塊所組成;
                這範例是用文字來作,你要的圖片效果,只要在div中加入<img src>*/
            var tooltip = "<div id='tooltip'>"+ this.newTitle +"<\/div>";

            /*利用.append()把這段div加到body,而條件就是:
                當滑鼠指標移動你指定的Tag的範圍時,才會加入*/
            $("body").append(tooltip);

                /*利用.css()設定tooltip的css,其中e.pageY及e.pageX就是滑鼠指標
                  的座標,避免tooltip和滑鼠指標太靠近,後面加上前面設定的x及y*/
                $("#tooltip")
                        .css({
                                "top": (e.pageY+y) + "px",
                                "left": (e.pageX+x)  + "px"

                        /*利用.show()讓tooltip這段div區塊顯示*/
                        }).show("fast");

        /*當滑鼠移開時,將newTitle的值還給title,
            並且利用.remove()將tooltip這段div區塊移除*/
        }).mouseout(function(){
                this.title = this.newTitle;
                $("#tooltip").remove();

        /*當滑鼠指標在指定的Tag範圍內移動時,
          tooltip的div區塊也會隨著滑鼠指標作移動*/
        }).mousemove(function(e){
                $("#tooltip")
                        .css({
                                "top": (e.pageY+y) + "px",
                                "left": (e.pageX+x)  + "px"
                        });
        });
	})(jQuery);
    
    </script>

</body>

</html>
