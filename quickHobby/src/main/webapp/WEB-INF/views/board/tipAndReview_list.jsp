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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${root}/css/board/board.css"/>
<style>
/** */
</style>
<script>
//
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../../WEB-INF/views/template/header.jsp"></jsp:include>
<!-- 일반게시판 Content 시작 -->
<div class="container">
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
	    <li class="active"><a href="#menu1">전체</a></li>
	 	<li><a href="#menu2">TIP</a></li>
	 	<li><a href="#menu3">REVIEW</a></li>
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
                       <div id="list1" class="tab-pane active">
                       	<div class="row-fluid">
							<div class="gTable">
								<!-- list1 header -->
								<div class="gTableRow">
									<div class="gTableHead number"><strong>#</strong></div>
									<div class="gTableHead nickname"><strong>NickName</strong></div>
									<div class="gTableHead title"><strong>Title</strong></div>
									<div class="gTableHead date"><i class="glyphicon glyphicon-calendar"></i><strong> Date</strong></div>
									<div class="gTableHead count"><strong>Views</strong></div>
									<div class="gTableHead good"><i class="glyphicon glyphicon-heart"></i><strong> Good</strong></div>
								</div>
								
								<!-- list1 contents -->
		
								<div class="gTableRow">
								
									<c:forEach var="board" items="${boardList}">
									<!-- boardVisible 값이 1인 글들만 출력 -->
										<c:if test="${board.boardVisible==1}">
											<div class="gTableCell number">${board.boardNum}</div>
											<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
												<a href="#">${board.boardWriter}</a></div>
											<div class="gTableCell titlec"><a href="#">${board.boardSubject}&nbsp;</a>
												<i class="glyphicon glyphicon-comment"></i><a href="#"><b id="myReply"> 3</b></a></div>
											<div class="gTableCell date"><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate type="both" value="${board.boardModifyDate}" pattern="E M/d, KK:mm a"/></div>
											<div class="gTableCell count">${board.boardReadCount}</div>
											<div class="gTableCell good">${board.boardRecommand}</div>
										</c:if>
									<!-- boardVisible 값이 1인 글들만 출력 -->
									</c:forEach>
									
								</div><!-- .gTableRow 끝-->
							</div> <!-- .gTable 끝  -->
					</div><!-- .row-fluid 끝 -->
                   </div><!-- #list1 끝 -->

                   <!-- menu1 전체의 album1 시작--> 
                   <div id="album1" class="tab-pane">
			        <div class="row-fluid">
			        	<div class="gAlbum">
			        		<!-- album1 contents -->
			        	 	<div class="col-md-4">
			        	 	  <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Review]<a href="#">ㅇㅇㅇ모임 후기입니다.</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
					        </div><!-- .col-md-4 끝 -->
					        
					        <div class="col-md-4">
			        	 	  <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Tip]<a href="#">The Green Fields of Spring</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
					        </div><!-- .col-md-4 끝 -->
     
						    <div class="col-md-4" style="position:relative; top:-8px;"> <!--style (padding or margin 8px 어디인지 확인 필요!!!!!!) -->
						      <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Review]<a href="#">The Green Fields of Spring</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
 								</div><!-- .col-md-4 끝 -->
			        	</div><!-- .gAlbum 끝 -->
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
				                        <a href="#">&laquo;</a>
				                    </li>
			                    </c:if>
			                    <!-- prev Page 버튼 생성 관련 -->
			                    
			                    <!-- 각 Page 버튼 생성 관련 -->
			                    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
					                <c:if test="${currentPage!=i}">
							            <li> 
				                       		<a id="messagePage" href="" data-filter="${i}">${i}</a> 
					                    </li>    	                                                                                                                                                                                                                                                                                                                                                                                                                   
					                </c:if>
					                <c:if test="${currentPage==i}">
						                <li class="active">
							                   	<a href="" id="currentP">${i}</a>
							            </li>  
						            </c:if>  
			                    </c:forEach>
			                    <!-- 각 Page 버튼 생성 관련 -->
			                    
								<!-- next Page 버튼 생성 관련 -->
								<c:if test="${endPage<pageCount}">
				                    <li>
				                        <a href="#">&raquo;</a>
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
   	
   	<!-- menu2 Tip 게시판 시작 -->
    <div id="menu2" class="tab-pane fade"> 
    	<section class="panel">
           <!--menu2 Tip 게시판 list/album선택하기-->
               <header class="panel-heading tab-bg-default tab-right">
                   <ul class="nav nav-pills pull-right">
                       <li class="active">
                           <a data-toggle="pill" href="#list2">
                               <i class="glyphicon glyphicon-th-list"></i>
                           </a>
                       </li>
                       <li class="">
                           <a data-toggle="pill" href="#album2">
                               <i class="glyphicon glyphicon-th-large"></i>
                           </a>
                       </li>
                   </ul>
               </header>
               <!-- menu2 Tip 게시판 body -->
               <div class="panel-body">
                   <div class="tab-content">
                   <!-- menu2 Tip 게시판 list2 시작--> 
                       <div id="list2" class="tab-pane active">
                       	<div class="row-fluid">
						<div class="gTable">
							<!-- list2 header -->
							<div class="gTableRow">
								<div class="gTableHead number"><strong>#</strong></div>
								<div class="gTableHead nickname"><strong>NickName</strong></div>
								<div class="gTableHead title"><strong>Title</strong></div>
								<div class="gTableHead date"><i class="glyphicon glyphicon-calendar"></i><strong> Date</strong></div>
								<div class="gTableHead count"><strong>Views</strong></div>
								<div class="gTableHead good"><i class="glyphicon glyphicon-heart"></i><strong> Good</strong></div>
							</div>
							
							<!-- list2 contents -->
							<div class="gTableRow">
								<div class="gTableCell number">5</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Tip] ㅇㅇㅇ관련 정보입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
							
							<div class="gTableRow">
								<div class="gTableCell number">4</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Tip] ㅇㅇㅇ관련 정보입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
							
							<div class="gTableRow">
								<div class="gTableCell number">3</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Tip] ㅇㅇㅇ관련 정보입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
							
							<div class="gTableRow">
								<div class="gTableCell number">2</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Tip] ㅇㅇㅇ관련 정보입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
							
							<div class="gTableRow">
								<div class="gTableCell number">1</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Tip] ㅇㅇㅇ관련 정보입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
						</div> <!-- .gTable 끝  -->
					</div><!-- .row-fluid 끝 -->
                  </div><!-- #list2 끝 -->

                  <!-- menu2 Tip게시판 album2 시작--> 
                  <div id="album2" class="tab-pane">
			        <div class="row-fluid">
			        	<div class="gAlbum">
			        		<!-- album2 contents -->
			        	 	<div class="col-md-4">
			        	 	  <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Tip]<a href="#">ㅇㅇㅇ관련 정보입니다.</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
					        </div><!-- .col-md-4 끝 -->
					        
					        <div class="col-md-4">
			        	 	  <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Tip]<a href="#">ㅇㅇㅇ관련 정보입니다.</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
					        </div><!-- .col-md-4 끝 -->
     
						    <div class="col-md-4" style="position:relative; top:-8px;"> <!--style (padding or margin 8px 어디인지 확인 필요!!!!!!) -->
						      <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Tip]<a href="#">ㅇㅇㅇ관련 정보입니다.</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
 							</div><!-- .col-md-4 끝 -->
			        	</div><!-- .gAlbum 끝 -->
                       </div><!-- .row-fluid 끝 -->
                   </div><!-- #album2 끝 -->
               </div>
              
	        <!-- menu2 Tip게시판 page넘기기 -->   
	        <div class="row text-center">
	            <div class="col-lg-12">
	                <ul class="pagination">
	                    <li><a href="#">&laquo;</a></li>
	                    <li class="active"><a href="#">1</a></li>
	                    <li><a href="#">2</a></li>
	                    <li><a href="#">3</a></li>
	                    <li><a href="#">4</a></li>
	                    <li><a href="#">5</a></li>
	                    <li><a href="#">&raquo;</a></li>
	                </ul>
	            </div><!-- .col-lg-12 끝 -->
	        </div><!-- .row text-center 끝 -->
     	</section><!-- .panel 끝 -->
    </div><!-- #menu2 끝 -->
    
    <!-- menu3 Review 게시판 시작 -->
    <div id="menu3" class="tab-pane fade">
    <section class="panel">
           <!--menu3 Review 게시판 list/album선택하기-->
               <header class="panel-heading tab-bg-default tab-right">
                   <ul class="nav nav-pills pull-right">
                       <li class="active">
                           <a data-toggle="pill" href="#list3">
                               <i class="glyphicon glyphicon-th-list"></i>
                           </a>
                       </li>
                       <li class="">
                           <a data-toggle="pill" href="#album3">
                               <i class="glyphicon glyphicon-th-large"></i>
                           </a>
                       </li>
                   </ul>
               </header>
               <!-- menu3 Review 게시판 body -->
               <div class="panel-body">
                   <div class="tab-content">
                   <!-- menu3 REview게시판 list3 시작--> 
                       <div id="list3" class="tab-pane active">
                       	<div class="row-fluid">
						<div class="gTable">
							<!-- list3 header -->
							<div class="gTableRow">
								<div class="gTableHead number"><strong>#</strong></div>
								<div class="gTableHead nickname"><strong>NickName</strong></div>
								<div class="gTableHead title"><strong>Title</strong></div>
								<div class="gTableHead date"><i class="glyphicon glyphicon-calendar"></i><strong> Date</strong></div>
								<div class="gTableHead count"><strong>Views</strong></div>
								<div class="gTableHead good"><i class="glyphicon glyphicon-heart"></i><strong> Good</strong></div>
							</div>
							
							<!-- list3 contents -->
							<div class="gTableRow">
								<div class="gTableCell number">5</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Review] ㅇㅇㅇ모임 후기입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
							
							<div class="gTableRow">
								<div class="gTableCell number">4</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Review] ㅇㅇㅇ모임 후기입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
							
							<div class="gTableRow">
								<div class="gTableCell number">3</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Review] ㅇㅇㅇ모임 후기입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
							
							<div class="gTableRow">
								<div class="gTableCell number">2</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Review] ㅇㅇㅇ모임 후기입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
							
							<div class="gTableRow">
								<div class="gTableCell number">1</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">[Review] ㅇㅇㅇ모임 후기입니다. &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
								<div class="gTableCell good">1</div>
							</div><!-- .gTableRow 끝-->
						</div> <!-- .gTable 끝  -->
					</div><!-- .row-fluid 끝 -->
                  </div><!-- #list3 끝 -->

                  <!-- menu3 Review게시판 album3 시작--> 
                  <div id="album3" class="tab-pane">
			        <div class="row-fluid">
			        	<div class="gAlbum">
			        		<!-- album3 contents -->
			        	 	<div class="col-md-4">
			        	 	  <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Review]<a href="#">ㅇㅇㅇ모임 후기입니다.</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
					        </div><!-- .col-md-4 끝 -->
					        
					        <div class="col-md-4">
			        	 	  <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Review]<a href="#">ㅇㅇㅇ모임 후기입니다.</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
					        </div><!-- .col-md-4 끝 -->
     
						    <div class="col-md-4" style="position:relative; top:-8px;"> <!--style (padding or margin 8px 어디인지 확인 필요!!!!!!) -->
						      <div class="gAlbum-img">
			        	 	  	<img class="img-responsive" src="${root}/img/Lighthouse.jpg" alt="Image"/>
			        	 	  </div>
					          <div class="gAlbum-date-wrapper">
					          	<span class="floatleft"><i class="glyphicon glyphicon-user"></i> leemyeongjin </span>
					            <span class="floatleft"><i class="glyphicon glyphicon-calendar"></i>13:00</span>
					            <span class="floatright"><i class="glyphicon glyphicon-heart"></i> 3 </span>
					            <span class="floatright"><i class="glyphicon glyphicon-comment"></i> 2 </span>
					            <span class="clearboth"> &nbsp; </span>
					          </div>
					          <div class="gAlbum-container">
					            <h4>[Review]<a href="#">ㅇㅇㅇ모임 후기입니다.</a></h4>
					            <p>Tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniamTempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam</p>
					            <a href="#" >read more <i>&raquo;</i></a>
					          </div>
 							</div><!-- .col-md-4 끝 -->
			        	</div><!-- .gAlbum 끝 -->
                       </div><!-- .row-fluid 끝 -->
                   </div><!-- #album3 끝 -->
               </div>
              
	        <!-- menu3 Review게시판 page넘기기 -->   
	        <div class="row text-center">
	            <div class="col-lg-12">
	                <ul class="pagination">
	                    <li><a href="#">&laquo;</a></li>
	                    <li class="active"><a href="#">1</a></li>
	                    <li><a href="#">2</a></li>
	                    <li><a href="#">3</a></li>
	                    <li><a href="#">4</a></li>
	                    <li><a href="#">5</a></li>
	                    <li><a href="#">&raquo;</a></li>
	                </ul>
	            </div><!-- .col-lg-12 끝 -->
	        </div><!-- .row text-center 끝 -->
     	</section><!-- .panel 끝 -->
    </div><!-- #menu3 끝 -->
  </div><!-- .tab-content 끝 -->
 </div><!-- .container 끝 -->
 
 <!-- Reply Pop-Up// -->
 <div class="container">
 <!-- Modal -->
  <div class="modal fade" id="myModalReply" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span class="glyphicon glyphicon-comment" style="color:white !important"></span> Comments</h4>
        </div>
        <div class="modal-Reply-body">
          <ul class="reply-box">
               <li class="left clearfix">
                   <div class="reply-body">                                        
                       <strong ><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong>
                       <small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i> 13:00:00</small>                                      
                       <p>
                           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                       </p>
                   </div>
               </li>
               <li class="left clearfix">
                   <div class="reply-body clearfix">
                       <strong ><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong>
                       <small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i> 13:00:00</small>
                       <p>
                           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                       </p>
                   </div>
               </li>
               <li class="left clearfix">
                <div class="reply-body">                                        
                    <strong ><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong>
                    <small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i> 13:00:00</small>                                      
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                    </p>
                </div>
           </li> 
           </ul>
        </div>
        <div class="modal-footer" style="font-color:white">
        	<a href="#" class="btn btn-primary" style="background-color:#BDBDBD; border-color:#BDBDBD;">to Content</a>
            <a href="#" class="btn btn-primary" style="background-color:#BDBDBD; border-color:#BDBDBD; width:11%;">to List</a>
        </div>
      </div>
    </div>
  </div>
  </div>
<!-- //Reply Pop-Up -->

<jsp:include page="../../../WEB-INF/views/template/loginModal.jsp"></jsp:include>
<jsp:include page="../../../WEB-INF/views/template/footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/css/board/board.js"></script>
</body>
</html>