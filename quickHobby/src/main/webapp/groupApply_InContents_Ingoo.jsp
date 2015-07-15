<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">


<style>
/*groupApply*/
.groupApply-img img {
    width: 100%;
    border-radius: 1px;
	height: 500px;
}
.groupApply-detail {
    padding-bottom: 15px;
    font-size: 15px;
}

.groupApply-list i { color: #c7c7c7 }
.image-caption a { padding: 10px 15px }
.pad-ten { padding-bottom: 30px }
.gApplyTitle { margin-top: 40px }

.single_gMember {
  border: 1px solid #ccc;
  border-radius: 5px;
  display: inline;
  float: left;
  padding: 15px 15px;
  text-align: center;
  width: 100%;
}
.gMember_img{
	float: left;
	display: block;
	width: 100%;
}
.gMember_img > img {
  border-radius: 100%;
  height: 150px;
  margin: 0 auto 15px;
  width: 150px;
}

.single_gMember span {
  display: inline-block;
  font-size: 15px;
  margin-bottom: 10px;
 
}

</style>

<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="groupApply-img post-thumb">
                     <img class="img-responsive" src="${root}/img/Lighthouse.jpg"/>
                 </div>
                 <div class="post-meta">
                	<span><i class="glyphicon glyphicon-user"></i> 3 Joins</span>
                	<span><i class="glyphicon glyphicon-heart"></i> 0 Likes</span> 
              	</div>
            </div>
        </div>
    </div>


    <!--container start-->
    <div class="container">
        <div class="row">
            <!--portfolio-single start-->

            <div class="col-lg-8">
                <div class="gApplyTitle">
                    <h3>*****Meet people who like Paragliding*****</h3>
                    <hr>
                </div>
                <div class="groupApply-detail">
                	<h4> DATE: </h4>
                	<h4> LOCATION: </h4>
                	<b>패러글라이딩 모임 소제목 쓰세요.</b>
                	
                    <p> 패러글라이딩 소개글 입니다. 패러글라이딩 소개글 입니다.  패러글라이딩 소개글 입니다. 
                   패러글라이딩 소개글 입니다.  패러글라이딩 소개글 입니다.  패러글라이딩 소개글 입니다. 
                   패러글라이딩 소개글 입니다.  패러글라이딩 소개글 입니다. 패러글라이딩 소개글 입니다. 
                    </p>
                    <p>
                    
                    </p>
                </div>
            </div>

            <div class="col-lg-4 groupHost">
                <div class="gApplyTitle">
                    <h3>Group Host</h3>
                    <hr>
                </div>
      			<div class="single_gMember" >
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                   <ul class="list-unstyled groupApply-list">
                    <li><i class="glyphicon glyphicon-user"></i><span><a href="#"> Leemyeongjin</a></span></li>
                    <li><i class="glyphicon glyphicon-star"></i><b>Member Level: </b><span> USER</span></li>
                    <li><i class="glyphicon glyphicon-zoom-in"></i><b>SNS: </b><span><a href="#"> Look around!</a></span></li>
                </ul>                  
             </div>
             </div>

        </div>
        <hr>
        <div class="col-lg-12">
        	<p><button class="btn btn-primary btn-block"><i class="glyphicon glyphicon-ok"></i> Join</button></p>
		</div>
	</div>

</body>
</html>