<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<title>회원정보수정</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<br/><br/>
	<div class="container">
		<div class="page-header">
			<h2>회원정보수정</h2>
		</div>
		<form name="updateForm" action="${root}/member/update.do" method="post" enctype="multipart/form-data" onsubmit="return updateCheck(this)">
			<input type="hidden" name="memberNum" value="${member.memberNum}"/>
			<div class="col-md-7">
				<div id="emailDiv" class="form-group">
					<label for="memberId"><span class="glyphicon glyphicon-envelope"></span> E-Mail</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="text" name="memberId" value="${member.memberId}" disabled/>
						</div>
					</div>
					<input type="hidden" name="emailCheck" value="0"/>
				</div>
				
				<div class="form-group">
					<label for="memberPassword"><span class="glyphicon glyphicon-lock"></span> Password</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="password" name="memberPassword" maxlength="10" placeholder="Password"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="rePassword"><span class="glyphicon glyphicon-lock"></span> Confirm you password</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="password" name="rePassword" maxlength="10" placeholder="Confirm your password"/>
						</div>
					</div>
				</div>
				
				<div id="nicknameDiv" class="form-group">
					<label for="memberNickName"><span class="glyphicon glyphicon-user"></span> NickName</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="text" name="memberNickName" value="${member.memberNickName}" disabled/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="memberSNS"><span class="glyphicon glyphicon-eye-open"></span> SNS Address</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" type="text" name="memberSNS" value="${member.memberSNS}"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="수정 완료"/>
				</div>
			</div>
			<div class="col-md-3">
				<label for="memberFile"><span class="glyphicon glyphicon-camera"></span> 사진 선택</label><br/>
				<img class="img-thumnail" alt="이미지 없음" src="${root}/img/memberImage/${fileName}" id="userImage" height="300" width="250"><br/><br/>
				<input type="file" name="memberFile" onclick="previewImage()"/>
			</div>
		</form>
	</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>