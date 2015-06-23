/**
 * 
 */


//로그인 팝업창
$(document).ready(function(){
    $("#myLogin").click(function(){
        $("#myModal").modal();
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