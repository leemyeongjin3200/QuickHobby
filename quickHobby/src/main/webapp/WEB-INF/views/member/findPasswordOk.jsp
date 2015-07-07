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
<title>비밀번호 찾기</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include><br/><br/>
<body>
	<div class="container">
		<div class="page-header">
			<h2>비밀번호 찾기</h2>
		</div>
		<div style="dispay: inline-block; text-align: center;">
		<h3 class="text-info">회원님의 비밀번호는 </h3>
		<a class="btn btn-default" href="javascript:window.close();" >닫기</a>
		</div>
	</div>
</body>
<jsp:include page="../template/loginModal.jsp"></jsp:include>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/css/main/main.js"></script>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
</html>