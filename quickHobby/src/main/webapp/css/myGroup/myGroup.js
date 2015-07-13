$(function(){
	$(".postDiv").each(function(i, group){
		var deg=Math.floor(Math.random()*60)-30;
		$(this).css("transform", "rotate(" + deg + "deg)");
	});
	
	$("a").hover(function(){
		$(this).children(".groupInfo").css("opacity", "0.8");
	}, function(){
		$(this).children(".groupInfo").css("opacity", "0");
	});
	
	$(".groupInfo").click(function(){
		
	});
});