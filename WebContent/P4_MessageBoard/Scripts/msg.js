$(document).ready(function(){
var moreText = "Read more",
    lessText = "Read less",
    moreButton = $("a.comment_bottom_link");

moreButton.click(function () {
    var $this = $(this);
    $this.text($this.text() == lessText ? moreText : lessText).siblings(".comment_bottom_second").slideToggle("fast");
    return false;
});

   
  $('.comment_add').click(function(){
	     $('#users_comment').slideDown();
	     return false;
	  });
  
  $('.comment_close').click(function(){
     $(this).parents('.comment_write').slideUp();
      return false;
  });
  
  
  
  
});