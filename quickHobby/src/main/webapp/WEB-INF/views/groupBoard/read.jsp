<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<input type="hidden" name="pageNumber" value="${pageNumber}"/>
  <!--======================게시글 read content========================== -->
     <div class="row-fluid">
         <div class="span8" >
         	<!-- 게시글 .board 시작 -->
             <div class="board">
                 <div class="board-item well">
                     <h3>${groupBoard.groupBoardSubject}</h3>
                      <div class="board-meta clearfix">
                          <p class="pull-left">
                               <i class="glyphicon glyphicon-user"></i> by <a href="#">${groupBoard.memberNickName}</a> | <i class="glyphicon glyphicon-calendar"></i> <fmt:formatDate value="${groupBoard.groupBoardModifyDate}"/>
                          </p>
                          <p class="clearfix pull-right"><i class="glyphicon glyphicon-comment"></i> ${groupBoard.groupReplyCount}</p>
                      </div>
                      <p><img src="${root}/groupBoardImage/${groupBoard.groupBoardFileName}" width="100%" alt="" /></p>
                      <p>
                      	<script>
                      		var content='${groupBoard.groupBoardContent}';
                      		content=content.replaceAll("\r\n","<br>").replace(" ", "&nbsp");
                      	</script>
                      	${content}
                      </p>
 					<p>&nbsp;</p>
                </div><!-- .board-item 끝 -->
            </div><!-- 게시글 .board 끝 -->
        </div><!--.span8 끝 -->
        
        <aside class="span4">
           <div id="boardReply" class="boardReply well1">
                <h4>Comments</h4> <!-- 새로고침???? -->
                <!-- 답글목록 boardReply-list 시작  -->
                <div class="boardReply-list">
                <div></div><!--  지우지 마세요!! -->
                	<!-- 리플 01 시작 -->
                    <div class="boardReply media">
                       <div class="span2 pull-left boardReply-img">
                           <img class="img-circle" src="${root}/img/Penguins.jpg" alt="" />     
                       </div>

                       <div class="span10 media-body boardReply-icon">
                           <i class="glyphicon glyphicon-user"></i> by <a href="#">seoingoo</a><br/>
                           <i class="glyphicon glyphicon-time"></i> 13:00:00
                       </div>
                       <div class="pull-left ReplyContent">
                       <p>하하하하하 리플01 입니다. 리플01 입니다. 리플01 입니다. 리플01 입니다.</p>
                       </div>
                   </div><!-- 리플 01 끝 -->

				   <!-- 리플 02시작 -->
                   <div class="boardReply media">
                     <div class="span2 pull-left boardReply-img">
                         <img class="img-circle" src="${root}/img/Penguins.jpg" alt="" />     
                     </div>

                     <div class="span10 media-body boardReply-icon">
                         <i class="glyphicon glyphicon-user"></i> by <a href="#">seoingoo</a><br/>
                         <i class="glyphicon glyphicon-time"></i> 13:00:00
                     </div>
                     <div class="pull-left ReplyContent">
                     <p>하하하하하 리플02 입니다. 리플02 입니다. 리플02 입니다. 리플02 입니다. 리플02 입니다. 리플02 입니다. 리플02 입니다.</p>
                     </div>
                  </div><!-- 리플 02 끝 -->
                    
                  <!-- 리플 03시작 -->
                  <div class="boardReply media">
                     <div class="span2 pull-left boardReply-img">
                         <img class="img-circle" src="${root}/img/Penguins.jpg" alt="" />     
                     </div>

                     <div class="span10 media-body boardReply-icon">
                         <i class="glyphicon glyphicon-user"></i> by <a href="#">seoingoo</a><br/>
                         <i class="glyphicon glyphicon-time"></i> 13:00:00
                     </div>
                     <div class="pull-left ReplyContent">
                     <p>하하하하하 리플03 입니다. 리플03 입니다. 리플03 입니다. 리플03 입니다. 리플03 입니다. 리플03 입니다. 리플03 입니다.</p>
                     </div>
                 </div><!-- 리플 03 끝 -->
                    
                <!-- 리플 04시작 -->
                <div class="boardReply media">
                   <div class="span2 pull-left boardReply-img">
                       <img class="img-circle" src="${root}/img/Penguins.jpg" alt="" />     
                   </div>

                   <div class="span10 media-body boardReply-icon">
                       <i class="glyphicon glyphicon-user"></i> by <a href="#">seoingoo</a><br/>
                       <i class="glyphicon glyphicon-time"></i> 13:00:00
                   </div>
                   <div class="pull-left ReplyContent">
                   <p>하하하하하 리플04 입니다. 리플04 입니다. 리플04 입니다. 리플04 입니다. 하하하하하 리플04 입니다. 리플04 입니다. 리플04 입니다. 리플04 입니다.</p>
                   </div>
               </div><!-- 리플 04 끝 -->
             </div><!-- 답글목록 .boardReply-list 끝  -->
             
 			 <!--답글달기 .boardReply-form 시작  -->
             <div class="boardReply-form">
                 <h4>Leave a Comment</h4>
                 <form name="boardReply-form" id="boardReply-form">
                     <textarea rows="4" name="message" id="message" required="required" class="input-block-level" placeholder="Message"></textarea>
                     <input type="submit" value="Submit Comment" class="btn btn-block btn-primary" />
                 </form>
             </div><!--답글달기 .boardReply-form 끝  -->
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

<script src="${root}/css/apply/default.js"></script>
</body>
</html>