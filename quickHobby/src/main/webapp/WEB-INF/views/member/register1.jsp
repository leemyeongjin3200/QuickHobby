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
		<div>
			<label>이메일</label>
			<input type="text" name="email"/>
			<input type="button" onclick="sendCode(email, '${root}')" value="인증번호 발송">
			<label id="emailAuth" style="color:red">인증미완료</label><br/>
			<input type="hidden" name="emailAuth" value="false">
			
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
	</form>
</body>
</html>