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
	<!-- 해당 게시물에 대한 정보 -->
	<label>번호 : ${applyDto.apply_num}</label><br/>
	<label>제목 : ${applyDto.apply_subject}</label><br/>
	<label>파일경로 : ${applyDto.apply_filepath}</label><br/>
	<label>조회수 : ${applyDto.apply_readcount}</label><br/><br/>
	
	<a href="${root}/apply/applyUpdate.do?apply_num=${applyDto.apply_num}">수정</a><br/>
	<a href="${root}/apply/applyDelete.do?apply_num=${applyDto.apply_num}">삭제</a>
</body>
</html>