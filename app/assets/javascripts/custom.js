new WOW().init();
$(function(){
  var $anchor = $("#page-top");
  // $("#page-top").css("display","inline");
  setTimeout(function(){
	   $('html, body').stop().animate({
       scrollTop: $("#page-top").offset().top
      }, 1250, 'easeInOutExpo',
      function(){
  	    $(".wrap-container").css("display","none");
  	    $(document).scrollTop(0);
  	    $("body").css("overflow","scroll");
  	    $("#mainNav").addClass("navbar-fixed-top");
	    });
        //event.preventDefault();
  }, 3000);
});
