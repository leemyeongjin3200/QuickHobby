<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="root1" value="${pageContext.request.requestURI }"/>
<link rel="stylesheet" type="text/css" href="${root}/css/board/bootstrap-responsive.min.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/board/readBoard.css"/>
<style>

</style>

<title>Tip & View Read</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<div class="container">
<!-- Page Header -->
     <div class="row">
         <div class="col-lg-12">
             <h1 class="page-header">일반게시판
                 <small>Tip & Review</small>
             </h1>
         </div>
     </div><!-- .row Page Header끝 -->
  <!--======================게시글 read content========================== -->
     <div class="row-fluid">
         <div class="span8" >
         	<!-- 게시글 .board 시작 -->
             <div class="board">
                 <div class="board-item well">
                     <h3>${board.boardSubject}</h3>
                      <div class="board-meta clearfix">
                          <p class="pull-left">
                               <i class="glyphicon glyphicon-user"></i> by <a href="#">${board.boardWriter}</a> | <i class="glyphicon glyphicon-tag"></i> Category <a href="#">${board.boardSection}</a> | <i class="glyphicon glyphicon-calendar"></i> ${board.boardModifyDate}
                          </p>
                          <p class="clearfix pull-right"><i class="glyphicon glyphicon-comment"></i> 3 Comments</p>
                      </div>
                      <p>
                      	<c:if test="${board.boardFileName==null}">
                      		<img src="${root}/img/Chrysanthemum.jpg" width="100%" alt="" />
                      	</c:if>
                      	
                      	<c:if test="${board.boardFileName!=null}">
                      		<img src="${root}/boardImage/${board.boardFileName}" width="100%" alt="" />
                      	</c:if>
                      </p>
                      <p>${board.boardContent}</p>
 					<p>&nbsp;</p>
                </div><!-- .board-item 끝 -->
            </div><!-- 게시글 .board 끝 -->
        </div><!--.span8 끝 -->
        
        <aside class="span4">
           <div id="boardReply" data-num="${board.boardNum}" class="boardReply well1">
                <h4>Comments</h4> <!-- 새로고침???? -->
                <!-- 답글목록 boardReply-list 시작  -->
                
                <!-- 세션값 받아와서 스크립트로 보내기 -->
				<input id="sessionNum" type="hidden" value="${member.memberNum}"/>
				
                <div class="boardReply-list">
                <div></div><!--  지우지 마세요!! -->
                	<!-- 리플 01 시작 -->
                	<c:forEach var="reply" items="${board.boardReplyList}">
                	
                    <div class="boardReply media" data-replynum="${reply.boardReplyNum}">
                       <div class="span2 pull-left boardReply-img">
                           <img class="img-circle" src="${root}/pds/${reply.memberFileName}" alt="" />     
                       </div>

                       <div class="span10 media-body boardReply-icon">
                           <i class="glyphicon glyphicon-user"></i> by <a href="#">${reply.memberNickName}</a><br/>
                           <i class="glyphicon glyphicon-time"></i> <fmt:formatDate value="${reply.boardReplyModifyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                       </div>
                       <div class="pull-left ReplyContent">
                       <p>${reply.boardReplyContent}</p>
                       </div>
                    </div><!-- 리플 01 끝 -->
                    
                    </c:forEach>

             </div><!-- 답글목록 .boardReply-list 끝  -->
             
 			 <!--답글달기 .boardReply-form 시작  -->
             <div class="boardReply-form">
                 <h4>Leave a Comment</h4>
<!--                  <form name="boardReply-form" id="boardReply-form"> -->
                     <input type="text" rows="4" name="message" id="message" required="required" class="input-block-level" placeholder="Message"/>
                     <span class="input-group-btn">
                     	<button type="button" name="replyBtn" class="btn btn-block btn-primary">Submit Comment</button>
                     </span>
<!--                  </form> -->
             </div><!--답글달기 .board-reply 끝  -->
         </div><!-- 답글 #boardReply 끝-->
      </aside>
   </div><!--.row-fluid 끝  -->
    
   <!--  버튼 줄 시작-->
   <div class="row">
	<div class="col-12-lg" style="text-align:center">
		<a href="#" class="btn btn-primary" >previous</a>
        <a href="#" class="btn btn-primary" >to List</a>
        <a href="#" class="btn btn-primary" >next</a>
	</div>
  </div><!-- 버튼 줄.row 끝 -->
</div><!-- .container 끝 -->

<%-- <script src="${root}/css/apply/default.js"></script> --%>
<script type="text/javascript">

</script>
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