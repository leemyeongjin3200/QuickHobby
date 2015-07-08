<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/main.css"/>
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
	$(function(){
		document.getElementById("${applyDto.apply_category}").selected=true;
		document.getElementById("${applyDto.apply_inout}").selected=true;
		document.getElementById("apply_file").setAttribute("defaultValue", "${applyDto.apply_filepath}");
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
<jsp:include page="../template/header.jsp"></jsp:include><br/><br/>
<body>
	<div class="container">
		<div class="page-header">
			<h2>모임 수정하기</h2>
		</div>
		
		<!-- 신청게시물의 수정 정보를 입력 받는 form -->
		<form name="applyUpdateForm" action="${root}/apply/applyUpdateOk.do" method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">
			<div class="col-md-6">
				<input type="hidden" name="apply_host" value="1"/>
				<input type="hidden" name="apply_num" value="${applyDto.apply_num}"/>
				
				<div id="category" class="form-group">
					<label for=""><span class="glyphicon glyphicon-list-alt"></span> Category  /  Indoor & Outdoor</label>
					<div class="row">
						<div class="col-md-10">
							<span class="col-xs-4">
								<select class="form-control" name="apply_category">
									<optgroup label="category">
										<option></option>
									    <option id="eye" value="eye">eye</option>
						        		<option id="mouth" value="mouth">mouth</option>
						       			<option id="hand" value="hand">hand</option>
						       			<option id="legs" value="legs">legs</option>
					       			</optgroup>
								</select>
							</span>
							
							<span class="col-xs-4">
								<select class="form-control" name="apply_inout">
									<optgroup label="indoor & outdoor">
										<option></option>
										<option id="in" value="in">in</option>
										<option id="out" value="out">out</option>
									</optgroup>
								</select>
							</span>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for=""><span class="glyphicon glyphicon-pushpin"></span> Title</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" value="${applyDto.apply_subject}" type="text" name="apply_subject" placeholder="Title"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for=""><span class="glyphicon glyphicon-subtitles"></span> Subtitle</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" value="${applyDto.apply_subtitle}" type="text" name="apply_subtitle" placeholder="Subtitle"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for=""><span class="glyphicon glyphicon-search"></span> Section</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" value="${applyDto.apply_section}" type="text" name="apply_section" placeholder="Section"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for=""><span class="glyphicon glyphicon-usd"></span> Cost</label>
					<div class="row">
						<div class="col-md-9">
							<input class="form-control" value="${applyDto.apply_cost}" type="text" name="groupCost" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;' placeholder="Cost">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="title"><span class="glyphicon glyphicon-pencil"></span> Content</label>
					<div class="row" style="height:230px;">
						<div class="col-md-9">
							<textarea class="form-control" rows="14" cols="58" name="apply_content" placeholder="Content"> ${applyDto.apply_content}</textarea>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="form-group">
					<label for=""><span class="glyphicon glyphicon-calendar"></span> Date</label>
					<div class="row">
						<div class="col-xs-4">
							<input class="form-control" value="${date}" type="date" name="apply_date" id="date"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for=""><span class="glyphicon glyphicon-map-marker"></span> Location</label>
					<div class="row">
						<div class="col-md-10">
				 			<div id="map_canvas" style="width:460px; height:380px;"></div>
				 			<div id="address" style="display:none"></div><br/>
			 				<input class="form-control" value="${applyDto.apply_location}" type="text" id="addr" size="70" name="apply_location">
			 			</div>
		 			</div>
				</div>
				
				<div class="form-group">
					<label for=""><span class="glyphicon glyphicon-camera"></span> Picture</label>
					<div class="row">
						<div class="col-md-10">
							<input class="btn btn-default" type="file" name="apply_file" id="apply_file"/>
						</div>
					</div>
				</div><br/>
				
				<!-- 글쓰기, 취소, 버튼 부분 -->
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="Complete"/>
					<input type="button" class="btn btn-default" value="List" onclick="location.href='${root}/apply/applyList.do'"/>
				</div>
			</div>
		</form>
	</div>
	
<jsp:include page="../template/loginModal.jsp"></jsp:include>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/css/main/main.js"></script>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
</body>
</html>