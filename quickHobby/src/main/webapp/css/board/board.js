/**
 * 
 */

//tab넘기기
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
      $(this).tab('show');
  });
});

//Reply 팝업창
function replyCheck(boardNum){
	$(function(e){
		var target = $(e.target)
		var replaySection =target.parents('.modal-Reply-body'); 
		var replyWrap = replaySection.find('.reply-box');
		console.log(boardNum);
		var root=getContextPath();
		var callUrl=root+"/boardReply/boardReplyList.do";
		var sendData="boardNum="+boardNum;
		$.ajax({
			url:callUrl,
			type:"post",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				//console.log(decodeURIComponent(data));
				var replyList = JSON.parse(decodeURIComponent(data));
				replyWrap.html(getReplyList(replyList));
				console.log(getReplyList(replyList));
				
				replaySection.find("strong").html(getReplyList(replyList));
				replaySection.find("small").html(getReplyList(replyList));
				replaySection.find("p").html(getReplyList(replyList));
				
				
//				replaySection.find('.form-control').val('');
//				$("strong").val($(data).find("strong").val());
//				if($("input[name='serverCode']").val()==-1){
//					$("#emailModal").modal("toggle");
//					alert("이미 사용중인 이메일입니다.");
//				}
				console.log("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
			}
		});
		$("#myModalReply").modal();
	});
}

function getReplyList(replyList){
	var length = replyList.length;
	var result='';
	for(var i=0; i<length; i++){
		result += makeReplyDiv(replyList[i])
	}
	return result;
}

function makeReplyDiv(reply) {
	var d = new Date(reply.boardReplyModifyDate);
	console.log(d);
	var dateStr = padStr(d.getFullYear()) +
	padStr(1 + d.getMonth()) +
	padStr(d.getDate()) +
	padStr(d.getHours()) +
	padStr(d.getMinutes()) +
	padStr(d.getSeconds());
	console.log(dateStr);
	
	var year=dateStr.substring(0,4);
	var month=dateStr.substring(4,6);
	var day=dateStr.substring(6,8);
	var hour=dateStr.substring(8,10);
	var minute=dateStr.substring(10,12);
	var second=dateStr.substring(12,14);
	var replyTime=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	console.log(replyTime);
	
	var text = '<strong><i class="glyphicon glyphicon-user"></i>'+ reply.memberNickName + '</strong>';
	text += '<small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i>' + replyTime +" " + '</small>';
	text += '<p>' + reply.boardReplyContent+" " + '</p>';

	return text;	
}

// Modal 버튼들
$(document).ready(function(){
    $("a[name='toList']").click(function(){
    	$("#myModalReply").modal("toggle");
		// location.reload();
    });
    
    $("a[name='toContent']").click(function(){
    	alert("mamamamamama");
    });
});

//root값 받아오는 함수
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

//시간값 자리수 맞춰주는 함수
function padStr(i) {
    return (i < 10) ? "0" + i : "" + i;
}