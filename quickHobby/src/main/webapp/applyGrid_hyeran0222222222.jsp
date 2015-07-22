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
<!-- smooth animate css file -->
 <link rel="stylesheet" href="${root}/css/groupBoard/animate.css">
 <!-- css file --> 

<link rel="stylesheet" href="${root}/css/apply/jquery-ui-1.8.21.custom.css">
<link rel="stylesheet" href="${root}/css/apply/jquery-ui-slider-pips.css">

 
<style>

[data-toggle="buttons"] > ul > li > .btn input[type="radio"],
[data-toggle="buttons"] > ul > li> .btn-group > .btn input[type="radio"] {
  position: absolute !important;
  clip: rect(0, 0, 0, 0) !important;
  pointer-events: none !important;
}

/*body 상단부 여백 */
body {
    padding-top: 20px;
}

/* a태그 효과없음 */
a:link{text-decoration:none !important;}
a:visited{text-decoration:none !important;}
a:hover{text-decoration:none !important;}
a:active{text-decoration:none !important;}

/* MENU CONF*/
.container-fluid {
 	  text-align: center;
}

.filterMenu {
  display: none;
  background-color: #353535;
  border-top: 2px solid #ffffff;
  padding-top: 0px;
  margin-bottom:0px;
  position: relative;
  height:auto;
  padding-bottom:-10px;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}

.open {
	position: fixed;
	border-radius: 5px 5px 5px 5px;
	width:45px;
	height:45px;
	padding: 11px 13px;
	font-size: 20px;
	margin: 40px 0px 0px 30px;
	cursor: pointer;
	color: rgb(221, 221, 221);
	background: #353535;
}


.filtering{
	border:2px solid #fff;
	padding:5px;
}

.locationFilter{
	border:2px solid #aaa;
	margin-bottom:0px;
}
.datepicker{
	font-size: 8px;
}

.well{
	background: rgba(0, 0, 0, 0.1) !important;
	padding:5px;
}
.filterStart{
	padding-top:40px;
}
.slider{
	margin-left:2%;
	margin-right:2%;
	margin-top:10px;
}

/**                                */
#content {
	filter: none;
	min-height: 100%;
	padding: 5px 5px;
	position: relative;

}

.box {
	float: center;
	width: 100%;
	border: 0px solid #eee;
	background: #fff !important;
	margin-bottom: 28px;	
}

.box-header {
	height: 16px;
	font-size: 16px;
	line-height: 16px;
  	padding: 10px;
  	background: #eee;
	-webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
	overflow: hidden;
}
.box-header h2{
	float: center;
	margin-top: 0px;
	font-weight: 300;
}
/*
.box-content {
	position: relative;
	z-index: 50;
  	margin-top: -1px;
	padding: 10px;
	background: #fff !important;
}
*/
.box-content {

	width: 100%;
	position: relative;
	z-index: 50;
  	margin-top: -1px;
	padding: 10px;
}
/* Grid Images
=================================================================== 
.masonry-thumb {
  	display: inline-block;
  	vertical-align: top;
  	margin-bottom: 6px;
}
*/
.grayscale {
    filter: none;
    -webkit-filter: grayscale(60%);
    -moz-filter:    grayscale(60%);
    -ms-filter:     grayscale(60%);
    -o-filter:      grayscale(60%);
    cursor: pointer;
}

.grid{
	float: center;
	width: 100%;
}

.grid img{
	width: 265px;
	margin-bottom: 10px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
	margin-left: 10px;
}

.date > input{
	margin-top:10px;
}
.date >input >:firstchild{
	font-size:14px;
	font-weight:bold;
	color:#fff;
}

/**   btn */
ul {
    list-style-type: none;
    padding: 0px;
    margin: 0px;
}
#allBtn{
	margin-top:25px;
	margin-bottom:25px;
}

.categoryBtn >ul >li{
	display: table-cell;
	 float: none;
  	width: 1%;

}
.categoryBtn-circle{
	height:55px;
	width:55px;
	border-radius:100% !important;
	margin-top:-10px;
}

.btn-group-justified {
  display: table;
  width: 100%;
  table-layout: fixed;
  border-collapse: separate;
}
.btn-group-justified > ul > li {
  display: table-cell;
  float: none;
  width: 1%;
}
.btn-group-justified > ul > li > .btn {
  width: 100%;
}
/*
.btn-row {
    margin-bottom: 10px;
}
*/
/******************************/


