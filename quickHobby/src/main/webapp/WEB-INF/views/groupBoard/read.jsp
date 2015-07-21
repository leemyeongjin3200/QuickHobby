<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 50px; margin-bottom: 30px">
		<input type="hidden" name="pageNumber" value="${pageNumber}" />
		<!--======================게시글 read content========================== -->
		<div class="row-fluid">
			<div class="span8">
				<!-- 게시글 .board 시작 -->
				<div class="board">
					<div class="board-item well">
						<h3>${groupBoard.groupBoardSubject}</h3>
						<div class="board-meta clearfix">
							<p class="pull-left">
								<i class="glyphicon glyphicon-user"></i> by <a
									href="${root}/memberBoard/check.do?memberNum=${groupBoard.groupBoardWriter}">${groupBoard.memberNickName}</a>
								| <i class="glyphicon glyphicon-calendar"></i>
								<fmt:formatDate value="${groupBoard.groupBoardModifyDate}"
									pattern="yyyy-MM-dd" />
							</p>
							<p class="clearfix pull-right">
								<i class="glyphicon glyphicon-comment"></i>
								${groupBoard.groupReplyCount}
							</p>
						</div>
						<p>
							<c:if test="${groupBoard.groupBoardFileName!=null}">
								<img
									src="${root}/groupBoardImage/${groupBoard.groupBoardFileName}"
									width=100%; alt="" />
							</c:if>
							<c:if test="${groupBoard.groupBoardFileName==null}">
								<img src="${root}/groupImage/1437372698884_bunji drop.jpg"
									width="100%" alt="" />
							</c:if>

						</p>
						<p class="textArea">${groupBoard.groupBoardContent}</p>
						<p>&nbsp;</p>
					</div>
					<!-- .board-item 끝 -->
				</div>
				<!-- 게시글 .board 끝 -->
			</div>
			<!--.span8 끝 -->

			<aside class="span4">
			<div id="boardReply" data-num="${groupBoard.groupBoardNum}" class="boardReply well1">
				<h4>Comments</h4>
				<!-- 새로고침???? -->
				<!-- 세션값 받아와서 스크립트로 보내기 -->
				
				<!-- 답글목록 boardReply-list 시작  -->
				<div class="boardReply-list">
				<input id="sessionNum" type="hidden" value="${member.memberNum}"/>
					<div></div>
					<!--  지우지 마세요!! -->
					<!-- 리플 01 시작 -->
					<c:forEach var="boardReply" items="${groupBoard.groupReplyList}">
						<div class="boardReply media" title="replyDiv" data-replynum="${boardReply.groupReplyNum}">
							<div class="span2 pull-left boardReply-img">
								<img class="img-circle" src="${root}/pds/${boardReply.memberFileName}" alt="" />
							</div>

							<div class="span10 media-body boardReply-icon">
								<i class="glyphicon glyphicon-user"></i> by <a
									href="${root}/memberBoard/check.do?memberNum=${boardReply.groupReplyWriter}">${boardReply.memberNickName}</a><br />
								<i class="glyphicon glyphicon-time"></i>
								<fmt:formatDate value="${boardReply.groupReplyModifyDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
									
								<c:if test="${boardReply.groupReplyWriter==member.memberNum}">
                           			<a class="pull-right" style='cursor:pointer;' name="deleteReply1"><i class="glyphicon glyphicon-remove"></i></a>
                           		</c:if>
							</div>
							<div class="pull-left ReplyContent">
								<p>${boardReply.groupReplyContent}</p>
							</div>
						</div>
						<!-- 리플 01 끝 -->
					</c:forEach>
				</div>
				<!-- 답글목록 .boardReply-list 끝  -->

				<!--답글달기 .boardReply-form 시작  -->
				<div class="boardReply-form">
					<h4>Leave a Comment</h4>
					<input type="text" rows="4" name="message" id="message"	required="required" class="input-block-level"
						placeholder="Message" /> <span class="input-group-btn">
						<button type="button" name="replyBtn" class="btn btn-block btn-primary">Submit Comment</button>
					</span>
				</div>
				<!--답글달기 .boardReply-form 끝  -->
			</div>
			<!-- 답글 #boardReply 끝--> </aside>
		</div>
		<!--.row-fluid 끝  -->

		<!--  버튼 줄 시작-->
		<div class="row">
			<div class="col-12-lg" style="text-align: center">
				<c:if test="${member.memberNum == groupBoard.groupBoardWriter}">
					<a href="#" class="btn btn-primary"
						onclick="updateFunction('${groupBoard.groupBoardNum}')">Update</a>
					<a href="#" class="btn btn-primary"
						onclick="deleteFunction('${groupBoard.groupBoardNum}')">Delete</a>
				</c:if>
				<a href="#" class="btn btn-primary" onclick="moveList()">List</a>
			</div>
		</div>
		<!-- 버튼 줄.row 끝 -->
	</div>
	<!-- .container 끝 -->
	<script type="text/javascript">
		var textArea = '${groupBoard.groupBoardContent}';
		textArea = textArea.replace(/\r\n/g, '"<"br">"');
		textArea = textArea.replace(/\n/g, '"<"br">"');
		textArea = textArea.replace(/\r/g, '"<"br">"');

		$(".textArea").text(textArea);
	</script>
	<jsp:include page="updateModal.jsp"></jsp:include>
	<script type="text/javascript" src="${root}/css/groupReply/groupReply.js"></script>
</body>
</html>