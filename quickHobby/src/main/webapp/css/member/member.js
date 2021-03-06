/**
 * 
 */
function registerCheck(form){
	if($("input[name='memberId']").val()==""){
		alert("이메일을 입력해주세요.");
		$("input[name='memberId']").focus();
		return false;
	}
	
	if($("input[name='memberPassword']").val()==""){
		alert("비밀번호를 입력해주세요.");
		$("input[name='memberPassword']").focus();
		return false;
	}
	
	if($("input[name='memberPassword']").val().length < 8){
		alert("비밀번호는 8글자 이상이여야 합니다.");
		$("input[name='memberPassword']").focus();
		return false;
	}
	
	if($("input[name='rePassword']").val()==""){
		alert("비밀번호를 다시한번 입력해주세요.");
		$("input[name='rePassword']").focus();
		return false;
	}
	
	if($("input[name='memberNickName']").val()==""){
		alert("닉네임을 입력해주세요.");
		$("input[name='memberNickName']").focus();
		return false;
	}
	
	if($("input[name='memberSNS']").val()==""){
		alert("SNS주소를 입력해주세요.");
		$("input[name='memberSNS']").focus();
		return false;
	}
	
	if($("input[name='memberPassword']").val()!=$("input[name='rePassword']").val()){
		alert("입력하신 패스워드가 일치하지 않습니다.");
		return false;
	}
	
	if($("input[id='emailCheck']").val()=="0"){
		alert("이메일 인증을 해주세요.");
		return false;
	}
	
	if($("input[id='nicknameCheck']").val()=="0"){
		alert("닉네임 중복확인을 해주세요.");
		return false;
	}
	
	$("input[name='memberId']").removeAttr("disabled");
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
					if($("input[name='serverCode']").val()==-1){
						$("#emailModal").modal("toggle");
						alert("이미 사용중인 이메일입니다.");
					}
				}
			});
			$("#emailModal").modal();
		});
	}
}

function checkCode(checkForm){
	var serverCode=$("input[name='serverCode']").val();
	var userCode=$("input[id='userCode']").val();
	
	if(serverCode==""){
		serverCode="Mail Error";
		alert("이메일 발송에 실패 했습니다. 이메일 주소를 확인해주세요.");
		return false;
	}
	
	if(serverCode!=userCode){
		alert("인증번호를 잘못입력하셨습니다.");
		$("#emailDiv").attr("class", "form-group has-feedback has-error");
		$("#emailIcon").attr("style", "right:20px");
		$("#emailIcon").attr("class", "glyphicon glyphicon-remove form-control-feedback");
		$("input[name='memberId']").attr("data-toggle", "tooltip");
		$("input[name='memberId']").attr("data-placement", "top");
		$("input[name='memberId']").attr("title", "이메일 인증을 해주세요.");
		$("input[name='memberId']").attr("container", "body");
		$("input[name='memberId']").tooltip();
		return false;
	}
	
	if((serverCode==userCode)){
		alert("인증이 완료 되었습니다.");
		$("input[name='memberId']").attr("disabled", "disabled");
		$("#emailCheck").val("1");
		$("#emailModal").modal('toggle');
		$("#emailDiv").attr("class", "form-group has-feedback has-success");
		$("#emailIcon").attr("style", "right:20px");
		$("#emailIcon").attr("class", "glyphicon glyphicon-ok form-control-feedback");
		return false;
	}
}

function checkNickname(nickname, root){
	if($("input[name='memberNickName']").val()==""){
		$("#nicknameAlert").attr("class", "text-danger");
		$("#nicknameAlert").attr("style", "font:15px");
		$("#nicknameAlert").text("닉네임을 입력해주세요.");
	}
	
	if($("input[name='memberNickName']").val()!=""){
		$(function(){
			var callUrl=root+"/member/checkNickname.do?nickname="+nickname.value;
			$.ajax({
				url:callUrl,
				type:"get",
				dataType:"html",
				success:function(data){
					if($(data).find("#serverNickname").val()==""){
						$("#nicknameDiv").attr("class", "form-group has-feedback has-success");
						$("#nicknameIcon").attr("style", "right:20px");
						$("#nicknameIcon").attr("class", "glyphicon glyphicon-ok form-control-feedback");
						$("#nicknameCheck").val(1);
						$("#nicknameAlert").attr("class", "text-success");
						$("#nicknameAlert").attr("style", "font:15px");
						$("#nicknameAlert").text("사용가능한 닉네임입니다.");
					}
					
					if($(data).find("#serverNickname").val()!=""){
						$("#nicknameCheck").val(0);
						$("#nicknameDiv").attr("class", "form-group has-feedback has-error");
						$("#nicknameIcon").attr("style", "right:20px");
						$("#nicknameIcon").attr("class", "glyphicon glyphicon-remove form-control-feedback");
						$("#nicknameAlert").attr("class", "text-success");
						$("#nicknameAlert").attr("style", "font:15px");
						$("#nicknameAlert").text("이미 사용중인 닉네임입니다.");
					}
				}
			});
		});
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

function updateCheck(form){
	if($("input[name='memberPassword']").val()==""){
		alert("비밀번호를 입력해주세요.");
		$("input[name='memberPassword']").focus();
		return false;
	}
	
	if($("input[name='memberPassword']").val().length < 8){
		alert("비밀번호는 8글자 이상이여야 합니다.");
		$("input[name='memberPassword']").focus();
		return false;
	}
	
	if($("input[name='rePassword']").val()==""){
		alert("비밀번호를 다시한번 입력해주세요.");
		$("input[name='rePassword']").focus();
		return false;
	}
	
	if($("input[name='memberSNS']").val()==""){
		alert("SNS주소를 입력해주세요.");
		$("input[name='memberSNS']").focus();
		return false;
	}
}

function sendCodeFindPass(email, root){
	if($("input[name='memberId']").val()==""){
		alert("이메일을 입력해주세요.");
	}
	
	if($("input[name='memberId']").val()!=""){
		$(function(){
			$("#findPassModal").modal("toggle");
			var callUrl=root+"/member/sendCodeFindPass.do?email="+email.value;
			$.ajax({
				url:callUrl,
				type:"get",
				dataType:"html",
				success:function(data){
					$("input[name='serverCode']").val($(data).find("input[name='serverCode']").val());
					if($("input[name='serverCode']").val()==-1){
						$("#findPassModal").modal("toggle");
						alert("존재하지않는 이메일입니다.");
					}
				}
			});
		});
	}
}

function checkCodeFindPass(checkForm){
	var serverCode=$("input[name='serverCode']").val();
	var userCode=$("input[id='userCode']").val();
	
	if(serverCode==""){
		serverCode="Mail Error";
		alert("이메일 발송에 실패 했습니다. 이메일 주소를 확인해주세요.");
		return false;
	}
	
	if(serverCode!=userCode){
		alert("인증번호를 잘못입력하셨습니다.");
		
		return false;
	}
	
	if((serverCode==userCode)){
		alert("인증이 완료 되었습니다.");
		$("input[name='emailCheck']").val("1");
		$("#findPassModal").modal('toggle');
		
		return false;
	}
}

function findPasswordCheck(form){
	if($("input[name='memberId']").val()==""){
		alert("이메일을 입력해주세요.");
		$("input[name='memberId']").focus();
		
		return false;
	}
	
	if($("input[name='emailCheck']").val()!="1"){
		alert("이메일 인증을 해주세요.");
		
		return false;
	}
}