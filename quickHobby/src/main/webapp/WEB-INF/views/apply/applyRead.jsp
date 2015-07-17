<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var geocoder = new google.maps.Geocoder();
		 
	    var addr="${applyDto.apply_location}";
	 
	    var lat="";
	    var lng="";
	 
	    geocoder.geocode({'address':addr},
	 
	        function(results, status){
	 
	            if(results!=""){
	 
	                var location=results[0].geometry.location;
	 
	                lat=location.lat();
	                lng=location.lng();
	  
	                var latlng = new google.maps.LatLng(lat , lng);
	                var myOptions = {
	                    zoom: 16,
	                    center: latlng,
	                    mapTypeControl: true,
	                    mapTypeId: google.maps.MapTypeId.ROADMAP
	                };
	                var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	                
	        		var marker=new google.maps.Marker({
	        			position:latlng,
	        			map:map
	        		});
	        		
	        		var geocoder=new google.maps.Geocoder();
	            }
	        }
		)
	});
</script>

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
.gApplyTitle { margin-top: 40px; }

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
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body style="font-family:'맑은 샘물', Sans-serif;">
    <div class="container">
    	<hr>
        <div class="row">
            <div class="col-md-12">
                <div class="groupApply-img post-thumb">
                     <img class="img-responsive" src="${root}/groupImage/${applyDto.apply_filename}"/>
                 </div>
                 <div class="post-meta">
                 	<div class="col-lg-6" style="text-align:left">
	                	<i class="glyphicon glyphicon-user"></i><span> ${joins} Joins</span>&nbsp;&nbsp;
	                	<i class="glyphicon glyphicon-heart"></i> <span id="likes"></span> Likes&nbsp;&nbsp;
	                	<i class="glyphicon glyphicon-book"></i><span> ${applyDto.apply_readcount} Reads</span>
                	</div>
                	
                	<div class="col-lg-6 likes" style="text-align:right">
	                	
	                </div>
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
                	<span class="badge">#${applyDto.apply_category}</span>
					<span class="badge">#${applyDto.apply_inout}</span>
					<span class="badge">#${applyDto.apply_section}</span>&nbsp;&nbsp;
					<c:if test="${member.memberNum == applyDto.apply_host}">
						<a href="${root}/apply/applyUpdate.do?apply_num=${applyDto.apply_num}">수정</a>
						<a href="${root}/apply/applyDelete.do?apply_num=${applyDto.apply_num}">삭제</a>
					</c:if>
                    <h2>${applyDto.apply_subject}</h2>
                	&nbsp;&nbsp;&nbsp;&nbsp;<b>${applyDto.apply_subtitle}</b>
                    <hr>
                </div>
                
                <div class="groupApply-detail">
                    <textarea style="background-color:white;" class="form-control" rows="27" cols="58" disabled="disabled">${applyDto.apply_content}</textarea>
               	</div>
            </div>

            <div class="col-lg-4 groupHost">
                <div class="gApplyTitle">
                    <h3>Group Host</h3>
                    <hr>
                </div>
                
      			<div class="single_gMember" >
                    <div class="gMember_img">
                    	<img src="${root}/pds/default.PNG" alt="img">
                    </div>
                    <ul class="list-unstyled groupApply-list" style="text-align:left;">
	                    <li><i class="glyphicon glyphicon-user"></i><b> NickName : </b><span><a href="#"> ${host.memberNickName}</a></span></li>
	                    <li><i class="glyphicon glyphicon-star"></i><b> Member Level : </b><span> ${host.memberLevel}</span></li>
	                    <li><i class="glyphicon glyphicon-zoom-in"></i><b> SNS : </b><span><a href="#"> ${host.memberSNS}</a></span></li>
                    </ul>                  
             	</div>   
             	
             	<div class="single_gMember" style="margin-top:20px">
             		<div class="col-lg-4">
		                <b style="margin-top:35px;"> <fmt:formatDate value="${applyDto.apply_closedate}" type="date"/></b><br/><br/>
						<img id=weather style="width:80px; height:80px;" src="${root}/weather/QuestionMark.png"><br/>
						<b>${weather.wf}</b><br/>
		                <b>최저 : ${weather.tmn}</b><br/>
		                <b>최고 : ${weather.tmx}</b>
					</div>
	                
	                <div class="col-lg-8" style="margin-top:5px;">
			 			<div id="map_canvas" style="width:200px; height:200px;"></div>
			 			<div id="address" style="display:none"></div><br/>
	               	</div>
	               	
	               	<span style="background-color:white; font-size:small; text-align:left; height:50px;" class="form-control" id="addr">${applyDto.apply_location}</span>
               	</div>     	
             </div>
        </div>

        <div class="col-lg-12">
        	<p onclick="return checkJoin('${root}', '${applyDto.apply_num}')"><button class="btn btn-primary btn-block"><i class="glyphicon glyphicon-ok"></i> Join</button></p>
		</div>
