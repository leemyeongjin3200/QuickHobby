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
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script src="${root}/css/groupBoard/jquery.ui.map.js"></script>
<script>
$(document).ready(function(){
		var userLat="";
		var userLng="";
		$(document).ready(function geoLocation()
		{
		     if (navigator.geolocation)
		          navigator.geolocation.getCurrentPosition(showPosition,showError);
		     else
		          alert("Geolocation is not supported by this browser.");
		});

		function showPosition(position){
		    userLat = position.coords.latitude;
		    userLng = position.coords.longitude;
		    
		    $("#userLat").val(userLat);
		    $("#userLng").val(userLng);
		}

		function showError(error){
		     switch (error.code){
		          case error.PERMISSION_DENIED:
		               alert("User denied the request for Geolocation.");
		               break;
		          case error.POSITION_UNAVAILABLE:
		               alert("Location information is unavailable.");
		               break;
		          case error.TIMEOUT:
		               alert("The request to get user location timed out.");
		               break;
		          case error.UNKNOWN_ERROR:
		               alert("An unknown error occurred.");
		               break;
		     }
		}
});
</script>
<body>
<!-- Navigation bar//-->
 <div class="container" >
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
       <li id="" data-filter=".location3"><a href="#">LOCATION</a></li>
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
<div class="grid no-gutter point">
	<c:forEach var="board" items="${applyDtoList}">
		<input type="hidden" name="groupLocation" value="${board.apply_location}"/>
		<div class="col-md-4 ${board.apply_category} ${board.apply_inout} ${board.apply_num}" id="board">
			<script>
			var geocoder = new google.maps.Geocoder();
			var addr='${board.apply_location}';
			
			var lat="";
		    var lng="";
		 
		    geocoder.geocode({'address':addr},
		 
		        function(results, status){
		 
		            if(results!=""){
		 
		                var location=results[0].geometry.location;
		 
		                lat=location.lat();
		                lng=location.lng();
		                var dist=distance(lat, lng);
		                
		                var className="";
				    	if(dist>0 && dist <= 5){
				    		className="location1";
				    	}else if(dist <= 10){
				    		className="location2";
				    	}else if(dist <= 20){
				    		className="location3";
				    	}else if(dist <= 30){
				    		className="location4";
				    	}else if(dist <= 40){
				    		className="location5";
				    	}else if(dist <= 50){
				    		className="location6";
				    	}else if(dist <= 100){
				    		className="location7";
				    	}else if(dist <= 150){
				    		className="location8";
				    	}else if(dist <= 200){
				    		className="location9";
				    	}else if(dist <= 300){
				    		className="location10";
				    	}else{
				    		className="location11";
				    	}
				    	$("." + '${board.apply_num}').addClass(className);
		            }
		    });

		    function distance(lat, lng){
				var userLat=Number($("#userLat").val());
				var userLng=Number($("#userLng").val());
		    	var theta=userLng-lng;
		    	var dist=Math.sin(deg2rad(userLat)) * Math.sin(deg2rad(lat)) + Math.cos(deg2rad(userLat))
		    			* Math.cos(deg2rad(lat)) * Math.cos(deg2rad(theta));
		    	dist=Math.acos(dist);
		    	dist=rad2deg(dist);
		    	dist=dist*60*1.1515;
		    	dist=dist*1.609344;
		    	dist=Number(dist).toFixed(2);
		    	return dist;
		    }

		    function deg2rad(deg){
		    	return (deg * Math.PI / 180);
		    }

		    function rad2deg(rad){
		    	return (rad*180/Math.PI);
		    }  
		</script>
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
<input type="hidden" id="userLat" value=""/>
<input type="hidden" id="userLng" value=""/>
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
