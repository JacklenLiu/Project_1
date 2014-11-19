<html>  
<head>  
<title>jQuery Multi-Pageslide Demo</title>  
  
<style type="text/css">  
  
#pageslide-body-wrap {  
  position: relative;  
}  
  
#pageslide-slide-wrap {  
  position: fixed;  
  width: 0;  
  top: 0;  
  right: 0;  
  height: 100%;  
  background-color: #000;  
}  
  
#pageslide-content {  
}  
  
#secondary {  
  padding: 15px 35px;  
  color: #FFFFFF;  
}  
  
#pageslide-content h2 {  
  color: #C60;  
  font-size: 130%;  
  padding-bottom: 20px;  
}  
  
#pageslide-content p {  
  padding-bottom: 15px;  
}  
  
</style>  
</head>  
  
<body>  
<h1>jQuery Multi-Pageslide Demo</h1>  
  
<p>The <a href="http://halobrite.com/blog/jquery-pageslide/">jQuery Pageslide</a>  
plugin was great and all but you can only have one pageslide per page. Say you  
want to have multiple links one one page that each invoke a page slide but with  
different settings. This demo includes a version of page slide that allows  
multiple pageslide links per page and allows them all to have their own individual  
settings. These all point to the same secondary page but could just as well  
point to different pages.</p>  

  
  
<script src="http://www.ianlewis.org/files/multi-pageslide/jquery.min.js"></script>
<script src="http://www.ianlewis.org/files/multi-pageslide/jquery.pageslide-0.2.js"></script>  
<p>  
<ul>  
<li><a class="help" href="show_accept.jsp">Fast Narrow Pageslide</a></li>  
<li><a class="help-long" href="secondary_page.htm">Normal Long Pageslide</a></li>  
</ul>  
  
<script type="text/javascript">  
$(document).ready(function() {  
  $('a.help').pageSlide({  
      width: "300px",  
      duration: "fast"  
  });  
  $('a.help-long').pageSlide({  
      width: "600px"  
  });  
  $('a.help-full').pageSlide({  
      width: "100%",  
      duration: 1000  
  });  
});  
</script>  
</body>  
  
</html>  