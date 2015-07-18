<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="root1" value="${pageContext.request.requestURI }" />
<!-- smooth animate css file -->
<link rel="stylesheet" href="${root}/css/groupBoard/animate.css">
<!-- Slick slider css file -->
<link href="${root}/css/groupBoard/slick.css" rel="stylesheet">
<!-- groupBoard.css -->
<link href="${root}/css/groupBoard/groupBoard.css" rel="stylesheet">
<style>
#gb-bgImg {
	background: url(${root}/groupImage/${group.groupFileName}) no-repeat center center;
	padding: 0;
	-webkit-background-size: cover;
	background-size: cover;
	height: 50%;
}
</style>

<title>HYERAN</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<!--===========group board Information=================-->
<section id="gInfo">
	<div id="gb-bgImg"><!-- background Image -->
		<div class="container">
		<!-- Page Header -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					그룹 게시판 <small>Group Board</small>
				</h1>
			</div>
		</div><!-- .row 끝 -->
	</div><!-- .container 끝 -->
	
		<div class="container">
			<div class="row">
				<div class="gInfo_content">
					<!-- 그룹 정보 panel(date, weather, location 등등) -->
					<div class="col-lg-7 col-md-7 col-sm-7">
						<div class="row">
							<div class="col-sm-6 post-meta">
								<!-- 참가인원수 받아오기 -->
								<span><i class="glyphicon glyphicon-user"></i> ${memberList.size()} Joins</span>
								<!-- 좋아요 개수 받아오기 --> 
								<span><i class="glyphicon glyphicon-heart"></i> ${group.groupRecommend} Likes</span>
							</div>
							
							<!-- 카테고리 정보 받아오기 (눈,코,입,다리 등등)-->
							<div class="col-sm-6 category_item">
								<div class="clearfix pull-right">
									<span class="eye"><i class="glyphicon glyphicon-comment"></i></span>
									<span class="hand"><i class="glyphicon glyphicon-user"></i></span>
									<span class="mouth"><i class="glyphicon glyphicon-calendar"></i></span> 
									<span class="legs"><i class="glyphicon glyphicon-heart"></i></span>
								</div>
							</div>
							
							<!-- 날짜, 날씨, 주소 받아오기 -->
							<div class="col-sm-12 gElement-item">
								<div class="col-sm-3 group_date"><!-- 날짜 -->
									<fmt:setLocale value="en_US" scope="session"/>
									<p class="week"><fmt:formatDate value="${group.groupDate}" pattern="E"/></p>
									<p class="when"><fmt:formatDate value="${group.groupDate}" pattern="MMM. d"/></p>
								</div>
								<div class="col-sm-3 group_weather"><!-- 날씨 -->
									<img id="weather" src="${root}/weather/QuestionMark.png" class="img-responsive" alt="">
								</div>
								<div class="col-sm-6 group_location"><!-- 주소 -->
									<p class="glocation1">${group.groupLocation}</p>
								</div>
							</div><!-- .gElement-item 끝 -->
						</div><!-- .row 끝 -->
					</div><!-- .col-lg-7 끝 -->
					
					<!-- GOOGLE MAP -->
					<input type="hidden" id="groupLocation" value="${group.groupLocation}"/>
					<div class="col-lg-5 col-md-5 col-sm-5">
						<div class="gInfo_map">
							<!-- 지도 parsing -->
							<div id="map_canvas"></div>
						</div><!-- .gInfo_map 끝 -->
					</div><!-- .col-lg-5 끝 -->
				</div><!-- .gInfo_content 끝 -->
			</div><!-- .row 끝 -->
		</div><!-- .container 끝 -->
	</div>
	</section><!--===========group board Information 끝=================-->

	<!--=========== group board List Table================-->
	<section id="gTableList point">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<!-- list talbe head -->
				<div class="heading">
					<h2 class="">${group.groupSubject}</h2>
					<p>${group.groupSubtitle}</p>
				</div><!-- .heading 끝 -->
			</div>
		</div>
			<div id="list" class="">
				<div class="row-fluid">
					<div class="gTable">
						<!-- list table header -->
						<div class="gTableRow">
							<div class="gTableHead number">
								<strong>#</strong>
							</div>
							<div class="gTableHead nickname">
								<strong>NickName</strong>
							</div>
							<div class="gTableHead title">
								<strong>Title</strong>
							</div>
							<div class="gTableHead date">
								<i class="glyphicon glyphicon-calendar"></i><strong>
									Date</strong>
							</div>
							<div class="gTableHead count">
								<strong>Views</strong>
							</div>
						</div>
						
							<!-- list table contents -->
							<c:if test="${count > 0}">
								<c:forEach var="groupBoard" items="${groupBoardList}">
									<div class="gTableRow row${groupBoard.groupRowNum}" style="display:none">
										<div class="gTableCell number">${groupBoard.groupBoardNum}</div>
										<div class="gTableCell nickname">
											<i class="glyphicon glyphicon-user"></i> <a href="#">${groupBoard.groupBoardWriterNick}</a>
										</div>
										<div class="gTableCell titlec">
											<a style='cursor:pointer;' onclick="toReadPage('${groupBoard.groupBoardNum}')">${groupBoard.groupBoardSubject} &nbsp;</a> <i
												class="glyphicon glyphicon-comment"></i><a href="#"><b
												class="myInGroupReply"> ${groupBoard.groupBoardReplyCount}</b></a>
										</div>
										<div class="gTableCell date"><fmt:formatDate value="${groupBoard.groupBoardModifyDate}" type="date"/></div>
										<div class="gTableCell count">${groupBoard.groupBoardReadCount}</div>
									</div>
								</c:forEach>
								<script>
									for(var i=1; i<=10; i++){
										$(".row" + i).css("display", "table-row");
									}
								</script>
								<!-- .gTableRow 끝-->
							</c:if>
						</div><!-- .gTable 끝  -->
					</div><!-- .row-fluid 끝 -->
				</div>
			<!-- #list 끝 -->
	
			<!--list table page넘기기 -->
			<c:set var="boardSize" value="${10}"/>
			<c:set var="pageBlock" value="${5}"/>
			<fmt:parseNumber var="temp" value="${count/boardSize}" integerOnly="true"/>
			<c:set var="pageCount" value="${temp+(count%boardSize==0 ? 0 : 1)}"/>
			<c:set var="currentPage" value="${1}"/>
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${(rs*pageBlock)+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			<div class="row text-center">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					
					<ul class="pagination">
						<li class="left" style="display:none"><a href="#point" onclick="moveLeft('${boardSize}', '${pageBlock}', '${pageCount}')">&laquo;</a></li>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==startPage}">
								<li class="page${i} active"><a href="#point" onclick="movePage('${i}', '${boardSize}', '${pageBlock}')">${i}</a></li>
							</c:if>
							<c:if test="${i!=1}">
								<li class="page${i}"><a href="#point" onclick="movePage('${i}', '${boardSize}', '${pageBlock}')">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<li class="right"><a href="#point" onclick="moveRight('${boardSize}', '${pageBlock}', '${pageCount}')">&raquo;</a></li>
						</c:if>
					</ul>
				</div><!-- .col-lg-10 끝 -->
				<!-- 글쓰기 버튼 -->
				<div class="col-lg-1 btns">
					<div class="clearfix" style="margin-top: 20px">
						<a href="${root}/groupBoard/writeForm.do?groupNum=${group.groupNum}" class="btn btn-primary  btn-sm btn-block">글쓰기</a>
					</div>
				</div><!-- .col-lg-1 btns 끝 -->
			</div> <!-- .row text-center 끝 -->
		<hr>
	</div><!-- container 끝 -->
	</section> <!--=========== group board List Table 끝================-->

	<!--=========== GroupMember list 시작 ================-->
	<section id="gMember">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<!-- GroupMember heading -->
				<div class="heading">
					<h3 class="text-denter">Group Member</h3>
					<p>모임을 신청한 사람들입니다.</p>
				</div> <!-- .heading 끝 -->
				
				<!-- GroupMember List 슬라이드 영역 -->
				<div class="gMember_area">
					<div class="gMember_slider">
						<c:forEach var="groupMember" items="${memberList}">
							<div class="col-lg-3 col-md-3 col-sm-4">
								<div class="single_gMember">
									<div class="gMember_img">
										<img src="${root}/pds/${groupMember.memberFileName}" alt="img" class="img-responsive">
									</div>
									<h5>
										<i class="glyphicon glyphicon-user"></i><a href="#"> ${groupMember.memberNickName}</a>
									</h5>
									<c:if test="${group.groupHost==groupMember.memberNum}">
										<span>Host</span>
									</c:if>
									<c:if test="${group.groupHost!=groupMember.memberNum}">
										<span>Member</span>
									</c:if>
									
								</div>
							</div><!-- GroupMember 01 끝 -->
						</c:forEach>
						
					</div><!-- .gMember_slider 끝 -->
				</div><!-- .gMember_area 끝 -->
			</div><!-- .col-lg-12 col-md-12 끝 -->
		</div><!-- .row 끝 -->
	</div><!-- .container 끝 -->
	</section>
	<!--=========== GroupMember list 끝 ================-->

	<!--===========Reply Pop-Up 시작================ -->
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModalReply" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<span class="glyphicon glyphicon-comment" style="color: white !important"></span> Comments
						</h4>
					</div> <!-- .modal-header 끝 -->
					<div class="modal-Reply-body">
						<ul class="reply-box">
							<li class="left clearfix">
								<div class="reply-body">
									<strong><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong> 
									<small class="pull-right text-muted">
										<i class="glyphicon glyphicon-calendar"></i> 13:00:00
									</small>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
								</div>
							</li>
							<li class="left clearfix">
								<div class="reply-body clearfix">
									<strong><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong> 
									<small class="pull-right text-muted">
										<i class="glyphicon glyphicon-calendar"></i> 13:00:00
									</small>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
								</div>
							</li>
							<li class="left clearfix">
								<div class="reply-body">
									<strong><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong> 
									<small class="pull-right text-muted">
										<i class="glyphicon glyphicon-calendar"></i> 13:00:00
									</small>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Curabitur bibendum ornare dolor, quis ullamcorper ligula	sodales.</p>
								</div>
							</li>
						</ul>
					</div><!-- .modal-Reply-body 끝 -->
					<div class="modal-footer" style="font-color: white">
						<a href="#" class="btn btn-primary" style="background-color: #BDBDBD; border-color: #BDBDBD;">
							to Content</a> 
						<a href="#" class="btn btn-primary" style="background-color: #BDBDBD; border-color: #BDBDBD; width: 11%;">
							to List</a>
					</div><!-- .modal-footer 끝 -->
				</div><!-- .modal-content 끝 -->
			</div><!-- .modal-dialog 끝 -->
		</div><!-- #myModalReply 끝 -->
	</div><!-- .container 끝 -->
	<!--=============Reply Pop-Up 끝================= -->


	<!-- Google map -->
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="${root}/css/groupBoard/jquery.ui.map.js"></script>
	<!-- For GroupMember -->
	<script src="${root}/css/groupBoard/wow.min.js"></script>
	<!-- superslides slider -->
	<script src="${root}/css/groupBoard/jquery.superslides.min.js" type="text/javascript"></script>
	<!-- slick slider -->
	<script src="${root}/css/groupBoard/slick.min.js"></script>
	<!--  groupBoard.js-->
	<script src="${root}/css/groupBoard/groupBoard.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${weather.wf}" != ""){
	
	var wf="${weather.wf}";
	var url="${root}/weather/" + wf + ".jpg";
	
		$("#weather").attr("src", url);
	}
	
	if("${host.memberFileName}" !=""){
		var fileName="${host.memberFileName}";
		var url="${root}/pds/" + fileName + ".jpg";
	}
});
</script>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>