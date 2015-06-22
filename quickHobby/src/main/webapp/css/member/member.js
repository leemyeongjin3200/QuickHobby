/**
 * 
 */

function sendCode(email, root){
	var url=root+"/member/sendCode.do?email="+email.value;
	
	window.open(url, "", "width=350, height=250");
}

function checkCode(checkForm){
	var serverCode=$("input[name='serverCode']").val();
	var userCode=$("input[name='userCode']").val();
	
	
	if(serverCode==userCode){
		alert("인증이 완료 되었습니다.");
		$(opener.document).find("label[id='emailAuth']").text("인증완료");
		$(opener.document).find("label[id='emailAuth']").attr("style", "color:blue");
		self.close();
		return true;
	}else{
		alert("인증번호를 잘못입력하셨습니다.")
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
        $("input[name='file']").change(function(){
            readURL(this);
        });
     });
}