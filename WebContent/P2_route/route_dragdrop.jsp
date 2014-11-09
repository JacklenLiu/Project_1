<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%@ include file="../platform/include_start.jsp" %>

<head>
    <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
<style type="text/css">
        table {
            border-right: 1.5px solid #F00;
            border-bottom:1.5px solid #F00;
            
        }
        
         td {
            border-left: 1.5px solid #F00;
            border-top:1.5px solid #F00;
        }
      
		.viewimge{
			width:150px;
			height:150px;
		}
		
#gallery { float: left; /*width: 65%*/ width:440px; min-height: 12em; /*for grid*/ margin: 0; padding: 0;  list-style: none; overflow: auto; height:525px}
.gallery.custom-state-active { background: #eee; }
  .gallery li { float: left; width: 415px; padding: 0.6em; margin: 0 0.4em 0.4em 0; text-align: center; /*for grid*/overflow: hidden; display: block;}
  .gallery li h5 { margin: 0 0 0.4em; cursor: move;}
  .gallery li a { float: right; }
  .gallery li a.ui-icon-zoomin { float: left; }
  .gallery li img { /*width: 100%*/ width:400px; cursor: move; }
 
#route { float: right; /*width: 32%*/ width:375px; min-height: 18em; padding: 5px; overflow: auto; height:425px}
#route h4 { line-height: 16px; margin: 0 0 0.4em; }
#route h4 .ui-icon { float: left; }
#route .gallery h5 { display: inline; }
		

/*for grid*/
figure, figcaption, h3, p {
            margin: 0;
            padding: 0;
        }
        
#gallery li > figure {
                float: left;
                /*width: 25%;*/
                width: 400px;
                margin: 0;
            }

                #gallery li > figure img {
                    display: block;
                    max-width: 100%;
                    /*height: auto;*/
                    height: 180px;
                    weight: 400px;
                }

        .image-details {
            clear: both;
            padding: 1em;
            background: #222;
            color: #fff;
            position: relative;
            overflow: hidden;
            display: none;
        }

        .image-details-close {
            position: absolute;
            top: 1em;
            right: 1em;
            width: 25px;
            height: 25px;
            text-indent: -9999em;
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAAGXRFWHRTb2Z0d2Fy ZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAA AAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5U Y3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6 eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8w Mi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRw Oi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpE ZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRv YmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNv bS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20v eGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRv YmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0i eG1wLmlpZDpCNDg5MkEwM0ZEM0MxMUUzOTAyNDlCRDA2MTgzMjhENCIgeG1wTU06 RG9jdW1lbnRJRD0ieG1wLmRpZDpCNDg5MkEwNEZEM0MxMUUzOTAyNDlCRDA2MTgz MjhENCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAu aWlkOkI0ODkyQTAxRkQzQzExRTM5MDI0OUJEMDYxODMyOEQ0IiBzdFJlZjpkb2N1 bWVudElEPSJ4bXAuZGlkOkI0ODkyQTAyRkQzQzExRTM5MDI0OUJEMDYxODMyOEQ0 Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8 P3hwYWNrZXQgZW5kPSJyIj8+8NlNEgAAAVBJREFUeNrs29EOgiAUgOHoLeC5Mq17 3/+2DTeSOmvWFFSoYf5nO2tuTTwfYEKlnHOHPcfxsPMAAAAAAAAAAAAAAAAAAAAA AAAAAAAgJZRS/kX32fZp/PE30p9b2tByvD78nmDG1H3e3DNsn9fcPebPKed20pZO uebcAK17jy4nghTffbTRlgRgBr0zRLhkKP4yUryVNssACPRSEsJE8a/RVRRABKFZ UXwTKr5IgEiv1QuKr+eMpiIBUhHmFl80QGQInwPFn5dMoaIBAr1pxxCkeLtk1BQP EEGoBu+plha/GYBA7/rjk6SdM0o2CxBBWFX85gACQ31yavwdgFz0aQLhMSV+taDb /X4AU4CbIB+DPAjxKMxiiOUwGyJsibEpyrY4X4zw1Vime4CWXjFfXMAZaUOn3gMU f5jg9wEAAAAAAAAAAAAAAAAAAAD7i7sAAwB/21/1MhzmOwAAAABJRU5ErkJggg==' );
            background-size: 25px 25px;
            background-repeat: no-repeat;
        }

        .image-details-content {
            float: left;
            width: 45%;
            margin: 0 3%;
            padding-right: 0.8em;
            border-right: 1px dotted #666;
        }

        .image {
            padding: 0.3em;
            border: 1px solid #888;
        }

            .image img {
                display: block;
                max-width: 100%;
                height: auto;
            }

        .image-details-desc {
            float: left;
            width: 85%;
            color: #767676;
        }

		hr {
  			border-color:#777;
		}
