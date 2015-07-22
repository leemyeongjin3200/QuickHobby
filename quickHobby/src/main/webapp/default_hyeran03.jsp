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

<link rel="stylesheet" type="text/css" href="${root}/css/myGroup/myGroup.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/myGroup/baraja.css" /> 
<link rel="stylesheet" type="text/css" href="${root}/css/myGroup/responsive.css" /> 

<style>
.board{
	min-height:100%;
}
a {
	color: #cccccc;
	text-decoration: none;
}

a:hover, a:focus, .btn:focus {
    text-decoration: none;
	outline: none;
	color: #6c6b6b
}

input:focus, textarea:focus {
	outline: 0;
}



h1 {
    font-size: 72px;
    line-height: 82px;
}

h2 {
    font-size: 48px;
    line-height: 60px;
}

h3 {
    font-size: 32px;
    line-height: 45px;
}

h4 {
    font-size: 20px;
    line-height: 30px;
}

h5 {
    font-size: 18px;
	line-height: 25px;
}

img {
	max-width: 100%;
	height: auto;
}

ul, ol {
	padding-left: 0 !important;
}

li {
	list-style: none;
}

/* --------------- Common Classes --------------- */
.center {
	text-align: center;
}

.left {
	text-align: left;
}

.justify {
	text-align: justify;
}

.strong {
font-weight: 700;
}

.floatright {
	float:right;
}

.floatleft {
	float:left;
}

.floatnone {
	float:none;
}

.fixed {
	position:fixed;
}

.absolute {
	position:absolute;
}

.relative {
	position:relative;
}

.container {
	position:relative;
	z-index: 10;
}

.section-overlay {
	position: absolute;
	width: 100%;
	height: 100%;
}

.animated {
	visibility: hidden;
}

.visible {
	visibility: visible;
}

.section-title {
	margin-bottom: 48px;
}

.section-title h3, .section-title h4 {
	color: #F4F4F4;
	border-top: 1px solid;
	border-bottom: 1px solid;
	display: inline-block;
	margin-top: 0;
	padding: 8px 0;
	
}

.section-overlay {
	background: rgba(0, 0, 0, .7) !important;
	z-index: 5;
}
.section-solid {
position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 1) !important;


}


/* ================ Features Section ================ */
#section-feature {
	background-color: #f9f9f9 !important;
}

.container-fluid.features {
	padding-top: 132px;
	padding-bottom: 190px;
}

.baraja-container {
	width: 250px;
	height: 400px;
}

.baraja-container .single-feature {
	border: 1px solid #ccc;
	border-radius: 4px;
}

.single-feature .feature-title {
	margin-top: 18px;
}

.single-feature .feature-text {
	line-height: 1.5;
	padding: 0 10px;
	margin-bottom: 16px;
}

.baraja-container .single-feature:hover {
	-webkit-box-shadow: 0px 0px 10px rgba(110, 110, 110, 0.5);
	-moz-box-shadow: 0px 0px 10px rgba(110, 110, 110, 0.5);
	-o-box-shadow: 0px 0px 10px rgba(110, 110, 110, 0.5);
	box-shadow: 0px 0px 10px rgba(110, 110, 110, 0.5);
}

.single-feature .feature-image {

}

.feature-image {
	height:220px !important;
	width:248px !important;
	overflow:hidden !important;

	padding:2px;
	
}


.features-control {
	margin: auto;
	margin-top: 55px;
	width: 253px;
	z-index: 1020;
}

.control-icon {
	position: absolute;
	top:0;
	padding: 5px 15px;
	font-size: 20px;
	height: 46px;
}

.feature-link a{
	color:#fff;
	font-weight: 400;
}
.feature-link a i {
	font-weight: 300;
}

.features-control #feature-prev {
	left: 0px;
}

.features-control #feature-expand {
	left: 60px;
}

.features-control #feature-close {
	left: 120px;
}

.features-control #feature-next {
	left: 180px;
}

.sub-steps .icon {
	float:left;
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-left: 1px solid;
	line-height: 40px;
	padding: 0px 13px;
	-webkit-transition: all .3s ease-in;
	-moz-transition: all .3s ease-in;
	-o-transition: all .3s ease-in;
	transition: all .3s ease-in;
}
	
/* --------------- Button Styles --------------- */
.button-line {
	background: transparent;
	display: inline-block;
	font-weight: 400;
	border-radius: 4px;
	border: 1px solid;
	margin: 10px;
	overflow: visible;
}

.no-text .icon {
	margin: 0;
}

.btn .icon {
	margin-left: 13px;
}

.button-white {
	border-color: #fff;
	color: #fff;
}

.button-white:hover {
	border-color: #fff;
	color: #fff;
}

/***********************/


.ratio{
    position:relative;
    width: 100% ;
    height: 100% ;
    padding-bottom: 50%  ; 
    
    background-repeat: no-repeat !important;
    background-position: center center !important;
    background-size: cover !important;  

}
</style>

<title>작업중 지우지 마세요!!!!!!!</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>	
<div class="board">				
<div class="container">
<!-- Page Title// -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">${host.memberNickName}
                <small>'s List</small>
            </h1>
        </div>
    </div>
   <!-- //Page Title -->
