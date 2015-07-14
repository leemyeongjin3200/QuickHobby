<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    padding-top: 70px;
}
</style>
<title>Apply</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<!-- Navigation bar//-->
 <div class="container">
 	<!-- Page Title// -->
	        <div class="row">
	            <div class="col-lg-12">
	                <h1 class="page-header">신청게시판
	                    <small>Apply</small>
	                </h1>
	            </div>
	        </div>
	    <!-- //Page Title -->
 
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
       <li id="" data-filter=".hand"><a href="#">HAND</a></li>
       <li id="" data-filter=".legs"><a href="#">LEGS</a></li>
      </ul>
    </div>
</nav>
</div>
<!-- //Navigation bar -->

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
<!-- //Content2 -->
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
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
