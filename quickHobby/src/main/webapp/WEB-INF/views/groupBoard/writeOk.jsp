<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
<!-- 	글쓰기 성공시 -->
	<c:if test="${check>0}">
		<script type="text/javascript">
			location.href="${root}/groupBoard/groupPage.do?groupNum=${groupNum}";
		</script>
	</c:if>
	
<!-- 	글쓰기 실패시 -->
	<c:if test="${check==0}">
		<script type="text/javascript">
			location.href="${root}/groupBoard/groupPage.do?groupNum=${groupNum}";
		</script>
	</c:if>
</body>
</html>