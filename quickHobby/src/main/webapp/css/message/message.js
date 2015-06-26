/**
 * 
 */

//tab넘기기
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
});

//메세지 팝업창
$(document).ready(function(){
    $("#myMessage").click(function(){
        $("#myModal").modal();
    });
});


function checkForm(messageForm){
	alert("Message Form check");
}

