<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/css/apply/apply.js"></script>
<script type="text/javascript">
// 	$(function(){
// 		$("#date").datepicker({
// 			dateFormat: "yy-mm-dd",
// 			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
// 			dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
// 			showOn: "button",
// 			buttonImage: "",
// 			buttonImageOnly: true
// 		});
		
// 		$("#btn").click(function(){
// 			$("#resultDate").text($("#date1").val());
// 		});
// 	});
</script>
 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var latlng=new google.maps.LatLng(37.5640, 126.9751);
		var mapOptions={
				zoom:7,
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
					$('#lat').html(results[0].geometry.location.lat());
					$('#lng').html(results[0].geometry.location.lng());
				}
				else{
					alert("Geocoder failed due to:"+status);
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
	});
</script>
 
</head>
<body>
	<form action=""  method="post" onsubmit="" enctype="multipart/form-data">	
		<input type="hidden" name="" value=""/>
			
		<div>
			<label>Category</label>
			<span>
				<select name="GROUP_CATEGORY">
					<optgroup label="category">
						<option></option>
					    <option value="0">eye</option>
		        		<option value="1">mouth</option>
		       			<option value="2">hand</option>
		       			<option value="3">legs</option>
	       			</optgroup>
				</select>
			</span>
			<span>
				<select name="GROUP_INOUT">
					<optgroup label="indoor & outdoor">
						<option></option>
						<option value="4">in</option>
						<option value="5">out</option>
					</optgroup>
				</select>
			</span>
		</div>
		
		<div>
			<label>Date</label>
			<input type="text" name="apply_date" id="date"/><br/>
		</div>
		
		
		<div>
			<label>Location</label>
	 			<div id="map_canvas" style="width:460px; height:380px;"></div>
	 			<input type="text" id="address" value="address"/>
	 			<div id="address"></div>
		</div><br/>
		
		<div>
			<label >Title</label>
			<span >
				<input type="text" name=""/>
			</span>
		</div>
		
		<div>
			<label >Subtitle</label>
			<span >
				<input type="text" name=""/>
			</span>
		</div>
		
		<div style="height:230px;">
			<label class="title" style="height:230px;">Content</label>
			<span style="height:230px;">
				<textarea rows="14" cols="58" name=""></textarea>
			</span>
		</div>
		
<!-- 		글쓰기, 취소, 버튼 부분 -->
		<div style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="Create"/>
			<input type="reset" value="Reset"/>
		</div>
	</form>
</body>
</html>