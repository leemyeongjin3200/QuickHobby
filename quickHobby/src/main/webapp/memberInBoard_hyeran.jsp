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
<link rel="stylesheet" type="text/css" href="${root}/css/memberBoard/memberBoard.css"/>
<style>
/**  */
</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
<!--main-->
<div class="container">
	<div class="row">
      <!--left-->
      <div class="col-md-3" id="leftCol">
        <div class="" id="sidebar" style="background-color:#white;">
 			<div class="single_gMember" >
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                   <ul class="list-unstyled groupApply-list">
                    <li><i class="glyphicon glyphicon-user"></i><span><a href="#"> Leemyeongjin</a></span></li>
                    <li><i class="glyphicon glyphicon-star"></i><b>Member Level: </b><span> USER</span></li>
                    <li><i class="glyphicon glyphicon-zoom-in"></i><b>SNS: </b><span><a href="#"> Look around!</a></span></li>
                </ul>                    
             </div>
        </div>
      </div><!--/left-->
      
      <!--right-->
      <div class="col-md-9" id="content1">
      		<!--  myBoard 01 시작-->
      	   <div class="myBoard">
                <div class="myBoard-item">
                        <h4><strong>제목입니다. 제목입니다. 제목입니다.</strong></h4>
                        <div class="clearfix myBoard-underline">
                            <p class="pull-left">
                              <i class="glyphicon glyphicon-user"></i> by <a href="#">leemyeongjin</a> | <i class="glyphicon glyphicon-tag"></i> Category <a href="#">TIP</a> | <i class="glyphicon glyphicon-calendar"></i> 2015-07-09
                          </p>
                          <p class="pull-right"><i class="glyphicon glyphicon-comment"></i> 3 Comments</p>    
                      </div>

                      <p class="img"><img src="${root}/img/Chrysanthemum.jpg" width="100%" alt="" /></p>
                      <hr>
                      <p>Proin gravida nibh vel velit auctor aliquet. 
                      Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. 
                      Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. 
                      Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. 
                      Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
                      Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. 
                      Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. 
                      Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. 
                      Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
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
			
			<!--  myBoard 02 시작-->
      	   <div class="myBoard">
                <div class="myBoard-item">
                        <h4><strong>제목입니다. 제목입니다. 제목입니다.</strong></h4>
                        <div class="clearfix myBoard-underline">
                            <p class="pull-left">
                              <i class="glyphicon glyphicon-user"></i> by <a href="#">leemyeongjin</a> | <i class="glyphicon glyphicon-tag"></i> Category <a href="#">TIP</a> | <i class="glyphicon glyphicon-calendar"></i> 2015-07-09
                          </p>
                          <p class="pull-right"><i class="glyphicon glyphicon-comment"></i> 3 Comments</p>    
                      </div>

                      <p class="img"><img src="${root}/img/Chrysanthemum.jpg" width="100%" alt="" /></p>
                      <hr>
                      <p>Proin gravida nibh vel velit auctor aliquet. 
                      Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. 
                      Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. 
                      Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. 
                      Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
                      Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. 
                      Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. 
                      Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. 
                      Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
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
			</div><!-- .myBoard  02끝 -->
			
        	<div class="readMore">
    			<button type="button" class="btn btn-primary btn-block" data-toggle="collapse" data-target="#demo">read more</button>
			</div>
			
			<!--  myBoard 03 시작-->
      	   <div class="myBoard collapse" id="demo">
                <div class="myBoard-item">
                        <h4><strong>제목입니다. 제목입니다. 제목입니다.</strong></h4>
                        <div class="clearfix myBoard-underline">
                            <p class="pull-left">
                              <i class="glyphicon glyphicon-user"></i> by <a href="#">leemyeongjin</a> | <i class="glyphicon glyphicon-tag"></i> Category <a href="#">TIP</a> | <i class="glyphicon glyphicon-calendar"></i> 2015-07-09
                          </p>
                          <p class="pull-right"><i class="glyphicon glyphicon-comment"></i> 3 Comments</p>    
                      </div>

                      <p class="img"><img src="${root}/img/Chrysanthemum.jpg" width="100%" alt="" /></p>
                      <hr>
                      <p>Proin gravida nibh vel velit auctor aliquet. 
                      Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. 
                      Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. 
                      Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. 
                      Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
                      Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. 
                      Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. 
                      Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. 
                      Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
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
			</div><!-- .myBoard  03끝 -->
        </div><!--/right-->
  	</div><!--/row-->
</div><!--/container-->

 

<script>
//
</script>
<script type="text/javascript" src="${root}/css/memberBoard/memberBoard.js"></script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
</html>