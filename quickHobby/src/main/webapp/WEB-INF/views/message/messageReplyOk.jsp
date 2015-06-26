<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>게시판</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<!-- 쪽지 답장 결과 표시 후 페이지 이동 -->
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("답장이 완료되었습니다.");
			location.href="${root}/message/messageReceiveList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("답장에 실패했습니다.");
			location.href="${root}/message/messageReceiveList.do";
		</script>
	</c:if>
</body>
</html>