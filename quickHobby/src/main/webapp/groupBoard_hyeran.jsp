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
/* a태그 효과없음 */
a:link{text-decoration:none !important;}
a:visited{text-decoration:none !important;}
a:hover{text-decoration:none !important;}
a:active{text-decoration:none !important;}


/*background-color 및 라인 */
#gInfo{
	background: none repeat scroll 0 0;
	display: inline;
	float: left;
	padding: 80px 0px 0px;
	width: 100%;
	border-top: 0px solid #eee;
	border-bottom: 0px solid #eee;	
}
.gInfo_content {
  display: inline;
  float: left;
  margin-top: 30px;
  width: 100%;
  padding-bottom: 30px;
}

.gInfo_map {
  border: 1px solid #ccc;
  display: inline;
  float: left;
  width: 100%; 
}


.gInfo_img img{
  border: 1px solid #ccc;
  display: inline;
  float: right;
  width: 100%;
  height: 400px;
}

#map_canvas{
	width: 100%;
	float: left;
	display: inline;
    height: 400px;

}

/** List 타입 게시판=========================================
==================================================== */
.gTable {
		display:table;
		width:100%;
		font-size: 13px;
}
.gTableRow {
		display:table-row;
}
.gTableHeading {
		display:table-header-group;
		background-color:#ddd;
}
.gTableCell{
		display:table-cell;
		padding:6px 15px;
		border-bottom:1px solid #D5D5D5;
		text-align:center;
}
.gTableHead {
		display:table-cell;
		padding:6px 20px;
		border-top:1px solid #999999;
		border-bottom:1px solid #999999;
		text-align:center;
}
.gTableHeading {
		display:table-header-group;
		background-color:#ddd;
		font-weight:bold;
}
.gTableBody {
		display: table-row-group;
}
.number{
	display: inline-block;
	width: 5%;
	white-space: nowrap;
	overflow:hidden !important;
	text-overflow: ellipsis;	
}
.title{
	display: inline-block;
	width:45%;
	white-space: nowrap;
	overflow:hidden !important;
	text-overflow: ellipsis;	
}
.titlec{
	display: inline-block;
	width:45%;
	text-align:left !important;
	white-space: nowrap;
	overflow:hidden !important;
	text-overflow: ellipsis;	
}
.nickname{
	display: inline-block;
	width: 20%;
	white-space: nowrap;
	overflow:hidden !important;
	text-overflow: ellipsis;	
}
.date{
	display: inline-block;
	width: 20%;
	white-space: nowrap;
	overflow:hidden !important;
	text-overflow: ellipsis;	
}
.count{
	display: inline-block;
	width: 10%;
	white-space: nowrap;
	overflow:hidden !important;
	text-overflow: ellipsis;	
}

/** Group Member=========================================
==================================================== */

/* background color 적용됨
#gMember{
	float: left;
	display: inline;
	width: 100%;
	padding:80px 0px; 
}*/

