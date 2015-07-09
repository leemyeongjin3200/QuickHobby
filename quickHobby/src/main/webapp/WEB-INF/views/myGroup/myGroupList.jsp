<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" type="text/css" href="${root}/css/myGroup/myGroup.css"/>
<title>Insert title here</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
	<br/><br/>
	<div class="container">
		<div class="page-header">
			<h2>My Group</h2>
		</div>
		<div id="backgroundDiv" class="row">
			<div class="col-md-4 postDiv">
				<a href="#">	
					<img src="${root}/background/post11.png" class="img-responsive" height="150" width="250"></img>
					<div>
						
					</div>
				</a>
			</div>
			<div class="col-md-4 postDiv">
				<a href="#">
					<img src="${root}/background/post11.png" class="img-responsive" height="150" width="250"></img>
				</a>
			</div>
			<div class="col-md-4 postDiv">
				<a href="#">
					<img src="${root}/background/post11.png" class="img-responsive" height="150" width="250"></img>
				</a>
			</div>
			<div class="col-md-4 postDiv">
				<a href="#">
					<img src="${root}/background/post11.png" class="img-responsive" height="150" width="250"></img>
				</a>
			</div>
			<div class="col-md-4 postDiv">
				<a href="#">
					<img src="${root}/background/post11.png" class="img-responsive" height="150" width="250"></img>
				</a>
			</div>
			<div class="col-md-4 postDiv">
				<a href="#">
					<img src="${root}/background/post11.png" class="img-responsive" height="150" width="250"></img>
				</a>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>