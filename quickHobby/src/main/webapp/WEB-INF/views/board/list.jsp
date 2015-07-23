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
<link rel="stylesheet" type="text/css" href="${root}/css/board/board.css"/>
<style type="text/css">
.board{
	min-height:100%;
}
</style>
<title>Tip/Review</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<c:if test="${param.loginCheck==1}">
	<script type="text/javascript">
		$("#myModal").modal();
	</script>
</c:if>
<!-- 일반게시판 Content 시작 -->
<div class="container board">
	<!-- Page Header -->
     <div class="row">
         <div class="col-lg-12">
             <h1 class="page-header">일반게시판
                 <small>Tip & Review</small>
             </h1>
         </div>
     </div><!-- .row 끝 -->
	<!-- Tab 선택하기 전체/tip/review -->
	<ul class="nav nav-tabs">
	    <li class="active"><a>Tip & Review</a></li>
	</ul>

  	<div class="tab-content">
 	<!-- menu1 전체 게시판 시작 -->
   	<div id="menu1" class="tab-pane fade in active">
    	<section class="panel">
           <!--menu1 전체 게시판 list/album선택하기-->
               <header class="panel-heading tab-bg-default tab-right">
                   <ul class="nav nav-pills pull-right">
                       <li class="active">
                           <a data-toggle="pill" href="#list1">
                               <i class="glyphicon glyphicon-th-list"></i>
                           </a>
                       </li>
                       <li class="">
                           <a data-toggle="pill" href="#album1">
                               <i class="glyphicon glyphicon-th-large"></i>
                           </a>
                       </li>
                   </ul>
               </header>
               <!-- menu1 전체의 body -->
               <div class="panel-body">
                   <div class="tab-content">
                   <!-- menu1 전체의 list1 시작--> 
                       <div id="list1" class="tab-pane active" >
                       	<div class="row-fluid">
							<div class="gTable">
								<!-- list1 header -->
								<div class="gTableRow">
									<div class="gTableHead number"><strong>#</strong></div>
									<div class="gTableHead nickname"><strong>NickName</strong></div>
									<div class="gTableHead title"><strong>Title</strong></div>
									<div class="gTableHead date"><i class="glyphicon glyphicon-calendar"></i><strong> Date</strong></div>
									<div class="gTableHead count"><strong>Views</strong></div>
									<div class="gTableHead good"><span style="color:white">a</span></div>
								</div>
								
								<!-- list1 contents -->
		
								<div class="gTableRow">
								
									<c:forEach var="board" items="${boardList}">
									<!-- boardVisible 값이 1인 글들만 출력 -->
										<c:if test="${board.boardVisible==1}">
											<div class="gTableCell number">${board.boardNum}</div>
											<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
												<a href="${root}/memberBoard/check.do?memberNum=${board.boardWriter}">${board.memberNickName}</a></div>
											<div class="gTableCell titlec">
											
											<!-- tip/review 구분하기 -->
												<c:if test="${board.boardSection=='t'}"><span class="label label-default">Tip</span></c:if>
												<c:if test="${board.boardSection=='r'}"><span class="label label-default">Review</span></c:if>
											<!-- tip/review 구분하기 -->
											
												&nbsp;<a href="${root}/board/read.do?boardNum=${board.boardNum}&pageNumber=${currentPage}">${board.boardSubject}&nbsp;</a>
												<i class="glyphicon glyphicon-comment"></i><a onclick="replyCheck('${board.boardNum}','${currentPage}')"class="myReply" style='cursor:pointer;'><b>${board.boardReplyCount}</b></a></div>
											<div class="gTableCell date"><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate type="both" value="${board.boardModifyDate}" pattern="E M/d, KK:mm a"/></div>
											<div class="gTableCell count">${board.boardReadCount}</div>
											<div class="gTableCell good"></div>
										</c:if>
									<!-- boardVisible 값이 1인 글들만 출력 -->
									</c:forEach>
									
								</div><!-- .gTableRow 끝-->
							</div> <!-- .gTable 끝  -->
							<div class="col-lg-1 btns" style="float:right">
								<div class="clearfix" style="margin-top: 20px; text-align:right">
									<c:if test="${member != null}">
										<a href="#" class="btn btn-primary  btn-sm btn-block" onclick="writeBoard('${member.memberNum}')">Write</a>
									</c:if>
								</div>
							</div>
					</div><!-- .row-fluid 끝 -->
                   </div><!-- #list1 끝 -->

                   <!-- menu1 전체의 album1 시작--> 
                   <div id="album1" class="tab-pane">
			        <div class="row-fluid">
			        	<div class="gAlbum">
				        	<c:forEach var="board" items="${boardList}">
								<!-- boardVisible 값이 1인 글들만 출력 -->
								<c:if test="${board.boardVisible==1}">
					        		<!-- album1 contents -->
					        	 	<div class="col-md-4">
					        	 	  <div class="gAlbum-img">
					        	 	  	<c:if test="${board.boardFileName==null}">
					        	 	  		<img class="img-responsive" style='cursor:pointer;' onclick="fromImgToRead('${board.boardNum}','${currentPage}')" src="${root}/img/boardImage/default.jpg" alt="Image"/>
					        	 	  	</c:if>
					        	 	  		
					        	 	  	<c:if test="${board.boardFileName!=null}">
					        	 	  		<img class="img-responsive" style='cursor:pointer;' onclick="fromImgToRead('${board.boardNum}','${currentPage}')" src="${root}/img/boardImage/${board.boardFileName}" alt="Image"/>
					        	 	  	</c:if>
					        	 	  </div>
							          <div class="gAlbum-date-wrapper">
							          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i><a href="${root}/memberBoard/check.do?memberNum=${board.boardWriter}"> ${board.memberNickName}</a></span>
							            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate type="both" value="${board.boardModifyDate}" pattern="E M/d, KK:mm a"/></span>
							            <span class="floatright" style="color:white">a</span>
							            <span class="floatright"><i class="glyphicon glyphicon-comment"></i><a onclick="replyCheck('${board.boardNum}','${currentPage}')"class="myReply" style='cursor:pointer;'><b> ${board.boardReplyCount}</b></a></span>
							            <span class="clearboth"> &nbsp; </span>
							          </div>
							          <div class="gAlbum-container">
							            <h4>
							            	<!-- tip/review 구분하기 -->
							            	<c:if test="${board.boardSection=='t'}">[Tip]</c:if>
							            	<c:if test="${board.boardSection=='r'}">[Review]</c:if>
							            	<!-- tip/review 구분하기 -->
							            <a href="${root}/board/read.do?boardNum=${board.boardNum}&pageNumber=${currentPage}">${board.boardSubject}</a></h4>
							            <p>${board.boardContent}</p>
							            <a href="${root}/board/read.do?boardNum=${board.boardNum}&pageNumber=${currentPage}" >read more <i>&raquo;</i></a>
							          </div>
							        </div><!-- .col-md-4 끝 -->
								</c:if>
						    </c:forEach>    
			        	</div><!-- .gAlbum 끝 -->
			        	
		        		<div class="col-lg-1 btns" style="float:right">
							<div class="clearfix" style="margin-top: 20px; text-align:right">
								<c:if test="${member!=null}">
									<a href="#" class="btn btn-primary  btn-sm btn-block" onclick="writeBoard('${member.memberNum}')">Write</a>
								</c:if>
							</div>
						</div>
							
                       </div><!-- .row-fluid 끝 -->
                   </div><!-- #album1 끝 -->
               </div>
             </div>
              
	        <!-- menu1 전체의 page넘기기 -->   
	       <!-- Page 설정에 관련한 변수들 설정 -->
				<c:if test="${count>0}">
				
				<c:set var="pageBlock" value="${3}"/>
				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
				
				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
				
				<c:set var="startPage" value="${rs*pageBlock+1}"/>
				<c:set var="endPage" value="${startPage+pageBlock-1}"/>
				
				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				<!-- Page 설정에 관련한 변수들 설정 -->
				<form id="boardPage" name="boardPage">
				
				<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			        <div class="row text-center">
			            <div class="col-lg-12">
			                <ul class="pagination">
			                	
			                	<!-- prev Page 버튼 생성 관련 -->
			                	<c:if test="${startPage>pageBlock}">
				                    <li>
				                        <a href="${root}/board/list.do?pageNumber=${startPage-pageBlock}">&laquo;</a>
				                    </li>
			                    </c:if>
			                    <!-- prev Page 버튼 생성 관련 -->
			                    
			                    <!-- 각 Page 버튼 생성 관련 -->
			                    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
					                <c:if test="${currentPage!=i}">
							            <li> 
				                       		<a id="messagePage" style='cursor:pointer;' onclick="movePage('${i}')" data-filter="${i}">${i}</a> 
					                    </li>    	                                                                                                                                                                                                                                                                                                                                                                                                                   
					                </c:if>
					                <c:if test="${currentPage==i}">
						                <li class="active">
							                   	<a id="currentP">${i}</a>
							            </li>  
						            </c:if>  
			                    </c:forEach>
			                    <!-- 각 Page 버튼 생성 관련 -->
			                    
								<!-- next Page 버튼 생성 관련 -->
								<c:if test="${endPage<pageCount}">
				                    <li>
				                        <a href="${root}/board/list.do?pageNumber=${startPage+pageBlock}">&raquo;</a>
				                    </li>
			                    </c:if>
			                    <!-- next Page 버튼 생성 관련 -->
			                </ul>
			            </div>
			        </div>
			    </form>
			        
				</c:if>
     	</section><!-- .panel 끝 -->
   	</div><!-- #menu1 끝 -->
  </div><!-- .tab-content 끝 -->
 </div><!-- .container 끝 -->
</body>
<jsp:include page="writeModal.jsp"></jsp:include>
<jsp:include page="replyCheckModal.jsp"></jsp:include>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/board/board.js"></script>
</html>
