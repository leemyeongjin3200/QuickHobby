<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
</head>
<body onload="previewImage()">
	<form name="registerForm" action="${root}/member/register.do" method="post" enctype="multipart/form-data">
			<label>Email</label>
			<input type="text" name="memberId"/>
			<input type="button" value="이메일 인증" onclick="sendCode(memberId, '${root}')"/><br/>

			<label>Password</label>
			<input type="password" name="memberPassword"/><br/>
				
			<label>Confirm your password</label>
			<input type="password" name="rePassword"/><br/>
				
			<label>NickName</label>
			<input type="text" name="memberNickName"/>
			<input type="button" value="중복확인"><br/>
				
			<label>SNS Address</label>
			<input type="text" name="memberSNS">

			<div>
				<img alt="이미지 없음" src="#" id="userImage" height="200" width="150"><br/>
				<label>사진 선택</label>
				<input type="file" name="memberFile"/>
				<input type="submit" value="가입 완료"/>
			</div>
		</form>
</body>
</html>