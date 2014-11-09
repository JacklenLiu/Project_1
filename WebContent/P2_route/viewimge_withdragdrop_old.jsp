<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Images</title>
<link rel="stylesheet" href="../Styles/jquery-ui.min.css">

<style>
.viewimge{
	width:150px;
	height:150px;
}

#gallery { float: left; width: 65%; min-height: 12em;}
.gallery.custom-state-active { background: #eee; }
  .gallery li { float: left; width: 200px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }
  .gallery li h5 { margin: 0 0 0.4em; cursor: move;}
  .gallery li a { float: right; }
  .gallery li a.ui-icon-zoomin { float: left; }
  .gallery li img { width: 100%; cursor: move; }
 
#route { float: right; width: 32%; min-height: 18em; padding: 1%; }
#route h4 { line-height: 16px; margin: 0 0 0.4em; }
#route h4 .ui-icon { float: left; }
#route .gallery h5 { display: none; }

#mainDiv{
	overflow:auto;
}  

</style>
</head>
<body>
<input type="button" value="北部" id="buttonNorth">
<input type="button" value="中部" id="buttonWest">
<input type="button" value="南部" id="buttonSouth">
<input type="button" value="東部" id="buttonEast">

<div id="mainDiv" class="ui-widget ui-helper-clearfix">
<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
<!-- <li class="ui-widget-content ui-corner-tr"> -->
<!--     <h5 class="ui-widget-header">七分窯</h5> -->
<%--   	<img src='${pageContext.servletContext.contextPath}/GetImageServlet' alt="七分窯" width="150" height="150"> --%>
<!--   	<a href="images/high_tatras.jpg" title="景點描述" class="ui-icon ui-icon-zoomin">景點描述</a> -->
<!--     <a href="link/to/trash/script/when/we/have/js/off" title="加入行程" class="ui-icon ui-icon-image">加入行程</a> -->
<!--   </li> -->
<!--   <li class="ui-widget-content ui-corner-tr"> -->
<!--     <h5 class="ui-widget-header">七分窯</h5> -->
<%--   	<img src='${pageContext.servletContext.contextPath}/GetImageServlet' alt="七分窯" width="150" height="150"> --%>
<!--   	<a href="images/high_tatras.jpg" title="景點描述" class="ui-icon ui-icon-zoomin">景點描述</a> -->
<!--     <a href="link/to/trash/script/when/we/have/js/off" title="加入行程" class="ui-icon ui-icon-image">加入行程</a> -->
<!--   </li>   -->
<!--   <li class="ui-widget-content ui-corner-tr"> -->
<!--     <h5 class="ui-widget-header">七分窯</h5> -->
<%--   	<img src='${pageContext.servletContext.contextPath}/GetImageServlet' alt="七分窯" width="150" height="150"> --%>
<!--   	<a href="images/high_tatras.jpg" title="景點描述" class="ui-icon ui-icon-zoomin">景點描述</a> -->
<!--     <a href="link/to/trash/script/when/we/have/js/off" title="加入行程" class="ui-icon ui-icon-image">加入行程</a> -->
<!--   </li>     -->
</ul>

<div id="route" class="ui-widget-content ui-state-default">
  <h4 class="ui-widget-header"><span class="ui-icon ui-icon-image">Route</span> Route</h4>
</div>

</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script src='../Script/jquery-ui.js'></script>	
<script>

        (function ($) {      	
        	
        	$(':button').click(function(){
        	$('#gallery').empty();//clear images in maindiv
        		
        	var area = $(this).val();
 			var url = "viewnameServlet";
        	$.getJSON(url, {'area':area,'action':'GetAllByArea'}, function(datas){
        		$.each(datas,function(i,item){
            			//i->index
            			//item -> item
            			//console.log(item.viewID);
            			//console.log(item.viewname);
            			//var namelable = $('<lable></lable>').text(item.viewname);
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
            			
            			var imgs = $('<img></img>').attr("src",'http://localhost:8081/GoogleTest/GetImageServlet?id='+imgarea+ item.viewID + '_01')
            									   .addClass("viewimge")
            									   .attr("alt",item.viewname);
            			var viewimg = $(imgs).attr("src");
            			//alert(viewimg);
            			var alinkdesc = $('<a></a>').attr("title", "景點描述")
            										.attr("href",viewimg)			//check pic
													.addClass("ui-icon ui-icon-zoomin")
													.text("景點描述");
            			
            			var alinkaddroute = $('<a></a>').attr("title", "加入行程")
													.addClass("ui-icon ui-icon-image")
													.attr("href",'#')
													.text("加入行程");
            			
            			var idli = $('<li></li>').attr("id", item.viewID)
            										.append(namehead)
            										.append(imgs)
            										.append(alinkdesc)
            										.append(alinkaddroute)
            										.addClass("ui-widget-content ui-corner-tr")
            										.draggable({
            								             cancel: "a.ui-icon", // clicking an icon won't initiate dragging
            								             revert: "invalid", // when not dropped, the item will revert back to its initial position
            								             containment: "document",
            								             helper: "clone",
            								             cursor: "move"
            								            })
            								        .click(function click(event){
            								        		var $item = $( this ),
            							                	$target = $( event.target );
            							              		//alert("click");//debug
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
            			//$('#mainDiv').append(ul);
            		});
            	});
        	});//end of area button click
        	
        	
        	// there's the gallery and the RouteDiv
            var $gallery = $( "#gallery" ),
              $route = $( "#route" );
         
            // let the gallery items be draggable
//             $( "li", $gallery ).draggable({
//              cancel: "a.ui-icon", // clicking an icon won't initiate dragging
//              revert: "invalid", // when not dropped, the item will revert back to its initial position
//              containment: "document",
//              helper: "clone",
//              cursor: "move"
//             });
            
         
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
              $item.fadeOut(function() {
                var $list = $( "ul", $route ).length ?
                  $( "ul", $route ) :
                  $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $route );
                
                  console.log($item);
                $item.find( "a.ui-icon-image" ).remove();
                $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
                	
                  $item
                    .animate({ width: "100px" })
                    .find( "img" )
                      .animate({ height: "100px" });
                });
              });
            }
         
            // image recycle function
            var trash_icon = "<a href='#' title='Delete this image' class='ui-icon ui-icon-image'>Delete image</a>";
            function recycleImage( $item ) {
              $item.fadeOut(function() {
                $item
                  .find( "a.ui-icon-refresh" )
                    .remove()
                  .end()
                  .css( "width", "200px")
                  .append( trash_icon )
                  .find( "img" )
                    .css( "height", "150px" )
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
            	  alert("if");
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
         
            // resolve the icons behavior with event delegation
//             $( "ul.gallery > li" ).click(function( event ) {
//               var $item = $( this ),
//                 $target = $( event.target );
//               alert("click111");
//               if ( $target.is( "a.ui-icon-image" ) ) {
//                 deleteImage( $item );
//               } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
//                 viewLargerImage( $target );
//               } else if ( $target.is( "a.ui-icon-refresh" ) ) {
//             	  //alert("here");
//                 recycleImage( $item );
//               }
         
//               return false;
//             });
            
//             function click(event){
//             	var $item = $( this ),
//                 $target = $( event.target );
//               alert("click");
//               if ( $target.is( "a.ui-icon-image" ) ) {
//                 deleteImage( $item );
//               } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
//                 viewLargerImage( $target );
//               } else if ( $target.is( "a.ui-icon-refresh" ) ) {
//             	  //alert("here");
//                 recycleImage( $item );
//               }
         
//               return false;
//             }
        	
        	
        	
        })(jQuery);
        
    </script>
</body>
</html>