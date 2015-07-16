<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript">
var lat="";
var lng="";
$(document).ready(function geoLocation()
{
     if (navigator.geolocation)
          navigator.geolocation.getCurrentPosition(showPosition,showError);
     else
          alert("Geolocation is not supported by this browser.");
});
//위치 추적 Success
function showPosition(position)
{
     var lat = position.coords.latitude;
     var lng = position.coords.longitude;
     //현재 위치로 지도 이동
     var latlng=new google.maps.LatLng(lat, lng);
		var mapOptions={
				zoom:10,
				center:latlng,
				mapTypeId:google.maps.MapTypeId.ROADMAP
		}
		var map=new google.maps.Map(document.getElementById("map_canvas"),
	            mapOptions);
		var marker=new google.maps.Marker({
			position:latlng,
			map:map
		});
		
		var geocoder=new google.maps.Geocoder();
		
		google.maps.event.addListener(map, 'click', function(event){
			var location=event.latLng;
			geocoder.geocode({
				'latLng':location
			},
			function(results, status){
				if(status==google.maps.GeocoderStatus.OK){
					$('#address').html(results[0].formatted_address);
					var addr=document.getElementById("address").innerHTML;
					document.getElementById("addrText").value=addr;
					document.getElementById("addr").value=addr;
					$('#lat').html(results[0].geometry.location.lat());
					$('#lng').html(results[0].geometry.location.lng());
				}
				
			});
			if(!marker){
				marker=new google.maps.Marker({
					position:location,
					map:map
				});
			}
			else{
				marker.setMap(null);
				marker=new google.maps.Marker({
					position:location,
					map:map
				});
			}
			map.setCenter(location);
		});
}
//위치 추적 Faile
function showError(error)
{
     switch (error.code)
     {
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
	$(document).ready(function(){
		
	});
</script>
<style>
#map_canvas{
	width: 400px;
	float: left;
	display: inline;
    height: 400px;
}
</style>
</head>
<body>
	<a href="#" onclick="location()">요청하기</a><br/>
	<div id="map_canvas"></div>
</body>
</html>