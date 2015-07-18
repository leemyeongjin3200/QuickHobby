/**
 * 
 */
// 페이지 이동
function movePage(pageNumber){
	console.log(pageNumber);
	var root=getContextPath();
	var callUrl=root+"/board/list.do?pageNumber="+pageNumber;
	$.ajax({
		url:callUrl,
		type:"get",
		dataType:"html",
		success:function(data){
			$(location).attr("href", callUrl);
		}
	});
}

function moveTipPage(tipPageNumber){
//	var temp=$("#tipgTableRow1").clone().html();
//	temp += $("#tipgTableRow2").clone().html();
//	console.log(temp);
//	console.log(tipPageNumber);
//	$("#tipList").children().remove();
	var root=getContextPath();
	var callUrl=root+"/board/list.do?pageNumber="+tipPageNumber;
	$.ajax({
		url:callUrl,
		type:"get",
		dataType:"html",
		success:function(data){
			
			//$('.tabMenu2').trigger('click');
			$(function(){
				$(location).attr("href", callUrl);
				var cnt=0;
				cnt=1;
				if(cnt==1){
					$('.tabMenu2').trigger('click');
					alert("클릭 이벤트 발생");
					
				}
			});
			
			
//			$(".tabMenu2").bind("trigger", function(){
//	            alert("클릭 이벤트 발생");
//	            $('.tabMenu2').click();
//	        });
			
//			console.log(data);
			//console.log(JSON.parse(decodeURIComponent(data)));
//			$("#tipList").html(temp);
			
			
			//$(location).attr("href", callUrl+"#menu2");
			
			
//			$(function(){
//				$(location).attr("href", callUrl);
//				$('.tabMenu2').trigger('click');
//				$('.tabMenu2').attr('class', 'active');
//			});
			
//			$("#menu2").addClass("active");
//			$(document).ready(function(){
//				$("#menu2").trigger("click");
//			});
		}
	});
}

//$(function() {
////  $("#tabs").tabs();
//	  $(".nav-tabs a").tabs({
//	   cookie: {
//	    // store cookie for a day, without, it would be a session cookie
//	    expires: 1
//	   }
//	  });
//});

//tab넘기기
$(document).ready(function(){
	 $(".nav-tabs a").click(function(e){
	      $(this).tab('show');
	 });
});

//Reply 팝업창
function replyCheck(boardNum, currentPage){
	console.log(boardNum);
	var root=getContextPath();
	var callUrl=root+"/boardReply/getBoardReplyList.do";
	var sendData="boardNum="+boardNum;
	$.ajax({
		url:callUrl,
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"html",
		success:function(data){
			console.log(data);
			console.log(JSON.parse(decodeURIComponent(data)));
			var replyList = JSON.parse(decodeURIComponent(data));
			var length=replyList.length;
			// console.log("length:"+length);
			var result='';
			var strong='';
			for(var i=0;i<length;i++){
				result += makeReplyDiv2(replyList[i]);
			}
			console.log(result);
			$(".reply-box").html(result);
		}
	});
	
	$("#myModalReply").modal();
	
	$("#toContent").click(function(){
		console.log(boardNum);
		console.log(currentPage);
		var root=getContextPath();
		var callUrl=root+"/board/read.do?boardNum="+boardNum+"&pageNumber="+currentPage;
		
		$.ajax({
			url:callUrl,
			type:"get",
			dataType:"html",
			success:function(data){
				$(location).attr("href", callUrl);
			}
		});
	});

}

function makeReplyDiv2(reply) {
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
	
	var text = '<li class="left clearfix"><div class="reply-body"> <strong><i class="glyphicon glyphicon-user"></i>'+ reply.memberNickName + '</strong>';
	text += '<small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i>' + replyTime +" " + '</small>';
	text += '<p>' + reply.boardReplyContent+" " + '</p></div></li>';
	text += '<input type="hidden" name="boardReplyBoardNum" value="'+reply.boardReplyBoardNum+'"/>'
	
	console.log(text);
	return text;	
}

// 해당 글로 이동
function toContent(boardNum){
	console.log(boardNum);
	var root=getContextPath();
	var callUrl=root+"/board/read.do?="+boardNum;
	console.log(callUrl);
	$.ajax({
		url:callUrl,
		type:"get",
		dataType:"html",
		success:function(data){
			console.log(data);
			console.log(JSON.parse(decodeURIComponent(data)));
			var replyList = JSON.parse(decodeURIComponent(data));
			var length=replyList.length;
			// console.log("length:"+length);
			var result='';
			var strong='';
			for(var i=0;i<length;i++){
				result += makeReplyDiv(replyList[i]);
			}
			console.log(result);
			$(".reply-box").html(result);
		}
	});
}

// 목록으로 되돌아가기
$(document).ready(function(){
    $("a[name='toList']").click(function(){
    	$("#myModalReply").modal("toggle");
		// location.reload();
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