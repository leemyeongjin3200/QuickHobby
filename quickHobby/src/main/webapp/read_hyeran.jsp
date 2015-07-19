<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
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
                     <h3>제목입니다. 제목입니다.</h3>
                      <div class="board-meta clearfix">
                          <p class="pull-left">
                               <i class="glyphicon glyphicon-user"></i> by <a href="#">leemyeongjin</a> | <i class="glyphicon glyphicon-tag"></i> Category <a href="#">TIP</a> | <i class="glyphicon glyphicon-calendar"></i> 2015-07-09
                          </p>
                          <p class="clearfix pull-right"><i class="glyphicon glyphicon-comment"></i> 3 Comments</p>
                      </div>
                      <p><img src="${root}/img/Chrysanthemum.jpg" width="100%" alt="" /></p>
                      <p>Contrary to popular belief, Lorem Ipsum is not simply random text. 
                      It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. 
                      Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, 
                      and going through the cites of the word in classical literature, discovered the undoubtable source. 
                      Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. 
                      This book is a treatise on the theory of ethics, very popular during the Renaissance. 
                      The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
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
<script type="text/javascript">

</script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>

</html>