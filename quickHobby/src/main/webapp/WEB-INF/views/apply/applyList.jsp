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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/css/main/main.css"/>
<script type="text/javascript" src="${root}/css/main/main.js"></script>
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
      $(this).appendClass('is-checked');
    });
  });

});

</script>

<style>
body {
    padding-top: 70px;
}

</style>
<title>Apply</title>
</head>
<body>
<!-- Header -->
<header>
<nav class="navbar navbar-default navbar-fixed-top">
 <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">QuickHobby</a>
    </div>
    <!-- Before Login -->
	<!-- c:if문 설정  -->
	<div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	      	<li><a href="#">Apply</a></li>
	        <li><a href="#">Tip & Review</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
	        <li id="myLogin"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      </ul>
	  </div>
	<!-- c:if문 닫기 -->
	
	<!-- After Login
	<c:if test="#">
	<div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Apply<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">Apply Group</a></li>
	            <li><a href="#">Create Group</a></li>
	          </ul>
	        </li>
	        <li><a href="#">Tip & Review</a></li>
	        <li><a href="#" >My Group</a></li>
	        <li><a href="#">My Page</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<li><a href="#"><span class="glyphicon glyphicon-envelope"></span> 5</a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-user"></span> NickName</a></li>
	        <li id="myLogout"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
	      </ul>
	  </div>
	</c:if>
	 -->
  </div>
</nav>
</header>
<!-- //Header -->

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
       <li id="" data-filter=".hands"><a href="#">HANDS</a></li>
       <li id="" data-filter=".legs"><a href="#">LEGS</a></li>
      </ul>
    </div>
</nav>
</div>
<!-- //Navigation bar -->

<div class="container">
<div class="grid no-gutter">
	<c:forEach var="board" items="${applyDtoList}">
		<div class="col-md-4" id="board">
			<script>
				$("#board").addClass("${board.apply_category}");
				$("#board").addClass("${board.apply_inout}");
			</script>
			<a href="${root}/apply/applyRead.do?apply_num=${board.apply_num}" class="apply-box">
				<img alt="" src="${root}/groupImage/${board.apply_filename}" class="img-responsive" style="width:400px; height:300px;">
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

<!-- footer// -->
<footer>
	<div id="copyRight">CopyRight @ QuickHobby </div>
</footer>
<!-- //footer -->
 
</body>
</html>
