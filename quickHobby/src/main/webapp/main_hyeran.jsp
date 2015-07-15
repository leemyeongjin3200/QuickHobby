<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>


</style>

<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="root1" value="${pageContext.request.requestURI }"/>

<title>Main</title>

<script>
</script>
<title>HYERAN</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
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
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img src="${root}/img/mainBg/bg02.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="${root}/img/mainBg/bg03.jpg" alt="Flower"  >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="${root}/img/mainBg/bg01.jpg" alt="Flower" >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
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

<!-- Navigation bar//-->
 <div class="container">
 
 <nav name="here" class="navbar navbar-inverse">
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
  	   <li id="" data-filter=".best"><a href="#here">BEST</a></li>
       <li id="" data-filter=".location"><a href="#here">LOCATION</a></li>
       <li id="" data-filter=".time"><a href="#here">TIME</a></li>
       <li id="" data-filter=".eye"><a href="#here">EYE</a></li>
       <li id="" data-filter=".mouth"><a href="#here">MOUTH</a></li>
       <li id="" data-filter=".hand"><a href="#here">HAND</a></li>
       <li id="" data-filter=".legs"><a href="#here">LEGS</a></li>
      </ul>
    </div>
</nav>
</div>
<!-- //Navigation bar -->

<!-- Content 2// -->
<div class="container">
<div class="grid no-gutter">
	<c:forEach var="board" items="${applyDtoList}">
		<div class="col-md-4 ${board.apply_category} ${board.apply_inout}" id="board">
			<a href="${root}/apply/applyRead.do?apply_num=${board.apply_num}" class="apply-box">
				<img alt="" src="${root}/groupImage/${board.apply_filename}" class="img-responsive" style="width:400px; height:250px;">
				<div class="apply-box-caption">
					<div class="apply-box-caption-content">
						<p> DATE : <fmt:formatDate value="${board.apply_closedate}" type="date"/> </p>
						<p> TITLE : ${board.apply_subject} </p>
						<p> SUBTITLE : ${board.apply_subtitle} </p>
					</div>
				</div>
			</a>
		</div>
	</c:forEach>
   </div>
</div>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/main/isotope-docs.min.js"></script>
<script>
// filter 설정
$(function() {
  // init Isotope
  var $grid = $('.grid').isotope({
    layoutMode: 'fitRows',
    itemSelector: '.col-md-4'
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
</html>
