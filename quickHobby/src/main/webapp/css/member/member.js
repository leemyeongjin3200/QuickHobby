/**
 * 
 */
function registerCheck(form){
	
}

function sendCode(email, root){
	if($("input[name='memberId']").val()==""){
		alert("이메일을 입력해주세요.");
	}
	
	if($("input[name='memberId']").val()!=""){
		$(function(){
			var callUrl=root+"/member/sendCode.do?email="+email.value;
			$.ajax({
				url:callUrl,
				type:"get",
				dataType:"html",
				success:function(data){
					$("input[name='serverCode']").val($(data).find("input[name='serverCode']").val());
				}
			});
			$("#emailModal").modal();
		});
	}
}

function checkCode(checkForm){
	var serverCode=$("input[name='serverCode']").val();
	var userCode=$("input[id='userCode']").val();
	
	if(serverCode==userCode){
		alert("인증이 완료 되었습니다.");
		$("#emailModal").modal('toggle');
		$("#emailDiv").attr("class", "form-group has-success");
		return false;
	}else{
		alert("인증번호를 잘못입력하셨습니다.");
		$("#emailDiv").attr("class", "form-group has-error");
		return false;
	}
}

function previewImage(){
	$(document).ready(function(){
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                reader.onload = function (e) { 
                //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                    $('#userImage').attr('src', e.target.result);
                    //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                    //(아래 코드에서 읽어들인 dataURL형식)
                }                    
                reader.readAsDataURL(input.files[0]);
                //File내용을 읽어 dataURL형식의 문자열로 저장
            }
        }//readURL()--

        //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
        $("input[name='memberFile']").change(function(){
            readURL(this);
        });
     });
}

function loginPopUp(){
	$(document).ready(function(){
		$("#myModal").modal();
	});
}