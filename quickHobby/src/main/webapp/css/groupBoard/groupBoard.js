/**
 * 
 */

//GroupMember list slide
$(document).ready(function(){
	//gMember_slider
	$('.gMember_slider').slick({
	  dots: false,
	  infinite: true,
	  speed: 600,
	  slidesToShow: 5,
	  slidesToScroll: 5,
	  responsive: [
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 3,
	        slidesToScroll: 3,
	        infinite: true,
	        dots: true
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 2,
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1,
	      }
	    }
	  ]
	});

//GoogleMap
  var zoom= $('#map_canvas').gmap('option', 'zoom');
  
  $('#map_canvas').gmap().bind('init', function(ev, map) {
    $('#map_canvas').gmap('addMarker', {'position': '57.7973433,12.0502107', 'bounds': true});
    $('#map_canvas').gmap('option', 'zoom', 13);
  });

});

//Reply 팝업창
$(document).ready(function(){
    $(".myInGroupReply").click(function(){
        $("#myModalReply").modal();
    });
});
