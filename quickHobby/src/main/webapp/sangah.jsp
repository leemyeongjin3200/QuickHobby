<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 요청페이지에서 board_writer의 값과 groupboard_writer의 값들을 받아서 get방식으로 controller에 값들을 보낸다. -->
 

<c:set var="root" value="${pageContext.request.contextPath}"/>
<a href="${root}">test</a>
<a href="${root}/memberBoard/check.do?board_writer=1&&groupboard_writer=1">개인 게시판</a>

</body>
</html>