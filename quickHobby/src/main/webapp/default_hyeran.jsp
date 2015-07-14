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
<!-- smooth animate css file -->
 <link rel="stylesheet" href="${root}/css/groupBoard/animate.css">
 <!-- Slick slider css file --> 
 <link href="${root}/css/groupBoard/slick.css" rel="stylesheet">  
<style>
/*body 상단부 여백 */
body {
    padding-top: 70px;

}


/* a태그 효과없음 */
a:link{text-decoration:none !important;}
a:visited{text-decoration:none !important;}
a:hover{text-decoration:none !important;}
a:active{text-decoration:none !important;}



</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
    <div class="container-fluid-full">

	</div>
    
    
<script>


</script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/js/jquery.masonry.min.js"></script>
</html>