/*             .image-details-desc h3 { */
/*                 font-weight: normal; */
/*                 font-size: 19px; */
/*                 color: #fff; */
/*                 padding-bottom: 2px; */
/*                 border-bottom: 1px solid #777; */
/*                 margin-bottom: 0.3em; */
/*             } */
            
/* 			.image-details-desc p { */
/* 				border-bottom: 1px solid #777; */
/* 				margin-bottom: 0.3em; */
/* 			} */
#mainDiv{
	height:650px;
}


#mapdiv{
		margin: 0px 20px 0px 10px;
        height: 450px;
        width: 410px;
        float: left;
	}
#map {
        height: 100%;
        margin: 10px;
        padding: 0px;
        height: 385px;
        width: 385px;
        float: left;
        color: black;
      }
      
#mapdiv h4 { line-height: 16px; margin: 0 0 0.4em; }
#mapdiv h4 .ui-icon { float: left; }

    </style>
   
	<link rel="stylesheet" href="../Styles/jquery-ui.min.css"> <!-- 蕙齊link-->
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
                  <a class="navbar-brand" href="../index.jsp">下一站，幸福</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
<!--                         <a href="P0_login/login.jsp">登入</a> -->
<!--                         <a href="#myModal" data-toggle="modal" data-target="#myModal">登入</a> -->

					<li class="dropdown">
                    	<a href="#"  class="dropdown-toggle" data-toggle="dropdown"  style="color:red;">
                    		會員，<%= sionName %>你好<b class="caret"></b></a>
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
                    
<!--                     <li> -->
<!--                         <a href="services.html">Services</a> -->
<!--                     </li>                    -->
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
                     <li>
                        <a href="../P4_MessageBoard/showALL.jsp">留言板</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../portfolio-1-col.html">1 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="../portfolio-2-col.html">2 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="../portfolio-3-col.html">3 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="../portfolio-4-col.html">4 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="../ortfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../blog-home-1.html">Blog Home 1</a>
                            </li>
                            <li>
                                <a href="../blog-home-2.html">Blog Home 2</a>
                            </li>
                            <li>
                                <a href="../blog-post.html">Blog Post</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../full-width.html">Full Width Page</a>
                            </li>
                            <li>
                                <a href="../sidebar.html">Sidebar Page</a>
                            </li>
                            <li>
                                <a href="../faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="../404.html">404</a>
                            </li>
                            <li>
                                <a href="../pricing.html">Pricing Table</a>
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

<!-- ******************************************************************* -->
 
    <img src = "images/02.gif" /> 欲選擇其他地區
	<select  id="sel1">
		<option value="北部" id="N">北部</option>
  		<option value="中部" id="C">中部</option>
  		<option value="南部" id="S">南部</option>
  		<option value="東部" id="E">東部</option>
	</select>
	<!-- 放抓到的area值 -->
	<input type="text" id="resp" value="${area}" hidden/>
	<input type="text" id="respPath" value="${path}" hidden/>
	
	<div id="mainDiv" class="ui-widget ui-helper-clearfix">
	<div id="mapdiv" class="ui-widget-content ui-state-default">
		<h4 class="ui-widget-header"><span class="ui-icon ui-icon-image">地圖</span> 地圖</h4>
		<div id="map"></div>
	</div>
	<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix"></ul>
	<div id="route" class="ui-widget-content ui-state-default">
		<h4 class="ui-widget-header"><span class="ui-icon ui-icon-image">路徑規劃</span> 路徑規劃</h4>
	</div>
	

