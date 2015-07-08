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

// 현재 페이지 클릭 막기
$(document).ready(function(){
	$("#currentP").click(function(e){
		// alert("currentP");
		e.preventDefault();
	});
});

// 체크한 message들 한번에 delete 컨트롤러로 보내기
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

// message 작성 후 send 컨트롤러로 보내기
$(document).ready(function(){
	$("#sendMsg").click(function(e){
		var sendMsg = document.getElementById("sendMsg");
		var messageFrom = document.getElementById("messageFrom");
		var message_sender=messageFrom.value;
		message_sender=Number(message_sender);
		
		var messageTo = document.getElementById("messageTo");
		var message_receiver=messageTo.value;
		message_receiver=Number(message_receiver);
		
		var messageCon = document.getElementById("messageContent");
		var message_content=messageCon.value;
		
		console.log(message_sender);
		console.log(message_receiver);
		console.log(message_content);
		
		var sendData="message_sender="+message_sender+"&message_receiver="+message_receiver+"&message_content="+message_content;
		var root=getContextPath();
		var callUrl=root+"/message/messageWrite.do";
		
		$.ajax({
			url:callUrl,
			type:"post",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				alert("message가 전송되었습니다.");
				$("#myModal").modal("toggle");
			},
			error:function(xhr, status, error){
				alert(xhr+","+status+","+error);
			}
		});
	});
});

// root값 받아오는 함수
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}