.panel header{
	text-decoration: none;
	font-size: 14px;
	text-align: center;
	display: block;
	line-height: 15px;
	border:1px solid #ddd;
	background-color:rgba(255,255,255, 0.4) !important;
	font-weight: bold;
	color:#fff;

}

.panel > .panel-body {
	border:1px solid #ddd;
	height:80px;
}



.panel{
	padding: 5px !important;
	background-color:rgba(255,255,255, 0) !important;
}
.categoryBtn ul{
	margin-top:6px;
}
.inoutBtn ul, .feeBtn ul {
	margin-top:7px;
}
/*
.con{
	display: table; 
	border:2px solid #ccc;
	background-color:red;
	height:55px;
	width:55px;
	border-radius:100%;
}

.con span{
	display: table-cell; text-align: center; vertical-align: middle;
}
*/
#icon_eye{
    background: url('${root}/icon/eyeIcon.png') center center no-repeat;
	background-size: 42px auto;
	background-color:#e74c3c;
	border:2px solid #e74c3c;
}
#icon_mouth{
	background: url('${root}/icon/mouthIcon.png') center center no-repeat;
	background-size: 40px auto;
	background-color:#BCE067;
	border:2px solid #BCE067;
}
#icon_hand{
	background: url('${root}/icon/handIcon.png') center center no-repeat;
	background-size: 40px auto;
	background-color:#3498db;
	border:2px solid #3498db;
}
#icon_legs{
	background: url('${root}/icon/feetIcon.png') center center no-repeat;
	background-size: 40px auto;
	background-color:#8e44ad;
	border:2px solid #8e44ad;
}

.green,
.green [class="box-header"],
.green.box,
.slider.green .ui-slider-range, 
.progress.green .ui-progressbar-value,
.sliderVertical.green .ui-slider-range,
.progressSlim.green .ui-progressbar-value,
.label-success,
.badge-success {
	background: #00A300 !important;
	border-color: #00A300 !important;
	color: #fff;
}

</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
	<div class="container-fluid filterMenu" style="display: block; padding-left:40px; padding-right:40px;">
		<div class="collapse out" id="demo">
			<div class="row filterStart">
				<div class="col-md-2 panel">
				 <header class="panel-heading">FILTER</header>
					<div class="button panel-body" style="height:210px !important;">
						<ul class="btn-row">
  							<li data-filter="*"><a href="#" class="btn btn-default btn-block btn-lg" id="allBtn">All</a></li>
  							<li data-filter=".best"><a href="#" class="btn btn-default btn-block btn-lg" id="bestBtn">BEST</a></li>
						</ul>
			        </div>
				</div>
			
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4 panel">
						<header class="panel-heading">DATE</header>
						<div class="date panel-body">
							<input type="text" id="datepicker" size="12"> - <input type="text" id="datepicker2"  size="12">
						</div>
					</div>
					<div class="col-md-4 panel">
						<header class="panel-heading">CATEGORY</header>
						<div class="btn-group panel-body categoryBtn" data-toggle="buttons">
							<ul>
					          <li data-filter=".eye">
					          	<label class="btn btn-default categoryBtn-circle" id="icon_eye">
					          		<input type="radio" name="options" id="option1" >
					          	</label>
					          </li>
					          <li data-filter=".mouth">
					          	<label class="btn btn-default categoryBtn-circle" id="icon_mouth">
					          		<input  type="radio" name="options" id="option2">
					          	</label>
					          </li>
					          <li data-filter=".hand">
					          	<label class="btn btn-default categoryBtn-circle" id="icon_hand">
					          		<input  type="radio" name="options" id="option3">
					          	</label>
					          </li>
					          <li data-filter=".legs">
					          	<label class="btn btn-default categoryBtn-circle" id="icon_legs">
					          		<input  type="radio" name="options" id="option4">
					          	</label>
					          </li>
					        </ul>
				        </div>
					</div>
					<div class="col-md-2 panel" >
						<header class="panel-heading">INDOOR/OUTDOOR</header>
						<div class="btn-group btn-group-justified panel-body inoutBtn" data-toggle="buttons">
							<ul>
							 	<li data-filter=".indoor">
							 		<label class="btn btn-default" style="border-top-right-radius: 0; border-bottom-right-radius: 0;">
							 			<input type="radio" name="options" id="option5">IN
							 		</label>
							 	</li>
							 	<li data-filter=".outdoor"><label class="btn btn-default" style="border-top-left-radius: 0; border-bottom-left-radius: 0;"><input type="radio" name="options" id="option6" >OUT</label></li>
							 </ul> 
						</div>			
					</div>
					<div class="col-md-2 panel">
						<header class="panel-heading">APPLICATION FEE</header>
						<div class="btn-group btn-group-justified panel-body feeBtn" data-toggle="buttons">
							<ul>
							  <li data-filter=".fee">
							  	<label class="btn btn-default" style="border-top-right-radius: 0; border-bottom-right-radius: 0;"><input type="radio" name="options" id="option7">YES</label>
							  </li>
							  <li data-filter=".free">
							  	<label class="btn btn-default" style="border-top-left-radius: 0; border-bottom-left-radius: 0;"><input type="radio" name="options" id="option8" >NO</label>
							  </li>
							 </ul> 
						</div>	
					</div>
			
				</div><!-- .row 끝 -->
				<div class="row" >
					<div class="col-md-12 panel" style="margin-top:-20px;">
						<header class="panel-heading">DISTANCE</header>
						<div class="locationFilter panel-body">
							<div class="slider sliderMin-2 yellow"></div>
						</div>
					</div>
				</div>
				
			</div>
		
	</div ><!-- .row -->
		
	
		</div><!-- .filterMenu 끝 -->
	</div><!-- #demo 끝 -->
		
