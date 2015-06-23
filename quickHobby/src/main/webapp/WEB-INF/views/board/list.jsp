<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tip / Review Board</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<a href="${root}/board/writeForm.do">Write</a>
	<div>
		<c:forEach var="board" items="${boardList}">
			<span>${board.boardWriter}</span>
			<a href="${root}/board/read.do?boardNum=${board.boardNum}&pageNumber=${currentPage}">${board.boardSubject}</a>
			<small>${board.boardModifyDate}</small>
			<span>${board.boardReadCount}</span><br/><br/>
		</c:forEach>
	</div>
	
	<center>
		<c:if test="${count>0}">
			<c:set var="pageBlock" value="${5}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<c:if test="${startPage>pageBlock}">
				<a href="${root}/board/list.do?pageNumber=${startPage-pageBlock}">[Previous]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root}/board/list.do?pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
				<a href="${root}/board/list.do?pageNumber=${startPage+pageBlock}">[Next]</a>
			</c:if>
		</c:if>
	</center>
</body>
</html>