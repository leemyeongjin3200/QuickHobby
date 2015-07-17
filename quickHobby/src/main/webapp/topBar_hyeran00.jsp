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
 <link rel="stylesheet" type="text/css" media="all"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
 
<style>
/*body 상단부 여백 */
body {
    padding-top: 100px;

}


/* a태그 효과없음 */
a:link{text-decoration:none !important;}
a:visited{text-decoration:none !important;}
a:hover{text-decoration:none !important;}
a:active{text-decoration:none !important;}

/* MENU CONF*/

.container-fluid {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}

.menu-xs{
  display: none;
  background-color: #E5E5E5;
  border-top: 2px solid #ffffff;
  padding-bottom: 40px;
  position: relative;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
}

.tutmenu, .refmenu, .examenu, .searchmenu, .translatemenu, .menu-xs, .menu-sm {
  display: none;
  background-color: #E5E5E5;
  border-top: 2px solid #ffffff;
  padding-bottom: 40px;
  position: relative;
}

.closemenu {
  color: #ffffff;
  position: absolute;
  right: 30px;
  line-height: 69px;
  font-size: 24px;
  cursor: pointer;
}
.glyphicons {
  position: relative;
  top: 1px;
  display: inline-block;
  font-family: 'Glyphicons Regular';
  font-style: normal;
  font-weight: normal;
  line-height: 1;
  vertical-align: top;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
#translateSection {
  text-align: center;
}
#searchmenu, #translateSection {
  margin-left: 20%;
  margin-right: 20%;
  color: #ffffff;
  font-size: 18px;
}

.open {
	position: relative;
	border-radius: 5px 5px 5px 5px;
	width:45px;
	height:45px;
	padding: 11px 13px;
	font-size: 20px;
	margin: 40px 0px 0px 60px;
	cursor: pointer;
	color: rgb(221, 221, 221);
	background: rgba(0, 0, 0, 1);
}

/**  date */
.datepicker-inline {
  width: 220px;
}
.datepicker {
  padding: 4px;
  margin-top: 1px;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  direction: ltr;
}
table {
  max-width: 100%;
  background-color: transparent;
  border-collapse: collapse;
  border-spacing: 0;
}


</style>

