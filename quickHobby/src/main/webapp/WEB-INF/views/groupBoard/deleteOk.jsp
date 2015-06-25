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
	
<!-- 	삭제 성공시 -->
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("Completed.");
			location.href="${root}/groupBoard/list.do?pageNumber=${pageNumber}";
		</script>
	</c:if>
	
<!-- 	삭제 실패시 -->
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("Failed.");
			location.href="${root}/groupBoard/list.do?pageNumber=${pageNumber}";
		</script>
	</c:if>
</body>
</html>