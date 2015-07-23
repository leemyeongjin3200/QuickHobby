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
<c:set var="current" value="4"/>
<link rel="stylesheet" type="text/css" href="${root}/css/memberBoard/memberBoard.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/myGroup/responsive.css" /> 
<style type="text/css">
.board{
	min-height:100%;
}

</style>
<title>My Page</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<div class="container board">
  <div class="row">
           <div class="col-lg-12">
               <h1 class="page-header">${host.memberNickName}
                   <small>'s Page</small>
               </h1>
           </div>
       </div>
	<div class="row">
      <!--left-->
      <div class="col-md-3" id="leftCol">
        <div class="" id="sidebar" style="background-color:#white;">
 			<div class="single_gMember" >
                    <div class="gMember_img">
                    	<c:if test="${host.memberFileName == null}">
	                    	<img src="${root}/img/memberImage/default.PNG" alt="img"/>
	                    </c:if>
	                    <c:if test="${host.memberFileName != null}">
	                    	<img src="${root}/img/memberImage/${host.memberFileName}" alt="img"/>
	                    </c:if>
                    </div>
                   <ul class="list-unstyled groupApply-list" style="text-align:left;">
	                    <li><i class="glyphicon glyphicon-user"></i><b> NickName : </b><span>${host.memberNickName}</span></li>
	                    <li><i class="glyphicon glyphicon-star"></i><b> Member Level : </b><span> ${host.memberLevel}</span></li>
	                    <li><i class="glyphicon glyphicon-zoom-in"></i><b> SNS : </b><span><a href="http://${host.memberSNS}"> ${host.memberSNS}</a></span></li>
                </ul>
                
                <!-- 자신에게는 message를 보낼 수 없게 하기 -->
                <c:if test="${member.memberNum != host.memberNum}">
                	<a style='cursor:pointer;' onclick="replyMessage('${host.memberNum}', '${host.memberNickName}')" class="btn btn-primary btn-block">send a Message</a>   
                </c:if>
             </div>
        </div>
      </div>
      <!--/left-->
      
      <c:if test="${memberBoardList.size() != 0}">
      <!--right-->
      <div class="col-md-9" id="content1">
		<c:forEach var="board" items="${memberBoardList}">
      		<!--  myBoard 01 시작-->
      	    <div class="myBoard ${board.rnum}" style="display:none">
                <div class="myBoard-item">
                        <h4><strong>${board.boardSubject}</strong></h4>
                        <div class="clearfix myBoard-underline">
                            <p class="pull-left">
                              <i class="glyphicon glyphicon-user"></i> by <strong>${host.memberNickName}</strong>&nbsp; | &nbsp;<i class="glyphicon glyphicon-tag"></i> Category <c:if test="${board.boardSection == 't'}"><strong>Tip</strong></c:if><c:if test="${board.boardSection == 'r'}"><strong>Review</strong></c:if>&nbsp; | &nbsp;<i class="glyphicon glyphicon-calendar"><fmt:formatDate value="${board.boardModifyDate}" pattern="yyyy.MM.dd. hh:mm:ss"/></i>
                              
                          <p class="pull-right"><i class="glyphicon glyphicon-comment"></i> ${board.boardReplyCount} Comments</p>    
                      </div>
								<p class="img">
									<c:if test="${board.boardFileName==null}">
										<img src="${root}/img/boardImage/default.jpg" width="100%" alt="" />
									</c:if>
									<c:if test="${board.boardFileName!=null}">
										<img src="${root}/img/boardImage/${board.boardFileName}" width="100%" alt="" />
									</c:if>
								</p>
								<hr>
                      <p>${board.boardContent}
                      </p>
			          
					  <c:forEach var="reply" items="${board.boardReplyList}">
				          <!-- 리플 패널 시작 -->
				          <div class="myBoardReply-panel panel panel-default" >
	                        <div class="panel-body">
	                            <ul class="myBoardReply-box">
	                            	<!-- 리플1 시작-->
	                                <li class="clearfix myBoardReplyItem">
	                                    <div class="col-sm-1 myBoardReply-img">
	                                    	<c:if test="${reply.memberFileName == null}">
	                                        	<img src="${root}/img/memberImage/default.PNG" alt="User" class="img-circle" />
	                                        </c:if>
	                                        <c:if test="${reply.memberFileName != null}">
	                                        	<img src="${root}/img/memberImage/${reply.memberFileName}" alt="User" class="img-circle" />
	                                        </c:if>
	                                    </div>
	                                    <div class="col-sm-11 myBoardReply-body">                                        
	                                            <strong ><i class="glyphicon glyphicon-user"></i> by <a href="${root}/memberBoard/check.do?memberNum=${reply.boardReplyWriter}">${reply.memberNickName}</a></strong>
	                                            <small class="pull-right text-muted">
	                                                <i class="glyphicon glyphicon-time"></i>&nbsp;<fmt:formatDate value="${reply.boardReplyModifyDate}" pattern="MM.dd. hh:mm:ss"/>
	                                            </small>                                      
	                                        <p>
	                                            ${reply.boardReplyContent}
	                                        </p>
	                                    </div>
	                                </li><!-- 리플1 끝-->
	                                
	                            </ul>
	                        </div><!-- .panel-body 끝 -->
	
	                    </div><!-- .myBoardReply-panel 끝 -->
                    </c:forEach>
       		 	</div><!-- .myBoard-item 끝 -->
			</div><!-- .myBoard  01끝 -->
		</c:forEach>
		
		
     </div>
     <!--/right-->
     </c:if>	
  	</div><!--/row-->
</div>
<!--/container-->

<script type="text/javascript" src="${root}/css/memberBoard/memberBoard.js"></script>
</body>
<script>
	$(document).ready(function(){
		var size=${memberBoardList.size()};
		var count=4;
		for(var i=1; i<4; i++){
			$("."+i).css("display", "block");
		}
		
		$(window).scroll(function(){
			var dheight = $(document).height();
			var sheight = $(window).scrollTop() + $(window).height();
  
			if(dheight == sheight){
				if(count <= "${memberBoardList.size()}"){
					for(var i=count; i<count+1; i++){
						$("."+i).css("display", "block");
					}
					count++;
				}
			}
		});
	});
</script>
<script type="text/javascript" src="${root}/css/message/message.js"></script>
<jsp:include page="../message/messageModal.jsp"></jsp:include>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/main/isotope-docs.min.js"></script>
</html>