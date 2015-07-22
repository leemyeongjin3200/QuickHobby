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
	border:2px solid #fff;
	margin-bottom:0px;
}
.datepicker{
	font-size: 8px;
}

.category span{
	font-size:40px;
	padding:5px;
}
.category{
	margin:-18px 0px 0px 30px;
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
/**   btn */
ul {
    list-style-type: none;
    padding: 0px;
    margin: 0px;
}
#allBtn{
	margin-bottom:10px;
}
.category{
	
}
.categoryItems {
	display:block;
	padding-top:30px;
}
.categoryItems li{
	display:inline;
	padding:10px;
}

/*********************************************/
section{
  display: block;
}
div {
  display: block;
}
*, ::before, ::after {
  box-sizing: border-box;
}
.panel-body {
  padding: 15px;
}
.panel .panel-body {
  border-width: 1px 1px 2px;
  border-style: solid;
  border-top: none;
  border-right-color: #ccc!important;
  border-bottom-color: #ccc!important;
  border-left-color: #ccc!important;
}
.panel-heading {
  padding: 10px 15px;
  border-bottom: 1px solid transparent;
}

.panel .panel-heading {
  line-height: 34px;
  padding: 0 15px;
  min-height: 34px;
  border-left: 1px solid #ccc;
  border-right: 1px solid #ccc;
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  border-radius: 0px;
  position: relative;
  box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
  -moz-box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
  -webkit-box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
}

.btn-group > .btn:first-child:not(:last-child):not(.dropdown-toggle) {
  border-bottom-right-radius: 0px;
  border-top-right-radius: 0px;
}
.btn-group > .btn:first-child {
  margin-left: 0px;
}
.btn-group > .btn:hover, .btn-group-vertical > .btn:hover, .btn-group > .btn:focus, .btn-group-vertical > .btn:focus, .btn-group > .btn:active, .btn-group-vertical > .btn:active, .btn-group > .btn.active, .btn-group-vertical > .btn.active {
  z-index: 2;
}
.btn-group > .btn, .btn-group-vertical > .btn {
  position: relative;
  float: left;
}

.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0px;
  font-size: 14px;
  line-height: 1.428571429;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  border: 1px solid transparent;
  border-image-source: initial;
  border-image-slice: initial;
  border-image-width: initial;
  border-image-outset: initial;
  border-image-repeat: initial;
  border-radius: 4px;
  white-space: nowrap;
  -webkit-user-select: none;
  font-weight: 300;
  transition: all 0.15s;
  -webkit-transition: all 0.15s;
}

.btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
  background-image: none;
}
.btn:active, .btn.active {
}
.btn-default {
  color: rgb(43, 43, 43) !important;
  background-color: rgb(255, 255, 255) !important;
  border-color: rgb(199, 199, 204) !important;
}
.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
  color: rgb(255, 255, 255) !important;
  background-color: rgb(158, 158, 158) !important;
  border-color: rgb(158, 158, 158) !important;
}

.btn-row {
    margin-bottom: 10px;
}

.btn-primary {
  color: rgb(255, 255, 255) !important;
  background-color: rgb(0, 122, 255) !important;
  border-color: rgb(0, 122, 255) !important;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open .dropdown-toggle.btn-primary {
  color: rgb(255, 255, 255) !important;
  background-color: rgb(158, 158, 158) !important;
  border-color: rgb(158, 158, 158) !important;
}



</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
	<div class="container-fluid filterMenu" style="display: block;">
		<div class="collapse out" id="demo">
			<div class="row filterStart">
				<div class="col-md-2 panel" style="border:2px solid #ddd; height:180px;">
					<div class="buttons">
						<ul>
  							<li data-filter="*"><a href="#" class="btn btn-primary btn-lg btn-block" id="allBtn">All</a></li>
  							<li data-filter=".best"><a href="#" class="btn btn-primary btn-lg btn-block" id="bestBtn">BEST</a></li>
						</ul>
			        </div>
				</div>
				
		
			
			<div class="col-md-10" style="border:2px solid #ddd;height:180px;">
				<div class="row">
					<div class="col-md-4" style="border:2px solid #ddd;height:80px;">
						<div class="date">
							<input type="text" id="datepicker" size="12"> -  <input type="text" id="datepicker2"  size="12">
						</div>
					</div>
					<div class="col-md-4" style="border:2px solid #ddd;height:80px;">
						 <div class="category">
					      <ul class="categoryItems">
					        <li id="" data-filter=".eye"><a href="#"><span class="glyphicon glyphicon-eye-open"></span></a></li>
					        <li id="" data-filter=".hand"><a href="#"><span class="glyphicon glyphicon-hand-right"></span></a></li>
					        <li id="" data-filter=".mouth"><a href="#"><span class="glyphicon glyphicon-cutlery"></span></a></li> 
					        <li id="" data-filter=".legs"><a href="#"><span class="glyphicon glyphicon-user"></span></a></li> 
					      </ul>
					    </div>
					</div>
					<div class="col-md-2 panel" style="border:2px solid #ddd;height:80px;">
                          <header class="panel-heading">
                              Group Radio
                          </header>
                          <div class="panel-body">
                            <div class="btn-row">
                                <div class="btn-group" data-toggle="buttons">
                                      <label class="btn btn-default active">
                                          <input type="radio" name="options" id="option1">IN
                                      </label>
                                      <label class="btn btn-default">
                                          <input type="radio" name="options" id="option2">OUT
                                      </label>
                                   
                                  </div>
                              </div> 
                            </div>
					</div>
					<div class="col-md-2" style="border:2px solid #ddd;height:80px;">
					
					</div>
			
				</div><!-- .row 끝 -->
				<div class="row">
					<div class="col-md-12" style="border:2px solid #ddd;height:100px;">
						<div class="locationFilter">
							<div class="slider"></div>
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
             <h1 class="page-header">신청게시판
                 <small>Apply</small>
             </h1>
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