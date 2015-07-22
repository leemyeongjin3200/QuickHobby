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
<link rel="stylesheet" href="${root}/css/apply/applyGrid00.css">
 
<style>
.active_grid_menu a, .category_menu ul li a:hover{
	background: #363940 !important;
	color: #fff !important;
}
.category_menu{
	text-align: center;
	overflow: hidden;
	margin-top:22px;
	margin-bottom:48px;
}
.category_menu ul{
	list-style: none outside none;
    text-align: center;
}
.category_menu ul li{
    display: inline-block; 
}
.category_menu ul li a{
	color: #363940;
	background: #454545;
    display: inline-block;
    margin: 4px;
    padding: 8px 10px;
    text-decoration: none;
    text-transform: uppercase;
    border:2px solid #363940; 
}

[data-toggle="buttons"] > ul > li > .btn input[type="radio"],
[data-toggle="buttons"] > ul > li> .btn-group > .btn input[type="radio"] {
  position: absolute !important;
  clip: rect(0, 0, 0, 0) !important;
  pointer-events: none !important;
}
</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
	<div class="container-fluid filterMenu" style="display: block;">
		<div class="collapse out" id="demo">
			<div class="row filterStart">
				<div class="col-md-4">
				<!--
					<div class="category_menu" id="filters1">
				       <ul>
				           <li><a class="btn btn-default" href="#category_menu" data-filter=".eye">EYE</a></li>
				           <li><a class="btn btn-default" href="#category_menu" data-filter=".mouth" >MOUTH</a></li>
				           <li><a class="btn btn-default" href="#category_menu" data-filter=".hand">HAND</a></li>
				           <li><a class="btn btn-default" href="#category_menu" data-filter=".legs">LEGS</a></li>
				       </ul>
				   </div>  -->
				</div>
				<div class="col-md-4">
					<div class="btn-group btn-group-justified" id="filters2">
					  <a href="#" class="btn btn-primary">Apple</a>
					  <a href="#" class="btn btn-primary">Samsung</a>
					  <a href="#" class="btn btn-primary">Sony</a>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="btn-group category_menu" data-toggle="buttons">
						<ul>
				          <li data-filter=".eye"><label class="btn btn-default btn-circle"><input type="radio" name="options" id="option5" >eye</label></li>
				          <li  data-filter=".mouth"><label class="btn btn-default btn-circle"><input  type="radio" name="options" id="option6">mouth</label></li>
				          <li  data-filter=".hand"><label class="btn btn-default btn-circle"><input  type="radio" name="options" id="option7">hand</label></li>
				        </ul>
			        </div>
				</div> 
				<!--
				<div class="col-md-4">
					<div class="btn-group category_menu" data-toggle="buttons">
						<ul>
				          <li data-filter=".eye" class="btn btn-default"><a href="#" class="btn btn-primary">eye</a></li>
				          <li  data-filter=".mouth" class="btn btn-default"><a href="#" class="btn btn-primary">mouth</a></li>
				          <li  data-filter=".hand" class="btn btn-default"><a href="#" class="btn btn-primary">hand</a></li>
				        </ul>
			        </div>
				</div>  -->
			</div>
		
			<div class="row">
	
			
	
		
			</div>
			<div class="row">
				<div class="col-md-12 filterEnd">
					<div class="locationFilter well">
						<div class="slider"></div>
					</div>
				</div>
			</div>
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