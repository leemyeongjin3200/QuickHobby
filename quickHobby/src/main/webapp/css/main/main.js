/**
 * 
 */
  WebFontConfig = {
    google: { families: [ 'Roboto:400,300italic,300,100italic,100,400italic,500,500italic,700,700italic,900,900italic:latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })(); 

function getNewMessage(root, memberNum){
	if(memberNum!=""){
		var callUrl=root+"/getNewMessage.do?memberNum="+memberNum;
		$.ajax({
			url:callUrl,
			type:"get",
			dataType:"html",
			success:function(data){
				$("#newMessage").append("<span id='messageNum'>&nbsp;&nbsp;" + $(data).find("input[name='newMessageNum']").val() + "</span>");
				if($(data).find("input[name='newMessageNum']").val() > 0){
					$("#newMessage").css("background-color", "gold");
				}
			}
		});
		
		setInterval(function(){
			$.ajax({
				url:callUrl,
				type:"get",
				dataType:"html",
				success:function(data){
					$("#messageNum").text($(data).find("input[name='newMessageNum']").val());
					$("#messageNum").prepend("&nbsp;&nbsp");
				}
			});
		}, 60000);
	}
}

//로그인 팝업창
$(document).ready(function(){
    $("#myLogin").click(function(){
    	var cookieId=$.cookie('cookieId');
		if(cookieId!=undefined){
			$("#userId").val(cookieId);
			$("#rememberId").attr("checked", true);
		}
		
        $("#myModal").modal("toggle");
    });
    
    $("#login").click(function(){
    	var cookieId=$.cookie('cookieId');
		if(cookieId!=undefined){
			$("#userId").val(cookieId);
			$("#rememberId").attr("checked", true);
		}
		
        $("#myModal").modal("toggle");
    });
    
    $("#loginBtn").click(function(){
		if($("#userId").val()==""){
			alert("E-mail을 입력하세요.");
			return false;
		}
		
		if($("#userPassword").val()==""){
			alert("Password를 입력하세요.");
			return false;
		}
		
		if($("#rememberId").is(":checked")){
			$.cookie('cookieId', $("#userId").val(), {expires:7});
		}else{
			$.removeCookie('cookieId');
		}
	});
});

//content1-메인 이미지슬라이드 형식 구현
$(document).ready(function(){
    // Activate Carousel
    $("#myCarousel").carousel({interval: 2000, wrap: true});
    
    // Enable Carousel Indicators
    $(".item1").click(function(){
        $("#myCarousel").carousel(0);
    });
    $(".item2").click(function(){
        $("#myCarousel").carousel(1);
    });
    $(".item3").click(function(){
        $("#myCarousel").carousel(2);
    });
    $(".item4").click(function(){
        $("#myCarousel").carousel(3);
    });
    
    // Enable Carousel Controls
    $(".left").click(function(){
        $("#myCarousel").carousel("prev");
    });
    $(".right").click(function(){
        $("#myCarousel").carousel("next");
    });
});
