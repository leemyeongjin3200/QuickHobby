<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<a href="${root}/member/register.do">회원가입</a>
	<c:if test="${member==null}">
		<a href="${root}/member/login.do">로그인</a>
		<a href="${root}/member/update.do">회원정보수정</a>
	</c:if>
	<c:if test="${member !=null}">
		<a href="${root}/member/update.do">회원정보수정</a>
		<a href="${root}/member/logout.do">로그아웃</a>
	</c:if>
</body>
</html>