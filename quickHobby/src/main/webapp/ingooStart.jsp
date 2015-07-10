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
	<a href="${root}">test</a><br/> 
	<a href="${root}/apply/applyWrite.do">모이자 게시물 작성</a>
	<a href="${root}/apply/applyList.do">모이자 게시판</a><br/>
	<a href="${root}/message/messageWrite.do">쪽지 쓰기</a>
	<a href="${root}/message/messageSendList.do">발송함</a>
	<a href="${root}/message/messageReceiveList.do">수신함</a><br/><br/>
	<a href="${root}/groupBoard/writeForm.do">그룹 게시물 작성</a>
	<a href="${root}/groupBoard/list.do">그룹 게시판</a>
</body>
</html>