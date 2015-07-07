<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
<form name="loginForm" action="${root}/member/login.do" method="post">
	<label>이메일</label>
	<input type="text" name="memberEmail"><br/>
	
	<label>비밀번호</label>
	<input type="password" name="memberPassword"/><br/>
	
	<input type="submit" value="login">
</form>

</body>
</html>