.gMember_area{
	float: left;
	display: inline;
	width: 100%;
}
.gMember_slider{
	float: left;
	display: inline;
	width: 100%;
}
.gMember_slider .slick-next, .gMember_slider .slick-prev{
  height: 40px;
  background-color: #eee;
  font:white;
}
.single_gMember {
  border: 0px solid #ccc;
  border-radius: 5px;
  display: inline;
  float: left;
  padding: 25px 15px;
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

.single_gMember h5 {
  color: #555;
  font-weight: bold;
  margin-bottom: 0;
  margin-top: 18px;
  font-size: 14px;
}

.gMember_team h5 {
  color: #555;
  margin-bottom: 0;
  margin-top: 10px;
  text-transform: uppercase;

}

.single_gMember span {
  display: inline-block;
  font-size: 15px;
  margin-bottom: 10px;
 
}

.single_gMemberp {
  line-height: 26px;
}

/** Reply Model창=========================================
==================================================== */
 .modal-Reply-body {
	height: 250px;
	overflow-y: scroll;
}
 .reply-box {
	margin: 0;
	padding: 15px;
	list-style: none;
}
 .reply-box li {
	margin-bottom: 15px;
	padding-bottom: 5px;
	border-bottom: 1px dotted #808080;
}
 .reply-box li.left .reply-body {
	margin-left: 5px;
}
 .reply-box li .reply-body p {
	margin: 0;
	color: #8d8888;
}

.modal-header, .modal-header h4, .close {
      background-color: #BDBDBD;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
      text-align: center;
  }
  
/** category*/ 
.category_item{
	float: left;
	display: inline;
	width: 100%;
	margin-top: 10px;
}

.category_item span {
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

.category_item i {
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

.category_item .eye{
	background-color:red;
}

.category_item .hands{
	background-color:#0054FF;

}

.category_item .mouth{
	background-color:#9FC93C;

}

.category_item .legs{
	background-color:#FFE08C;

}

  
</style>

<title>UNDER CONSTRUCTION!!!작업중!!!</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
    <!--=========== BEGAIN CONTACT SECTION ================-->
    <section id="gInfo">
      <div class="container">
      
        <div class="row">
          <!-- BEGAIN CONTACT CONTENT -->
          <div class="gInfo_content">
            <!-- BEGAIN CONTACT FORM -->
            <div class="col-lg-7 col-md-7 col-sm-7">
              <div class="gInfo_img">
				<img src="${root}/img/Tulips.jpg" class="img-responsive" alt="">
              </div>
              <div class="category_item">
                 <span class="eye"><i class="glyphicon glyphicon-comment" ></i></span>
                 <span class="hands"><i class="glyphicon glyphicon-user"></i></span>
                 <span class="mouth"><i class="glyphicon glyphicon-calendar"></i></span>
                 <span class="legs"><i class="glyphicon glyphicon-heart"></i></span>
       		</div>
            </div>
            <!-- BEGAIN CONTACT MAP -->
            <div class="col-lg-5 col-md-5 col-sm-5">
              <div class="gInfo_map">
              <!-- BEGAIN GOOGLE MAP -->
               <div id="map_canvas"></div>
              </div>
            </div>           
          </div>
        </div>      
      </div>             
    </section>
    <!--=========== END CONTACT SECTION ================-->
    
    <div class="container">
         <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <!-- START CONTACT HEADING -->
            <div class="heading">
              <h2 class="">Title입니다.</h2>
              <p>subtitle입니다.</p>
            </div>
          </div>
        </div> 
                <div id="list1" class="tab-pane active">
                       	<div class="row-fluid">
						<div class="gTable">
							<!-- list1 header -->
							<div class="gTableRow">
								<div class="gTableHead number"><strong>#</strong></div>
								<div class="gTableHead nickname"><strong>NickName</strong></div>
								<div class="gTableHead title"><strong>Title</strong></div>
								<div class="gTableHead date"><i class="glyphicon glyphicon-calendar"></i><strong> Date</strong></div>
								<div class="gTableHead count"><strong>Views</strong></div>
							</div>
							
							<!-- list1 contents -->
		
								<div class="gTableRow">
									<div class="gTableCell number">5</div>
									<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
										<a href="#">leemyeongjin</a></div>
									<div class="gTableCell titlec"><a href="#">안녕하세요. 반갑습니다. &nbsp;</a>
										<i class="glyphicon glyphicon-comment"></i><a href="#"><b class="myInGroupReply"> 3</b></a></div>
									<div class="gTableCell date"> 13:48 </div>
									<div class="gTableCell count">45</div>
								</div><!-- .gTableRow 끝-->

							
								<div class="gTableRow">
									<div class="gTableCell number">4</div>
									<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
										<a href="#">leemyeongjin</a></div>
									<div class="gTableCell titlec"><a href="#">안녕하세요. 반갑습니다.  &nbsp;</a>
										<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
									<div class="gTableCell date"> 13:48 </div>
									<div class="gTableCell count">45</div>
								</div><!-- .gTableRow 끝-->
						
							<div class="gTableRow">
								<div class="gTableCell number">4</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">안녕하세요. 반갑습니다.  &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
							</div><!-- .gTableRow 끝  -->
							
							<div class="gTableRow">
								<div class="gTableCell number">3</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">안녕하세요. 반갑습니다.  &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
							</div><!-- .gTableRow 끝  -->
							
							<div class="gTableRow">
								<div class="gTableCell number">2</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">안녕하세요. 반갑습니다.  &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
							</div><!-- .gTableRow 끝  -->
							
							<div class="gTableRow">
								<div class="gTableCell number">1</div>
								<div class="gTableCell nickname"><i class="glyphicon glyphicon-user"></i>
									<a href="#">leemyeongjin</a></div>
								<div class="gTableCell titlec"><a href="#">안녕하세요. 반갑습니다.  &nbsp;</a>
									<i class="glyphicon glyphicon-comment"></i><a href="#"><b> 3</b></a></div>
								<div class="gTableCell date"> 13:48 </div>
								<div class="gTableCell count">45</div>
							</div><!-- .gTableRow 끝  -->
						</div> <!-- .gTable 끝  -->
					</div><!-- .row-fluid 끝 -->
                   </div><!-- #list1 끝 -->
   
   			<!-- menu2 Tip게시판 page넘기기 -->   
	        <div class="row text-center">
	            <div class="col-lg-12">
	                <ul class="pagination">
	                    <li><a href="#">&laquo;</a></li>
	                    <li class="active"><a href="#">1</a></li>
	                    <li><a href="#">2</a></li>
	                    <li><a href="#">3</a></li>
	                    <li><a href="#">4</a></li>
	                    <li><a href="#">5</a></li>
	                    <li><a href="#">&raquo;</a></li>
	                </ul>
	            </div><!-- .col-lg-12 끝 -->
	        </div><!-- .row text-center 끝 -->
    <hr>
    </div><!-- container 끝 -->
    
     <!--=========== GroupMember list 시작 ================-->
    <section id="gMember">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12">
            <!-- BEGAIN ABOUT HEADING -->
            <div class="heading">
              <h3 class="">Group Member</h3>
              <p>모임을 신청한 사람들입니다.</p>            
            </div>
            <div class="gMember_area">
              <!-- BEGAIN TEAM SLIDER -->
              <div class="gMember_slider">  
              
                <!-- BEGAIN SINGLE TEAM SLIDE#1 -->              
                <div class="col-lg-3 col-md-3 col-sm-4">
                  <div class="single_gMember">
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                    <h5><i class="glyphicon glyphicon-user"></i><a href="#"> leemyeongjin</a></h5>
                    <span>Host</span>                        
                    
                
                  </div>
                </div>
                <!-- BEGAIN SINGLE TEAM SLIDE#2 -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                  <div class="single_gMember">
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                    <h5><i class="glyphicon glyphicon-user"></i><a href="#"> seoingoo1</a></h5>
                    <span>Member</span>                        
                    
              
                  </div>
                </div>
                <!-- BEGAIN SINGLE TEAM SLIDE#3 -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                  <div class="single_gMember">
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                    <h5><i class="glyphicon glyphicon-user"></i><a href="#"> seoingoo2</a></h5>
                    <span>Member</span>                        
                    
             
                  </div>
                </div>
                <!-- BEGAIN SINGLE TEAM SLIDE#4 -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                  <div class="single_gMember">
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                    <h5><i class="glyphicon glyphicon-user"></i><a href="#"> seoingoo3</a></h5>
                    <span>Member</span>                        
                    
             
                  </div>
                </div>
                <!-- BEGAIN SINGLE TEAM SLIDE#5 -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                  <div class="single_gMember">
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                    <h5><i class="glyphicon glyphicon-user"></i><a href="#"> seoingoo4</a></h5>
                    <span>Member</span>                        
                  </div>
                </div>
                <!-- BEGAIN SINGLE TEAM SLIDE#6 -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                  <div class="single_gMember">
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                    <h5><i class="glyphicon glyphicon-user"></i><a href="#"> seoingoo5</a></h5>
                    <span>Member</span>                        
                    
                  </div>
                </div>
                <!-- BEGAIN SINGLE TEAM SLIDE#7 -->
                <div class="col-lg-3 col-md-3 col-sm-4">
                  <div class="single_gMember">
                    <div class="gMember_img">
                      <img src="${root}/img/Tulips.jpg" alt="img">
                    </div>
                    <h5><i class="glyphicon glyphicon-user"></i><a href="#"> seoingoo6</a></h5>
                    <span>Member</span>                        
                  </div>
                </div>                              
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--=========== END TEAM SECTION ================-->
    
    

    
    
 <!-- Reply Pop-Up// -->
 <div class="container">
 <!-- Modal -->
  <div class="modal fade" id="myModalReply" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span class="glyphicon glyphicon-comment" style="color:white !important"></span> Comments</h4>
        </div>
        <div class="modal-Reply-body">
          <ul class="reply-box">
               <li class="left clearfix">
                   <div class="reply-body">                                        
                       <strong ><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong>
                       <small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i> 13:00:00</small>                                      
                       <p>
                           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                       </p>
                   </div>
               </li>
               <li class="left clearfix">
                   <div class="reply-body clearfix">
                       <strong ><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong>
                       <small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i> 13:00:00</small>
                       <p>
                           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                       </p>
                   </div>
               </li>
               <li class="left clearfix">
                <div class="reply-body">                                        
                    <strong ><i class="glyphicon glyphicon-user"></i> Leemyeongjin</strong>
                    <small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i> 13:00:00</small>                                      
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                    </p>
                </div>
           </li> 
           </ul>
        </div>
        <div class="modal-footer" style="font-color:white">
        	<a href="#" class="btn btn-primary" style="background-color:#BDBDBD; border-color:#BDBDBD;">to Content</a>
            <a href="#" class="btn btn-primary" style="background-color:#BDBDBD; border-color:#BDBDBD; width:11%;">to List</a>
        </div>
      </div>
    </div>
  </div>
  </div>
<!-- //Reply Pop-Up -->
    
    
	
	<!-- Google map -->
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="${root}/css/groupBoard/jquery.ui.map.js"></script>
    <!-- for circle counter -->
    <script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
    <!-- For smooth animatin --> 
    <script src="${root}/css/groupBoard/wow.min.js"></script> 
        <!-- superslides slider -->
    <script src="${root}/css/groupBoard/jquery.superslides.min.js" type="text/javascript"></script>
    <!-- slick slider -->
    <script src="${root}/css/groupBoard/slick.min.js"></script>    
<script>

jQuery(function($){
	//gMember_slider

		$('.gMember_slider').slick({
		  dots: false,
		  infinite: true,
		  speed: 400,
		  slidesToShow: 5,
		  slidesToScroll: 5,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 4,
		        slidesToScroll: 4,
		        infinite: true,
		        dots: true
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2,
		      }
		    }
		  ]
		});

  var zoom= $('#map_canvas').gmap('option', 'zoom');
  
  $('#map_canvas').gmap().bind('init', function(ev, map) {
    $('#map_canvas').gmap('addMarker', {'position': '57.7973433,12.0502107', 'bounds': true});
    $('#map_canvas').gmap('option', 'zoom', 13);
  });

});

//Reply 팝업창
$(document).ready(function(){
    $(".myInGroupReply").click(function(){
        $("#myModalReply").modal();
    });
});

</script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
</html>