<div class="container-fluid">
	<div class="open" data-toggle="collapse" data-target="#demo">
			<span class="glyphicon glyphicon-search"></span>
	</div>
</div>

<div class="container" style="overflow:auto hidden;"><!-- slider 없애야 함!!! -->
	<!-- Page Header -->
     <div class="row">
         <div class="col-lg-12">
             <h2 class="page-header">신청게시판
                 <small>Apply</small>
             </h2>
         </div>
     </div><!-- .row 끝 -->
		<div class="row-fluid">		
			<!-- start: Content -->
			<div id="content" class="span12">
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-content">
						<div class="grid" id="">
							<div id="image-1" class="grid-item location best eye indoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar01.jpg" alt="Sample Image 1">
											 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-2" class="grid-item eye time best outdoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar02.jpg" alt="Sample Image 2">
										 <div class="apply-box-caption">
					                         <div class="apply-box-caption-content">
					                             <p> DATE: </p>
					                             <p> TITLE: </p>
					                        </div>
					                	</div>
									</a>
								</div>
							</div>
							<div id="image-3" class="grid-item eye best time indoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar03.jpg" alt="Sample Image 3">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-4" class="grid-item location eye outdoor free">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye01.jpg" alt="Sample Image 4">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>	
							</div>
							<div id="image-5" class="grid-item eye location best indoor free">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye02.jpg" alt="Sample Image 5">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-6" class="grid-item time best eye outdoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye03.jpg" alt="Sample Image 7">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-7" class="grid-item location best eye indoor free">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye04.JPG" alt="Sample Image 8">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-8" class="grid-item hand time indoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand01.jpg" alt="Sample Image 9">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-9" class="grid-item hand best outdoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand02.jpg" alt="Sample Image 10">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-10" class="grid-item hand location indoor free">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand03.jpg" alt="Sample Image 11">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-11" class="grid-item legs location outdoor free">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs01.jpg" alt="Sample Image 12">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-12" class="grid-item legs best indoor free">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs02.jpg" alt="Sample Image 13">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-13" class="grid-item legs location time indoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs03.jpg" alt="Sample Image 13">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-14" class="grid-item legs location best indoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs04.jpg" alt="Sample Image 13">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-15" class="grid-item legs time outdoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs05.jpg" alt="Sample Image 13">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-16" class="grid-item legs location time outdoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs06.jpg" alt="Sample Image 13">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-17" class="grid-item legs best time indoor fee">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs07.jpg" alt="Sample Image 13">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-18" class="grid-item mouth location time outdoor free">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupMouth01.jpg" alt="Sample Image 13">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
							<div id="image-19" class="grid-item mouth best outdoor free">
								<div class="apply-box">
									<a title="applyGroup01" href="#">
										<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupMouth02.jpg" alt="Sample Image 13">
										 <div class="apply-box-caption">
						                         <div class="apply-box-caption-content">
						                             <p> DATE: </p>
						                             <p> TITLE: </p>
						                        </div>
						                	</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div><!--/span-->
			</div><!--/.row-fluid sortable-->
		</div><!-- end: Content -->
	</div><!--/#content.span12-->
