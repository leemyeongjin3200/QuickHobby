<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<title>비밀번호 찾기</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include><br/><br/>
<body>
	<div class="container">
		<div class="page-header">
			<h2>비밀번호 찾기</h2>
		</div>
		<div style="dispay: inline-block; text-align: center;">
		<h3>회원님의 비밀번호는 ${password}입니다.</h3>
		<p class="text-info">비밀번호는 처음 네글자만 공개 됩니다.</p><br/>
		<a id="login" class="btn btn-default" href="#">로그인</a>
		<a class="btn btn-default" href="${root}/memberMain.do">메인으로</a>
		</div>
	</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>