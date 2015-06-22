<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>부트스트랩 101 템플릿</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${root}/css/member/member.js"></script>
<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<form class="form-horizontal" name="registerForm" action="${root}/member/register.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="email" class="control-label">E-mail</label>
			<input type="email" id="email" name="email" class="form-control" placeholder="E-mail"/>
			<input type="button" onclick="sendCode(email, '${root}')" value="인증번호 발송">
			<label id="emailAuth" style="color:red">인증미완료</label><br/>
		</div>
		<div class="form-group">
			<label for="password" class="control-label">Password</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="Password"/>
		</div>
		<div class="form-group">
			<label for="rePassword" class="control-label">Password</label>
			<input type="password" name="rePassword" maxlength="8"/><br/>
		</div>
	</form>
	<div>
			<label>비밀번호</label>
			<input type="password" name="password" maxlength="8"/><br/>
			
			<label>비밀번호</label>
			<input type="password" name="rePassword" maxlength="8"/><br/>
			
			<label>SNS주소</label>
			<input type="text" name="snsAddress"/><br/>
			
			<input type="submit" value="가입 완료"/>
		</div>
		<div>
			<img alt="이미지 없음" src="#" id="userImage" height="200" width="150"><br/>
			<label>사진 선택</label>
			<input type="file" name="file"/>
		</div>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>