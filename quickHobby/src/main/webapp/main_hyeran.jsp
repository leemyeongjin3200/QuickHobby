<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
//Navigation bar 필터설정

</script>
<title>QuickHobby-Grid-3col</title>
</head>
<body>
<!-- Header -->
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
<!-- //Header -->

<!-- Content 1//-->
<div class="container-fluid">
  <br>
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
<!-- //Content2 -->

<!-- Login Pop-Up// -->
 <div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block" style="background-color:#BDBDBD; border-color:#BDBDBD"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
    </div>
  </div> 
</div>
<!-- //Login Pop-Up -->

<!-- footer// -->
<footer>
	<div id="copyRight">CopyRight @ QuickHobby </div>
</footer>
<!-- //footer -->
 
</body>
</html>