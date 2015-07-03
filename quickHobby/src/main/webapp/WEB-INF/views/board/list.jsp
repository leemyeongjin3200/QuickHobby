<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root }/css/board/script.js"></script>
	<link rel="stylesheet" type="text/css" href="${root }/css/board/style.css">
</head>
<body>
<table width="530" align="center">
<tr>
<td align="right" bgcolor="D1DBDB">
<a href="${root}/board/jesus.do">목록보기</a>
</td>
<c:if test="${count==0 }">
		<table border="1" width="530" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
	</c:if>

			
	 
	<c:if test="${count!=0 }">	
	<br/><br/>
		<table border="1" width="530" cellpadding="2" cellspacing="0" align="center">
		<tr>
<td align="right" bgcolor="D1DBDB">
<a href="${root}/board/jesus.do">목록보기</a>
</td>
</tr>
			<tr> 
			
			
				<td align="center" width="70">작성자</td>
			    <td align="center" width="250">작성</td>
				<td align="center" width="100">날짜</td>
			
			</tr>
			
			<!-- Board List -->
			<c:forEach var="board" items="${jesusList}">
				<tr>
					<td>${board.board_writer}</td>						
					<td>${board.board_subject}</td>
					<td>${board.board_createdate}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	 
	
	

</tr>
</table>








</body>
</html>