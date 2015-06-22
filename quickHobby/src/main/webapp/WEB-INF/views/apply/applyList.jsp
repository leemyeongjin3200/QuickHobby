<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<c:if test="${applyDtoList.size() == 0}">
		<table border="1" width="530" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="center">신청게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test="${applyDtoList.size() > 0 }">
		<table border="1" width="1030" cellpadding="2" cellspacing="0" align="center">
			<tr> 
				<td align="center" width="30">번호</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="250">부제</td>
				<td align="center" width="150">작성자</td>
				<td align="center" width="150">종목</td>
				<td align="center" width="150">장소</td>
				<td align="center" width="250">내용</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="150">모임일</td>
				<td align="center" width="100">조회수</td>
				<td align="center" width="100">추천수</td>
			</tr>
			
			<!-- Apply List -->
			<c:forEach var="board" items="${applyDtoList}">
			<tr>
				<td>${board.apply_num}</td>
				<td>
					<a href="">${board.apply_subject}</a>
				</td>
				<td>${board.apply_subtitle}</td>
				<td>${board.apply_host}</td>
				<td>${board.apply_section}</td>
				<td>${board.apply_location}</td>
				<td>${board.apply_content}</td>
				<td><fmt:formatDate value="${board.apply_modifydate}" type="date"/></td>
				<td><fmt:formatDate value="${board.apply_closedate}" type="date"/></td>
				<td>${board.apply_readcount}</td>
				<td>${board.apply_recommend}</td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	<br/>
</body>
</html>