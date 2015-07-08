<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<title>비밀번호 찾기</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include><br/><br/>
<body>
	<div class="container">
		<div class="page-header">
			<h2>비밀번호 찾기</h2>
		</div>
		<form name="findPasswordForm" action="${root}/member/findPassword.do" method="post" onsubmit="return findPasswordCheck(this)">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div id="emailDiv" class="form-group has-feedback">
				<label for="memberId"><span	class="glyphicon glyphicon-envelope"></span> E-Mail</label>
				<div class="row">
					<div class="col-md-8">
						<input class="form-control" type="text" name="memberId"	placeholder="E-Mail" /> <span id="emailIcon"></span>
					</div>
					<div class="col-md-3">
						<button type="button" style="padding-left:35px" class="form-control btn btn-primary" onclick="sendCodeFindPass(memberId, '${root}')">인증번호 받기</button>
					</div>
				</div>
				<input type="hidden" name="emailCheck" value="0" />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-default" value="비밀번호 찾기"/>
			</div>
		</div>
		<div class="col-md-2"></div>
		</form>
	</div>
</body>
<jsp:include page="sendCodeFindPass.jsp"></jsp:include>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>