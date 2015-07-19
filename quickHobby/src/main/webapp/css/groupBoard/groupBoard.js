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

//Reply 팝업창
$(document).ready(function(){
    $(".myInGroupReply").click(function(){
        $("#myModalReply").modal();
    });
});

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