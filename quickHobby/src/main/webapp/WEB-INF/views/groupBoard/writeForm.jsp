<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>그룹 게시물 작성</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<br/><br/>
	<div class="container">
		<div class="page-header">
			<h2>게시물 작성</h2>
		</div>
		
		<form name="groupBoardWriteForm" action="${root}/groupBoard/write.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
			<input type="hidden" name="groupNum" value="${groupNum}"/>
			<input type="hidden" name="groupBoardWriter" value="${member.memberNum}"/>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for=""><span class="glyphicon glyphicon-pushpin"></span> Title</label>
						<input class="form-control" type="text" name="groupBoardSubject" size="50" placeholder="Title"/>
					</div>
					
					<div class="form-group">
						<label for="" class="title"><span class="glyphicon glyphicon-pencil"></span> Content</label>
						<textarea class="form-control" rows="14" cols="58" name="groupBoardContent" placeholder="Content"></textarea>
					</div>
					
					<div class="form-group" style="text-align:right">
						<input type="submit" class="btn btn-default" value="Complete"/>
						<input type="button" class="btn btn-default" onclick="window.history.back(-1)" value="Cancel"></input>
						<input type="button" class="btn btn-default" value="List" onclick="location.href='${root}/apply/applyList.do'"/>
					</div>
				</div>
				
				<div class="col-md-5">	
					<div class="form-group">
						<label for=""><span class="glyphicon glyphicon-camera"></span> Picture</label>
						<img class="img-thumnail" alt="이미지 없음" src="${root}/img/groupBoard/no_image.png" id="userImage" height="365" width="455"><br/><br/>
						<input class="btn btn-default" type="file" name="file" id="file"/>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
function checkForm(form){
	if(form.apply_category.value==""){
		alert("You have to check at least a category.");
		form.apply_category[0].focus();
		return false;
	}
	
	if(form.apply_inout.value==""){
		alert("You have to choose indoor or outdoor.");
		form.apply_inout[0].focus();
		return false;
	}
	
	if(form.apply_date.value==""){
		alert("You have to choose the closing date.");
		form.apply_date.focus();
		return false;
	}
	
	if(form.apply_subject.value==""){
		alert("You have to input the title.");
		form.apply_subject.focus();
		return false;
	}
	
	if(form.apply_subtitle.value==""){
		alert("You have to input the subtitle.");
		form.apply_subtitle.focus();
		return false;
	}
	
	if(form.apply_content.value==""){
		alert("You have to input the content.");
		form.apply_content.focus();
		return false;
	}
}

function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>
