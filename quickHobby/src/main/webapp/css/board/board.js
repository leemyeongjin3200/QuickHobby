/**
 * 
 */

//tab넘기기
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
      $(this).tab('show');
  });
});

//Reply 팝업창
$(document).ready(function(){
    $(".myReply").click(function(){
        $("#myModalReply").modal();
    });
});