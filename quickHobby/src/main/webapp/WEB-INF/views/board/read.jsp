<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tip / Review Board</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	function boardUpdate(boardNum) {
		var boardUD = document.getElementById("boardUD");	
		boardUD.action="${root}/board/updateForm.do";
		boardUD.method="post";
		
		var input=document.getElementById("boardNum");
		input.value=boardNum;
		boardUD.submit(); 
	}
	
	function boardDelete(boardNum) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var boardUD = document.getElementById("boardUD");	
			boardUD.action="${root}/board/delete.do";
			boardUD.method="post";
			
			var input1=document.getElementById("boardNum");
			input1.value=boardNum;
			boardUD.submit(); 
		}else{   //취소
		    return;
		}
	}
</script>
</head>
<body>
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/board/list.do">List</a>
		</div>
			
		<div>
			<label>Writer</label>
			<span>
				${board.boardWriter}
			</span>
		</div>
		
		<div>
			<label>Title</label>
			<span>${board.boardSubject}</span>
		</div>
		
		<div style="height:230px;">
			<label class="title" style="height:230px;">Content</label>
			<span style="height:230px;">
				<textarea rows="14" cols="58" name="boardContent">${board.boardContent}</textarea>
			</span>
		</div>
		
		<div >
			<label >Recommand</label>
			<span >
				${board.boardRecommand}
			</span>
		</div>
		
		<form id="boardUD" name="boardUD"> 
			<input id="boardNum" type="hidden" name="boardNum" value="${board.boardNum}">
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			
			<div style="width:598px; border-width:2px; text-align:center;">
				<input type="button" value="Modify" onclick="boardUpdate(${board.boardNum})"/>
				<input type="button" value="Delete" onclick="boardDelete(${board.boardNum})"/>
				<input type="button" value="List" onclick="location.href='${root}/board/list.do'"/>
			</div>
		</form>
</body>
</html>