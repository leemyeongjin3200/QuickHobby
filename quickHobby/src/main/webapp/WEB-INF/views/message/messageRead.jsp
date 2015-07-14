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
	<!-- 해당 번호의 쪽지 정보 -->
	<label>번호 : ${messageDto.message_num}</label><br/>
	<label>발신자 : ${messageDto.message_sender}</label><br/>
	<label>수신자 : ${messageDto.message_receiver}</label><br/>
	<label>발신시간 : <fmt:formatDate value="${messageDto.message_date}" type="both"/></label><br/>
	<br/>
	
	<!-- 수신 쪽지일 경우에만 답장 버튼 -->
	<c:if test="${member.memberNum == messageDto.message_receiver}">
		<a href="${root}/message/messageReply.do?message_receiver=${messageDto.message_sender}">답장</a>
	</c:if>
	<a href="${root}/message/messageDelete.do?message_num=${messageDto.message_num}">삭제</a>
</body>
</html>