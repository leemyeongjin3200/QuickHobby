<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/main.css"/>
</head>
<jsp:include page="../template/header.jsp"></jsp:include><br/><br/>
<body>
	<div class="container">
		<div class="page-header">
			<h2>그룹 게시물 수정하기</h2>
		</div>
		
	<!-- 	수정한 글 내용들을 form으로 묶어 controller로 보내기 -->
		<form name="groupBoardUpdateForm"action="${root}/groupBoard/update.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
			<input type="hidden" name="groupBoardNum" value="${groupBoardNum}"/>
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			<input type="hidden" name="groupBoardWriter" value="1" disabled="disabled"/>	<!--  value="${groupBoard.groupBoardWriter} -->
			
			<div class="form-group">
				<label for=""><span class="glyphicon glyphicon-pushpin"></span> Title</label>
				<div class="row">
					<div class="col-md-9">
						<input type="text" size="50" value="${groupBoard.groupBoardSubject}" name="groupBoardSubject" placeholder="Title"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="title" for=""><span class="glyphicon glyphicon-pencil"></span> Content</label>
				<div class="row">
					<div class="col-md-9">
						<textarea rows="14" cols="58" name="groupBoardContent" placeholder="Content">${groupBoard.groupBoardContent}</textarea>
					</div>
				</div>
			</div>
			
	<!-- 		글쓰기, 취소, 목록보기 버튼 부분 -->
			<div class="form-group">
				<div class="col-md-9">
					<input type="submit" value="Modify"/>
					<input type="button" value="List" onclick="location.href='${root}/groupBoard/list.do'"/>
				</div>
			</div>
		</form>
	</div>
	
<jsp:include page="../template/loginModal.jsp"></jsp:include>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/css/main/main.js"></script>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
</body>
</html>