<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/views/template/header.jsp"></jsp:include>
<body>
	<div class="collapse out" id="demo">
		<div class="container-fluid tutmenu" style="display: block;">
			<span class="closemenu glyphicons glyphicons-circle-remove" id="hidetutmenu"></span>
			<div id="tutmenu">
				<h5 style="margin: 0 0 5px 0; border-bottom: 1px dashed #ddd; padding-bottom: 3px;">Filtering</h5>
			<div class="filtering">
				<div class="col-md-6">
					<button type="button" class="btn btn-default btn-block">ALL</button>
				</div>
				<div class="col-md-6">
					<button type="button" class="btn btn-default btn-block">BEST</button>
				</div>

				<h5 style="margin: 0 0 5px 0; border-bottom: 1px dashed #ddd; padding-bottom: 3px;">Option</h5>
				<div class="option">
						<div class="col-md-6">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default active"> <input
									type="radio" name="options" id="yes">YES
								</label> <label class="btn btn-default"> 
								<input type="radio"	name="options" id="option2">NO
								</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="btn-group btn-block" data-toggle="buttons">
								<label class="btn btn-default active"> 
								<input type="radio" name="options" id="option1">IN
								</label> <label class="btn btn-default"> 
								<input type="radio" name="options" id="option2">OUT
								</label>
							</div>
						</div>
				</div>
				<h5 style="margin: 0 0 5px 0; border-bottom: 1px dashed #ddd; padding-bottom: 3px;">Category</h5>
				<div class="form-group no-margin">
					<div class=".radio">
						<button type="button" class="btn btn-primary btn-circle btn-lg">
							<span class="glyphicon glyphicon-eye-open"></span>
						</button>
						<button type="button" class="btn btn-success btn-circle btn-lg">
							<span class="glyphicon glyphicon-hand-right"></span>
						</button>
						<button type="button" class="btn btn-warning btn-circle btn-lg">
							<span class="glyphicon glyphicon-cutlery"></span>
						</button>
						<button type="button" class="btn btn-danger btn-circle btn-lg">
							<span class="glyphicon glyphicon-user"></span>
						</button>
					</div>
				</div>
				
				<h5>날짜 선택</h5>
				<div>
					<div class="well">
         
            
              <div id="dp6" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
              <div class="datepicker datepicker-inline"><div class="datepicker-days" style="display: block;">
              <table class=" table-condensed">
              <thead><tr><th class="prev" style="visibility: visible;"><i class="icon-arrow-left"></i></th>
              <th colspan="5" class="switch">July 2015</th>
              <th class="next" style="visibility: visible;"><i class="icon-arrow-right"></i></th>
              </tr><tr><th class="dow">Su</th><th class="dow">Mo</th><th class="dow">Tu</th><th class="dow">We</th><th class="dow">Th</th><th class="dow">Fr</th>
              <th class="dow">Sa</th></tr></thead><tbody><tr><td class="day old">28</td><td class="day old">29</td>
              <td class="day old">30</td><td class="day">1</td><td class="day">2</td><td class="day">3</td>
              <td class="day">4</td></tr><tr><td class="day">5</td><td class="day">6</td><td class="day">7</td>
              <td class="day">8</td><td class="day">9</td><td class="day">10</td><td class="day">11</td></tr><tr>
              <td class="day">12</td><td class="day">13</td><td class="day">14</td><td class="day">15</td>
              <td class="day active">16</td><td class="day">17</td><td class="day">18</td></tr><tr><td class="day">19</td>
              <td class="day">20</td><td class="day">21</td><td class="day">22</td><td class="day">23</td>
              <td class="day">24</td><td class="day">25</td></tr><tr><td class="day">26</td><td class="day">27</td>
              <td class="day">28</td><td class="day">29</td><td class="day">30</td><td class="day">31</td><td class="day new">1</td></tr>
              <tr><td class="day new">2</td><td class="day new">3</td><td class="day new">4</td><td class="day new">5</td>
              <td class="day new">6</td><td class="day new">7</td><td class="day new">8</td></tr></tbody>
              <tfoot><tr><th colspan="7" class="today">Today</th></tr></tfoot></table></div>
              <div class="datepicker-months" style="display: none;">
              <table class="table-condensed"><thead><tr><th class="prev" style="visibility: visible;"><i class="icon-arrow-left"></i>
              </th><th colspan="5" class="switch">2015</th><th class="next" style="visibility: visible;">
              <i class="icon-arrow-right"></i></th></tr></thead><tbody><tr><td colspan="7"><span class="month">Jan</span>
              <span class="month">Feb</span><span class="month">Mar</span><span class="month">Apr</span>
              <span class="month">May</span><span class="month">Jun</span><span class="month active">Jul</span>
              <span class="month">Aug</span><span class="month">Sep</span><span class="month">Oct</span>
              <span class="month">Nov</span><span class="month">Dec</span></td></tr></tbody>
              <tfoot><tr><th colspan="7" class="today">Today</th></tr></tfoot></table></div>
              <div class="datepicker-years" style="display: none;">
              <table class="table-condensed"><thead><tr><th class="prev" style="visibility: visible;"><i class="icon-arrow-left"></i></th>
              <th colspan="5" class="switch">2010-2019</th><th class="next" style="visibility: visible;"><i class="icon-arrow-right"></i></th>
              </tr></thead><tbody><tr><td colspan="7"><span class="year old">2009</span>
              <span class="year">2010</span><span class="year">2011</span>
              <span class="year">2012</span><span class="year">2013</span>
              <span class="year">2014</span><span class="year active">2015</span>
              <span class="year">2016</span><span class="year">2017</span>
              <span class="year">2018</span><span class="year">2019</span>
              <span class="year old">2020</span></td></tr></tbody>
              <tfoot><tr><th colspan="7" class="today">Today</th></tr></tfoot></table></div></div></div>
          </div>
				</div>
				
				
				
				
				<h5
					style="margin: 0 0 5px 0; border-bottom: 1px dashed #ddd; padding-bottom: 3px;">Distance</h5>
				<div class="form-group no-margin">
					<div id="defaultslide"></div>
					<div id="defaultval">
						<span id="currentval">500</span>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
	<div class="open" data-toggle="collapse" data-target="#demo">
			<span class="glyphicon glyphicon-search"></span>
	</div>


<div class="container" style="overflow:auto;">
<div class="sidemenu hidden-sm hidden-xs">
 <hr>
  <h2>내용 시작</h2>
  <hr>
  
</div>
</div>

 

<script>
//
//Distance slider bar
$(function(){
  $('#defaultslide').slider({ 
    max: 10000,
    min: 0,
    value: 500,
    step: 100,
    slide: function(e,ui) {
      $('#currentval').html(ui.value);
    }
  });
});

$(function() {
    $( "#datepicker" ).datepicker();
  });
</script>
 <script type="text/javascript" src="${root}/css/apply/bootstrap-datepicker.js" charset="UTF-8"></script>
</body>
<jsp:include page="WEB-INF/views/template/footer.jsp"></jsp:include>
</html>