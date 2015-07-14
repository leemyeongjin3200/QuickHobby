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
	background: #ffffff;
	filter: none;
	min-height: 100%;
	padding: 20px 20px;
	position: relative;
}
.box {
	border: 2px solid #eee;
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
	float:left;
	margin-top: 0px;
	font-weight: 300;
}
.box-content {
	position: relative;
	z-index: 50;
  	margin-top: -1px;
	padding: 10px;
	background: #fff !important;
}

/* Masonry Gallery
=================================================================== */
.masonry-thumb {
  	display: inline-block;
  	vertical-align: top;
  	margin-bottom: 6px;
}
.grayscale {
    filter: none;
    -webkit-filter: grayscale(20%);
    -moz-filter:    grayscale(20%);
    -ms-filter:     grayscale(20%);
    -o-filter:      grayscale(20%);
    cursor: pointer;
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
							<div id="image-1" class="masonry-thumb location best legs">
								<a title="Sample Image 1" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar01.jpg" alt="Sample Image 1">
								</a>
							</div>
							<div id="image-2" class="masonry-thumb eye hand time">
								<a title="Sample Image 2" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs02.jpg" alt="Sample Image 2">
								</a>
							</div>
							<div id="image-3" class="masonry-thumb mouth best time">
								<a title="Sample Image 3" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupMouth01.jpg" alt="Sample Image 3">
								</a>
							</div>
							<div id="image-4" class="masonry-thumb location legs hand">
								<a title="Sample Image 4" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs05.jpg" alt="Sample Image 4">
								</a>
							</div>
							<div id="image-5" class="masonry-thumb legs hand">
								<a title="Sample Image 5" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs01.jpg" alt="Sample Image 5">
								</a>
							</div>
							<div id="image-6" class="masonry-thumb best time location">
								<a title="Sample Image 6" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye02.jpg" alt="Sample Image 6">
								</a>
							</div>
							<div id="image-7" class="masonry-thumb time best eye">
								<a title="Sample Image 7" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupMouth02.jpg" alt="Sample Image 7">
								</a>
							</div>
							<div id="image-8" class="masonry-thumb location legs eye">
								<a title="Sample Image 8" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand02.jpg" alt="Sample Image 8">
								</a>
							</div>
							<div id="image-9" class="masonry-thumb eye hand time">
								<a title="Sample Image 9" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupLegs06.jpg" alt="Sample Image 9">
								</a>
							</div>
							<div id="image-10" class="masonry-thumb">
								<a title="Sample Image 10" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar03.jpg" alt="Sample Image 10">
								</a>
							</div>
							<div id="image-11" class="masonry-thumb">
								<a title="Sample Image 11" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupHand01.jpg" alt="Sample Image 11">
								</a>
							</div>
							<div id="image-12" class="masonry-thumb">
								<a title="Sample Image 12" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEye01.jpg" alt="Sample Image 12">
								</a>
							</div>
							<div id="image-13" class="masonry-thumb">
								<a title="Sample Image 13" href="#">
									<img class="grayscale img-responsive" src="${root}/img/groupCategory/groupEar02.jpg" alt="Sample Image 13">
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
//filter 설정


$(function() {
   var $container = $('.grid');
   var gutter = 6;
   var min_width = 250;
   $container.imagesLoaded( function(){
       $container.masonry({
           itemSelector : '.masonry-thumb',
           gutterWidth: gutter,
           isAnimated: true,
             columnWidth: function( containerWidth ) {
               var num_of_boxes = (containerWidth/min_width | 0);
               var box_width = (((containerWidth - (num_of_boxes-1)*gutter)/num_of_boxes) | 0) ;

               if (containerWidth < min_width) {
                   box_width = containerWidth;
               }

               $('.masonry-thumb').width(box_width);
               return box_width;
             }
       });
   });
 
});

$(function() {
	  // init Isotope
	  
	  var $category = $('.grid').isotope({
	    itemSelector: '.masonry-thumb',
	    columnWidth: 180,
	    isFitWidth: true
	  });
	  
	  // filter functions
	  var filterFns = {

	  };
	  // bind filter button click
	  $('.navbar-nav').on('click', 'li', function() {
	    var filterValue = $(this).attr('data-filter');
	    // use filterFn if matches value
	    filterValue = filterFns[filterValue] || filterValue;
	    $category.isotope({
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

<script type="text/javascript" src="${root}/css/apply/jquery.masonry.min.js"></script>

<script type="text/javascript" src="${root}/css/apply/apply-grid.js"></script>

<script type="text/javascript" src="${root}/css/main/isotope.pkgd.js"></script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>

</html>