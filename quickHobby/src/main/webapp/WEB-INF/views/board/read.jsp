<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tip & Review</title>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" type="text/css" href="${root}/css/board/board.css"/>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
	<div class="container">
		
	</div>
	
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
		
<!-- 		수정, 삭제, 목록보기 버튼 부분 -->
		<form id="boardUD" name="boardUD"> 
			<input id="boardNum" type="hidden" name="boardNum" value="${board.boardNum}">
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			
			<div style="width:598px; border-width:2px; text-align:center;">
				<input type="button" value="Modify" onclick="boardUpdate(${board.boardNum})"/>
				<input type="button" value="Delete" onclick="boardDelete(${board.boardNum})"/>
				<input type="button" value="List" onclick="location.href='${root}/board/list.do'"/>
			</div>
		</form>
		
		<div class="board-reply" data-num="${board.boardNum}">
		
			<div class="input-group">
		      <input type="text" name="writeReply" class="form-control" placeholder="Comment...">
		      <span class="input-group-btn">
		        <button class="btn btn-default" name="replyBtn" type="button">Reply</button>
		      </span>
		    </div>
		    <br/>
		    
		    <!-- 세션값 받아와서 스크립트로 보내기 -->
			<input id="sessionNum" type="hidden" value="${member.memberNum}"/>
			
			<div class="replyDiv-wrap" >
			<c:forEach var="reply" items="${board.boardReplyList}">
				<div class="replyDiv" data-replynum="${reply.boardReplyNum}">
					<span class="reply_member">${reply.memberNickName}</span>
					<span class="reply_content">${reply.boardReplyContent}</span>
					<span class="reply_date"><small><fmt:formatDate value="${reply.boardReplyModifyDate}" pattern="yyyy-MM-dd HH:mm:ss"/></small></span>
					
					
					
					<c:if test="${reply.boardReplyWriter==member.memberNum}">
					<span class="reply_btns" >
						<a class="modifyBtn" style='cursor:pointer;'>수정</a>
						&nbsp;/&nbsp;
						<a class="deleteBtn" style='cursor:pointer;'>삭제</a>						
					</span>
					</c:if>
				</div>
			</c:forEach>
			</div>
		</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/board/board.js"></script>
<script type="text/javascript" src="${root}/css/boardReply/boardReply.js"></script>
<script type="text/javascript">
//  	수정 버튼 클릭 시 boardNum값과 함께 POST 방식으로 넘기기
	function boardUpdate(boardNum) {
		var boardUD = document.getElementById("boardUD");	
		boardUD.action="${root}/board/updateForm.do";
		boardUD.method="post";		
		var input=document.getElementById("boardNum");
		input.value=boardNum;
		boardUD.submit(); 
	}
	
	function boardDelete(boardNum) {
// 		삭제 버튼 클릭 시 boardNum값과 함께 POST 방식으로 넘기기
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
</html>