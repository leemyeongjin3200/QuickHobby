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

<style>
/*body 상단부 여백 */
body {
    padding-top: 70px;
}
/* a태그 효과없음 */
a:link{text-decoration:none !important;}
a:visited{text-decoration:none !important;}
a:hover{text-decoration:none !important;}
a:active{text-decoration:none !important;}
/* Content and Main Elements
=================================================================== */
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
    -webkit-filter: grayscale(20%);
    -moz-filter:    grayscale(20%);
    -ms-filter:     grayscale(20%);
    -o-filter:      grayscale(20%);
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


</style>

<title>작업중!!!!!!!!!</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
<div class="container">
 	<!-- Page Title// -->
     <div class="row">
         <div class="col-lg-12">
             <h1 class="page-header">신청게시판
                 <small>Apply</small>
             </h1>
         </div>
     </div>
     <nav class="navbar navbar-inverse">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span> 
	      </button>
	      <a class="navbar-brand" href="#">QuickHobby</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	       <li id="" data-filter="*"><a href="#">ALL</a></li>
	  	   <li id="" data-filter=".best"><a href="#">BEST</a></li>
	       <li id="" data-filter=".location"><a href="#">LOCATION</a></li>
	       <li id="" data-filter=".time"><a href="#">TIME</a></li>
	       <li id="" data-filter=".eye"><a href="#">EYE</a></li>
	       <li id="" data-filter=".mouth"><a href="#">MOUTH</a></li>
	       <li id="" data-filter=".hand"><a href="#">HANDS</a></li>
	       <li id="" data-filter=".legs"><a href="#">LEGS</a></li>
	      </ul>
	    </div>
	</nav>
</div><!-- .container 끝 -->
	      
 	<div class="container">
		<div class="row-fluid">		
			<!-- start: Content -->
			<div id="content" class="span12">
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-content">
						<div class="grid" id="">
							<div id="image-1" class="grid-item location best eye">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar01.jpg" alt="Sample Image 1">
								</a>
							</div>
							<div id="image-2" class="grid-item eye time best">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar02.jpg" alt="Sample Image 2">
								</a>
							</div>
							<div id="image-3" class="grid-item eye best time">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar03.jpg" alt="Sample Image 3">
								</a>
							</div>
							<div id="image-4" class="grid-item location eye">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye01.jpg" alt="Sample Image 4">
								</a>
							</div>
							<div id="image-5" class="grid-item eye location best">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye02.jpg" alt="Sample Image 5">
								</a>
							</div>
							<div id="image-6" class="grid-item time best eye">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye03.jpg" alt="Sample Image 7">
								</a>
							</div>
							<div id="image-7" class="grid-item location best eye">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye04.JPG" alt="Sample Image 8">
								</a>
							</div>
							<div id="image-8" class="grid-item hand time">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand01.jpg" alt="Sample Image 9">
								</a>
							</div>
							<div id="image-9" class="grid-item hand best">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand02.jpg" alt="Sample Image 10">
								</a>
							</div>
							<div id="image-10" class="grid-item hand location">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand03.jpg" alt="Sample Image 11">
								</a>
							</div>
							<div id="image-11" class="grid-item legs location">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs01.jpg" alt="Sample Image 12">
								</a>
							</div>
							<div id="image-12" class="grid-item legs best">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs02.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-13" class="grid-item legs location time">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs03.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-14" class="grid-item legs location best">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs04.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-15" class="grid-item legs time">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs05.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-16" class="grid-item legs location time">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs06.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-17" class="grid-item legs best time">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs07.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-18" class="grid-item mouth location time">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupMouth01.jpg" alt="Sample Image 13">
								</a>
							</div>
							<div id="image-19" class="grid-item mouth best">
								<a title="applyGroup01" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupMouth02.jpg" alt="Sample Image 13">
								</a>
							</div>
						</div>
					</div>
				</div><!--/span-->
			</div><!--/row-->
		</div><!--/.fluid-container-->
	<!-- end: Content -->
	</div><!--/#content.span12-->
</div><!--/fluid-row-->
		
<div class="clearfix"></div>
	
	
<script>
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

//필터설정
$(function() {
	  // init Isotope
	  var $grid = $('.grid').isotope({
	    itemSelector: '.grid-item'
	  });
	  
	  // filter functions
	  var filterFns = {
	  };
	  // bind filter button click
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

	});
	
</script>
<!-- masonry js -->
<script type="text/javascript" src="${root}/css/apply/jquery-migrate-1.0.0.min.js"></script>

<script type="text/javascript" src="${root}/css/apply/apply-grid.js"></script>

<script type="text/javascript" src="${root}/css/apply/isotope-docs.min.js"></script>

</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>

</html>