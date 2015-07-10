function checkForm(boardForm){

}

function deleteCheck(deleteForm){

}


//스크롤 움직일때 왼쪽 사이드 바  고정
$(document).ready(function(){/* activate sidebar */
	$('#sidebar').affix({
	  offset: {
	    top: 235
	  }
	});
	
	/* activate scrollspy menu */
	var $body   = $(document.body);
	var navHeight = $('.navbar').outerHeight(true) + 10;
	
	$body.scrollspy({
		target: '#leftCol',
		offset: navHeight
	});
	
	/*scrolling memberTag*/
	$('a[href*=#]:not([href=#])').click(function() {
	    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
	      var target = $(this.hash);
	      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
	      if (target.length) {
	        $('html,body').animate({
	          scrollTop: target.offset().top - 30
	        }, 5000);
	        return false;
	      }
	    }
	});

});