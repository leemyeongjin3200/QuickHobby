<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="${root }/css/memberBoard/memberBoard.js"></script>
	<link rel="stylesheet" type="text/css" href="${root }/css/memberBoard/style.css">
	
	<style type="text/css">


@CHARSET "UTF-8";


.src{

overflow:auto;width:1000px;height:1000px;
align:auto;





}

.a{
overflow:auto;
align:auto;

}
.subject{
	height:300px;
}

.subject1{
	height:200px;
}
.container row{
clear:left;
margin:0;
padding:0;
list-style-type:none;
}


.container .header{
font-weight: bold;
text-align:center;
border-top:1px solid #000;

}



</style>
</head>
<body>


<c:if test="${count!=0 }">	
  <div class="container src" align="center">
  


	<c:forEach var="board" items="${memberBoardList}">

<div class="row"> 
  <div class="col-sm-9 col-md-9 col-lg-9 subject1" style="background-color:lavender;">
  
  
  <img class="a" src="${root}/img/${board.board_filename}" width="304" height="236" align="left">

 </div>
</div>
<!--  <ul>-->
<div class="row">
 <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 subject" style="background-color:lightcyan;">${board.board_createdate}</div>
  </div>
  <div class="row">
 <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" style="background-color:lightcyan;">
 
 
 

 

 <input type="text" name="e1"/>
		<input type="button" id="btn1" maxlength="30" size="30" value="버튼"/>


 </div>
  </div>
  <div class="row">
 <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" style="background-color:lightcyan;">
 댓글:
	<input type="text" name="e"/>
 </div>
	
  </div>
  
<!--  </ul>-->


			</c:forEach>


</div>
</c:if>
  
<!--  <table width="530" align="center">
<tr>
<td align="right" bgcolor="D1DBDB">
<a href="${root}/board/jesus.do">목록보기</a>
</td>

	 
	 
	<c:if test="${count!=0 }">	
	<br/><br/>
		<table border="1" width="530" cellpadding="2" cellspacing="0" align="center">
		<tr>
<td align="right" bgcolor="D1DBDB">
<a href="${root}/board/jesus.do">목록보기</a>
</td>
</tr>
			<tr> 
			
			
				<td align="center" width="70">작성자</td>
			    <td align="center" width="250">작성</td>
				<td align="center" width="100">날짜</td>
			
			</tr>-->
			
			<!-- Board List -->
			<!--<c:forEach var="board" items="${jesusList}">
				<tr>
					<td>${board.board_writer}</td>						
					<td>${board.board_subject}</td>
					<td>${board.board_createdate}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	 
	
	

</tr>
</table>
-->







</body>
</html>