<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script>
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
</script>
</head>
<body>
	<c:if test="${member!=null}">
		<script type="text/javascript">
			$(location).attr("href", "${root}/memberMain.do");
		</script>
	</c:if>
	
	<c:if test="${member==null}">
		<script type="text/javascript">
			alert("아이디와 비밀번호를 확인해주세요.");
			$(location).attr("href", "${root}/memberMain.do");
		</script>
	</c:if>
</body>
</html>