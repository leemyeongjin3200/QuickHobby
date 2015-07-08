<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="root1" value="${pageContext.request.requestURI }"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/main.css"/>
<script>
</script>
<title>HYERAN</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp?root1=${root1}"></jsp:include>
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
        <img src="${root}/img/main_bg.jpg" alt="Chania"  >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img src="${root}/img/Chrysanthemum.jpg" alt="Chania" >
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="${root}/img/Desert.jpg" alt="Flower"  >
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="${root}/img/Lighthouse.jpg" alt="Flower" >
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
        <li id="best"><a href="#">BEST</a></li>
        <li id="location"><a href="#">LOCATION</a></li>
        <li id="time"><a href="#">TIME</a></li>
        <li id="eye"><a href="#">EYE</a></li>
        <li id="mouth"><a href="#">MOUTH</a></li>
        <li id="hands"><a href="#">HANDS</a></li>
        <li id="legs"><a href="#">LEGS</a></li>
      </ul>
    </div>
</nav>
</div>
<!-- //Navigation bar -->

<!-- Content 2// -->
<div class="container">
	<div class="row no-gutter">
	  <div class="col-md-4" >
	   	<a href="#" class="apply-box">
              <img src="${root}/img/Lighthouse.jpg" class="img-responsive" alt="">
               <div class="apply-box-caption">
                         <div class="apply-box-caption-content">
                                <p> DATE: </p>
                                <p> TITLE: </p>
                        </div>
                </div>
          </a>
       </div>
	  <div class="col-md-4" >
	  	  <a href="#" class="apply-box">
              <img src="${root}/img/Chrysanthemum.jpg" class="img-responsive" alt="">
               <div class="apply-box-caption">
                         <div class="apply-box-caption-content">
                                <p> DATE: </p>
                                <p> TITLE: </p>
                        </div>
                </div>
          </a>
	  </div>
	  <div class="col-md-4" >
	     <a href="#" class="apply-box">
              <img src="${root}/img/Desert.jpg" class="img-responsive" alt="">
               <div class="apply-box-caption">
                         <div class="apply-box-caption-content">
                                 <p> DATE: </p>
                                <p> TITLE: </p>
                        </div>
                </div>
          </a>
	  </div>
	</div>
	
	<div class="row no-gutter">
	  <div class="col-md-4" >  	   	
	  	<a href="#" class="apply-box">
              <img src="${root}/img/Hydrangeas.jpg" class="img-responsive" alt="">
               <div class="apply-box-caption">
                         <div class="apply-box-caption-content">
                                <p> DATE: </p>
                                <p> TITLE: </p>
                        </div>
                </div>
         </a>
	  </div>
	  <div class="col-md-4" >  	   	
	 	 <a href="#" class="apply-box">
              <img src="${root}/img/Jellyfish.jpg" class="img-responsive" alt="">
               <div class="apply-box-caption">
                         <div class="apply-box-caption-content">
                                <p> DATE: </p>
                                <p> TITLE: </p>
                        </div>
                </div>
          </a>
      </div>
	  <div class="col-md-4" >
	  	<a href="#" class="apply-box">
              <img src="${root}/img/Koala.jpg" class="img-responsive" alt="">
               <div class="apply-box-caption">
                         <div class="apply-box-caption-content">
                              <p> DATE: </p>
                              <p> TITLE: </p>
                        </div>
                </div>
          </a>
	  </div>
	</div>
	 
	<div class="row no-gutter">
	  <div class="col-md-4" >  	   	
	  	<a href="#" class="apply-box">
              <img src="${root}/img/Penguins.jpg" class="img-responsive" alt="">
               <div class="apply-box-caption">
                         <div class="apply-box-caption-content">
                          		<p> DATE: </p>
                                <p> TITLE: </p>
                        </div>
                </div>
          </a>
      </div>  
	  <div class="col-md-4" >  	   	
	  	<a href="#" class="apply-box">
              <img src="${root}/img/Tulips.jpg" class="img-responsive" alt="">
               <div class="apply-box-caption">
                         <div class="apply-box-caption-content">
                       			<p> DATE: </p>
                                <p> TITLE: </p>
                        </div>
                </div>
          </a>
       </div>
	  <div class="col-md-4" >  	   	
	 	 <a href="#" class="apply-box">
              <img src="${root}/img/Lighthouse.jpg" class="img-responsive" alt="">
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
<jsp:include page="WEB-INF/views/template/loginModal.jsp?root1=${root1}"></jsp:include>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="${root}/css/jquery.cookie.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/css/main/main.js"></script>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
</body>
</html>
