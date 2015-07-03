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
	<form name="registerForm" action="${root}/member/update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memberNum" value="${member.memberNum}"/>
			<label>Email</label>
			<input type="text" name="memberId" value="${member.memberId}" disabled="disabled"/>

			<label>Password</label>
			<input type="password" name="memberPassword"/><br/>
				
			<label>Confirm your password</label>
			<input type="password" name="rePassword"/><br/>
				
			<label>NickName</label>
			<input type="text" name="memberNickName" value="${member.memberNickName}" disabled="disabled"/>
			<input type="button" value="중복확인"><br/>
				
			<label>SNS Address</label>
			<input type="text" name="memberSNS" value="${member.memberSNS}">

			<div>
				<img alt="이미지 없음" src="${root}/pds/${fileName}" id="userImage" height="200" width="150"><br/>
				<label>사진 선택</label>
				<input type="file" name="memberFile"/>
				<input type="submit" value="수정 완료"/>
			</div>
		</form>
</body>
</html>