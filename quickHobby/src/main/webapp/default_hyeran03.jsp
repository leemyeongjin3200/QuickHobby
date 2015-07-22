<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="root1" value="${pageContext.request.requestURI }"/>


<style>
/*body 상단부 여백 */
body {
    padding-top: 200px important;
}

.box{
	 display: table; width: 50px; height: 50px; border: 1px solid red;

}
img{
	width:70%;
}

.box span{
	display: table-cell; text-align: center; vertical-align: middle;
}

.con{
	display: table; 
	border:2px solid #ccc;
	background-color:red;
	height:120px;
	width:120px;
	border-radius:100%;
}


.con span{
	display: table-cell; text-align: center; vertical-align: middle;
}
#icon_eye{
    background: url('${root}/icon/eyeIcon01.png') center center no-repeat;
	background-size: 100px auto;

}

</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
<div class="container">
<br/><br/><br/>
	<div class="box">
   		<span><img src="${root}/weather/Slight Drizzle.png" alt="weather"  ></span>
     </div>
</div>
<br/><br/><br/>


    
    <div class="con">
		<span id="icon_eye"></span>
   </div>

<script src="${root}/css/apply/default.js"></script>
<script type="text/javascript">

</script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>

</html>