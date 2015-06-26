<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	function groupBoardUpdate(groupBoardNum) {
//  	수정 버튼 클릭 시 boardNum값과 함께 POST 방식으로 넘기기
		var groupBoardUD = document.getElementById("groupBoardUD");	
		groupBoardUD.action="${root}/groupBoard/updateForm.do";
		groupBoardUD.method="post";
		
		var input=document.getElementById("groupBoardNum");
		input.value=groupBoardNum;
		groupBoardUD.submit(); 
	}
	
	function groupBoardDelete(groupBoardNum) {
// 		삭제 버튼 클릭 시 boardNum값과 함께 POST 방식으로 넘기기
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var groupBoardUD = document.getElementById("groupBoardUD");	
			groupBoardUD.action="${root}/groupBoard/delete.do";
			groupBoardUD.method="post";
			
			var input1=document.getElementById("groupBoardNum");
			input1.value=groupBoardNum;
			groupBoardUD.submit(); 
		}else{   //취소
		    return;
		}
	}
</script>
</head>
<body>
	<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/groupBoard/list.do">List</a>
		</div>
			
		<div>
			<label>Writer</label>
			<span>
				${groupBoard.groupBoardWriter}
			</span>
		</div>
		
		<div>
			<label>Title</label>
			<span>${groupBoard.groupBoardSubject}</span>
		</div>
		
		<div style="height:230px;">
			<label class="title" style="height:230px;">Content</label>
			<span style="height:230px;">
				<textarea rows="14" cols="58" name="groupBoardContent">${groupBoard.groupBoardContent}</textarea>
			</span>
		</div>
		
		<!-- 		수정, 삭제, 목록버기 버튼 부분 -->
		<form id="groupBoardUD" name="groupBoardUD"> 
			<input id="groupBoardNum" type="hidden" name="groupBoardNum" value="${groupBoard.groupBoardNum}">
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			
			<div style="width:598px; border-width:2px; text-align:center;">
				<input type="button" value="Modify" onclick="groupBoardUpdate(${groupBoard.groupBoardNum})"/>
				<input type="button" value="Delete" onclick="groupBoardDelete(${groupBoard.groupBoardNum})"/>
				<input type="button" value="List" onclick="location.href='${root}/groupBoard/list.do'"/>
			</div>
		</form>
</body>
</html>