</div>
		


<script type="text/javascript" src="${root}/css/apply/jquery-migrate-1.0.0.min.js"></script>
<script type="text/javascript" src="${root}/css/apply/apply-grid.js"></script>
<script type="text/javascript" src="${root}/css/apply/isotope-docs.min.js"></script>
 <script type="text/javascript" src="${root}/css/apply/jquery-ui.js"></script>
<script  type="text/javascript" src="${root}/css/apply/jquery-ui-slider-pips.js"></script>
<script>

//버튼 그룹 설정


//필터설정
$(function() {
	  // init Isotope
	  var $grid = $('.grid').isotope({
	    itemSelector: '.grid-item'
	  });
	  
	  // filter functions
	  var filterFns = {
	  };
	  //filter nav-bar nav li 클릭시
	  $('.navbar-nav').on('click', 'li', function() {
	    var filterValue = $(this).attr('data-filter');
	    // use filterFn if matches value
	    filterValue = filterFns[filterValue] || filterValue;
	    $grid.isotope({
	      filter: filterValue
	    });
	  });
	  // change is-checked class on buttons
	  $('.nav').each(function(i, filterGroup) {
	    var $filterGroup = $(filterGroup);
	    $filterGroup.on('click', 'li', function() {
	      $filterGroup.find('.is-checked').removeClass('is-checked');
	      $(this).addClass('is-checked');
	    });
	  });
	  
	  //filter nav-bar nav li 클릭시
	  $('.btn-group').on('click', 'li', function() {
	    var filterValue = $(this).attr('data-filter');
	    // use filterFn if matches value
	    filterValue = filterFns[filterValue] || filterValue;
	    $grid.isotope({
	      filter: filterValue
	    });
	  });
	  // change is-checked class on buttons
	  $('.btn-group').each(function(i, filterGroup) {
	    var $filterGroup = $(filterGroup);
	    $filterGroup.on('click', 'li', function() {
	      $filterGroup.find('.is-checked').removeClass('is-checked');
	      $(this).addClass('is-checked');
	    });
	  });
	  //filter nav-bar nav li 클릭시
	  $('.button').on('click', 'li', function() {
	    var filterValue = $(this).attr('data-filter');
	    // use filterFn if matches value
	    filterValue = filterFns[filterValue] || filterValue;
	    $grid.isotope({
	      filter: filterValue
	    });
	  });
	  // change is-checked class on buttons
	  $('.button').each(function(i, filterGroup) {
	    var $filterGroup = $(filterGroup);
	    $filterGroup.on('click', 'li', function() {
	      $filterGroup.find('.is-checked').removeClass('is-checked');
	      $(this).addClass('is-checked');
	    });
	  });
	});

//Distance slider bar
var locations = ["", "~2km", "5km", "10km", "15km", "20km", "25km", "30km", "50km", "100km", "200km~", ""];
// lets be fancy for the demo and select the current month.

$(".slider")        
    // activate the slider with options
    .slider({ 
        min: 0, 
        max: 11, 
    })
                    
    // add pips with the labels set to "locations"
    .slider("pips", {
        rest: "label",
        labels: locations
    })
                    
    
  
    // and whenever the slider changes, lets echo out the month
    .on("slidechange", function(e,ui) {
        $("#labels-locations-output").text( "You selected " + locations[ui.value] + " (" + ui.value + ")");
        $("#labels-locations-output" ).css("background-color","red");
    });

$(function() {
	$("#datepicker").datepicker({showOn: 'button', buttonImage: '${root}/img/calendar.gif', buttonImageOnly: true});

	$("#datepicker2").datepicker({showOn: 'button', buttonImage: '${root}/img/calendar.gif', buttonImageOnly: true});

});

//img column 정렬
$(window).load(function () {

var size = 1;
var full_size_class = "grid";
var $container = $('.grid');
    
$container.isotope({itemSelector : '.grid-item'});

function check_size(){
	if(size==1){
		$(".grid").addClass(full_size_class); 
		}
	$container.isotope({itemSelector : '.grid-item'});
}

check_size();
});




</script>

</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
</html>