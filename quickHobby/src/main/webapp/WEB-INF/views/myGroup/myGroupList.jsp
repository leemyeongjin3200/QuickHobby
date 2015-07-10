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
	</div>
	<div class="container">
		<div id="backgroundDiv" class="row">
			<c:forEach var="group" items="${groupList}">
				<div class="col-md-3 postDiv">
					<a href="#">	
						<img src="${root}/background/polaroid.png" class="img-responsive" height="150" width="250"></img>
						<img src="${root}/groupImage/${group.groupFileName}" class="img-responsive" height="100" width="200"></img>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/myGroup/myGroup.js"></script>
</html>