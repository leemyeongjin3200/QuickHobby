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
	<form action="${root}/board/update.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<input type="hidden" name="boardNum" value="${boardNum}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
					
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/board/list.do">List</a>
		</div>
			
		<div>
			<label>Writer</label>
			<span>
				<input type="text" name="boardWriter" value="${board.boardWriter}" disabled="disabled"/>
			</span>
		</div>
		
		<div>
			<label>Title</label>
			<span><input type="text" size="50" value="${board.boardSubject}" name="boardSubject"/></span>
		</div>
		
		<div style="height:230px;">
			<label class="title" style="height:230px;">Content</label>
			<span style="height:230px;">
				<textarea rows="14" cols="58" name="boardContent">${board.boardContent}</textarea>
			</span>
		</div>
		
		<div style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="Modify"/>
			<input type="reset" value="Reset"/>
			<input type="button" value="List" onclick="location.href='${root}/board/list.do'"/>
		</div>
	</form>
</body>
</html>