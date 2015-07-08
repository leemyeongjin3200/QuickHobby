<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>Insert title here</title>
</head>
<body onload="getNewMessage('${root}', '${member.memberNum}')">
<!-- Header -->
<header>
<nav class="navbar navbar-default navbar-fixed-top">
<%-- <br/><br/>
${param.root1} --%>
 <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${root}/memberMain.do">QuickHobby</a>
    </div>
    <!-- Before Login -->
	<!-- c:if문 설정  -->
	<c:if test="${member==null}">
	<div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	      	<li><a href="#">Apply</a></li>
	        <li><a href="#">Tip & Review</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="${root}/member/register.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
	        <li id="myLogin"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      </ul>
	  </div>
	  </c:if>
	<!-- c:if문 닫기 -->
	
	<c:if test="${member!=null}">
	<div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Apply<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">Apply Group</a></li>
	            <li><a href="#">Create Group</a></li>
	          </ul>
	        </li>
	        <li><a href="#">Tip & Review</a></li>
	        <li><a href="#" >My Group</a></li>
	        <li><a href="#">My Page</a></li>
	      </ul>
	      <input type="hidden" name="newMessageNum" value="${newMessageNum}"/>
	      <ul class="nav navbar-nav navbar-right">
	      	<li><a href="#"><span id="newMessage" class="badge"><span class="glyphicon glyphicon-envelope"></span></span></a></li>
	        <li><a href="${root}/member/update.do"><span class="glyphicon glyphicon-user"></span> ${member.memberNickName}</a></li>
	        <li id="myLogout"><a href="${root}/member/logout.do"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
	      </ul>
	  </div>
	</c:if>
  </div>
</nav>
</header>
<!-- //Header -->
</body>
</html>