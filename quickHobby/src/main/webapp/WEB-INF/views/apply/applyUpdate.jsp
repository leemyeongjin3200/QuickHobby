<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/css/apply/apply.js"></script>
<script type="text/javascript">
//	달력을 통해 날짜 입력 받기
	$(function(){
		$("#date").datepicker({
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
			showOn: "button",
			buttonImage: "",
			buttonImageOnly: true
		});
	});
</script>
</head>
<body>
	<!-- 신청게시물의 수정 정보를 입력 받는 form -->
	<form action="${root}/apply/applyUpdateOk.do" method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">
		<input type="hidden" value="1" name="apply_host"/>
		<input type="hidden" value="${applyDto.apply_num}" name="apply_num"/>
		
		<label>작성자</label>
		<input type="text" value="seo" disabled="disabled"/><br/>
		
		<label>제목</label>
		<input type="text" name="apply_subject" value="${applyDto.apply_subject}"/><br/>
		
		<label>부제</label>
		<input type="text" name="apply_subtitle" value="${applyDto.apply_subtitle}"/><br/>
		
		<label>종목</label>
		<input type="text" name="apply_section" value="${applyDto.apply_section}"/><br/>
		
		<label>장소</label>
		<input type="text" name="apply_location" value="${applyDto.apply_location}"/><br/>
		
		<label>내용</label>
		<textarea rows="4" cols="50" name="apply_content">${applyDto.apply_content}</textarea><br/>
		
		<label>날짜</label>
		<input type="text" name="apply_date" id="date"/>
		<fmt:formatDate value="${applyDto.apply_closedate}" type="date"/><br/>
		
		<label>사진</label>
		<input type="file" name="apply_file"/><label>${applyDto.apply_filename}</label><br/>
		
		<input type="submit" value="수정"/>
		<input type="reset" value="다시작성"/>
		<input type="button" value="목록보기" onclick=""/>
	</form>
</body>
</html>