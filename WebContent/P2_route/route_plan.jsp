<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <%int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;%>
  <%@ include file="../platform/include_start.jsp" %>
    <style type="text/css">
        table {
            border-right: 1.5px solid #F00;
            border-bottom:1.5px solid #F00;
            
        }
        
         td {
            border-left: 1.5px solid #F00;
            border-top:1.5px solid #F00;
        }
    </style>
    

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
                                <a href="../P3_TravelDiary/blog_all.jsp">所有文章</a>
                            </li>
                            <li>
                                <a href="../P3_TravelDiary/blog_editor.jsp">發表新文章</a>
                            </li>
                            <li>
                                <a href="../P3_TravelDiary/blog_manage.jsp">管理我的文章</a>
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


    

<div style="float:left;width:650px;height:343px; margin:100px auto;">
	<img id="imgMap" alt="" src="images/map00.png" style="float:left;width: 189px;margin-left:50px; height: 343px" usemap="#FPMap0" />
	<table class="tooltip1" border="0" cellspacing="0" cellpadding="0"  hidden style="width:400px;">
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
	<form name="selPlace" method="post" action="selPlace">
		<map id="FPMap0" name="FPMap0">
		    <p><a href="javascript:selPlace.submit();" class="tooltip" id="a11"><area id="a1" alt="" coords="145,5,126,19,113,21,99,28,85,56,101,84,108,85,123,91,154,100,163,100,175,80,172,47,186,32,145,5" onmouseover="document.getElementById('imgMap').src='images/map01.png';" onmouseout="document.getElementById('imgMap').src='images/map00.png';"  shape="polygon" /></a></p>
		    <p><a href="javascript:selPlace.submit();" class="tooltip"  id="a22"><area id="a2" alt="" coords="83,58,53,92,39,120,19,156,12,169,17,181,31,168,46,169,63,171,74,176,74,183,95,184,116,166,114,156,119,128,124,118,137,101,132,93,119,87,108,82,101,79,99,70,83,58" onmouseover="document.getElementById('imgMap').src='images/map02.png';" onmouseout="document.getElementById('imgMap').src='images/map00.png';"  shape="polygon" /></a></p>
		    <p><a href="javascript:selPlace.submit();" class="tooltip"  id="a33"><area id="a3" alt="" coords="95,186,97,189,91,194,100,201,85,208,82,230,76,255,81,251,84,253,80,260,75,260,70,268,70,276,74,28,70,294,78,308,87,309,82,331,80,339,73,336,68,339,66,331,68,316,58,296,35,282,26,270,15,238,13,231,4,226,9,220,12,192,11,181,20,180,40,172,50,173,59,178,70,172,78,184,90,183,91,188,88,198,101,208,110,210,117,218,126,221,126,204,135,189,139,189" onmouseover="document.getElementById('imgMap').src='images/map04.png';" onmouseout="document.getElementById('imgMap').src='images/map00.png';"  shape="polygon" /></a></p>
		    <p><a href="javascript:selPlace.submit();" class="tooltip"  id="a44"><area id="a4" alt="" coords="164,102,157,122,150,125,153,136,147,156,130,212,130,223,117,244,113,251,112,258,108,262,100,264,87,307,79,310,70,299,75,287,71,265,84,259,83,251,72,234,86,207,97,199,99,184,116,166,115,143,120,126,126,123,121,114,127,110,129,99,140,100,153,96,164,102" onmouseover="document.getElementById('imgMap').src='images/map03.png';" onmouseout="document.getElementById('imgMap').src='images/map00.png';"  shape="polygon" /></a></p>
		    <input type="text" name="action" id="sel" hidden/>
	   	</map>
	   		
   	</form>
</div>


<!-- ***每個地區******************************** -->
<div id="div1" style="float:left;width:500px;">
<table class="weatherM" hidden cellspacing="0" cellpadding="0" style="margin-left:50px;margin-top:100px;">
	<tr>
		<td></td>              
        <td><%= newS[0]%></td>
        <td><%= newS[1]%></td>
        <td><%= newS[2]%></td>
        <td><%= newS[3]%></td>
        <td><%= newS[4]%></td>
        <td><%= newS[5]%></td>
        <td><%= newS[6]%></td>
    </tr>
<!--     <tr >            -->
<!--         <td  class='E'></td>                   -->
<!--     </tr> -->
</table>
</div> 
<div>
<!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>
</div>
<!-- ***每個地區******************************** -->
<!-- <script src="../jquery/jquery-2.1.1.min.js"></script> -->

  <!-- /.container -->

    <!-- jQuery Version 1.11.0 -->
    <script src="../js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script type="text/javascript">
   
