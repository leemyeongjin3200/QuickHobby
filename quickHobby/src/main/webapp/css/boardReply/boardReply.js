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
	$('button[name="replyBtn"]').click(function(e){
		writeReply(e);
	});
	
	$('.modifyBtn').click(function(e){
		clickModifyBtn(e);
	});
	
	$('.edit_ok').click(function(e){
		modifyReply(e);
	});
	
	$('.deleteBtn').click(function(e){
		deleteReply(e);
	});
	
	$('.edit_cancel').click(function(e){
		cancelReply(e);
	});
	
	$('.form-control').click(function(e){
		triggerWriteReply(e);
	});
	
	$('.edit_text').click(function(e){
		triggerEditReply(e);
	});
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
	
	var target = $(e.target)
	var replaySection =target.parents('.board-reply'); 
	boardNum = replaySection.data('num'),
	text = replaySection.find('.form-control').val();
	var replyWrap = replaySection.find('.replyDiv-wrap');
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
			console.log("hahaha");
			console.log(decodeURIComponent(data));
			var replyList = JSON.parse(decodeURIComponent(data));
			console.log("success1");
			replyWrap.html(getReplyList(replyList));
			console.log("success2");
			replaySection.find('.form-control').val('');
			console.log("success3");
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
	var time = d.toLocaleString();
	var year = time.substring(0, 4);
	
	var month = time.substring(6, 7);
	if(month<10){
		month="0"+month;
	}
	
	var day = time.substring(9, 10);
	if(day<10){
		day="0"+day;
	}
	
	var hour = time.substring(15, 16);
	if(hour<10){
		hour="0"+hour;
	}
	
	var minute = time.substring(17, 18);
	if(minute<10){
		minute="0"+minute;
	}
	
	var second = time.substring(20, 22);	
	console.log(time);
	
	var text = '<div class="replyDiv" data-replynum="' + reply.boardReplyNum + '">';
	text += '<span class="reply_member">' + reply.memberNickName + '</span>';
	text += '<span class="reply_content">' + reply.boardReplyContent + '</span>';
	text += '<span class="reply_date"><small>'+year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second + '</small></span>';
//	if (parseInt(window.config.member, 10) === reply.boardReplyWriter) {
		text += '<span class="reply_btns">'
				+ '<a class="modifyBtn" >수정</a>&nbsp;/&nbsp;<a class="deleteBtn">삭제</a></span></div>';
//	}
	return text;	
}
function clickModifyBtn(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var prevText = replayDiv.find('.reply_content').html();
	replayDiv.find('.reply_content').after('<span class="reply_edit"><input class="edit_text" type="text" value="'+prevText+'"/>&nbsp;&nbsp;<a href="#" class="edit_ok">수정</a>&nbsp;/&nbsp;<a href="#" class="edit_cancel">취소</a></span>');
	replayDiv.find('.reply_btns').hide();
	replayDiv.find('.reply_content').hide();
}

function modifyReply(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var replaySection =target.parents('.board-reply');
	var replyWrap = replaySection.find('.replyDiv-wrap');
	var boardNum = replaySection.data('num');
	var replyNum = replayDiv.data('replynum');
	var editText = replayDiv.find('.reply_edit input').val();
	var sendData="boardReplyNum="+replyNum+"&boardReplyContent="+editText+"&boardNum="+boardNum;
	var root=getContextPath();
	var callUrl=root+"boardReply/boardReplyModify.do";
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
	var sendData="replyNumber="+replyNum+"&boardNumber="+boardNum;
	$.ajax({
		url:"deleteReply.do",
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

function rplLine(value){
    if (value != null && value != "") { 
        return value.replace(/\n/g, "\\n");
    }else{
        return value;
    }
}