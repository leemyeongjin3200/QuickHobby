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
      $(this).addClass('is-checked');
    });
  });
});

//tab넘기기
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
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

function deleteMessage(messageNum){
	var root=getContextPath();
	var callUrl=root+"/message/messageDelete.do?message_num="+messageNum;
	
	$.ajax({
		url:callUrl,
		type:"get",
		dataType:"html",
		success:function(data){
			alert("삭제되었습니다.");
			location.reload();
		}
	});
}

// 체크한 message들 한번에 delete 컨트롤러로 보내기
$(document).ready(function(){
	$(".text-right:first-child").click(function(e){
		var checkedMsg="";
		$("input:checkbox:checked").each(function(){
			checkedMsg += $(this).val() + ","; 
		});
		// alert(checkedMsg);
		
		var root=getContextPath();
		var callUrl=root+"/message/messageDelete.do?message_num="+checkedMsg;
		$.ajax({
			url:callUrl,
			type:"get",
			dataType:"html",
			success:function(data){
				alert("삭제되었습니다.");
				location.reload();
			}
		});
	});
});

// message 작성 후 send 컨트롤러로 보내기
$(document).ready(function(){
	$("#sendMsg").click(function(e){
		var message_sender=$("#messageFromHidden").val();
		
		var message_receiver=$("#messageToHidden").val();
		
		var message_content=$("#messageContent").val();
		
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
				$("#messageModal").modal("toggle");
				location.reload();
			},
			error:function(xhr, status, error){
				alert(xhr+","+status+","+error);
			}
		});
	});
});

$(document).ready(function(){
    $("#closeMsg").click(function(){
    	$("#messageModal").modal("toggle");
		// location.reload();
    });
});

// root값 받아오는 함수
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

function readMessage(messageNum, memberNum, receiverNum){
	$("." + messageNum).slideToggle("slow");
	
	if(memberNum==receiverNum){
		var root=getContextPath();
		var callUrl=root + "/message/messageRead.do?message_num=" + messageNum;
		
		$.ajax({
			url:callUrl,
			type:"get",
			dataType:"text",
			success:function(data){
				
			}
		});
	}
}

function replyMessage(receiverNum, receiverNick){
	$("#messageModal").find("#messageTo").val(receiverNick);
	$("#messageModal").find("#messageToHidden").val(receiverNum);
	$("#messageModal").modal("toggle");
}
