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
	<!-- 보낸 쪽지가 하나도 없을 경우 -->
	<c:if test="${messageList.size() == 0}">
		<table border="1" width="1030" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="center">저장된 쪽지가 없습니다.</td>
			</tr>
		</table>
	</c:if>
	
	<!-- 보낸 쪽지가 하나라도 있을 경우 -->
	<c:if test="${messageList.size() > 0 }">
		<table border="1" width="1030" cellpadding="2" cellspacing="0" align="center">
			<tr> 
				<td align="center" width="30">번호</td>
				<td align="center" width="150">수신자</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="200">발신시간</td>
			</tr>
			
			<!-- Send Message List -->
			<c:forEach var="message" items="${messageList}">
			<tr>
				<td>${message.message_num}</td>
				<td>${message.message_receiver}</td>
				<td>
					<a href="${root}/message/messageRead.do?message_num=${message.message_num}">${message.message_subject}</a>
				</td>
				<td><fmt:formatDate value="${message.message_date}" type="both"/></td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>