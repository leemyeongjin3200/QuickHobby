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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/memberBoard/memberBoard.css"/>

<title>My Page</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body style="font-family:'맑은 샘물', Sans-serif;">
<!--main-->
<div class="container">
	<div class="row">
      <!--left-->
      <div class="col-md-3" id="leftCol">
        <div class="" id="sidebar" style="background-color:#white;">
 			<div class="single_gMember" >
                    <div class="gMember_img">
                    	<img src="${root}/pds/default.PNG" alt="img">
                    </div>
                   <ul class="list-unstyled groupApply-list" style="text-align:left;">
	                    <li><i class="glyphicon glyphicon-user"></i><b> NickName : </b><span><a href="#"> ${member.memberNickName}</a></span></li>
	                    <li><i class="glyphicon glyphicon-star"></i><b> Member Level : </b><span> ${member.memberLevel}</span></li>
	                    <li><i class="glyphicon glyphicon-zoom-in"></i><b> SNS : </b><span><a href="#"> ${member.memberSNS}</a></span></li>
                </ul>
                <a href="#" class="btn btn-primary btn-block" style="">send a Message</a>                    
             </div>
        </div>
      </div>
      <!--/left-->
      
      <c:if test="${count!=0}">
      <!--right-->
      <div class="col-md-9" id="content1">
      <div id="append">
      	<c:forEach var="board" items="${memberBoardList}" begin="0" end="3">
      		<!--  myBoard 01 시작-->
      	    <div class="myBoard">
                <div class="myBoard-item">
                        <h4><strong>${board.board_subject}</strong></h4>
                        <div class="clearfix myBoard-underline">
                            <p class="pull-left">
                              <i class="glyphicon glyphicon-user"></i> by <a href="#">${member.memberNickName}</a> | <i class="glyphicon glyphicon-tag"></i> Category <a href="#">TIP</a> | <i class="glyphicon glyphicon-calendar">${board.board_date}</i>
                              
                          <p class="pull-right"><i class="glyphicon glyphicon-comment"></i> 3 Comments</p>    
                      </div>

                      <p class="img"><img src="${root}/img/Koala.jpg" width="100%" alt="" /></p>
                      <hr>
                      <p>${board.board_content}
                      </p>
			          
			          <!-- 리플 패널 시작 -->
			          <div class="myBoardReply-panel panel panel-default" >
                        <div class="panel-body">
                            <ul class="myBoardReply-box">
                            	<!-- 리플1 시작-->
                                <li class="clearfix myBoardReplyItem">
                                    <div class="col-sm-1 myBoardReply-img">
                                        <img src="${root}/img/Penguins.jpg" alt="User" class="img-circle" />
                                    </div>
                                    <div class="col-sm-11 myBoardReply-body">                                        
                                            <strong ><i class="glyphicon glyphicon-user"></i> by <a href="#">seoingoo</a></strong>
                                            <small class="pull-right text-muted">
                                                <i class="glyphicon glyphicon-time"></i>13:00:00
                                            </small>                                      
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                            Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li><!-- 리플1 끝-->
                                
                                <!-- 리플2 시작-->
                                <li class="clearfix myBoardReplyItem">
                                    <div class="col-sm-1 myBoardReply-img">
                                        <img src="${root}/img/Penguins.jpg" alt="User" class="img-circle" />
                                    </div>
                                    <div class="col-sm-11 myBoardReply-body">                                        
                                            <strong ><i class="glyphicon glyphicon-user"></i> by <a href="#">seoingoo</a></strong>
                                            <small class="pull-right text-muted">
                                                <i class="glyphicon glyphicon-time"></i>13:00:00
                                            </small>                                      
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                            Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li><!-- 리플2 끝-->
                            </ul>
                        </div><!-- .panel-body 끝 -->

                        <div class="panel-footer">
                            <div class="input-group">
                                <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message to send..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-sm">  Send </button>
                                </span>
                            </div>
                        </div><!-- .panel-footer 끝 -->
                    </div><!-- .myBoardReply-panel 끝 -->
       		 	</div><!-- .myBoard-item 끝 -->
			</div><!-- .myBoard  01끝 -->
		</c:forEach>
		</div>
     </div>
     <!--/right-->
     </c:if>
		
		<!--  myBoard 02 시작-->
      		
		<!-- .myBoard  02끝 -->
			
  	</div><!--/row-->
</div>
<!--/container-->

<script type="text/javascript" src="${root}/css/memberBoard/memberBoard.js"></script>
</body>
<script>
	$(document).ready(function(){
		$(window).scroll(function(){
			var dheight = $(document).height();
			var sheight = $(window).scrollTop() + $(window).height();
  
			if(dheight == sheight){
				$("c:forEach").clone().attr({"begin":"4", "end":"7"}).appendTo("#content1");
			}
		});
	});
	
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>