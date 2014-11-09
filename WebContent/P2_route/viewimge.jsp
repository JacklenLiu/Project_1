<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Images</title>
<style>
.viewimge{
	width:150px;
	height:150px;
}
</style>
</head>
<body>
<input type="button" value="北部" id="buttonNorth">
<input type="button" value="中部" id="buttonWest">
<input type="button" value="南部" id="buttonSouth">
<input type="button" value="東部" id="buttonEast">
<div id="mainDiv"></div>

	
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>!window.jQuery && document.write("<script src='../Script/jquery-2.1.1.min.js'><\/script>")</script>
<script>

        (function ($) {        	
        	$(':button').click(function(){
        	$('#mainDiv').empty();//clear images in maindiv
        		
        	var area = $(this).val();
 			var url = "viewnameServlet";
        	$.getJSON(url, {'area':area,'action':'GetAllByArea'}, function(datas){
        		$.each(datas,function(i,item){
            			//i->index
            			//item -> item
            			console.log(item.viewID);
            			//console.log(item.viewname);
            			var namelable = $('<lable></lable>').text(item.viewname);
            			
            			
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
            									   .addClass("viewimge");
            			var iddiv = $('<div></div>').attr("id", item.viewID)
            										.append(namelable)
            										.append('<br>')
            										.append(imgs);
            			
            			$('#mainDiv').append(iddiv);
            		});
            	});
        	});
        	
        	
        	
        	
        })(jQuery);
        
    </script>
</body>
</html>