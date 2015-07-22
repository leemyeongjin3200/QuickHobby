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
/*
body {
    padding-top: 70px;
}
*/
#icon_eye{
    background: url('${root}/icon/eyeIcon.png') center center no-repeat;
	background-size: 42px auto;
	background-color:#e74c3c;
	border:2px solid #e74c3c;
}
#icon_mouth{
	background: url('${root}/icon/mouthIcon.png') center center no-repeat;
	background-size: 40px auto;
	background-color:#BCE067;
	border:2px solid #BCE067;
}
#icon_hand{
	background: url('${root}/icon/handIcon.png') center center no-repeat;
	background-size: 40px auto;
	background-color:#3498db;
	border:2px solid #3498db;
}
#icon_legs{
	background: url('${root}/icon/feetIcon.png') center center no-repeat;
	background-size: 40px auto;
	background-color:#8e44ad;
	border:2px solid #8e44ad;
}

</style>
<title>Apply</title>
<!-- smooth animate css file -->
 <link rel="stylesheet" href="${root}/css/groupBoard/animate.css">
 <!-- css file --> 
<link rel="stylesheet" href="${root}/css/apply/jquery-ui-1.8.21.custom.css">
<link rel="stylesheet" href="${root}/css/apply/jquery-ui-slider-pips.css">
<link rel="stylesheet" href="${root}/css/apply/applyGrid.css">
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<c:if test="${param.loginCheck==1}">
	<script type="text/javascript">
		$("#myModal").modal();
	</script>
</c:if>
	<c:if test="${error==1}">
		<script>
			alert("이미 가입그룹이 꽉 찼습니다.");
		</script>
	</c:if>
	<div class="container-fluid filterMenu" style="display: block;">
		<div class="collapse out" id="demo">
			<div class="row filterStart">
				<div class="col-md-2 panel">
				 <header class="panel-heading">FILTER</header>
					<div class="button panel-body" style="height:210px !important;">
						<ul class="filterAllBest filterGroup" data-filter-group="all">
  							<li data-filter="*"><a href="#" class="btn btn-default btn-block btn-lg" id="allBtn">All</a></li>
  							<li data-filter=".best"><a href="#" class="btn btn-default btn-block btn-lg" id="bestBtn">BEST</a></li>
						</ul>
			        </div>
				</div>
				
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4 panel">
						<header class="panel-heading">DATE</header>
						<div class="panel-body">
							<ul class="date filterGroup" data-filter-group="date">
								<input type="text" id="datepicker" size="12"> - <input type="text" id="datepicker2"  size="12">
								<li data-filter=".date"><a href="#" class="button"><span class="glyphicon glyphicon-ok-sign"></span></a></li>
							</ul>
						</div>
					</div>
					
					<div class="col-md-4 panel">
						<header class="panel-heading">CATEGORY</header>
						<div class="btn-group panel-body categoryBtn" data-toggle="buttons">
							<ul class="filterGroup" data-filter-group="category">
					          <li data-filter=".eye">
					          	<label class="btn btn-default categoryBtn-circle" id="icon_eye">
					          		<input type="radio" name="options" id="option1" >
					          	</label>
					          </li>
					          <li data-filter=".mouth">
					          	<label class="btn btn-default categoryBtn-circle" id="icon_mouth">
					          		<input  type="radio" name="options" id="option2">
					          	</label>
					          </li>
					          <li data-filter=".hand">
					          	<label class="btn btn-default categoryBtn-circle" id="icon_hand">
					          		<input  type="radio" name="options" id="option3">
					          	</label>
					          </li>
					          <li data-filter=".legs">
					          	<label class="btn btn-default categoryBtn-circle" id="icon_legs">
					          		<input  type="radio" name="options" id="option4">
					          	</label>
					          </li>
					        </ul>
				        </div>
					</div>
					
					<div class="col-md-2 panel" >
						<header class="panel-heading">INDOOR/OUTDOOR</header>
						<div class="btn-group btn-group-justified panel-body inoutBtn" data-toggle="buttons">
							<ul class="filterGroup" data-filter-group="inOut">
							 	<li data-filter=".indoor">
							 		<label class="btn btn-default" style="border-top-right-radius: 0; border-bottom-right-radius: 0;">
							 			<input type="radio" name="options" id="option5">IN
							 		</label>
							 	</li>
							 	<li data-filter=".outdoor"><label class="btn btn-default" style="border-top-left-radius: 0; border-bottom-left-radius: 0;"><input type="radio" name="options" id="option6" >OUT</label></li>
							 </ul> 
						</div>			
					</div>
					
					<div class="col-md-2 panel">
						<header class="panel-heading">APPLICATION FEE</header>
						<div class="btn-group btn-group-justified panel-body feeBtn" data-toggle="buttons">
							<ul class="filterGroup" data-filter-group="applicationFee">
							  <li data-filter=".fee">
							  	<label class="btn btn-default" style="border-top-right-radius: 0; border-bottom-right-radius: 0;"><input type="radio" name="options" id="option7">YES</label>
							  </li>
							  <li data-filter=".free">
							  	<label class="btn btn-default" style="border-top-left-radius: 0; border-bottom-left-radius: 0;"><input type="radio" name="options" id="option8" >NO</label>
							  </li>
							 </ul> 
						</div>	
					</div>
				</div><!-- .row 끝 -->
				
				<div class="row" >
					<div class="col-md-12 panel" style="margin-top:-20px;">
						<header class="panel-heading">DISTANCE</header>
						<div class="locationFilter panel-body">
							<div class="slider filterGroup" data-filter-group="location"></div>
						</div>
					</div>
				</div>
			</div><!--.col-md-10 끝  -->
		</div ><!-- .row -->
	</div><!-- .filterMenu 끝 -->
