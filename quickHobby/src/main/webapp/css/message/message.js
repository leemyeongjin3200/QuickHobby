/**
 * 
 */
// filter 설정
$(function() {
  // init Isotope
  var $grid = $('.grid').isotope({
    layoutMode: 'fitRows',
    itemSelector: '.col-md-4'
  });
  // filter functions
  var filterFns = {

  };
  // bind filter button click
  $('.navbar-nav').on('click', 'li', function() {
    var filterValue = $(this).attr('data-filter');
    // use filterFn if matches value
    filterValue = filterFns[filterValue] || filterValue;
    $grid.isotope({
      filter: filterValue
    });
  });
  // change is-checked class on buttons
  $('.nav').each(function(i, filterGroup) {
    var $filterGroup = $(filterGroup);
    $filterGroup.on('click', 'li', function() {
      $filterGroup.find('.is-checked').removeClass('is-checked');
      $(this).appendClass('is-checked');
    });
  });

});


//tab넘기기
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
});

//메세지 팝업창
$(document).ready(function(){
    $("#myMessage").click(function(){
        $("#myModal").modal();
    });
});


function checkForm(messageForm){
	alert("Message Form check");
}

$(document).ready(function(){
	$("#currentP").click(function(e){
		// alert("currentP");
		e.preventDefault();
	});
	
	
});

$(document).ready(function(){
	$("#messageDel").click(function(e){
		var checkedMsg="";
		$("input:checkbox:checked").each(function(){
			checkedMsg += $(this).val() + ","; 
		});
		alert(checkedMsg);
		
		var root=getContextPath();
		var callUrl=root+"/message/messageDelete.do?message_num="+checkedMsg;
		$.ajax({
			url:callUrl,
			type:"get",
			dataType:"html",
			success:function(data){
				alert("삭제되었습니다.");
			}
		});
	});
});

function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

