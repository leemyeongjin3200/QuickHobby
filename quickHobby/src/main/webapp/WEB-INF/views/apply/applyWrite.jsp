<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$("#date").datepicker({
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
			showOn: "button",
			buttonImage: "",
			buttonImageOnly: true
		});
		
		$("#btn").click(function(){
			$("#resultDate").text($("#date1").val());
		});
	});
</script>
 
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
					var addr=document.getElementById("address").innerHTML;
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
	});
</script>

<script type="text/javascript">
function checkForm(form){
// 	alert(form.groupCategory.value);
// 	alert(form.groupInout.value);
// 	console.log(form.groupDate.value);
// 	console.log(form.groupSubject.value);
	
	if(form.apply_category.value==""){
		alert("You have to check at least a category.");
		form.apply_category[0].focus();
		return false;
	}
	
	if(form.apply_inout.value==""){
		alert("You have to choose indoor or outdoor.");
		form.apply_inout[0].focus();
		return false;
	}
	
	if(form.apply_date.value==""){
		alert("You have to choose the closing date.");
		form.apply_date.focus();
		return false;
	}
	
	if(form.apply_subject.value==""){
		alert("You have to input the title.");
		form.apply_subject.focus();
		return false;
	}
	
	if(form.apply_subtitle.value==""){
		alert("You have to input the subtitle.");
		form.apply_subtitle.focus();
		return false;
	}
	
	if(form.apply_content.value==""){
		alert("You have to input the content.");
		form.apply_content.focus();
		return false;
	}
}

function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>
 
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>

	<form action="${root}/apply/applyWriteOk.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<input type="hidden" name="apply_host" value="1"/>
			
		<div>
			<label>Category</label>
			<span>
				<select name="apply_category">
					<optgroup label="category">
						<option></option>
					    <option value="eye">eye</option>
		        		<option value="mouth">mouth</option>
		       			<option value="hand">hand</option>
		       			<option value="legs">legs</option>
	       			</optgroup>
				</select>
			</span>
			<span>
				<select name="apply_inout">
					<optgroup label="indoor & outdoor">
						<option></option>
						<option value="in">in</option>
						<option value="out">out</option>
					</optgroup>
				</select>
			</span>
		</div>
		
		<div>
			<label>Date</label>
			<input type="text" name="apply_date" id="date"/><br/>
		</div>
		
		<div>
			<label>Section</label>
			<input type="text" name="apply_section"/><br/>
		</div>
		
		<div>
			<label>Location</label>
	 			<div id="map_canvas" style="width:460px; height:380px;"></div>
	 			<div id="address" style="display:none"></div><br/>
	 			<input type="text" id="addr" size="70" name="apply_location">
		</div><br/>
		
		<div>
			<label >Title</label>
			<span >
				<input type="text" name="apply_subject"/>
			</span>
		</div>
		
		<div>
			<label >Subtitle</label>
			<span >
				<input type="text" name="apply_subtitle"/>
			</span>
		</div>
		
		<div>
			<label >Cost</label>
			<span >
				<input type="text" name="groupCost" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
			</span>
		</div>
		
		<div style="height:230px;">
			<label class="title" style="height:230px;">Content</label>
			<span style="height:230px;">
				<textarea rows="14" cols="58" name="apply_content"></textarea>
			</span>
		</div>
		
		<div>
			<label>Picture</label>
			<input type="file" name="apply_file"/><br/>
		</div>
		
<!-- 		글쓰기, 취소, 버튼 부분 -->
		<div style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="Create"/>
			<input type="reset" value="Reset"/>
			<input type="button" value="List" onclick="location.href='${root}/apply/applyList.do'"/>
		</div>
	</form>
</body>
</html>