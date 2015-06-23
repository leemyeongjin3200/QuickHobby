<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("회원 가입이 완료 되었습니다. 로그인 후 이용하세요.");
			//location.href="${root}/member/register.do";
			$(location).attr("href", "${root}/member/register.do");
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("회원 가입에 실패 했습니다. 다시 시도해 주세요.");
			//location.href="${root}/member/register.do";
			$(location).attr("href", "${root}/member/register.do");
		</script>
	</c:if>
</body>
</html>