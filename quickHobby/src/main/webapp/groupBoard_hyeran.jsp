<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }" />
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
	background: url(${root}/img/bg.jpg) no-repeat center center;
	padding: 0;
	-webkit-background-size: cover;
	background-size: cover;
	height: 50%;
}
</style>

<title>HYERAN</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
<!--===========group board Information=================-->
	<section id="gInfo">
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
	
	<div id="gb-bgImg"><!-- background Image -->
		<div class="container">
			<div class="row">
				<div class="gInfo_content">
					<!-- 그룹 정보 panel(date, weather, location 등등) -->
					<div class="col-lg-7 col-md-7 col-sm-7">
						<div class="row">
							<div class="col-sm-6 post-meta">
								<!-- 참가인원수 받아오기 -->
								<span><i class="glyphicon glyphicon-user"></i> 3 Joins</span>
								<!-- 좋아요 개수 받아오기 --> 
								<span><i class="glyphicon glyphicon-heart"></i> 0 Likes</span>
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
									<p class="week">WED</p>
									<p class="when">Aug. 18</p>
								</div>
								<div class="col-sm-3 group_weather"><!-- 날씨 -->
									<img src="${root}/weather/Slight Drizzle.png" class="img-responsive" alt="">
								</div>
								<div class="col-sm-6 group_location"><!-- 주소 -->
									<p class="glocation1">경기도 성남시 분당구 삼평동</p>
									<p class="glocation2">유스페이스 광장</p>
								</div>
							</div><!-- .gElement-item 끝 -->
						</div><!-- .row 끝 -->
					</div><!-- .col-lg-7 끝 -->
					
					<!-- GOOGLE MAP -->
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
	<section id="gTableList">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<!-- list talbe head -->
				<div class="heading">
					<h2 class="">Title입니다.</h2>
					<p>subtitle입니다.</p>
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
					<div class="gTableRow">
						<div class="gTableCell number">5</div>
						<div class="gTableCell nickname">
							<i class="glyphicon glyphicon-user"></i> <a href="#">leemyeongjin</a>
						</div>
						<div class="gTableCell titlec">
							<a href="#">안녕하세요. 반갑습니다. &nbsp;</a> <i
								class="glyphicon glyphicon-comment"></i><a href="#"><b
								class="myInGroupReply"> 3</b></a>
						</div>
						<div class="gTableCell date">13:48</div>
						<div class="gTableCell count">45</div>
					</div>
					<!-- .gTableRow 끝-->

					<div class="gTableRow">
						<div class="gTableCell number">4</div>
						<div class="gTableCell nickname">
							<i class="glyphicon glyphicon-user"></i> <a href="#">leemyeongjin</a>
						</div>
						<div class="gTableCell titlec">
							<a href="#">안녕하세요. 반갑습니다. &nbsp;</a> 
							<i class="glyphicon glyphicon-comment"></i><a href="#"><b>3</b></a>
						</div>
						<div class="gTableCell date">13:48</div>
						<div class="gTableCell count">45</div>
					</div>
					<!-- .gTableRow 끝-->

					<div class="gTableRow">
						<div class="gTableCell number">4</div>
						<div class="gTableCell nickname">
							<i class="glyphicon glyphicon-user"></i> <a href="#">leemyeongjin</a>
						</div>
						<div class="gTableCell titlec">
							<a href="#">안녕하세요. 반갑습니다. &nbsp;</a> 
							<i class="glyphicon glyphicon-comment"></i><a href="#"><b>3</b></a>
						</div>
						<div class="gTableCell date">13:48</div>
						<div class="gTableCell count">45</div>
					</div>
					<!-- .gTableRow 끝  -->

					<div class="gTableRow">
						<div class="gTableCell number">3</div>
						<div class="gTableCell nickname">
							<i class="glyphicon glyphicon-user"></i> <a href="#">leemyeongjin</a>
						</div>
						<div class="gTableCell titlec">
							<a href="#">안녕하세요. 반갑습니다. &nbsp;</a> 
							<i class="glyphicon glyphicon-comment"></i><a href="#"><b>3</b></a>
						</div>
						<div class="gTableCell date">13:48</div>
						<div class="gTableCell count">45</div>
					</div>
					<!-- .gTableRow 끝  -->

					<div class="gTableRow">
						<div class="gTableCell number">2</div>
						<div class="gTableCell nickname">
							<i class="glyphicon glyphicon-user"></i> <a href="#">leemyeongjin</a>
						</div>
						<div class="gTableCell titlec">
							<a href="#">안녕하세요. 반갑습니다. &nbsp;</a> 
							<i class="glyphicon glyphicon-comment"></i><a href="#"><b>3</b></a>
						</div>
						<div class="gTableCell date">13:48</div>
						<div class="gTableCell count">45</div>
					</div>
					<!-- .gTableRow 끝  -->

					<div class="gTableRow">
						<div class="gTableCell number">1</div>
						<div class="gTableCell nickname">
							<i class="glyphicon glyphicon-user"></i> <a href="#">leemyeongjin</a>
						</div>
						<div class="gTableCell titlec">
							<a href="#">안녕하세요. 반갑습니다. &nbsp;</a> 
							<i class="glyphicon glyphicon-comment"></i><a href="#"><b>3</b></a>
						</div>
						<div class="gTableCell date">13:48</div>
						<div class="gTableCell count">45</div>
					</div><!-- .gTableRow 끝  -->
				</div><!-- .gTable 끝  -->
			</div><!-- .row-fluid 끝 -->
		</div>
		<!-- #list 끝 -->

		<!--list table page넘기기 -->
		<div class="row text-center">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div><!-- .col-lg-10 끝 -->
			<!-- 글쓰기 버튼 -->
			<div class="col-lg-1 btns">
				<div class="clearfix" style="margin-top: 20px">
					<a href="#" class="btn btn-primary  btn-sm btn-block">글쓰기</a>
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
				<!-- BEGAIN ABOUT HEADING -->
				<div class="heading">
					<h3 class="text-denter">Group Member</h3>
					<p>모임을 신청한 사람들입니다.</p>
				</div>
				<div class="gMember_area">
					<!-- BEGAIN TEAM SLIDER -->
					<div class="gMember_slider">

						<!-- BEGAIN SINGLE TEAM SLIDE#1 -->
						<div class="col-lg-3 col-md-3 col-sm-4">
							<div class="single_gMember">
								<div class="gMember_img">
									<img src="${root}/img/groupMember01.jpg" alt="img" class="img-responsive">
								</div>
								<h5>
									<i class="glyphicon glyphicon-user"></i><a href="#">leemyeongjin</a>
								</h5>
								<span>Host</span>
							</div>
						</div>
						<!-- BEGAIN SINGLE TEAM SLIDE#2 -->
						<div class="col-lg-3 col-md-3 col-sm-4">
							<div class="single_gMember">
								<div class="gMember_img">
									<img src="${root}/img/groupMember02.jpg" alt="img" class="img-responsive">
								</div>
								<h5>
									<i class="glyphicon glyphicon-user"></i><a href="#"> seoingoo1</a>
								</h5>
								<span>Member</span>
							</div>
						</div>
						<!-- BEGAIN SINGLE TEAM SLIDE#3 -->
						<div class="col-lg-3 col-md-3 col-sm-4">
							<div class="single_gMember">
								<div class="gMember_img">
									<img src="${root}/img/Penguins.jpg" alt="img"
										class="img-responsive">
								</div>
								<h5>
									<i class="glyphicon glyphicon-user"></i><a href="#">
										seoingoo2</a>
								</h5>
								<span>Member</span>


							</div>
						</div>
						<!-- BEGAIN SINGLE TEAM SLIDE#4 -->
						<div class="col-lg-3 col-md-3 col-sm-4">
							<div class="single_gMember">
								<div class="gMember_img">
									<img src="${root}/img/Penguins.jpg" alt="img"
										class="img-responsive">
								</div>
								<h5>
									<i class="glyphicon glyphicon-user"></i><a href="#">
										seoingoo3</a>
								</h5>
								<span>Member</span>


							</div>
						</div>
						<!-- BEGAIN SINGLE TEAM SLIDE#5 -->
						<div class="col-lg-3 col-md-3 col-sm-4">
							<div class="single_gMember">
								<div class="gMember_img">
									<img src="${root}/img/Penguins.jpg" alt="img"
										class="img-responsive">
								</div>
								<h5>
									<i class="glyphicon glyphicon-user"></i><a href="#">
										seoingoo4</a>
								</h5>
								<span>Member</span>
							</div>
						</div>
						<!-- BEGAIN SINGLE TEAM SLIDE#6 -->
						<div class="col-lg-3 col-md-3 col-sm-4">
							<div class="single_gMember">
								<div class="gMember_img">
									<img src="${root}/img/groupMember04.jpg" alt="img"
										class="img-responsive">
								</div>
								<h5>
									<i class="glyphicon glyphicon-user"></i><a href="#">
										kimhyeran1</a>
								</h5>
								<span>Member</span>

							</div>
						</div>
						<!-- BEGAIN SINGLE TEAM SLIDE#7 -->
						<div class="col-lg-3 col-md-3 col-sm-4">
							<div class="single_gMember">
								<div class="gMember_img">
									<img src="${root}/img/groupMember03.jpg" alt="img"
										class="img-responsive">
								</div>
								<h5>
									<i class="glyphicon glyphicon-user"></i><a href="#">
										kimhyeran2</a>
								</h5>
								<span>Member</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--=========== END TEAM SECTION ================-->

	<!-- Reply Pop-Up// -->
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModalReply" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<span class="glyphicon glyphicon-comment"
								style="color: white !important"></span> Comments
						</h4>
					</div>
					<div class="modal-Reply-body">
						<ul class="reply-box">
							<li class="left clearfix">
								<div class="reply-body">
									<strong><i class="glyphicon glyphicon-user"></i>
										Leemyeongjin</strong> <small class="pull-right text-muted"><i
										class="glyphicon glyphicon-calendar"></i> 13:00:00</small>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Curabitur bibendum ornare dolor, quis ullamcorper ligula
										sodales.</p>
								</div>
							</li>
							<li class="left clearfix">
								<div class="reply-body clearfix">
									<strong><i class="glyphicon glyphicon-user"></i>
										Leemyeongjin</strong> <small class="pull-right text-muted"><i
										class="glyphicon glyphicon-calendar"></i> 13:00:00</small>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Curabitur bibendum ornare dolor, quis ullamcorper ligula
										sodales.</p>
								</div>
							</li>
							<li class="left clearfix">
								<div class="reply-body">
									<strong><i class="glyphicon glyphicon-user"></i>
										Leemyeongjin</strong> <small class="pull-right text-muted"><i
										class="glyphicon glyphicon-calendar"></i> 13:00:00</small>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Curabitur bibendum ornare dolor, quis ullamcorper ligula
										sodales.</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="modal-footer" style="font-color: white">
						<a href="#" class="btn btn-primary"
							style="background-color: #BDBDBD; border-color: #BDBDBD;">to
							Content</a> <a href="#" class="btn btn-primary"
							style="background-color: #BDBDBD; border-color: #BDBDBD; width: 11%;">to
							List</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Reply Pop-Up -->



	<!-- Google map -->
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="${root}/css/groupBoard/jquery.ui.map.js"></script>
	<!-- for circle counter -->
	<script
		src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
	<!-- For smooth animatin -->
	<script src="${root}/css/groupBoard/wow.min.js"></script>
	<!-- superslides slider -->
	<script src="${root}/css/groupBoard/jquery.superslides.min.js"
		type="text/javascript"></script>
	<!-- slick slider -->
	<script src="${root}/css/groupBoard/slick.min.js"></script>
	<script>

jQuery(function($){
	//gMember_slider

		$('.gMember_slider').slick({
		  dots: false,
		  infinite: true,
		  speed: 600,
		  slidesToShow: 5,
		  slidesToScroll: 5,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: true,
		        dots: true
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2,
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        slidesToScroll: 1,
		      }
		    }
		  ]
		});

  var zoom= $('#map_canvas').gmap('option', 'zoom');
  
  $('#map_canvas').gmap().bind('init', function(ev, map) {
    $('#map_canvas').gmap('addMarker', {'position': '57.7973433,12.0502107', 'bounds': true});
    $('#map_canvas').gmap('option', 'zoom', 13);
  });

});

//Reply 팝업창
$(document).ready(function(){
    $(".myInGroupReply").click(function(){
        $("#myModalReply").modal();
    });
});

</script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
</html>