<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원가입</title>
</head>
<body onload="previewImage()">
	<div class="container">
		<form name="registerForm" action="${root}/member/register.do" method="post" enctype="multipart/form-data">
			<div class="col-md-6">
				<div class="form-group has-error has-feedback">
					<label for="memberId"><span class="glyphicon glyphicon-user"></span> E-Mail</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="text" name="memberId" placeholder="E-Mail"/>
							<span style="right:15px;" class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						<div class="col-md-3">
							<button type="button" class="form-control btn btn-info" onclick="sendCode(memberId, '${root}')">Email Confirm</button>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="memberPassword"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
					<input class="form-control" type="password" name="memberPassword" placeholder="Password"/>
				</div>
				
				<div class="form-group">
					<label for="rePassword"><span class="glyphicon glyphicon-eye-open"></span> Confirm you password</label>
					<input class="form-control" type="password" name="rePassword" placeholder="Confirm your password"/>
				</div>
				
				<div class="form-group has-feedback">
					<label for="memberNickName"><span class="glyphicon glyphicon-user"></span> NickName</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="text" name="memberNickName" placeholder="NickName"/>
							<span style="right:15px;" class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						<div class="col-md-3">
							<button type="button" class="form-control btn btn-info">Check</button>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="memberSNS"><span class="glyphicon glyphicon-eye-open"></span> SNS Address</label>
					<input class="form-control" type="password" name="memberSNS" placeholder="SNS Address"/>
				</div>
				<input type="submit" value="가입 완료"/>
			</div>
			<div class="col-md-6">
				
			</div>
			<img class="img-responsive" alt="이미지 없음" src="#" id="userImage" height="1800" width="250"><br/>
				<label>사진 선택</label>
				<input type="file" name="memberFile"/>
		</form>
	</div>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>