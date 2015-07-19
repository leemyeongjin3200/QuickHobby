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
<link rel="stylesheet" href="${root}/css/apply/applyGrid.css">
 
<style>

</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
	<div class="container-fluid filterMenu" style="display: block;">
		<div class="collapse out" id="demo">
			<div class="row filterStart">
				<div class="col-md-12">
					<div class="well filtering01">
						<ul class="button-group">
  							<li data-filter="*"><a href="#" class="button">All</a></li>
  							<li data-filter=".best"><a href="#" class="button">BEST</a></li>
						</ul>
					</div>
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-4">
					<div class="filtering02 well" style="height:80px">
						<ul class="button-group inout">
  							<li data-filter=".indoor"><a href="#" class="button">INDOOR</a></li>
  							<li data-filter=".outdoor"><a href="#" class="button">OUTDOOR</a></li>
						</ul>
	
						<ul class="button-group applicationFee">
  							<li data-filter=".fee"><a href="#" class="button">APPLICATION FEE</a></li>
  							<li data-filter=".free"><a href="#" class="button">FREE</a></li>
						</ul>
						
					</div>
				</div>
				<div class="col-md-4">
					<div class="filtering well" style="height:80px">
						<div class="date">
						<input type="text" id="datepicker" size="12"> -  <input type="text" id="datepicker2"  size="12">
						</div>
					</div>
				</div>
	
				<div class="col-md-4">
					<div class="filtering well" style="height:80px">
					    <div class="category navbar-inverse">
					      <ul class="nav navbar-nav">
					        <li id="" data-filter=".eye"><a href="#"><span class="glyphicon glyphicon-eye-open"></span></a></li>
					        <li id="" data-filter=".hand"><a href="#"><span class="glyphicon glyphicon-hand-right"></span></a></li>
					        <li id="" data-filter=".mouth"><a href="#"><span class="glyphicon glyphicon-cutlery"></span></a></li> 
					        <li id="" data-filter=".legs"><a href="#"><span class="glyphicon glyphicon-user"></span></a></li> 
					      </ul>
					    </div>
					</div>
				</div>
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

<div class="container" style="overflow:auto;"><!-- slider 없애야 함!!! -->
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
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar01.jpg" alt="Sample Image 1">
								</a>
							</div>
							<div id="image-2" class="grid-item eye time best outdoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar02.jpg" alt="Sample Image 2">
								</a>
							</div>
							<div id="image-3" class="grid-item eye best time indoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar03.jpg" alt="Sample Image 3">
								</a>
							</div>
							<div id="image-4" class="grid-item location eye outdoor free">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye01.jpg" alt="Sample Image 4">
								</a>
							</div>
							<div id="image-5" class="grid-item eye location best indoor free">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye02.jpg" alt="Sample Image 5">
								</a>
							</div>
							<div id="image-6" class="grid-item time best eye outdoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye03.jpg" alt="Sample Image 7">
								</a>
							</div>
							<div id="image-7" class="grid-item location best eye indoor free">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye04.JPG" alt="Sample Image 8">
								</a>
							</div>
							<div id="image-8" class="grid-item hand time indoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand01.jpg" alt="Sample Image 9">
								</a>
							</div>
							<div id="image-9" class="grid-item hand best outdoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand02.jpg" alt="Sample Image 10">
								</a>
							</div>
							<div id="image-10" class="grid-item hand location indoor free">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand03.jpg" alt="Sample Image 11">
								</a>
							</div>
							<div id="image-11" class="grid-item legs location outdoor free">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs01.jpg" alt="Sample Image 12">
								</a>
							</div>
							<div id="image-12" class="grid-item legs best indoor free">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs02.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-13" class="grid-item legs location time indoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs03.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-14" class="grid-item legs location best indoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs04.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-15" class="grid-item legs time outdoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs05.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-16" class="grid-item legs location time outdoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs06.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-17" class="grid-item legs best time indoor fee">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs07.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-18" class="grid-item mouth location time outdoor free">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupMouth01.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-19" class="grid-item mouth best outdoor free">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupMouth02.jpg" alt="Sample Image 13">
								</a>
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
	  $('.button-group').on('click', 'li', function() {
	    var filterValue = $(this).attr('data-filter');
	    // use filterFn if matches value
	    filterValue = filterFns[filterValue] || filterValue;
	    $grid.isotope({
	      filter: filterValue
	    });
	  });
	  // change is-checked class on buttons
	  $('.button-group').each(function(i, filterGroup) {
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