// <script type="text/javascript">
(function ($) {
	$("#a11").click(function(){$("#sel").prop("value","north");});
	$("#a22").click(function(){$("#sel").prop("value","central");});
	$("#a33").click(function(){$("#sel").prop("value","south");});
	$("#a44").click(function(){$("#sel").prop("value","east");});
   	var OverPlace="";
       $("#a1").mouseover(function () {    
           OverPlace=1;
           overP(OverPlace);
           $(".td1").append("北部");
       });

       $("#a2").mouseover(function () {    	  
           OverPlace=2;
           overP(OverPlace);
           $(".td1").append("中部");       
       });

       $("#a3").mouseover(function () {
           OverPlace=3;
           overP(OverPlace);
           $(".td1").append("南部");
       });

       $("#a4").mouseover(function () {
           	OverPlace=5;
            overP(OverPlace);
        	$(".td1").append("東部");
       });

//        $(".tooltip").mouseout(function () {
//            $(".td1").html("");         
//            $(".tooltip1").prop("hidden", true);
//           $(".weatherM").prop("hidden", true);
//            $(".weather>td[class!='td1']").remove();
//            $(".E").remove();	
//        });
       
       document.getElementById("FPMap0").addEventListener("mouseover",load,false);
       
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
// 		  	var str = "";
		
//   			var name="";
// 			if(OverPlace==0)              				  
// 			  	  name = locations[0].getElementsByTagName("name")[0].firstChild.nodeValue;
// 			if(OverPlace==1)              				  
//   				  name = locations[1].getElementsByTagName("name")[0].firstChild.nodeValue;
// 			if(OverPlace==2)              				  
//   				  name = locations[2].getElementsByTagName("name")[0].firstChild.nodeValue;
// 			if(OverPlace==3)              				  
//   				  name = locations[3].getElementsByTagName("name")[0].firstChild.nodeValue;
  			 
  			var weather="";
  			for(var j=0;j<7;j++){
			  	weather = locations[OverPlace].getElementsByTagName("text")[j].firstChild.nodeValue;
			  	//str += "<h2>" + name + "," + weather + "</h2>";
       	 		var opt="";
       	 		if(weather=="晴時多雲")
 					 opt = $("<td title='晴時多雲'></td>").html("<img src='images/08.gif'>");
       	 		if(weather=="多雲時晴")
					 opt = $("<td title='多雲時晴'></td>").html("<img src='images/07.gif'>");
       			if(weather=="多雲")
					 opt = $("<td title='多雲'></td>").html("<img src='images/02.gif'>");
       			if(weather=="多雲短暫雨")
					 opt = $("<td title='多雲短暫雨'></td>").html("<img src='images/12.gif'>");
       			if(weather=="多雲時陰短暫雨")
					 opt = $("<td title='多雲時陰短暫雨'></td>").html("<img src='images/18.gif'>");
       			if(weather=="陰時多雲短暫雨")
					 opt = $("<td title='陰時多雲短暫雨'></td>").html("<img src='images/26.gif'>");
       	 		
          	  	$('.weather').append(opt);
  			} 
  			
   		  }	
  	   }
     }
      //*************************每區每區每區每區每區***************************		
		
      document.getElementById("FPMap0").addEventListener("mouseover",loadM,false);
      
      var xhrM = null;
      function loadM(){
    	  xhrM = new XMLHttpRequest();
    	  xhrM.addEventListener("readystatechange",callbackM,false);
    	  xhrM.open("get","xml/F-C0032-005.xml",true);
    	  xhrM.send();
      }
       
     function callbackM(){
 	  if(xhrM.readyState == 4){
 		  if(xhrM.status == 200){  			
		  	var dataM = xhrM.responseXML;
		 	var locationM = dataM.getElementsByTagName("location");
		 	var locationC = dataM.getElementsByTagName("MaxT");
		 	//alert(locationC[0].getElementsByTagName("value")[0].firstChild.nodeValue);
			var selLen = "";
 			var nameM="";
 			var selP=null;
			if(OverPlace==1){
				selP =[0,1,5,6,7,8,16];
				selLen = selP.length;
				for(var k=0;k<selLen;k++){
					nameM = locationM[selP[k]].getElementsByTagName("name")[0].firstChild.nodeValue;
					$(".weatherM").append("<tr class='E' ><td rowspan='2'>"+nameM+"</td>");					
					weatherMM(locationM,selP[k]);
					weatherC(locationC,selP[k]);
					
					//****
					
					
// 		for(var j=0;j<7;j++){
			
// 			var weatherM="";
// 			weatherM = locationM[selP[k]].getElementsByTagName("text")[j].firstChild.nodeValue;
// 		  	//str += "<h2>" + name + "," + weather + "</h2>";
//   	 		var optM="";
//   	 		if(weatherM=="晴時多雲")
//   	 			optM = $("<td title='晴時多雲'></td>").html("<img src='../images/08.gif'>");
//   	 		if(weatherM=="多雲時晴")
//   	 			optM = $("<td title='多雲時晴'></td>").html("<img src='../images/07.gif'>");
//   			if(weatherM=="多雲")
//   				optM = $("<td title='多雲'></td>").html("<img src='../images/02.gif'>");
//   			if(weatherM=="多雲短暫雨")
//   				optM = $("<td title='多雲短暫雨'></td>").html("<img src='../images/12.gif'>");
//   			if(weatherM=="多雲時陰短暫雨")
//   				optM = $("<td title='多雲時陰短暫雨'></td>").html("<img src='../images/18.gif'>");
//   			if(weatherM=="陰時多雲短暫雨")
//   				optM = $("<td title='陰時多雲短暫雨'></td>").html("<img src='../images/26.gif'>");
//   			if(weatherM=="陰時多雲")
//   				optM = $("<td title='陰時多雲'></td>").html("<img src='../images/06.png'>");
  			
//      	  	$("tr:last").append(optM);
     	  	
// 			} 
					
				}
		  	  	
			}             				  
			             				  
			if(OverPlace==2){
				selP =[9,2,10,11,12,13,14];
				selLen = selP.length;
				for(var k=0;k<selLen;k++){
					nameM = locationM[selP[k]].getElementsByTagName("name")[0].firstChild.nodeValue;
					$(".weatherM").append("<tr class='E'><td rowspan='2'>"+nameM+"</td>");					
					weatherMM(locationM,selP[k]);
					$(".weatherM").append("</tr>");
					weatherC(locationC,selP[k]);
				}				
			}
			if(OverPlace==3){
				selP =[3,4,15];
				selLen = selP.length;
				for(var k=0;k<selLen;k++){
					nameM = locationM[selP[k]].getElementsByTagName("name")[0].firstChild.nodeValue;
					$(".weatherM").append("<tr class='E'><td rowspan='2'>"+nameM+"</td>");					
					weatherMM(locationM,selP[k]);
					$(".weatherM").append("</tr>");
					weatherC(locationC,selP[k]);
				}				
			}
			if(OverPlace==5){
				selP =[17,18];
				selLen = selP.length;
				for(var k=0;k<selLen;k++){
					nameM = locationM[selP[k]].getElementsByTagName("name")[0].firstChild.nodeValue;
					$(".weatherM").append("<tr class='E'><td rowspan='2'>"+nameM+"</td>");					
					weatherMM(locationM,selP[k]);
					$(".weatherM").append("</tr>");
					weatherC(locationC,selP[k]);
				}				
			}
 			 
 			
 			
 			
  		  }	
 	   }
    }
