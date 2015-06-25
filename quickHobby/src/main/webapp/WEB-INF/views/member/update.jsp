<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<title>회원수정</title>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body onload="previewImage()">
	<div class="container">
		<form role="form" class="form-horizontal" name="registerForm" action="${root}/member/update.do">
			<div class="col-md-6">
				<div class="form-group">
					<label class="control-label col-md-4" for="memberId">Email</label>
					<div class="col-md-8">
						<input type="email" class="form-control" name="memberId" placeholder="Email" disabled="disabled"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-md-4" for="memberPassword">Password</label>
					<div class="col-md-8">
						<input type="password" class="form-control" name="memberPassword" placeholder="Password"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-md-4" for="rePassword">Confirm your password</label>
					<div class="col-md-8">
						<input type="password" class="form-control" name="rePassword" placeholder="Confirm your password"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-md-4" for="memberSNS">SNS Address</label>
					<div class="col-md-8">
						<input type="text" class="form-control" name="memberSNS" placeholder="SNS Address">
					</div>
				</div>
			</div>
			<div>
			<img alt="이미지 없음" src="#" id="userImage" height="200" width="150"><br/>
			<label>사진 선택</label>
			<input type="file" name="memberFile"/>
			<input type="submit" value="가입 완료"/>
		</div>
		</form>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>