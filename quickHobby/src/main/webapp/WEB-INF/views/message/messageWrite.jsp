<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/css/message/message.js"></script>
</head>
<body>
	<!-- 새로운 쪽지 정보를 입력 받는 form -->
	<form action="${root}/message/messageWriteOk.do" method="post" onsubmit="return checkForm(this)">
		<input type="hidden" value="2" name="message_sender"/>
		<input type="hidden" value="1" name="message_receiver"/><br/>
		
		<label>발신자</label>
		<input type="text" value="kim" disabled="disabled"/><br/>
		
		<label>수신자</label>
		<input type="text" value="seo" disabled="disabled"/><br/>
		
		<label>제목</label>
		<input type="text" name="message_subject"/><br/>
		
		<label>내용</label>
		<textarea rows="4" cols="50" name="message_content"></textarea><br/>
		
		<input type="submit" value="전송"/>
		<input type="button" value="발송함" onclick="location.href='${root}/message/messageSendList.do'"/>
		<input type="button" value="수신함" onclick="location.href='${root}/message/messageReceiveList.do'"/>
	</form>
</body>
</html>