$(function(){
	$(".postDiv").each(function(i, group){
		var deg=Math.floor(Math.random()*60)-30;
		$(this).css("transform", "rotate(" + deg + "deg)");
	});
});