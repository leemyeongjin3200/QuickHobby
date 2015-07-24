<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
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
.center {
	text-align: center;
}
.left {
	text-align: left;
}
.floatleft {
	float:left;
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
	background: rgba(0, 0, 0, .7) !important;
	z-index: 5;
}
.section-solid {
	width: 100%;
	height: 100%;
	background: rgba(220, 220, 220, 0.8) !important;
	padding-top:3%;
	padding-bottom:8%;
	margin-bottom:3%;
}

/* ================ Features Section ================ */

.container-fluid.features {
	padding-top: 0px;
	
}
.baraja-container {
	width: 240px;
	height: 330px;
}
.baraja-container .single-feature {
	border: 1px solid #ccc;
	border-radius: 4px;
}
.single-feature .feature-text {
	line-height: 1.5;
	padding: 0 7px;
	margin-bottom: 5px;
}
.baraja-container .single-feature:hover {
	-webkit-box-shadow: 0px 0px 10px rgba(110, 110, 110, 0.5);
	-moz-box-shadow: 0px 0px 10px rgba(110, 110, 110, 0.5);
	-o-box-shadow: 0px 0px 10px rgba(110, 110, 110, 0.5);
	box-shadow: 0px 0px 10px rgba(110, 110, 110, 0.5);
}

.feature-image:hover {
	background: rgba(33,33,33,.8);
}
.feature-image {
	height:200px !important;
	width:238px !important;
	overflow:hidden !important;
	padding:2px;
}
.apply-box .apply-box-caption .apply-box-caption-content {
    position: absolute;
    top: 50%;
    width: 100%;
    text-align: center;
    transform: translateY(-50%);
}


.features-control {
	margin: auto;
	margin-top: 35px;
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
.feature-text{
	font-weight:800;
}
.section-solid > h5{
	font-weight:800;
}
</style>

<title></title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>	
<div class="board">				
<div class="container">
<!-- Page Title// -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">${member.memberNickName}
                <small style="color:#D5D5D5">'s GroupList</small>
            </h2>
        </div>
    </div>
   <!-- //Page Title -->
</div>
	<section id="section-feature" class="feature-wrap">
		<div class="container-fluid features center">
			<div class="row">
				<div class="col-lg-12 section-solid">
						<!--Features container Starts -->
						<ul id="card-ul" class="features-hold baraja-container">
							<c:forEach var="group" items="${groupList}">
							<!-- Single group 시작 -->
							<li class="single-feature" title="Card style" onclick="moveGroupPage('${root}', '${group.groupNum}')">
								<a href="#" class="fancy-button small vertical">
									<span class="icon">
										<i class="glyphicon glyphicon-share-alt"></i>
									</span>
								</a>
								<div class="feature-image" ><p class="ratio" style="background-image:url('${root}/img/groupImage/${group.groupFileName}')" ></p></div>
								<h4 class="feature-title"> <fmt:formatDate value="${group.groupDate}" type="date"/></h4>
								<p class="feature-text">${group.groupSubject}</p>
								<p>${group.groupLocation}</p>
							</li> <!-- Single group 끝-->
						</c:forEach>	
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
					<br/><br/>
				</div>
			</div>
	</section>
	</div>
</body>
<script type="text/javascript" src="${root}/css/myGroup/modernizr.js"></script>
<script type="text/javascript" src="${root}/css/myGroup/jquery.baraja.js"></script>
<script type="text/javascript" src="${root}/css/myGroup/jquery.appear.js"></script>
<script type="text/javascript" src="${root}/css/myGroup/jquery.vegas.min.js"></script>
<script type="text/javascript">
//my group list	
function moveGroupPage(root, groupNum){
	var url=root + "/groupBoard/groupPage.do?groupNum=" + groupNum;
	$(location).attr("href", url);
}

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
					range : 75,
					direction : 'right',
					origin : { x : 50, y : 170 },
					center : true
				});
			});
			$('#feature-expand').click(function() {
				baraja.fan({
					speed : 500,
					easing : 'ease-out',
					range : 75,
					direction : 'right',
					origin : { x : 50, y : 170 },
					center : true
				});
			}); 
		} else {
			sectionFeature.appear(function(){
				baraja.fan({
					speed : 1500,
					easing : 'ease-out',
					range : 85,
					direction : 'left',
					origin : { x : 170, y : 50 },
					center : true
				});
			});
			$('#feature-expand').click(function() {
				baraja.fan({
					speed : 500,
					easing : 'ease-out',
					range : 85,
					direction : 'left',
					origin : { x : 170, y : 50 },
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
		{ src:'${root}/img/bg_001.jpg', fade:1000 },
		{ src:'${root}/img/bg_002.jpg', fade:1000 },
		{ src:'${root}/img/bg_003.jpg', fade:1000 }
	  ]
	})();
});

</script>
<jsp:include page="../template/footer.jsp"></jsp:include>

</html>
