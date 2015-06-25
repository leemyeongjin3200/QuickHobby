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
<style type="text/css">
	html { height: 100% }
    body { height: 100%; margin: 0; padding: 0 }
    #map_canvas { height: 100% }
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true">
</script>
<script type="text/javascript">
	function initialize() {
	    var mapOptions = {
	      center: new google.maps.LatLng(-34.397, 150.644),
	      zoom: 5,
	      mapTypeId: google.maps.MapTypeId.TERRAIN
	    };
	    var map = new google.maps.Map(document.getElementById("map_canvas"),
	        mapOptions);
 	}
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
			<a href="http://maps.googleapis.com/maps/api/geocode/json?address='서울시강남구역삼1동'&sensor=true"> Yeoksam1dong Gangnam Seoul</a>
			<br/><br/>
			<input type="button" value="click" onclick="initialize()"/>
		    <div id="map_canvas" style="width:50%; height:50%"></div>
		</div>
		
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