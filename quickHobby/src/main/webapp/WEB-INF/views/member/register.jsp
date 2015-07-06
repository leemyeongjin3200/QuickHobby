<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/main.css"/>
<title>회원가입</title>
</head>
<body onload="previewImage()">
<jsp:include page="../../../template/header.jsp"></jsp:include><br/><br/>
	<div class="container">
		<div class="page-header">
			<h2>회원가입</h2>
		</div>
		<form name="registerForm" action="${root}/member/register.do" method="post" enctype="multipart/form-data" onsubmit="return registerCheck(this)">
			<div class="col-md-7">
				<div id="emailDiv" class="form-group has-feedback">
					<label for="memberId"><span class="glyphicon glyphicon-envelope"></span> E-Mail</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="text" name="memberId" placeholder="E-Mail"/>
							<span id="emailIcon"></span>
						</div>
						<div class="col-md-2">
							<button type="button" class="form-control btn btn-primary" onclick="sendCode(memberId, '${root}')">Confirm</button>
						</div>
					</div>
					<input type="hidden" name="emailCheck" value="0"/>
				</div>
				
				<div class="form-group">
					<label for="memberPassword"><span class="glyphicon glyphicon-lock"></span> Password</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="password" name="memberPassword" placeholder="Password"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="rePassword"><span class="glyphicon glyphicon-lock"></span> Confirm you password</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="password" name="rePassword" placeholder="Confirm your password"/>
						</div>
					</div>
				</div>
				
				<div id="nicknameDiv" class="form-group has-feedback">
					<label for="memberNickName"><span class="glyphicon glyphicon-user"></span> NickName</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="text" name="memberNickName" placeholder="NickName"/>
							<span id="nicknameIcon"></span>
						</div>
						<div class="col-md-2">
							<button type="button" class="form-control btn btn-primary" onclick="checkNickname(memberNickName, '${root}')">Check</button>
						</div>
						<input type="hidden" name="nicknameCheck" value="0"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="memberSNS"><span class="glyphicon glyphicon-eye-open"></span> SNS Address</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="password" name="memberSNS" placeholder="SNS Address"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="가입 완료"/>
				</div>
			</div>
			<div class="col-md-3">
				<label for="memberFile"><span class="glyphicon glyphicon-camera"></span> 사진 선택</label><br/>
				<img class="img-thumnail" alt="이미지 없음" src="${root}/pds/default.PNG" id="userImage" height="300" width="250"><br/><br/>
				<input type="file" name="memberFile"/>
			</div>
		</form>
	</div>
<jsp:include page="sendCode.jsp"></jsp:include>
<jsp:include page="../../../template/loginModal.jsp"></jsp:include>
<jsp:include page="../../../template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/css/main/main.js"></script>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
</body>
</html>