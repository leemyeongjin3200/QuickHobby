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
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
	<div class="container">
		<br/><br/><br/><br/>
		<!-- 해당 게시물에 대한 정보 -->
		<label>번호 : ${applyDto.apply_num}</label><br/>
		<label>제목 : ${applyDto.apply_subject}</label><br/>
		<label>파일경로 : ${applyDto.apply_filepath}</label><br/>
		<label>조회수 : ${applyDto.apply_readcount}</label><br/><br/>
		<img id=weather style="width:304px; height:228px;" src="${root}/weather/questionMark.jpg">
		<h4>${weather.wf}</h4>
		<h4>최저 : ${weather.tmn}</h4>
		<h4>최고 : ${weather.tmx}</h4>
		
		<a href="${root}/apply/applyUpdate.do?apply_num=${applyDto.apply_num}">수정</a><br/>
		<a href="${root}/apply/applyDelete.do?apply_num=${applyDto.apply_num}">삭제</a>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		if("${weather.wf}" != ""){
		
		var wf="${weather.wf}";
		var url="${root}/weather/" + wf + ".jpg";
		
			$("#weather").attr("src", url);
		}
	});
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>