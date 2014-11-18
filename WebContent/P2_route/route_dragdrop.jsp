<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="../platform/include_title.jsp" %>
    <%@ include file="../platform/include_start.jsp" %>
    <script src="../js/jquery-1.11.0.js"></script>
    <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
    <link rel="stylesheet" href="Jacklen_css/Jacklen.css"> <!--蕙齊css-->
	<link rel="stylesheet" href="../Styles/jquery-ui.min.css"> <!-- 蕙齊link-->
</head>

<body>
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
 <div>
    <img src = "images/02.gif" /> 欲選擇其他地區
	<select  id="sel1">
		<option value="北部" id="N">北部</option>
  		<option value="中部" id="C">中部</option>
  		<option value="南部" id="S">南部</option>
  		<option value="東部" id="E">東部</option>
	</select>
	<table class="tooltip1" border="0" cellspacing="0" cellpadding="0" style="width:400px;margin-bottom:10px;">
	    <tr style="background-color: pink;">
	        <td></td>                
	        <%
	        	String s[]={"星期日","星期一","星期二","星期三","星期四","星期五","星期六","星期日","星期一","星期二","星期三","星期四","星期五","星期六"};
	        	String newS[] = new String[7];
	       		for(int i = 0 ; i<=6 ; i++){
	       			//System.out.println(today);
	        		newS[i] = s[today++];        		
	        	}                
	        %>
	        <td><%= newS[0]%></td>
	        <td><%= newS[1]%></td>
	        <td><%= newS[2]%></td>
	        <td><%= newS[3]%></td>
	        <td><%= newS[4]%></td>
	        <td><%= newS[5]%></td>
	        <td><%= newS[6]%></td>
	    </tr>
	    <tr class="weather">         
	        <td class='td1'></td>  
	    </tr>
	</table>
</div>	
	
	<!-- 放抓到的area值 -->
	<input type="text" id="resp" value="${area}" hidden/>
	<input type="text" id="respPath" value="${path}" hidden/>
	
	<div id="mainDiv" class="ui-widget ui-helper-clearfix">
	<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix"></ul>
	<div id="resultdiv" style="width:410px; display:inline"><div id="inner"></div>
	<div id="mapdiv" class="ui-widget-content ui-state-default">
		<h4 class="ui-widget-header"><span class="ui-icon ui-icon-image">地圖</span> 地圖</h4>
		<div id="map"></div>		
	</div>
	</div>
	
	<div id="route" class="ui-widget-content ui-state-default">
		<h4 class="ui-widget-header"><span class="ui-icon ui-icon-image">路徑規劃</span> 路徑規劃</h4>
	</div>
	
	<span class="span-route">
	<label>出發地</label><select id="startid"></select><br>
	<label>目的地</label><select id="endid"></select>
	<br>
	<input type="button" id="computeRoute" value="開始規劃"/>
	<input type="button" id="saveRoute" class="saveRoute" value="儲存路徑" disabled/>
	</span>
	
</div>
<div id="dialog-save" title="儲存路線">
  <h2 class="validateTips">路線名稱</h2>
  <input type="text" name="routeName" id="routeName" value="墾丁一日遊" class="text ui-widget-content ui-corner-all">
</div>
<div id="dialog-savefinished" title="儲存成功">
  <h2 class="validateTips">儲存成功</h2>
