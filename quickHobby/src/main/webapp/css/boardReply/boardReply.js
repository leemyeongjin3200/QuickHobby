/**
 * 
 */


$(".board-reply").on('click', 'button[name="replyBtn"]', writeReply);
$(".board-reply").on('click', '.modifyBtn', clickModifyBtn);
$(".board-reply").on('keydown', '.form-control', triggerWriteReply);
$(".board-reply").on('click', '.deleteBtn', deleteReply);
$(".board-reply").on('click', '.edit_ok', modifyReply);
$(".board-reply").on('click', '.edit_cancel', cancelReply);
$(".board-reply").on('keydown', '.edit_text', triggerEditReply);

$(document).ready(function(){
//	$('button[name="replyBtn"]').click(function(e){
//		writeReply(e);
//	});
//	
//	$('.modifyBtn').click(function(e){
//		clickModifyBtn(e);
//		$('.edit_ok').click(function(e){
//			modifyReply(e);
//		});
//		
//		$('.edit_cancel').click(function(e){
//			cancelReply(e);
//		});
//	});
//	
//	$('.deleteBtn').click(function(e){
//		deleteReply(e);
//	});
//	
//	$('.form-control').keydown(function(e){
//		triggerWriteReply(e);
//	});
//	
//	$('.edit_text').keydown(function(e){
//		triggerEditReply(e);
//	});
	$(".board-reply").on('click', 'button[name="replyBtn"]', writeReply);
	$(".board-reply").on('click', '.modifyBtn', clickModifyBtn);
	$(".board-reply").on('keydown', '.form-control', triggerWriteReply);
	$(".board-reply").on('click', '.deleteBtn', deleteReply);
	$(".board-reply").on('click', '.edit_ok', modifyReply);
	$(".board-reply").on('click', '.edit_cancel', cancelReply);
	$(".board-reply").on('keydown', '.edit_text', triggerEditReply);
});

function triggerWriteReply(e){
	if(e.which===13){
		writeReply(e);
	}
}
function triggerEditReply(e){
	if(e.which===13){
		modifyReply(e);
	}
}

function writeReply(e){
	//alert("hahaha");
	// console.log(e);
	var target = $(e.target)
	var replySection =target.parents('.board-reply'); 
	boardNum = replySection.data('num'),
	text = replySection.find('.form-control').val();
	var replyWrap = replySection.find('.replyDiv-wrap');
	// console.log(replySection);
	// console.log(replyWrap);
	var sendData="boardNum="+boardNum+"&boardReplyContent="+text;
	var root=getContextPath();
	var callUrl=root+"/boardReply/boardReplyWrite.do";
	console.log(sendData, callUrl);
	$.ajax({
		url:callUrl,
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			// console.log(decodeURIComponent(data));
			var replyList = JSON.parse(decodeURIComponent(data));
			replyWrap.html(getReplyList(replyList));
			replySection.find('.form-control').val('');
		},
		error:function(xhr, status, error){
			alert(xhr+","+status+","+error);
		}
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
	// console.log(d);
	var dateStr = padStr(d.getFullYear()) +
	padStr(1 + d.getMonth()) +
	padStr(d.getDate()) +
	padStr(d.getHours()) +
	padStr(d.getMinutes()) +
	padStr(d.getSeconds());
	// console.log(dateStr);
	
	var year=dateStr.substring(0,4);
	var month=dateStr.substring(4,6);
	var day=dateStr.substring(6,8);
	var hour=dateStr.substring(8,10);
	var minute=dateStr.substring(10,12);
	var second=dateStr.substring(12,14);
	var replyTime=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	// console.log(replyTime);
	
	// 세션값 받아오기
	var session=document.getElementById("sessionNum").value;
	console.log(session);
	
	var text = '<div class="replyDiv" data-replynum="' + reply.boardReplyNum + '">';
	text += '<span class="reply_member">' + reply.memberNickName+" " + '</span>';
	text += '<span class="reply_content">' + reply.boardReplyContent+" " + '</span>';
	text += '<span class="reply_date"><small>'+replyTime+" "+ '</small></span>';
	text += '<input id="sessionNum" type="hidden" value="'+session+'"/>';
	
	if (parseInt(session) == reply.boardReplyWriter) {
		text += '<span class="reply_btns">'
				+ '<a class="modifyBtn" style="cursor:pointer;">수정</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="deleteBtn" style="cursor:pointer;">삭제</a></span></div>';
		return text;
	}
	if (parseInt(session) != reply.boardReplyWriter) {
		text += '</div>';
		return text;
	}
	return text;	
}
function clickModifyBtn(e){
	console.log("clickModifyBtn");
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var prevText = replayDiv.find('.reply_content').html();
	replayDiv.find('.reply_content').after('<span class="reply_edit"><input class="edit_text" type="text" value="'+prevText+'"/>&nbsp;&nbsp;<a class="edit_ok" style="cursor:pointer;">Modify</a>&nbsp;/&nbsp;<a class="edit_cancel" style="cursor:pointer;">Cancel</a></span>');
	replayDiv.find('.reply_btns').hide();
	replayDiv.find('.reply_content').hide();
}

function modifyReply(e){
	console.log("modifyReply");
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var replaySection =target.parents('.board-reply');
	var replyWrap = replaySection.find('.replyDiv-wrap');
	var boardNum = replaySection.data('num');
	var replyNum = replayDiv.data('replynum');
	var editText = replayDiv.find('.reply_edit input').val();
	var sendData="boardReplyNum="+replyNum+"&boardReplyContent="+editText+"&boardNum="+boardNum;
	var root=getContextPath();
	var callUrl=root+"/boardReply/boardReplyModify.do";
	console.log(sendData, callUrl);
	$.ajax({
		url:callUrl,
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			var replyList = JSON.parse(decodeURIComponent(data));
			replyWrap.html(getReplyList(replyList));
		},
		error:function(xhr, status, error){
			alert(xhr+","+status+","+error);
		}
	});
}
function cancelReply(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var replaySection =target.parents('.board-reply');
	replayDiv.find('.reply_content').show();
	replayDiv.find('.reply_btns').show();
	replayDiv.find('.reply_edit').remove();
}
function deleteReply(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var replaySection =target.parents('.board-reply');
	var replyWrap = replaySection.find('.replyDiv-wrap');
	var replyNum = replayDiv.data('replynum');
	var boardNum = replaySection.data('num');
	var sendData="boardReplyNum="+replyNum+"&boardNum="+boardNum;
	var root=getContextPath();
	var callUrl=root+"/boardReply/boardReplyDelete.do";
	$.ajax({
		url:callUrl,
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			var replyList = JSON.parse(decodeURIComponent(data));
			replyWrap.html(getReplyList(replyList));
		},
		error:function(xhr, status, error){
			alert(xhr+","+status+","+error);
		}
	});
}

//root값 받아오는 함수
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

// 시간값 자리수 맞춰주는 함수
function padStr(i) {
    return (i < 10) ? "0" + i : "" + i;
}