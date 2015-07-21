<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="root1" value="${pageContext.request.requestURI }"/>
<style type="text/css">
/* === mainGrid_menu 버튼 === */
.active_grid_menu a, .mainGrid_menu ul li a:hover{
	background: #363940 !important;
	color: #fff !important;
}
.mainGrid_menu{
	text-align: center;
	overflow: hidden;
	margin-top:22px;
	margin-bottom:48px;
}
.mainGrid_menu ul{
	list-style: none outside none;
    text-align: center;
}
.mainGrid_menu ul li{
    display: inline-block; 
}
.mainGrid_menu ul li a{
	color: #363940;
	background: transparent;
    display: inline-block;
    margin: 4px;
    padding: 8px 10px;
    text-decoration: none;
    text-transform: uppercase;
    border:2px solid #363940; 
}
.iconInformation{
    border:1px solid #4C4C4C; 
	background-color: #EAEAEA;
	width: 1320px;
	height: 200px;
	margin-left: 15px;
}

.iconInformation h4{
	color: black;
	text-align:center;
}

/**ApplyList(Grid)=======================================
============================================*/ 
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
/**********************************/



</style>
<title>HYERAN</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body onload="">
<!-- Content 1//-->
<div class="container-fluid">
  <br/><%-- <br/><br/><br/><br/>
  ${param.abc}
  ${root1} --%>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="${root}/img/mainBg/bg04.jpg" alt="Chania"  >
        <div class="carousel-caption">
          <h2>Welcome to QuickHobby ! &nbsp;- Social Activity Platform</h2><br/>
          <p>뭔가 하루를 색다르게 보내고 싶은데 무얼 해야할지 모르겠다면?</p>
          <p>하고싶은게 있는데 같이 할 친구들이 필요하다면?</p>
          <p>퀴카비는 여러 사람들과 함께 즐기고 소통하며 더 나은 삶을 살고자 합니다.</p>
          <p>지친 일상 속에서 퀴카비를 통해 활력을 찾아보는건 어떨까요?</p><br/><br/><br/>
        </div>
      </div>

      <div class="item">
        <img src="${root}/img/mainBg/bg02.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h2>Apply</h2><br/>
          <p>당신에게 딱 맞는 모임을 찾고 싶으세요?</p>
          <p>상단의 Apply에서 검색 기능을 사용해보세요!</p>
          <p>직접 모임을 만들어보는건 어떨까요?</p><br/><br/><br/><br/><br/>
        </div>
      </div>
    
      <div class="item">
        <img src="${root}/img/mainBg/bg03.jpg" alt="Flower"  >
        <div class="carousel-caption">
          <h2>Tip & Review</h2><br/>
          <p>처음이라 뭔가 두렵다면, 관심있는 모임이 있다면,</p>
          <p>Tip & Review 게시판을 통해 이미 경험했던 사람들의 후기도 감상하고</p>
          <p>취미 활동에 대한 정보도 얻어보세요!</p><br/><br/><br/><br/><br/>
        </div>
      </div>

      <div class="item">
        <img src="${root}/img/mainBg/bg01.jpg" alt="Flower" >
        <div class="carousel-caption">
          <h2>"절대 후회하지 마라.</h2>
          <h2>좋았다면 추억이고, 나빴다면 경험이다."</h2><br/>
          <h3>&nbsp;-&nbsp;Carol.A Turkington</h3><br/><br/><br/>
        </div>
      </div>
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br/>
<!-- //Content 1-->

<!-- Icon 설명 박스 
<div class="iconInformation" id="information">
	<h4>설명설명설명설명설명설명설명설명</h4>
</div>
 Icon 설명 끝 -->

