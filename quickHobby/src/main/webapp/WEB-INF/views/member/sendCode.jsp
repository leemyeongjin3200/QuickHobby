<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
</head>
<body>
	<form name="codeForm" onsubmit="return checkCode(this)">
		<input type="hidden" name="serverCode" value="${serverCode}"/>
		<label>인증번호</label>
		<input type="text" name="userCode"/><br/>
		<input type="submit" value="확인"/>
	</form>
</body>
</html>