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
	
	<!-- 게시물 삭제 결과 표시 후 페이지 이동. -->
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("게시물 삭제가 완료되었습니다.");
			location.href="${root}/apply/applyList.do";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("게시물 삭제에 실패했습니다.");
			location.href="${root}/apply/applyRead.do?apply_num=${apply_num}";
		</script>
	</c:if>

</body>
</html>