</body>
<script type="text/javascript">
	function checkJoin(root, apply_num){
		if("${memberGroups}" > 8){
			alert("8개 이상의 그룹을 가입할 수 없습니다.");
			return false;
		}
		
		if("${isJoin}" > 0){
			alert("이미 가입한 그룹입니다.");
			return false;
		}
		
		var url=root + "/apply/applyOk.do?apply_num=" + apply_num;
		location.href=url;
	}
	
</script>
<script type="text/javascript">
	var recommends=${memberRecommend};
	
	$(document).ready(function(){
		if("${weather.wf}" != ""){
		
		var wf="${weather.wf}";
		var url="${root}/weather/" + wf + ".jpg";
		
			$("#weather").attr("src", url);
		}
		
		if("${host.memberFileName}" !=""){
			var fileName="${host.memberFileName}";
			var url="${root}/pds/" + fileName + ".jpg";
		}
		
		$("#likes").html(recommends);
		
		if("${memberRecommend}" > 0){
			$(".likes").append('<img class="clicked" onclick="clickfun()" src="${root}/icon/heart.png" style="cursor:pointer; width:30px; height:30px;" id="recommendBtn">');
		}
		if("${memberRecommend}" == 0){
			$(".likes").append('<img class="nonclicked" onclick="nonclickfun()" src="${root}/icon/notHeart.png" style="cursor:pointer; width:30px; height:30px;" id="recommendBtn">');
		}
	});
	function nonclickfun(){
		sendData="board_num=${applyDto.apply_num}&recommend_type=A";
		
		$.ajax({
			url:"${root}/apply/incrementRecommend.do",
			type:"post",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				alert("이 게시물을 좋아합니다.")
				$("#recommendBtn").remove();
				$(".likes").append('<img class="clicked" onclick="clickfun()" src="${root}/icon/heart.png" style="cursor:pointer; width:30px; height:30px;" id="recommendBtn">');
				recommends++;
				$("#likes").html(recommends);
			},
			error:function(xhr, status, error){
				// xhr:XHRHttpRequest, status 4 20, error
				var arr=new Array();
				arr.push("xhr : " + xhr);
				arr.push("status : " + status);
				arr.push("error : " + error);
				alert(arr);
			}
		});
	}
	
	function clickfun(){
		sendData="board_num=${applyDto.apply_num}&recommend_type=A";
		
		$.ajax({
			url:"${root}/apply/decrementRecommend.do",
			type:"post",
			data:sendData,
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			dataType:"text",
			success:function(data){
				alert("좋아요를 취소합니다.")
				$("#recommendBtn").remove();
				$(".likes").append('<img class="nonclicked" onclick="nonclickfun()" src="${root}/icon/notHeart.png" style="cursor:pointer; width:30px; height:30px;" id="recommendBtn">');
				recommends--;
				$("#likes").html(recommends);
			},
			error:function(xhr, status, error){
				// xhr:XHRHttpRequest, status 4 20, error
				var arr=new Array();
				arr.push("xhr : " + xhr);
				arr.push("status : " + status);
				arr.push("error : " + error);
				alert(arr);
			}
		});
	}
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>
