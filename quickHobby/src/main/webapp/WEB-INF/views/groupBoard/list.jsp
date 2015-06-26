<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Group Board</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
<!-- 	글쓰기 페이지로 이동 -->
	<a href="${root}/groupBoard/writeForm.do">Write</a>
	
<!-- 	글 리스트가 없는 경우 안내메시지 출력 -->
	<c:if test="${count==0}">
		<div>
			<div>
				<span >There is nothing.</span>
			</div>
		</div>
	</c:if>
	
<!-- 	글 리스트가 있는 경우 글들 리스트형으로 출력 -->
	<c:if test="${count>0}">
		<div>
			<c:forEach var="groupBoard" items="${groupBoardList}">
			
<!-- 			boardVisible 값이 1인 글들만 출력 -->
				<c:if test="${groupBoard.groupBoardVisible==1}">
					<span>${groupBoard.groupBoardWriter}</span>
					<a href="${root}/groupBoard/read.do?groupBoardNum=${groupBoard.groupBoardNum}&pageNumber=${currentPage}">${groupBoard.groupBoardSubject}</a>
					<small>${groupBoard.groupBoardModifyDate}</small>
					<span>${groupBoard.groupBoardReadCount}</span><br/><br/>
				</c:if>
				
			</c:forEach>
		</div>
	</c:if>
	
<!-- 	페이지 이동 부분 -->
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
				<a href="${root}/groupBoard/list.do?pageNumber=${startPage-pageBlock}">[Previous]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root}/groupBoard/list.do?pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
				<a href="${root}/groupBoard/list.do?pageNumber=${startPage+pageBlock}">[Next]</a>
			</c:if>
		</c:if>
	</center>
</body>
</html>