</div>

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src='../Script/jquery-ui.js'></script>	
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src='../Script/jquery.tinyMap.js'></script>
<script>
		var serverName = "<%= request.getServerName()%>";
		var serverPort = "<%= request.getServerPort()%>";
		var contextPath = "<%= request.getContextPath()%>";

        (function ($) {      	
			var nextimgcss=null;
         	$(window).load(function() {
	        	var area = $("#resp").val();
	        	if(area=="北部"){$("#N").prop("selected",true);}
	        	if(area=="南部"){$("#S").prop("selected",true);}
	        	if(area=="東部"){$("#E").prop("selected",true);}
	        	if(area=="中部"){$("#C").prop("selected",true);}
	        	getViewDataByArea(area);
			});
        	
        	$('#sel1').change(function(){
    		 	area = $(this).val();
    		 	getViewDataByArea(area);
    		});
        	
        	function getViewDataByArea(area){
        		var url = "viewnameServlet";
                $.getJSON(url, {'area':area,'action':'GetAllByArea'}, function(datas){
                	show(area, datas);
            		window.setTimeout(initGalleryUL, 700);
            		setmarker(datas);
                });
        	}
        	
        	function setmarker(datas){
        			$('#map').tinyMap();//create instance first
        			$('#map').tinyMap('clear','marker');//clear overlay
        		
        			var addrs = [], vname = [], markers = [];	
                	//抓取每個景點座標
                	$.each(datas,function(i,item){
                		//i->index
                		//item -> item
                		var a = [item.viewlng,item.viewlat];
                		addrs[i] = a;
                		vname[i] = item.viewname;
                		console.log(addrs[i]);
                        console.log(vname[i]);
                	})
                 	
                	//set center order by viewlng(緯度)
                	var center = addrs[14];                	   
                	
                	//將每個景點組成marker物件放入markers陣列
                	for (var i = 0, max = addrs.length; i < max; i++) {
                        markers[i] = { addr: addrs[i], text: vname[i]};
                        //console.log("markers:"+markers[i]);
                    }

                	//更新地圖上的座標    
                    $('#map').tinyMap('modify',{
                        zoom: 14,//#bug 2014/10/28
                        marker: markers
                        //animation: 'DROP|BOUNCE'
                    });
                	
                	//將地圖移到多個景點緯度介於中間的位置
                    $('#map').tinyMap('panto', center);
        	}

        	var preview=null;
        	function initGalleryUL(){
    			preview = new $.imagePreview( "#gallery" );
    		};
        	
        	function show(area, datas){        		
	        	$('#gallery').empty();//clear images in maindiv
 					//var url = "viewnameServlet";
        			//$.getJSON(url, {'area':area,'action':'GetAllByArea'}, function(datas){
        				$.each(datas,function(i,item){
            					//i->index
            					//item -> item
            					var namehead = $('<h5></h5>').text(item.viewname).addClass("ui-widget-header");
            			
            			
            					//get img
             					var imgarea="E_";

            					switch(area){
            						case "北部":
            							imgarea="N_";
            							break;
            						case "中部":
            							imgarea="C_";
            							break;
            						case "南部":
            							imgarea="S_";
            							break;
            						case "東部":
            							imgarea="E_";
            							break;
            					}
            			
            					var imgs = $('<img></img>').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+imgarea+ item.viewID + '_01')
            											.attr("id", imgarea+ item.viewID + '_01')
            									   		.addClass("viewimge")
            									   		.attr("alt",item.viewname);
            					var alinkimg = $('<a></a>').attr("href", "#")
            									   		.addClass("image-link")
            									   		.append(imgs);						
            			
            					var viewimg = $(imgs).attr("src");
            					var alinkdesc = $('<a></a>').attr("title", "景點描述")
            												.attr("href",viewimg)			//check pic
															.addClass("ui-icon ui-icon-zoomin")
															.text("景點描述");
            			
            					var alinkaddroute = $('<a></a>').attr("title", "加入行程")
																.addClass("ui-icon ui-icon-image")
																.attr("href",'#')
																.text("加入行程");
            			
            					var figureimg = $('<figure></figure>').attr("data-desc","Default")
            														  //.attr("data-title","Img1")							  		  
            														  .append(namehead)
                      										  		  .append(alinkimg)
                    										  		  .append(alinkdesc)
                    										  		  .append(alinkaddroute);
            			
            					var alinkdetailclose = $('<a></a>').attr("href","#")
            									 		   		  .addClass("image-details-close")
            									 		   		  .text("Close");
            					//detailcontent
            					//var divfigure = $('<figure></figure>').addClass("image");
            					//var divdetailcontent = $('<div></div>').addClass("image-details-content")
            												   		   //.append(divfigure);
            			
            					//detaildescription
            					//var h3title = $('<h3></h3>').addClass("image-details-title");
            					var ptext = $('<p></p>').addClass("image-details-text");
            					nextimgcss = {"width":"45px","height":"45px","margin-right":"8px"};
            					var nextimg1 = $('<img></img>').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+imgarea+ item.viewID + '_02')
            												   .attr("id", imgarea+ item.viewID + '_02')
            												   .css(nextimgcss)
            												   .click(tinyimgclick);
            					var nextimg2 = $('<img></img>').attr("src",'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+imgarea+ item.viewID + '_03')
            												   .attr("id", imgarea+ item.viewID + '_03')
            												   .css(nextimgcss)
            												   .click(tinyimgclick);
            					var divdetaildesc = $('<div></div>').addClass("image-details-desc")
            														//.append(h3title)
            														.append(ptext)
            														.append('<hr>')
            														.append(nextimg1)
            														.append(nextimg2);
            			
            					//div details = detailcontent + detaildescription
            					var divdetails = $('<div></div>').addClass("image-details")
            											 		 .append(alinkdetailclose)
            											 		 //.append(divdetailcontent)
            											 		 .append(divdetaildesc);
            			
            					var idli = $('<li></li>').attr("id", item.viewID)
            											 .append(figureimg)
            											 .append(divdetails)
            											 .addClass("ui-widget-content ui-corner-tr")
            											 .draggable({
            								             	 cancel: "a.ui-icon", // clicking an icon won't initiate dragging
            								             	 revert: "invalid", // when not dropped, the item will revert back to its initial position
            								             	 containment: "document",
            								             	 helper: "clone",
            								             	 cursor: "move",
            								             	 drag: function(event, ui){
               								             		 		var $item = $(this);
               								             		 		$item.find('.image-details-close')
               								             		 	  		 .trigger('click');
               								             	 	   }
            								            	 })
            								        	 .click(function click(event){
            								        			 var $item = $( this ),
            							                		 $target = $( event.target );
            							              			 if ( $target.is( "a.ui-icon-image" ) ) {
            							                			 deleteImage( $item );
            							              			 } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
            							                			 viewLargerImage( $target );
            							              			 } else if ( $target.is( "a.ui-icon-refresh" ) ) {
            							            	  			 recycleImage( $item );
            							              			 }
            							         		     	 return false;
            								        	 });
            					var ul = $('#gallery').append(idli);
            		});
            	//});//end of getJSON
        	}//end of show function
        	
        	function tinyimgclick(){
				var tinyimg = $(this);
				var contentdesc = $(this).parent();
				var contentp = tinyimg.parent().find('p');
				var bigimg = tinyimg.parents('li').children('figure').children('a').children('img');
				
				//replace triggers desc
				var url = "imageinfoServlet";
                $.get(url, {'action':'GetImgInfoByID','id': tinyimg.attr("id")}, function(data){
                	console.log(data);
                	if(data!=""){
        				contentp.text(data);
        			}
       		 	 }); 
                
                //抓取大圖並新增一組小圖                
                var minimg = $('<img></img>').attr("id",bigimg.attr("id"))
                							 .attr("src",bigimg.attr("src"))
                							 .css(nextimgcss)
                							 .click(tinyimgclick);
                contentdesc.append(minimg);
                
                //點到的小圖顯示在大圖
                bigimg.attr("src", tinyimg.attr("src"))
                	  .attr("id", tinyimg.attr("id"));
                
                //刪除被點擊到的小圖
               tinyimg.remove();
                
        	};
        	
        	
        	//Start drag and drop UI
        	// there's the gallery and the RouteDiv
            var $gallery = $( "#gallery" ),
              $route = $( "#route" );
            
         
            // let the Route be droppable, accepting the gallery items
            $route.droppable({
              accept: "#gallery > li",
              activeClass: "ui-state-highlight",
              drop: function( event, ui ) {
                deleteImage( ui.draggable );
              }
            });
            
            // let the gallery be droppable as well, accepting items from the trash
            $gallery.droppable({
              accept: "#route li",
              activeClass: "custom-state-active",
              drop: function( event, ui ) {
                recycleImage( ui.draggable );
              }
            });
         
            // image deletion function
            var recycle_icon = "<a href='#' title='移除景點' class='ui-icon ui-icon-refresh'>移除景點</a>";
            function deleteImage( $item ) {
              	console.log($item);
            	$item.fadeOut(function() {
            	$item.find('.image-link').off("click");
                var $list = $( "ul", $route ).length ?
                  $( "ul", $route ) :
                  $( "<ul class='gallery'/>" ).appendTo( $route );
                
                $item.find( "a.ui-icon-image" ).remove();
                $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
                	
                  $item
                    .animate({ width: "145px" })
                    .find( "img" )
                      .animate({ height: "130px", width:"130px" });
                });
              });
            }
         
            // image recycle function
            var trash_icon = "<a href='#' title='Delete this image' class='ui-icon ui-icon-image'>Delete image</a>";
            function recycleImage( $item ) {
              $item.find('.image-link').on("click", function(e){
            	  	imageclick(e, preview, this);//重新綁定事件
            	  });
              $item.fadeOut(function() {
                $item
                  .find( "a.ui-icon-refresh" )
                    .remove()
                  .end()
                  .css( "width", "415px");
                  
                  $item.children().append( trash_icon );//append trash_icon到figure底下
                  
                  $item.find( "img" )
                    .css( "height", "180px" )
                    .css("width","400px")
                  .end()
                  .appendTo( $gallery )
                  .fadeIn();
                  
              });
            }
         
            // image preview function, demonstrating the ui.dialog used as a modal window
            function viewLargerImage( $link ) {
              var src = $link.attr( "href" ),
                title = $link.siblings( "img" ).attr( "alt" ),
                $modal = $( "img[src$='" + src + "']" );
              
         
              if ( $modal.length ) {
                $modal.dialog( "open" );
              } else {
            	  alert("else");
                var img = $( "<img alt='" + title + "' width='384' height='288' style='display: none; padding: 8px;' />" )
                  .attr( "src", src ).appendTo( "body" );
                setTimeout(function() {
                  img.dialog({
                    title: title,
                    width: 400,
                    modal: true
                  });
                }, 1 );
              }
            }
          	//end of drag and drop UI
            
          	//Start Grid plugin
            //plugin for grid testing
            var infoStatus = false;
            $.imagePreview = function( element ) {
                this.$element = $( element );
                this.init();
                };

                
                $.imagePreview.prototype = {
                init: function() {
                this.$triggers = this.$element.find( ".image-link" );
                this.$closeLinks = this.$element.find( ".image-details-close" );
                
                this.open();
                this.close();
                },

                _getContent: function( element ) {
                var $parent = element.parent(),
                title = $parent.data( "title" ),
                desc = $parent.data( "desc" ),
                html = element.html();

                return {
                title: title,
                desc: desc,
                html: html
                }
                },

                
                open: function() {
                var self = this;
                self.$triggers.on( "click", function( e ) {
                	console.log("open");
                	imageclick(e, self, this);
                });
                },
                close: function() {
                this.$closeLinks.on( "click", function( e ) {
                	console.log("close");
                e.preventDefault();
                $( this ).parent().slideUp( "fast" );
                infoStatus = false;
                });
                }
                };

                function imageclick(e, self, triggered){
                	e.preventDefault();
                    var $a = $( triggered ),
                    content = self._getContent( $a ),
                    $li = $a.parents( "li" ),
                    $details = $( ".image-details", $li ),
                    $contentImage = $( ".image", $details ),
                    //$detailsTitle = $( ".image-details-title", $details ),
                    $detailsText = $( ".image-details-text", $details );

                    $contentImage.html( content.html );
                    //$detailsTitle.text( content.title );
                    var url = "imageinfoServlet";
                    $.get(url, {'action':'GetImgInfoByID','id': $a.children().attr("id")}, function(data){
                    	if(data!=""){
                    		$detailsText.text( data );
            			}else{
            				$detailsText.text( content.desc );
            			}
           		 	}); 
            		
                    //self.$element.find( ".image-details" ).slideUp( "fast" );
                    if(infoStatus == true){
                    	self.$element.find( ".image-details" ).slideUp( "fast" );
                    	$details.slideUp( "fast" );
                    	infoStatus = false;
                    }else{
                    	self.$element.find( ".image-details" ).slideUp( "fast" );
                    	$details.slideDown( "fast" );
                    	infoStatus = true;
                    }
                }//end of grid plugin
            
        })(jQuery);
        
    </script>
</body>
</html>