<!-- Navigation bar//-->
 <div class="container"> 	
	<div class="mainGrid_menu" id="filters">
       <ul>
           <li class="active_grid_menu"><a data-toggle="tooltip" data-placement="top" title="많은 사람들이 관심 가지고 있는 모임입니다." class="btn btn-default" href="#mainFilter" data-filter=".best">BEST</a></li>
           <li><a data-toggle="tooltip" data-placement="top" title="뮤지컬, 영화, 미술관 관람 등 시각적인 문화활동을 즐기는 모임입니다." class="btn btn-default" href="#mainGrid_menu" data-filter=".eye">EYE</a></li>
           <li><a data-toggle="tooltip" data-placement="top" title="맛집을 혼자서 즐기기 외롭다면?" class="btn btn-default" href="#mainGrid_menu" data-filter=".mouth" >MOUTH</a></li>
           <li><a data-toggle="tooltip" data-placement="top" title="도자기 만들기, 치즈스쿨 체험, 공예 배우기 등을 직접 체험해 볼 수 있는 모임입니다." class="btn btn-default" href="#mainGrid_menu" data-filter=".hand">HAND</a></li>
           <li><a data-toggle="tooltip" data-placement="top" title="조금 더 스릴 넘치는 경험이 해보고 싶은 분들을 위한 액티비티한 모임입니다." class="btn btn-default" href="#mainGrid_menu" data-filter=".legs">LEGS</a></li>
       </ul>
   </div>
</div>
<!-- //Navigation bar -->

<!-- Content 2// -->
<div class="container">
<div class="grid no-gutter"  id="mainGrid">
	
	<c:forEach var="board" items="${applyDtoList}">
		<div class="grid-item ${board.apply_category} ${board.apply_num}" id="board">
		<c:if test="${board.apply_readcount>100}">
			<script>
				$("." + '${board.apply_num}').addClass("best");
			</script>
		</c:if>
			<div class="apply-box">
				<a href="${root}/apply/applyRead.do?apply_num=${board.apply_num}" class="apply-box">
					<c:if test="${board.apply_filename != null }">
						<img alt="" src="${root}/groupImage/${board.apply_filename}" class="img-responsive grayscale">
					</c:if>
					<c:if test="${board.apply_filename == null}">
						<img alt="" src="${root}/groupImage/default.jpg" class="img-responsive grayscale">
					</c:if>
					<div class="apply-box-caption">
						<div class="apply-box-caption-content">
							<p><fmt:formatDate value="${board.apply_closedate}" type="date" pattern="yyyy.MM.dd."/> </p>
							<p>${board.apply_subject} </p>
							<p>${board.apply_subtitle} </p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</c:forEach>
	<!-- 
		<div id="image-1" class="grid-item best eye">
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
		<div id="image-2" class="grid-item eye best">
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
		<div id="image-3" class="grid-item eye best">
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
		<div id="image-4" class="grid-item eye">
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
		<div id="image-5" class="grid-item eye location best">
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
		<div id="image-6" class="grid-item time best eye">
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
		<div id="image-7" class="grid-item location best eye">
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
		<div id="image-8" class="grid-item hand time">
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
		<div id="image-9" class="grid-item hand best">
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
		<div id="image-10" class="grid-item hand location">
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
		<div id="image-11" class="grid-item legs location">
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
		<div id="image-12" class="grid-item legs best">
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
		<div id="image-13" class="grid-item legs">
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
		<div id="image-14" class="grid-item legs best">
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
		<div id="image-15" class="grid-item legs">
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
		</div>-->
		
	
   </div>
</div>
</body>
<script type="text/javascript" src="${root}/css/main/isotope-docs.min.js"></script>
<script type="text/javascript" src="${root}/css/apply/jquery-migrate-1.0.0.min.js"></script>
<script type="text/javascript" src="${root}/css/apply/apply-grid.js"></script>
<script>
var $container = $('.grid');
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	var filterValue = '.best';
	 $container.isotope({ filter: filterValue });
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

$(window).load(function() {
	$('.mainGrid_menu ul li').click(function(){
		$('.mainGrid_menu ul li').removeClass('active_grid_menu');
		$(this).addClass('active_grid_menu');
	});

	var $container = $('#mainGrid');
	$container.isotope({
	  itemSelector: '.grid-item',
	});
	$('#filters').on( 'click', 'a', function() {
	  var filterValue = $(this).attr('data-filter');
	  $container.isotope({ filter: filterValue });
	  return false;
	});
	});

</script>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>

</html>
