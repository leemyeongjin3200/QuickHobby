/**
 * 
 */
// mouse click, keyboard input event
$(document).ready(function(){
	$("#boardReply").on('click', 'button[name="replyBtn"]', writeReply);
	$("#boardReply").on('keydown', '.input-block-level', triggerWriteReply);
	$("#boardReply").on('click', 'a[name="deleteReply"]', deleteReply);
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

// reply 작성내용 컨트롤러로 보내고 list들 담을 div 그리기
function writeReply(e){
	var target = $(e.target)
	var replySection =target.parents('#boardReply'); 
	groupBoardNum = replySection.data('num'),
	text = replySection.find('.input-block-level').val();
	console.log(groupBoardNum);
	console.log(text);
	var replyWrap = replySection.find('.boardReply-list');
	var sendData="groupBoardNum="+groupBoardNum+"&groupReplyContent="+text;
	var root=getContextPath();
	var callUrl=root+"/groupReply/groupReplyWrite.do";
	console.log(sendData, callUrl);
	$.ajax({
		url:callUrl,
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			var replyList = JSON.parse(decodeURIComponent(data.replace(/\+/gi, "%20")));
			replyWrap.html(getReplyList(replyList));
			replySection.find('.input-block-level').val('');
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

// list div 그리기
function makeReplyDiv(reply) {
	var root=getContextPath();
	var d = new Date(reply.groupReplyModifyDate);
	var dateStr = padStr(d.getFullYear()) +
	padStr(1 + d.getMonth()) +
	padStr(d.getDate()) +
	padStr(d.getHours()) +
	padStr(d.getMinutes()) +
	padStr(d.getSeconds());
	
	var year=dateStr.substring(0,4);
	var month=dateStr.substring(4,6);
	var day=dateStr.substring(6,8);
	var hour=dateStr.substring(8,10);
	var minute=dateStr.substring(10,12);
	var second=dateStr.substring(12,14);
	var replyTime=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	// console.log(replyTime);
	
	var imgSrc=root + "/img/memberImage/" + reply.memberFileName;
	var memberSrc=root + "/memberBoard/check.do?memberNum=" + reply.groupReplyWriter;
	// 세션값 받아오기
	var session=document.getElementById("sessionNum").value;
	console.log(session);
	
	var text = '<div class="boardReply media" title="replyDiv" data-replynum="' + reply.groupReplyNum + '">';
	text += '<div class="span2 pull-left boardReply-img"><img class="img-circle" src="'+ imgSrc +'" alt="" /></div>';
	text += '<div class="span10 media-body boardReply-icon"><i class="glyphicon glyphicon-user"></i> by <a href="' + memberSrc + '">';
	text += reply.memberNickName+'</a><br/>';
	text += '<i class="glyphicon glyphicon-time"></i>'+replyTime;
	
	if (parseInt(session) == reply.groupReplyWriter) {
		text += '<a class="pull-right" style="cursor:pointer;" name="deleteReply"><i class="glyphicon glyphicon-remove"></i></a>';
	}
	
	text += '</div>';
	text += '<div class="pull-left ReplyContent"><p>'+reply.groupReplyContent+'</p></div></div>';
	
	return text;	
}

function deleteReply(e){
	var target = $(e.target);
	var replyDiv =target.parents('div[title="replyDiv"]');
	var replySection =target.parents('#boardReply');
	var replyWrap = replySection.find('.boardReply-list');
	var replyNum = replyDiv.data('replynum');
	var boardNum = replySection.data('num');
	var sendData="groupReplyNum="+replyNum+"&groupReplyBoardNum="+boardNum;
	var root=getContextPath();
	var callUrl=root+"/groupReply/groupReplyDelete.do";
	$.ajax({
		url:callUrl,
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			console.log(data);
			var replyList = JSON.parse(decodeURIComponent(data.replace(/\+/gi, "%20")));
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
