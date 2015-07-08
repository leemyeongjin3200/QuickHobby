<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="jquery/lib/jquery.js"></script>
<script type="text/javascript" src="jquery/lib/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="jquery/lib/jquery.ajaxQueue.js"></script>
<script type="text/javascript" src="jquery/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="jquery/jquery.autocomplete.css" />
</head>
<body>
	<a href="${root}">test</a><br/> 
	<a href="${root}/apply/applyWrite.do">모이자 게시물 작성</a>
	<a href="${root}/apply/applyList.do">모이자 게시판</a><br/>
	<a href="${root}/message/messageWrite.do">쪽지 쓰기</a>
	<a href="${root}/message/messageSendList.do">발송함</a>
	<a href="${root}/message/messageReceiveList.do">수신함</a><br/><br/>
	
	
	<script>
	var availableTags = [
							"가나",
							"가나쵸콜렛",
							"갈갈이 삼형제",
							"북마크",
							"북까페",
							"엄마",
							"아빠",
							"북소리",
							"여러분",
							"소문",
							"소문난 식당",
							"나나나",
							"쇼",
							"쇼팽",
							"모나미",
							"한강",
							"강강수월래",
							"강촌",
							"제주도",
							"삼총사",
							"먹보",
							"먹소리",
							"수박",
							"수박 겉핥기",
							"java",
							"c++",
							"php",
							"Android"
						];
	</script>

	<script>
	$(document).ready(function() {
	    $("#searchbox").autocomplete(availableTags,{ 
	        matchContains: false,
	        selectFirst: false
	    });
	});
	</script>
	
	<form name="form1" method="post" action="#">
	  <input type="text" id="searchbox">
	  <input type="submit" id="sumit" value="검색">
	</form><br/>

	
</body>
</html>