</div><!-- #demo 끝 -->
		

		
<div class="container-fluid">
	<div class="open" data-toggle="collapse" data-target="#demo">
			<span class="glyphicon glyphicon-search"></span>
	</div>
</div>
<!-- Navigation bar//-->

<div class="container" style="overflow:auto hidden;">
<!-- Page Title// -->
       <div class="row">
           <div class="col-lg-12">
               <h1 class="page-header">신청게시판
                   <small>Apply</small>
               </h1>
           </div>
       </div>
   <!-- //Page Title -->
   <div id="content" class="span12">
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-content">
						<div class="grid point" id="">
							<c:forEach var="board" items="${applyDtoList}">
								<input type="hidden" name="groupLocation" value="${board.apply_location}"/>
								<input type="hidden" class="distance${board.apply_num}" value=""/>
								<div id="board" class="grid-item ${board.apply_category} ${board.apply_inout} ${board.apply_num}">
									<fmt:formatDate var="closeDate" value="${board.apply_closedate}" pattern="yyyyMMdd"/>
									<input type="hidden" id="groupDate" value="${closeDate}"/>
									<div class="apply-box">
										<a title="" href="${root}/apply/applyRead.do?apply_num=${board.apply_num}" class="apply-box">
											<c:if test="${board.apply_filename == null }">
												<img class="grayscale img-responsive" src="${root}/groupImage/default.jpg">
											</c:if>
											<c:if test="${board.apply_filename != null }">
												<img class="grayscale img-responsive" src="${root}/groupImage/${board.apply_filename}">
											</c:if>
											<div class="apply-box-caption">
												<div class="apply-box-caption-content">
													<p><fmt:formatDate value="${board.apply_closedate}" type="date" pattern="yyyy. MM. dd"/> </p>
													<p>${board.apply_subject} </p>
													<p>${board.apply_subtitle} </p>
												</div>
											</div>
										</a>
									</div>
								</div>
								<c:if test="${board.apply_readcount>100}">
									<script>
										$("." + '${board.apply_num}').addClass("best");
									</script>
								</c:if>
								<c:if test="${board.apply_cost>0}">
									<script>
										$("." + '${board.apply_num}').addClass("fee")
									</script>
								</c:if>
								<c:if test="${board.apply_cost==0 || board.apply_cost==null}">
									<script>
										$("." + '${board.apply_num}').addClass("free")
									</script>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div><!--/span-->
			</div><!--/.row-fluid sortable-->
		</div><!-- end: Content -->
	<div class="clearfix"></div>