//      **********************************************************************	
	function weatherC(locationC,p){
		
		$(".weatherM").append("<tr class='C'>");
		var names="";
		for(var v=0;v<14;v++){
			names = locationC[p].getElementsByTagName("value")[v].firstChild.nodeValue;
			names1 = locationC[p].getElementsByTagName("value")[++v].firstChild.nodeValue;
			$("tr:last").append("<td>"+names+"~"+names1+"度</td>");
		}
		$(".weatherM").append("</tr>");
		
	}

	function weatherMM(locationM,weatherMM){
		for(var j=0;j<7;j++){
			var weatherM="";
				weatherM = locationM[weatherMM].getElementsByTagName("text")[j].firstChild.nodeValue;
  	 		var optM="";
  	 		if(weatherM=="晴時多雲")
  	 			optM = $("<td title='晴時多雲'></td>").html("<img src='images/08.gif'>");  	 			
  	 		if(weatherM=="多雲時晴")
  	 			optM = $("<td title='多雲時晴'></td>").html("<img src='images/07.gif'>");
  			if(weatherM=="多雲")
  				optM = $("<td title='多雲'></td>").html("<img src='images/02.gif'>");
  			if(weatherM=="多雲短暫雨")
  				optM = $("<td title='多雲短暫雨'></td>").html("<img src='images/12.gif'>");
  			if(weatherM=="多雲時陰短暫雨")
  				optM = $("<td title='多雲時陰短暫雨'></td>").html("<img src='images/18.gif'>");
  			if(weatherM=="陰時多雲短暫雨")
  				optM = $("<td title='陰時多雲短暫雨'></td>").html("<img src='images/26.gif'>");
  			if(weatherM=="陰時多雲")
  				optM = $("<td title='陰時多雲'></td>").html("<img src='images/06.png'>");
  			
     	  	$("tr:last").append(optM);
     	  	
			} 
	}
    
	function overP(OverPlace){
		  $(".td1").html("");		 
		  if(OverPlace==1){$(".tooltip1").prop("hidden", false).css("margin-top","50px"); }
		  if(OverPlace==2){ $(".tooltip1").prop("hidden", false).css("margin-top","100px");}
		  if(OverPlace==3){ $(".tooltip1").prop("hidden", false).css("margin-top","250px");}
		  if(OverPlace==5){$(".tooltip1").prop("hidden", false).css("margin-top","170px");}
          $(".weatherM").prop("hidden", false);
          $(".E").remove();   
          $(".C").remove();
          $(".weather>td[class!='td1']").remove();
	}
	
	$('.nav .dropdown').hover(function() {
        $(this).addClass('open');
    }, function() {
        $(this).removeClass('open');
    });
	
	
})(jQuery);

</script>
</body>
</html>