/**
 * 
 */
function checkForm(applyForm){
	alert("Apply Form Check");
}


$(document).ready(function(){	
	init_masonry();
	widthFunctions();
});

/* ---------- Masonry Gallery ---------- */
function init_masonry(){
    var $container = $('.grid');
    var gutter = 6;
    var min_width = 250;
    $container.imagesLoaded( function(){
        $container.masonry({
            itemSelector : '.masonry-thumb',
            gutterWidth: gutter,
            isAnimated: true,
              columnWidth: function( containerWidth ) {
                var num_of_boxes = (containerWidth/min_width | 0);
                var box_width = (((containerWidth - (num_of_boxes-1)*gutter)/num_of_boxes) | 0) ;

                if (containerWidth < min_width) {
                    box_width = containerWidth;
                }

                $('.masonry-thumb').width(box_width);
                return box_width;
              }
        });
    });
}



/* ---------- Template Functions ---------- */		
		
function template_functions(){
	/* ---------- Makes elements soratble, elements that sort need to have id attribute to save the result ---------- */
	$('.sortable').sortable({
		revert:true,
		cancel:'.box-content',
		update:function(event,ui){
		}
	});
}


/* ---------- Page width functions ---------- */

$(window).bind("resize", widthFunctions);

function widthFunctions(e) {
    var winHeight = $(window).height();
    var winWidth = $(window).width();
	var contentHeight = $("#content").height();

	if (winHeight) {
		$("#content").css("min-height",winHeight);
	}

	if (winWidth < 980 && winWidth > 767) {
		if($("#content").hasClass("span10")) {
			$("#content").removeClass("span10");
		}
		
		$(".box").each(function(){
			var getOnTablet = $(this).attr('onTablet');
			var getOnDesktop = $(this).attr('onDesktop');
			if (getOnTablet) {
				$(this).removeClass(getOnDesktop);
				$(this).addClass(getOnTablet);
			}		
		});
					
	} else {
		$(".box").each(function(){
			var getOnTablet = $(this).attr('onTablet');
			var getOnDesktop = $(this).attr('onDesktop');
	
			if (getOnTablet) {
				$(this).removeClass(getOnTablet);
				$(this).addClass(getOnDesktop);
			} 			
		});
	}
}
