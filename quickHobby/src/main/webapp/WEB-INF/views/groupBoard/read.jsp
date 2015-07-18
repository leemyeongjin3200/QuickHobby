<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<jsp:include page="../template/header.jsp"></jsp:include><br/><br/>
<body>
	<div class="container">	
		<div class="page-header">
			<h2></h2>
		</div>
			
		<div class="col-md-6">
			<c:if test="${groupBoard.groupBoardFileName == null}">
				<img src="${root}/groupImage/1436243673802_패러글라이딩.jpg">
			</c:if>
			
			<c:if test="${groupBoard.groupBoardFileName != null}">
				<img style="width:400px; height:300px;" src="${root}/weather/${groupBoard.groupBoardFileName}">
			</c:if>
			
		</div>
		
		<div class="col-md-6">	
			<div class="form-group">
				<label for=""><span class="glyphicon glyphicon-user"></span> Writer</label>
				<div class="row">
					<div class="col-md-9">
						<input type="text" class="form-control" value="${groupBoard.groupBoardWriter}" disabled>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for=""><span class="glyphicon glyphicon-pushpin"></span> Title</label>
				<div class="row">
					<div class="col-md-9">
						<input type="text" class="form-control" value="${groupBoard.groupBoardSubject}" disabled>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for=""><span class="glyphicon glyphicon-pencil"></span> Content</label>
				<div class="row">
					<div class="col-md-9">
						<textarea rows="14" cols="58" name="groupBoardContent" class="form-control" disabled>${groupBoard.groupBoardContent}</textarea>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-9">
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
				</div>
			</div>
		</div>
	</div>
	
	
		<div class="board-reply" data-num="${groupBoard.groupBoardNum}">
		
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
<jsp:include page="../template/loginModal.jsp"></jsp:include>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/css/main/main.js"></script>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
</html>