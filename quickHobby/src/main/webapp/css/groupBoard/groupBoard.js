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
/*  var zoom= $('#map_canvas').gmap('option', 'zoom');
  
  $('#map_canvas').gmap().bind('init', function(ev, map) {
    $('#map_canvas').gmap('addMarker', {'position': '57.7973433,12.0502107', 'bounds': true});
    $('#map_canvas').gmap('option', 'zoom', 13);
  });
*/
});

$(document).ready(function(){
	var geocoder = new google.maps.Geocoder();
	 
    var addr=$("#groupLocation").val();
 
    var lat="";
    var lng="";
 
    geocoder.geocode({'address':addr},
 
        function(results, status){
 
            if(results!=""){
 
                var location=results[0].geometry.location;
 
                lat=location.lat();
                lng=location.lng();
  
                var latlng = new google.maps.LatLng(lat , lng);
                var myOptions = {
                    zoom: 16,
                    center: latlng,
                    mapTypeControl: true,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                
        		var marker=new google.maps.Marker({
        			position:latlng,
        			map:map
        		});
        		
        		var geocoder=new google.maps.Geocoder();
            }
        }
	)
});

function toReadPage(groupBoardNum){
	var pageNumber=Number($(".active").text());
	console.log(groupBoardNum);
	console.log(pageNumber);
	
	var root=getContextPath();
	var callUrl=root+"/groupBoard/read.do?groupBoardNum="+groupBoardNum+"&pageNumber="+pageNumber;
	$.ajax({
		url:callUrl,
		type:"get",
		dataType:"html",
		success:function(data){
			$(location).attr("href", callUrl);
		}
	});
}

function movePage(pageNumber, boardSize, pageBlock){
	var pageNumber=Number(pageNumber);
	var boardSize=Number(boardSize);
	var pageBlock=Number(pageBlock);
	var prevPage=Number($(".active").text());
	
	var prevStartRow=(prevPage-1)*boardSize+1;
	var prevEndRow=prevStartRow+boardSize-1;
	
	for(var i=prevStartRow; i<=prevEndRow; i++){
		$(".row" + i).css("display", "none");
	}
	
	$(".active").removeClass("active");
	$(".page" + pageNumber).addClass("active");
	
	
	var temp=parseInt((Number($(".active").text())-1)/pageBlock);
	var startRow=(pageNumber+(pageBlock*temp)-1)*boardSize+1;
	var endRow=startRow+boardSize-1;
	
	
	for(var i=startRow; i<=endRow; i++){
		$(".row" + i).css("display", "table-row");
	}
}

function moveRight(boardSize, pageBlock, pageCount){
	var boardSize=Number(boardSize);
	var pageBlock=Number(pageBlock);
	var pageCount=Number(pageCount);
	var currentPage=Number($(".active").text());
	
	var prevRs=parseInt(((currentPage-1)/pageBlock));
	var prevStartPage=prevRs*pageBlock+1;
	var prevEndPage=prevStartPage+pageBlock-1;
	if(prevEndPage>pageCount){
		prevEndPage=pageCount;
	}
	
	var rs=parseInt(((currentPage-1)/pageBlock))+1;
	var startPage=rs*pageBlock+1;
	var endPage=startPage+pageBlock-1;
	if(endPage>pageCount){
		endPage=pageCount;
	}
	
	//아래 번호 바꾸는부분
	var temp=parseInt(prevStartPage/pageBlock)+1;
	for(var i=1; i<=5; i++){
		$(".page" + i + " a").text(i+(pageBlock*temp));
	}
	
	for(var i=pageBlock; i>endPage-startPage+1; i--){
		$(".page" + i).css("display", "none");
	}
	
	$(".active").removeClass("active");
	$(".page1").addClass("active");
	
	if(endPage >= pageCount){
		$(".right").css("display", "none");
	}
	
	//화면바꾸는부분
	var prevStartRow=(currentPage-1)*boardSize+1;
	var prevEndRow=prevStartRow+boardSize-1;
	
	for(var i=prevStartRow; i<=prevEndRow; i++){
		$(".row" + i).css("display", "none");
	}
	
	var startRow=(startPage-1)*boardSize+1;
	var endRow=startRow+boardSize-1;
	for(var i=startRow; i<=endRow; i++){
		$(".row" + i).css("display", "table-row");
	}
	
	$(".left").css("display", "initial");
}

function moveLeft(boardSize, pageBlock, pageCount){
	var boardSize=Number(boardSize);
	var pageBlock=Number(pageBlock);
	var pageCount=Number(pageCount);
	var currentPage=Number($(".active").text());
	
	var prevRs=parseInt(((currentPage-1)/pageBlock));
	var prevStartPage=prevRs*pageBlock+1;
	var prevEndPage=prevStartPage+pageBlock-1;
	if(prevEndPage>pageCount){
		prevEndPage=pageCount;
	}
	
	var rs=parseInt(((currentPage-1)/pageBlock))-1;
	var startPage=rs*pageBlock+1;
	var endPage=startPage+pageBlock-1;
	if(endPage>pageCount){
		endPage=pageCount;
	}
	
	for(var i=pageBlock; i>=1; i--){
		$(".page" + i).css("display", "initial");
	}
	
	//아래 번호 바꾸는부분
	for(var i=1; i<=pageBlock; i++){
		$(".page" + i + " a").text(prevStartPage-(pageBlock-i+1));
	}
	
	$(".active").removeClass("active");
	$(".page5").addClass("active");
	
	if(endPage < pageCount){
		$(".right").css("display", "initial");
	}
	
	if(startPage==1){
		$(".left").css("display", "none");
	}
	
	//화면바꾸는부분
	var prevStartRow=(currentPage-1)*boardSize+1;
	var prevEndRow=prevStartRow+boardSize-1;

	for(var i=prevStartRow; i<=prevEndRow; i++){
		$(".row" + i).css("display", "none");
	}
	
	var temp=(currentPage%pageBlock);
	var startRow=(currentPage-(1+temp))*boardSize+1;
	var endRow=startRow+boardSize-1;
	for(var i=startRow; i<=endRow; i++){
		$(".row" + i).css("display", "table-row");
	}
	
	if(endPage < pageCount){
		$(".right").css("display", "initial");
	}
}

// groupReply Modal
function replyCheck(groupBoardNum){
	console.log(groupBoardNum);
	var root=getContextPath();
	var callUrl=root+"/groupReply/getGroupReplyList.do";
	var sendData="groupBoardNum="+groupBoardNum;
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
	
	$("#myModalGroupReply").modal();
	
	$("#toContent").click(function(){
		console.log(groupBoardNum);
		var currentPage=Number($(".active").text());
		console.log(currentPage);
		var root=getContextPath();
		var callUrl=root+"/groupBoard/read.do?groupBoardNum="+groupBoardNum+"&pageNumber="+currentPage;
		
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

// reply list div 그리기
function makeReplyDiv2(reply) {
	var d = new Date(reply.groupReplyModifyDate);
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
	text += '<p>' + reply.groupReplyContent+" " + '</p></div></li>';
	text += '<input type="hidden" name="boardReplyBoardNum" value="'+reply.groupReplyBoardNum+'"/>'
	
	console.log(text);
	return text;	
}

// 목록으로 되돌아가기
$(document).ready(function(){
    $("a[name='toList']").click(function(){
    	$("#myModalGroupReply").modal("toggle");
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

function groupBoardWrite(){
	$("#groupBoardModal").modal();
}