</div>
	<section id="section-feature" class="feature-wrap">
		<div class="section-solid"></div>
		<div class="container-fluid features center">
		
			<div class="row">
				<div class="col-lg-12">
						<!--Features container Starts -->
						<ul id="card-ul" class="features-hold baraja-container">
						
							<!-- Single group 시작 -->
							<li class="single-feature" title="Card style">
								<div class="feature-image" ><p class="ratio" style="background-image:url('${root}/img/bg01.jpg')" ></p></div>
								<h4 class="feature-title color-scheme">DATE: <fmt:formatDate value="${group.groupDate}" type="date"/></h4>
								<p class="feature-text">
									TITLE: ${group.groupSubject}
								</p>
								<p>LOCATION: ${group.groupLocation}</p>
									<a href="${root}/groupBoard/groupPage.do?groupNum=${group.groupNum}" class="fancy-button button-line btn-default small vertical">
										Details
										<span class="icon">
											<i class="glyphicon glyphicon-share-alt"></i>
										</span>
									</a>
							</li> <!-- Single group 끝-->
							
								<!-- Single group 시작 -->
							<li class="single-feature" title="Card style">
								<div class="feature-image" ><p class="ratio" style="background-image:url('${root}/img/bg02.jpg')" ></p></div>
								<h4 class="feature-title color-scheme">DATE: <fmt:formatDate value="${group.groupDate}" type="date"/></h4>
								<p class="feature-text">
									TITLE: ${group.groupSubject}
								</p>
								<p>LOCATION: ${group.groupLocation}</p>
									<a href="${root}/groupBoard/groupPage.do?groupNum=${group.groupNum}" class="fancy-button button-line btn-default small vertical">
										Details
										<span class="icon">
											<i class="glyphicon glyphicon-share-alt"></i>
										</span>
									</a>
							</li> <!-- Single group 끝-->
							
								<!-- Single group 시작 -->
							<li class="single-feature" title="Card style">
								<div class="feature-image" ><p class="ratio" style="background-image:url('${root}/img/bg03.jpg')" ></p></div>
								<h4 class="feature-title color-scheme">DATE: <fmt:formatDate value="${group.groupDate}" type="date"/></h4>
								<p class="feature-text">
									TITLE: ${group.groupSubject}
								</p>
								<p>LOCATION: ${group.groupLocation}</p>
									<a href="${root}/groupBoard/groupPage.do?groupNum=${group.groupNum}" class="fancy-button button-line btn-default small vertical">
										Details
										<span class="icon">
											<i class="glyphicon glyphicon-share-alt"></i>
										</span>
									</a>
							</li> <!-- Single group 끝-->
				
						
							
							
							
							
							
							
						</ul>
						<!-- button Controls  -->
						<div class="features-control relative">
							<button class="control-icon fancy-button button-line no-text btn-col bell" id="feature-prev" title="Previous" >
								<span class="icon">
									<i class="glyphicon glyphicon-arrow-left"></i>
								</span>
							</button>
							<button class="control-icon fancy-button button-line no-text btn-col zoom" id="feature-expand" title="Expand" >
								<span class="icon">
									<i class="glyphicon glyphicon-resize-full"></i>
								</span>
							</button>
							<button class="control-icon fancy-button button-line no-text btn-col zoom" id="feature-close" title="Collapse" >
								<span class="icon">
									<i class="glyphicon glyphicon-resize-small"></i>
								</span>
							</button>
							<button class="control-icon fancy-button button-line no-text btn-col bell" id="feature-next" title="Next" >
								<span class="icon">
									<i class="glyphicon glyphicon-arrow-right"></i>
								</span>
							</button>
						</div>
						<!-- button Controls  -->
		
						
					</div>
				</div>
			</div>
	</section>
	</div>
</body>
<script src="${root}/css/apply/default.js"></script>
<script type="text/javascript" src="${root}/css/myGroup/modernizr.js"></script>
<script type="text/javascript" src="${root}/css/myGroup/jquery.baraja.js"></script>
<script type="text/javascript" src="${root}/css/myGroup/jquery.appear.js"></script>
<script type="text/javascript" src="${root}/css/myGroup/jquery.vegas.min.js"></script>
<script type="text/javascript">
//my group list				
$(document).ready(function() {
	'use strict';
	var $el 			= $( '#card-ul' ),
		sectionFeature  = $('#section-feature'),
		baraja 			= $el.baraja();
	
		if ( $(window).width() > 480) {
			sectionFeature.appear(function(){
				baraja.fan({
					speed : 1500,
					easing : 'ease-out',
					range : 100,
					direction : 'right',
					origin : { x : 50, y : 200 },
					center : true
				});
			});
			$('#feature-expand').click(function() {
				baraja.fan({
					speed : 500,
					easing : 'ease-out',
					range : 100,
					direction : 'right',
					origin : { x : 50, y : 200 },
					center : true
				});
			}); 
		} else {
			sectionFeature.appear(function(){
				baraja.fan({
					speed : 1500,
					easing : 'ease-out',
					range : 80,
					direction : 'left',
					origin : { x : 200, y : 50 },
					center : true
				});
			});
			$('#feature-expand').click(function() {
				baraja.fan({
					speed : 500,
					easing : 'ease-out',
					range : 80,
					direction : 'left',
					origin : { x : 200, y : 50 },
					center : true
				});
			});
		}
		
	// Feature navigation
	$('#feature-prev').on( 'click', function( event ) {
		baraja.previous();
	});

	$('#feature-next').on( 'click', function( event ) {
		baraja.next();
	});
	
	// close Features
	$('#feature-close').on( 'click', function( event ) {
		baraja.close();
	});	
});

//Background slider

$(window).ready(function() {
	'use strict';
	$.vegas('slideshow', {
	  backgrounds:[
		{ src:'${root}/img/bg-1.jpg', fade:1000 },
		{ src:'${root}/img/bg-2.jpg', fade:1000 },
		{ src:'${root}/img/bg-3.jpg', fade:1000 }
	  ]
	})();
});

</script>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>

</html>