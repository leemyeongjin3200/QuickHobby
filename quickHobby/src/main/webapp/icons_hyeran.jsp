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


.blog-date {
    background      : #f54828;
    padding         : 10px 25px 15px;
    font-family     : 'Roboto Condensed', sans-serif;
    color           : #ffffff;
    font-size       : 20px;
    text-align      : center;
    line-height     : 20px;
    text-transform  : capitalize;
    width: 50px;
}

.blog-date p{
    font-size   : 18px;
}

.blog-date span{
    color       : #ffffff;
    font-size   : 55px;
    font-weight : bold;
    line-height : 55px;
}

/** 
.team_social {
  color: #fff;
  font-size: 40px;
  display: inline-block;
  background: #ccc;
  width: 100px;
  height: 100px;
  line-height: 100px;
  border-radius: 50%;
  -webkit-transition: all 0.5s;
  -o-transition: all 0.5s;
  transition: all 0.5s;

}

.team_social i {
  display: inline-block;
  width: 100px;
  height: 100px;
  line-height: 100px;
  border-radius: 50%;
  -webkit-transition: all 0.5s;
  -o-transition: all 0.5s;
  transition: all 0.5s;
  margin-left: 30%;
}
*/


.team_social{
	float: left;
	display: inline;
	width: 100%;
	margin-top: 10px;
}

.team_social span {
  color: #fff;
  font-size: 40px;
  display: inline-block;
  background: #ccc;
  width: 100px;
  height: 100px;
  line-height: 100px;
  border-radius: 50%;
  -webkit-transition: all 0.5s;
  -o-transition: all 0.5s;
  transition: all 0.5s;
}

.team_social i {
  display: inline-block;
  background: #red;
  width: 100px;
  height: 100px;
  line-height: 100px;
  border-radius: 50%;
  -webkit-transition: all 0.5s;
  -o-transition: all 0.5s;
  transition: all 0.5s;
  margin-left:30%;
}

.team_social .eye{
	background-color:red;
}

.team_social .hands{
	background-color:#0054FF;
}

.team_social .mouth{
	background-color:#9FC93C;
}

.team_social .legs{
	background-color:#FFE08C;
}




</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
    <div class="container">
 		<div class="blog-date"><!-- blog-date -->
              <span>WED</span><p>Aug 08</p>
        </div><!-- /.blog-date -->
        <br/><br/>
        <!-- 
         <div class="team_social">
                      <a href="#"><i class="glyphicon glyphicon-comment"></i></a>
                      <a href="#"><i class="glyphicon glyphicon-user"></i></a>
                      <a href="#"><i class="glyphicon glyphicon-calendar"></i></a>
                      <a href="#"><i class="glyphicon glyphicon-heart"></i></a>
        </div> -->
        <!-- 
        <div class="team_social">
              <i class="glyphicon glyphicon-comment"></i>
              <i class="glyphicon glyphicon-user"></i>
        </div>-->
        
        
            <div class="team_social">
                 <span class="eye"><i class="glyphicon glyphicon-comment" ></i></span>
                 <span class="hands"><i class="glyphicon glyphicon-user"></i></span>
                 <span class="mouth"><i class="glyphicon glyphicon-calendar"></i></span>
                 <span class="legs"><i class="glyphicon glyphicon-heart"></i></span>
       		</div>

    </div>
    
    
<script>
//


</script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
</html>