</div>

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src='../Script/jquery-ui.js'></script>	
<script src="http://maps.google.com/maps/api/js?sensor=false&libraries=geometry"></script>
<!-- <script src="http://maps.google.com/maps/api/js?sensor=false"></script> -->
<script src='../Script/jquery.tinyMap.js'></script>
<script>

		var serverName = "<%= serverName %>"; //localhost
		var serverPort = "<%= serverPort %>"; //8081
		var contextPath = "<%= contextPath %>"; //Project_1
		var sionLoginId = "<%= sionLoginId %>"; //aa123
		
        (function ($) {      	
        	var result = new Array();//路徑規劃結果
        	var resultName = new Array(); //中文結果
        	var resultToServlet = new Array(); //傳到servlet
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
        			$('#map').tinyMap('clear','marker,direction');//clear overlay
        		
        			var addrs = [], vname = [], markers = [];	
                	//抓取每個景點座標
                	$.each(datas,function(i,item){
                		//i->index
                		//item -> item
                		var a = [item.viewlng,item.viewlat];
                		addrs[i] = a;
                		vname[i] = item.viewname;
                		//console.log(addrs[i]);
                        //console.log(vname[i]);
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
                        marker: markers
                        //animation: 'DROP|BOUNCE'
                    });
                	
                	//將地圖移到多個景點緯度介於中間的位置
                    $('#map').tinyMap('panto', center).tinyMap('modify',{'zoom':8});
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
																.addClass("ui-icon ui-icon-plus")
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
            							              			 if ( $target.is( "a.ui-icon-plus" ) ) {
            							                			 deleteImage( $item );
            							              			 } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
            							                			 viewLargerImage( $target );
            							              			 } else if ( $target.is( "a.ui-icon-close" ) ) {
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
                	//console.log(data);
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
            var recycle_icon = "<a href='#' title='移除景點' class='ui-icon ui-icon-close'>移除景點</a>";
            function deleteImage( $item ) {
              	//console.log($item);
            	$item.fadeOut(function() {
            	$item.find('.image-link').off("click");
                var $list = $( "ul", $route ).length ?
                  $( "ul", $route ) :
                  $( "<ul class='gallery'/>" ).appendTo( $route );
                
                $item.find( "a.ui-icon-plus" ).remove();
                $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
                	
                  $item
                    .animate({ width: "145px" })
                    .find( "img" )
                      .animate({ height: "130px", width:"130px" });
                });
              });
            	//增加景點名稱到出發地及目的地
            	//console.log($item.attr("id"));
            	var startoption = $('<option></option>').val($item.find('h5').text())
            											.text($item.find('h5').text())
            											.attr("id","startOp"+$item.attr("id"));
            	var distoption = $('<option></option>').val($item.find('h5').text())
													   .text($item.find('h5').text())
													   .attr("id","distOp"+$item.attr("id"));
            	$("#startid").append(startoption);
            	$("#endid").append(distoption);
            }
         
            // image recycle function
            var trash_icon = "<a href='#' title='Delete this image' class='ui-icon ui-icon-plus'>Delete image</a>";
            function recycleImage( $item ) {
              $item.find('.image-link').on("click", function(e){
            	  	imageclick(e, preview, this);//重新綁定事件
            	  });
              $item.fadeOut(function() {
                $item
                  .find( "a.ui-icon-close" )
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
              //移除出發地及目的地的景點名稱
              var idStart = "startOp"+$item.attr("id");
              var idEnd = "distOp"+$item.attr("id");
              //console.log(idStart);
              $("#startid > option[id='" + idStart+"']").remove();
              $("#endid > option[id='" + idEnd+"']").remove();
              
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
                	//console.log("open");
                	imageclick(e, self, this);
                });
                },
                close: function() {
                this.$closeLinks.on( "click", function( e ) {
                	//console.log("close");
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
            
                
                //路徑規劃
                $("#computeRoute").click(function(){
                	
                	$('#saveRoute').prop("disabled", false)
                				   .removeClass("saveRoute");
                	
                	var allMarkersAfterOrder = new Array();
                	var waypoints = new Array();
                	
                	//抓出發地id, 建立nowmark座標物件
                	var start = ($('#startid > :selected').attr("id")).substr(7);
                	var startName = $('#startid > :selected').val();
                	console.log(startName);
                	var nowmarker = createMarker(start);
                	
                	//抓目的地id
                	var end = ($('#endid > :selected').attr("id")).substr(6);
                	var endName = $('#endid > :selected').val();
                	console.log(endName);
                	var endmarker = createMarker(end);
                	
                	//抓取剩下的景點轉成座標放入 allMarkers 物件陣列
                	var allMarkers = getOtherMarkers();
                	//console.log("allMarkers");
                	//console.log(allMarkers);                	
                	
                	//取得路徑計算結果
                	result.push(start);
                	computeRoute(allMarkers, nowmarker, allMarkersAfterOrder);
                	result.push(end);
                	console.log("resultName");
                	console.log(resultName);
                	copyResulttoResultToServlet();
                	ResultShowInMap();
                	ResultShowInText();
                	
                	
                	function copyResulttoResultToServlet(){
                		$.each(result, function(i, viewID){
                			resultToServlet[i] = viewID;
                		});
                		console.log("resultToServlet");
                		console.log(resultToServlet);
                	}
                	
                	function ResultShowInText(){
                		var viewsObj2 = new Array();
                    	viewsObj2 = $('#route .gallery li');

                    	var resultStr = "";
                		$.each(result, function(i, viewName){
                			$.each(viewsObj2, function(j, viewObj){
                				if(viewName == $(viewObj).attr("id")){
                					resultName[i] = $(viewObj).find("h5").text();
                				}
                			});
                		});
                		//console.log(result);
                		//console.log(resultName);
                		
                		$.each(resultName, function(i, viewNameCH){	
                			resultStr += String.fromCharCode(i+65) + ": " + viewNameCH;
                			
                			if(i < result.length-1){
                				resultStr += " &gt ";
                			}
                			if((i+1)%3==0){
                				resultStr += "<br>";
                			}
                		})
                		$('#inner').html(resultStr);
                	}
                	
                	//結果顯示在地圖
                	//顯示在地圖
                	function ResultShowInMap(){
                		$.each(allMarkersAfterOrder, function(i,viewmarker){
                			//console.log("allMarkersAfterOrder");
                			//console.log(viewmarker);
                			waypoints[i]={'location':[viewmarker.k , viewmarker.B], 'text': result[i+1]};
                		});
                		
                		var map = $('#map');
                		$('#map').tinyMap();//create instance first
                		$('#map').tinyMap('clear','marker,direction');//clear overlay
                		//更新地圖上的座標    
                    	$('#map').tinyMap('modify',{
                    		direction: [
                                      	{
                                          	'from': [nowmarker.k, nowmarker.B],
                                          	'to': [endmarker.k, endmarker.B],
                                          	'waypoint': waypoints,         	
                                      	}
                                  	]
                        	//animation: 'DROP|BOUNCE'
                    	});
                	
                		var center = [nowmarker.k, nowmarker.B];
                		//將地圖移到多個景點緯度介於中間的位置
                    	$('#map').tinyMap('panto', center).tinyMap('modify',{'zoom':13});
                	}
                	
                	//計算路徑
                	function computeRoute(allMarkers, nowmarker){
                		while(allMarkers.length!=0){
                            var prepareOrder = transferToDist(allMarkers, nowmarker);
                            //console.log("prepareOrder");
                            //console.log(prepareOrder);

                            //最近距離
                            var sortResult = sortByDist(prepareOrder);
                            var nearest  = {"name": sortResult.name, "marker": sortResult.marker};

                            //將此點的id加入result陣列
                            result.push(nearest.name);
                            allMarkersAfterOrder.push(nearest.marker);
                            //console.log(result);

                            //找到最近的點在陣列中的index
                            var index = arrayObjectIndexOf(allMarkers, nearest.name);
                            
                            //更新現在位置
                            nowmarker = allMarkers[index].marker;

                            //從景點座標陣列中移除此點
                            allMarkers.splice(index, 1);                    
                        }
                	}
                	
                	//find nearest point in allMarkers array
                	function arrayObjectIndexOf(allMarkers, searchTerm) {
                        for(var i = 0, len = allMarkers.length; i < len; i++) {
                            if (allMarkers[i].name === searchTerm) return i;
                        }
                        return -1;
                    }
                	
                	
                	//用距離排序
                	function sortByDist(toOrder) {
                	       toOrder.sort(function (a, b) {
                	            if (a.dist > b.dist) {
                	                //console.log("hi");
                	                return 1;
                	            }else{
                	                //console.log("here");
                	                return -1;
                	            }
                	        });
                	    return toOrder[0];
                	}

                	//將景點座標物件 轉成 景點距離物件
                	function transferToDist(allMarkers, nowmarker){
                	    var AfertTransfer = new Array();
                	    for(var i=0; i < allMarkers.length; i++){
                	        AfertTransfer[i] = {"name": allMarkers[i].name, "dist": google.maps.geometry.spherical.computeDistanceBetween(nowmarker, allMarkers[i].marker), "marker":allMarkers[i].marker};
                	    }
                	    return AfertTransfer;
                	}
                	
                	
                	
                	//取得出發地及目的地以外的景點座標 
                	
                	function getOtherMarkers(){
                		var allMarkersInner = new Array();
                		var viewsObj = new Array();
                    	viewsObj = $('#route .gallery li');
                    	
                    	//抓取剩下的景點id -> viewsStrs
                    	var viewsStrs = new Array();
                    	$.each(viewsObj,function(i, viewObj){
                    		//console.log(i);
                    		viewsStrs[i] = $(viewObj).attr("id");
                    		//console.log(viewsStrs);
                    	});
                    	
                    	//移除出發地及目的地id -> 其餘景點id
                    	viewsStrs.splice(viewsStrs.indexOf(start),1);
                    	viewsStrs.splice(viewsStrs.indexOf(end),1);
                    	//console.log(viewsStrs);	
                    	
                    	$.each(viewsStrs, function(i, viewID){
                    		allMarkersInner[i] = {"name":viewID,"marker":createMarker(viewID)};
                    	});
                    	return allMarkersInner;
                	}//end of getOtherMarkers
                	
                	
                	
                	//新建座標物件,需等server傳回座標經緯->用同步async:false
                	function createMarker(viewID){
                		var url = "viewnameServlet";
                		var viewLng=0, viewLat=0;
                		var marker = null;
                		$.ajax({
                			"url": url,
                			"type":"get",
                			"data":{'viewID':viewID,'action':'GetLatlngById'},
                			"dataType":"json",
                			"async":false,
                			"success":function(datas){
                				viewLat = parseFloat(datas[0].viewlat);
                        		//console.log(viewLat);
                        		viewLng = parseFloat(datas[0].viewlng);
                        		//console.log(viewLng);
                        		marker = new google.maps.LatLng(viewLng,viewLat);
                            	//console.log(marker);
                			}
                		});
                    	return marker;
                	}//end of createMarker
                	
                	//clear result array
                	result = [];
                	resultName = [];
                });//end of computeRoute button click eventHandler
              	
                
                
                
                
              //儲存路徑
              var dialog = $( "#dialog-save" ).dialog({
                    autoOpen: false,
                    height: 300,
                    width: 350,
                    modal: true,
                    buttons: {
                      "儲存": function(){
                    	var url = "viewnameServlet";
                    	//產生json字串送到server
                    	//{"memID":"id", "routeName":"routename", "routeResult":[...,...]}
                    	var routeJSON ={"memID": sionLoginId,
                    					"routeName": $('#dialog-save :text').val(),
                    					"routeResult": resultToServlet};
                    	//console.log(JSON.stringify(routeJSON));
                    	$.ajax({
                    		  "type": 'POST',
                    		  "url": url,
                    		  "data": {"action":"saveRoute", "routeJSONStr": JSON.stringify(routeJSON)},
                    		  "async":false,
                    		  "success":function(data){
                    				//增加景點hitRate
                    				$.ajax({
                              			"type": 'POST',
                          		  		"url": url,
                          		  		"data": {"action":"increaseHitRate", "routeResult": JSON.stringify(resultToServlet)},
                          		  		"async":false,
                          		  		"success":function(data){
                          		  			dialog.dialog( "close" );
                            				dialog1.dialog( "open" );
                          		  		}
                              		});
                    		  }
                    		});
                    	resultToServlet = [];
                      },
                      "取消": function() {
                        dialog.dialog( "close" );
                      }
                    },
                    close: function() {
                    }
                  });
                
              var dialog1 = $( "#dialog-savefinished" ).dialog({
                  autoOpen: false,
                  height: 300,
                  width: 350,
                  modal: true,
                  buttons: {
                    "確定": function(){
                  		//產生json字串送到server
                  		dialog1.dialog( "close" );
                  		//'http://'+ serverName +':'+ serverPort + contextPath +'/GetImageServlet?id='+imgarea+ item.viewID + '_01'
                  		window.location.href = "http://" + serverName + ":" + serverPort + contextPath +"/P2_route" + "/viewnameServlet?action=GetRouteByMemID&memID=" + sionLoginId;
                    }
                  },
                  close: function() {
                  }
                });
              
                $("#saveRoute").click(function(){
                	dialog.dialog( "open" );
                });
                
     //****************昱豪****************
     	var OverPlace="";
       	var area = $("#resp").val();
     	var listWeather = ["${listWeather[0]}","${listWeather[1]}","${listWeather[2]}","${listWeather[3]}","${listWeather[4]}","${listWeather[5]}","${listWeather[6]}"];
     	if(area == "北部"){
      		overP(OverPlace);
      		$(".td1").append("北部");
      		appendWeather();
		}
     	if(area == "中部"){
      		overP(OverPlace);
      		$(".td1").append("中部");
      		appendWeather();
		}
     	if(area == "南部"){
      		overP(OverPlace);
      		$(".td1").append("南部");
      		appendWeather();
		}
     	if(area == "東部"){
      		overP(OverPlace);
      		$(".td1").append("東部");
      		appendWeather();
		}
     	
     	function appendWeather(){
     		for(var j=0;j<7;j++){
     			weather= listWeather[j];
          	 	var opt="";
          	 	if(weather=="多雲")
   				 	opt = $("<td title='多雲'></td>").html("<img src='images/02.gif'>");
   	       	 	if(weather=="多雲時陰")
   					opt = $("<td title='多雲時陰'></td>").html("<img src='images/05.gif'>");
   	       	 	if(weather=="陰時多雲")
   	  				opt = $("<td title='陰時多雲'></td>").html("<img src='images/06.png'>");
   	       	 	if(weather=="多雲時晴")
   					opt = $("<td title='多雲時晴'></td>").html("<img src='images/07.gif'>");
      	 		if(weather=="晴時多雲")
					opt = $("<td title='晴時多雲'></td>").html("<img src='images/08.gif'>");
      			if(weather=="多雲短暫雨")
						opt = $("<td title='多雲短暫雨'></td>").html("<img src='images/12.gif'>");
      			if(weather=="多雲時陰短暫雨")
						opt = $("<td title='多雲時陰短暫雨'></td>").html("<img src='images/18.gif'>");
      			if(weather=="陰時多雲短暫雨"  || weather=="陰短暫雨")
						opt = $("<td title='陰時多雲短暫雨'></td>").html("<img src='images/26.gif'>");
          	 		
             	$('.weather').append(opt);
 			} 
     	}
     	
       	$("#sel1").change(function () {
    	   	var selPlace = $("#sel1").val();
    	   	$(".weather > td[class!='td1']").remove();
    	  	if(selPlace == "北部"){
	          	OverPlace=1;
	          	overP(OverPlace);
	          	$(".td1").append("北部");
       		}
    	  	if(selPlace == "中部"){
    	  		OverPlace=2;
    	        overP(OverPlace);
    	        $(".td1").append("中部");   
        	}
    	  	if(selPlace == "南部"){
    	  		OverPlace=3;
    	        overP(OverPlace);
    	        $(".td1").append("南部");
        	}
    	  	if(selPlace == "東部"){
    	  		OverPlace=5;
                overP(OverPlace);
            	$(".td1").append("東部");
        	}
	   });

       document.getElementById("sel1").addEventListener("change",load,false);
                
       var xhr = null;
       function load(){
      	  xhr = new XMLHttpRequest();
      	  xhr.addEventListener("readystatechange",callback,false);
      	  xhr.open("get","xml/F-C0032-003.xml",true);
      	  xhr.send();
       }
        
       function callback(){
     	  if(xhr.readyState == 4){
     		if(xhr.status == 200){  			
   		  		var data = xhr.responseXML;
   		 		var locations = data.getElementsByTagName("location");
     			var weather="";
     			for(var j=0;j<7;j++){
	   			  	weather = locations[OverPlace].getElementsByTagName("text")[j].firstChild.nodeValue;
	          	 	var opt="";
	          	 	if(weather=="多雲")
	   				 	opt = $("<td title='多雲'></td>").html("<img src='images/02.gif'>");
	   	       	 	if(weather=="多雲時陰")
	   					opt = $("<td title='多雲時陰'></td>").html("<img src='images/05.gif'>");
	   	       	 	if(weather=="陰時多雲")
	   	  				opt = $("<td title='陰時多雲'></td>").html("<img src='images/06.png'>");
	   	       	 	if(weather=="多雲時晴")
	   					opt = $("<td title='多雲時晴'></td>").html("<img src='images/07.gif'>");
          	 		if(weather=="晴時多雲")
    					opt = $("<td title='晴時多雲'></td>").html("<img src='images/08.gif'>");
          			if(weather=="多雲短暫雨")
   						opt = $("<td title='多雲短暫雨'></td>").html("<img src='images/12.gif'>");
          			if(weather=="多雲時陰短暫雨")
   						opt = $("<td title='多雲時陰短暫雨'></td>").html("<img src='images/18.gif'>");
          			if(weather=="陰時多雲短暫雨"  || weather=="陰短暫雨")
   						opt = $("<td title='陰時多雲短暫雨'></td>").html("<img src='images/26.gif'>");
	          	 		
	             	$('.weather').append(opt);
     			} 
     			
      		}	
       	}
   	 }
     function overP(OverPlace){
 		  $(".td1").html("");	
     }
    //****************昱豪****************
                
                
 })(jQuery);
        
</script>
<script src='../js/bootstrap.min.js'></script>
<%@ include file="../platform/include_script.jsp" %>
</body>
</html>