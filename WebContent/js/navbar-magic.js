$(document).ready(function(){
	
	var nav = $('#navbar');
	var burger = $('#nav-burger');
    var navHomeY = nav.offset().top + 5;
    var isFixed = false;
    var $w = $(window);
    $w.scroll(function() {
        var scrollTop = $w.scrollTop();
        var shouldBeFixed = scrollTop > navHomeY;
        if (shouldBeFixed && !isFixed) {
            nav.addClass("fixed");
            nav.removeClass("navbarmain-trans");
            $("[name='nav-text']").each(function() {
            	$(this).removeClass("black-text");
            	$(this).addClass("white-text");
            });
            burger.removeClass("grey-text text-darken-2");
            burger.addClass("white-text");
            isFixed = true;
        }
        else if (!shouldBeFixed && isFixed){
            nav.removeClass("fixed");
            nav.addClass("navbarmain-trans");
            $("[name='nav-text']").each(function() {
            	$(this).removeClass("white-text");
            	$(this).addClass("black-text");
            });
            burger.removeClass("white-text");
            burger.addClass("grey-text text-darken-2");
            isFixed = false;
        }
    });
    
});