</div>	
<!-- //Content2 -->
<input type="hidden" id="userLat" value=""/>
<input type="hidden" id="userLng" value=""/>
<script type="text/javascript" src="${root}/css/apply/jquery-ui.js"></script>
<script  type="text/javascript" src="${root}/css/apply/jquery-ui-slider-pips.js"></script>
<script type="text/javascript" src="${root}/css/apply/jquery-migrate-1.0.0.min.js"></script>
<script type="text/javascript" src="${root}/css/apply/apply-grid.js"></script>
<script type="text/javascript" src="${root}/css/apply/isotope-docs.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script src="${root}/css/groupBoard/jquery.ui.map.js"></script>
<script type="text/javascript">
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
<c:forEach var="board" items="${applyDtoList}">
<script type="text/javascript">
	var geocoder = new google.maps.Geocoder();
	var addr='${board.apply_location}';
	
	var lat="";
    var lng="";
 
    geocoder.geocode({'address':addr},
 
        function(results, status){
 
            if(status==google.maps.GeocoderStatus.OK){
 
                var location=results[0].geometry.location;
 
                lat=location.lat();
                lng=location.lng();
                var dist=distance(lat, lng);
                
                var className="";
                
                if(dist>=300){
                	className+="location11 ";
                }
                if(dist>=200){
                	className+="location10 ";
                }
                if(dist>=150){
                	className+="location9 ";
                }
                if(dist>=100){
                	className+="location8 ";
                }
                if(dist>=50){
                	className+="location7 ";
                }
                if(dist>=40){
                	className+="location6 ";
                }
                if(dist>=30){
                	className+="location5 ";
                }
                if(dist>=20){
                	className+="location4 ";
                }
                if(dist>=10){
                	className+="location3 ";
                }
                if(dist>=5){
                	className+="location2 ";
                }
                if(dist>=0){
                	className+="location1 ";
                }
              
                $("." + '${board.apply_num}').addClass(className);
                $(".distance"+'${board.apply_num}').val(dist);
            }else{
            	alert("에러");
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
</c:forEach>
<script type="text/javascript">
// filter 설정
$(function() {
	  // init Isotope
	  
	  var filters={};
	  
	  var $grid = $('.grid').isotope({
	    itemSelector: '.grid-item'
	  });
	  
	  // filter functions
	  var filterFns = {
			 
	  };
	  
	  var filterValue="";
	  //filter  li 클릭시
	  $('.filterGroup').on('click', 'li', function() {
		  	var arr1=$("#datepicker").val();
		  	var arr2=$("#datepicker2").val();
		  	arr1=arr1.split("/");
		  	arr2=arr2.split("/");
			var date1=arr1[2] + arr1[0] + arr1[1];
			var date2=arr2[2] + arr2[0] + arr2[1];
			date1=parseInt(date1);
			date2=parseInt(date2);
			
			
		  $(".grid-item").each(function(){
			  $(this).removeClass("date");
			  var groupDate=parseInt($(this).find("#groupDate").val());
			  if(groupDate >= date1 && groupDate <= date2){
				  $(this).addClass("date");
			  }
		  })
		  
		  var $this = $(this);
		  // get group key
		  var $buttonGroup = $this.parents('.filterGroup');
		  var filterGroup = $buttonGroup.attr('data-filter-group');
		  // set filter for group
		  filters[ filterGroup ] = $this.attr('data-filter');
		  // combine filters
		  filterValue = concatValues( filters );
		  filterValue=filterFns[filterValue] || filterValue;

		  $grid.isotope({ filter: filterValue });
	  });
	  
	  $('.filterAllBest').on('click', 'li', function() {
		    filters={};

		    var filterValue = $(this).attr('data-filter');
		    // use filterFn if matches value
		    filterValue = filterFns[filterValue] || filterValue;
		    $grid.isotope({
		      filter: filterValue
		    });
		  });
	  
	  function concatValues( obj ) {
		  var value = '';
		  for ( var prop in obj ) {
		    value += obj[ prop ];
		  }
		  return value;
		}

	  // change is-checked class on buttons
	  $('.filterGroup').each(function(i, filterGroup) {
	    var $filterGroup = $(filterGroup);
	    $filterGroup.on('click', 'li', function() {
	      $filterGroup.find('.is-checked').removeClass('is-checked');
	      $(this).addClass('is-checked');
	    });
	  });
	  
	  var locations = ["", "~5km", "~10km", "~20km", "~30km", "~40km", "~50km", "~100km", "~150km", "~200km", "~300km", "300km~"];
	//lets be fancy for the demo and select the current month.

	$(".slider")        
	 // activate the slider with options
	 .slider({ 
	     min: 0, 
	     max: 11, 
	 })
	                 
	 // add pips with the labels set to "locations"
	 .slider("pips", {
	     rest: "label",
	     labels: locations
	 })
	                 
	 // and whenever the slider changes, lets echo out the month
	 .on("slidechange", function(e,ui) {
		  //filter nav-bar nav li 클릭시
		  if(ui.value!=0){
			  $(this).attr("data-filter", ".location" + ui.value);
		  }else{
			  $(this).attr("data-filter", "");
		  }
		  
		  var $this = $(this);
		  // get group key
		  var $buttonGroup = $this.parents('.filterGroup');
		  var filterGroup = $buttonGroup.attr('data-filter-group');
		  // set filter for group
		  filters[ filterGroup ] = $this.attr('data-filter');
		  // combine filters
		  filterValue = concatValues( filters );
		  
		  $grid.isotope({ filter: filterValue });
		    
	    // $("#labels-locations-output").text( "You selected " + locations[ui.value] + " (" + ui.value + ")");
	 });

	$(function() {
		$("#datepicker").datepicker({showOn: 'button', buttonImage: '${root}/img/calendar.gif', buttonImageOnly: true});

		$("#datepicker2").datepicker({showOn: 'button', buttonImage: '${root}/img/calendar.gif', buttonImageOnly: true});

	});
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
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
