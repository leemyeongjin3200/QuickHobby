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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/message/message.css"/>
<script type="text/javascript" src="${root}/css/message/message.js"></script>
<script>
//
</script>

<style>
/** */
</style>

<title>HYERAN</title>
</head>
<body>
<!-- Header -->
<header>
	<nav class="navbar navbar-default navbar-fixed-top">
	 <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="#">QuickHobby</a>
	    </div>
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
		      <ul class="nav navbar-nav navbar-right">
		      	<!-- message 갯수 받아 오기!! -->
		      	<li><a href="#"><span class="glyphicon glyphicon-envelope"></span> 3</a></li>
		        <li><a href="#"><span class="glyphicon glyphicon-user"></span> NickName</a></li>
		        <li id="myLogout"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		      </ul>
		  </div>
	</div>
	</nav>
</header>
<!-- //Header -->

<!-- Message Content// -->
<div class="container">
	<!-- Page Title// -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					쪽지함 <small>Inbox</small>
				</h1>
			</div>
		</div>
	<!-- //Page Title -->
	
	<!-- Tab1 설정// -->
	  <ul class="nav nav-tabs">
	    <li class="active"><a href="#menu1">전체</a></li>
	    <li><a href="#menu2">수신</a></li>
	    <li><a href="#menu3">발신</a></li>
	  </ul>

	  <div class="tab-content">
	    <div id="menu1" class="tab-pane fade in active">
	    	<div class="row-fluid">
				<div class="span12">
					<ul class="messagesList">
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><span class="label label-default">new</span><a href="#"> 메세지 제목1</a></span>
							<span class="date">Today, <b>3:49 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><span class="label label-default">new</span><a href="#"> 메세지 제목2</a></span>
							<span class="date">Today, <b>3:48 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><span class="label label-default">new</span><a href="#"> 메세지 제목3</a></span>
							<span class="date">Today, <b>3:47 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><a href="#"> 메세지 제목4</a></span>
							<span class="date">Today, <b>3:46 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><a href="#"> 메세지 제목5</a></span>
							<span class="date">Today, <b>3:45 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><a href="#"> 메세지 제목6</a></span>
							<span class="date">Today, <b>3:44 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><a href="#"> 메세지 제목7</a></span>
							<span class="date">Today, <b>3:43 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><a href="#"> 메세지 제목8</a></span>
							<span class="date">Today, <b>3:42 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><a href="#"> 메세지 제목9</a></span>
							<span class="date">Today, <b>3:41 PM</b></span>
						</li>
						<li>
							<span class="from"><input type="checkbox" value="">  leemyeongjin</span>
							<span class="title"><a href="#"> 메세지 제목10</a></span>
							<span class="date">Today, <b>3:40 PM</b></span>
						</li>
					</ul>	
				</div>
		<!-- 버튼(쪽지 보내기, 삭제, 새로고침)// -->	
				<div class="span12">
				  <div class="text-right" style="margin-top:20px">
		                    <a href="#" class="btn btn-default btn-sm" id="myMessage">send</a>
		                    <a href="#" class="btn btn-default btn-sm">delete</a>
		                    <a href="#" class="btn btn-default btn-sm">refresh</a>
		          </div>
				</div>	
		<!--// 버튼(쪽지 보내기, 삭제, 새로고침)  -->
		
		<!-- Page 설정// -->
		        <div class="row text-center">
		            <div class="col-lg-12">
		                <ul class="pagination">
		                    <li>
		                        <a href="#">&laquo;</a>
		                    </li>
		                    <li class="active">
		                        <a href="#">1</a>
		                    </li>
		                    <li>
		                        <a href="#">2</a>
		                    </li>
		                    <li>
		                        <a href="#">3</a>
		                    </li>
		                    <li>
		                        <a href="#">4</a>
		                    </li>
		                    <li>
		                        <a href="#">5</a>
		                    </li>
		                    <li>
		                        <a href="#">&raquo;</a>
		                    </li>
		                </ul>
		            </div>
		        </div>
        <!-- //Page 설정 -->
				
 		</div>
    </div>
    <!-- //Tab1 설정 -->
    
    <!-- Tab2 설정// -->
    <div id="menu2" class="tab-pane fade">
      
    </div>
    <!-- //Tab2 설정 -->
    
    <!-- Tab3 설정// -->
    <div id="menu3" class="tab-pane fade">

    </div>
    <!-- //Tab3 설정 -->
  </div>
</div>
<!-- //Content1 -->

<!-- Message Pop-Up// -->
 <div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 30px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-pencil"></span> Message</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="from" class="col-sm-2 control-label"> From</label>
              <div class="col-sm-10">
              	<input type="text" class="form-control" id="messageFrom" value="" disabled="disabled">
              </div>
            </div>
            <div class="form-group">
              <label for="to" class="col-sm-2 control-label"> To</label>
              <div class="col-sm-10">
              	<input type="text" class="form-control" id="messageTo" value="">
              </div>
            </div>
            <div class="form-group">
              <label for="message" class="col-sm-2 control-label">Message</label>
        		<div class="col-sm-10">
           		 <textarea class="form-control" rows="4" name="message"></textarea>
        		</div>
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-success btn-sm" style="background-color:#BDBDBD; border-color:#BDBDBD; margin-top:10px">
               Send</button>
              <button type="reset" class="btn btn-success btn-sm" style="background-color:#BDBDBD; border-color:#BDBDBD; margin-top:10px">
               Cancel</button>
             </div>
          </form>
        </div>
      </div>
    </div>
  </div> 
</div>
<!-- //Message Pop-Up -->

<!-- footer// -->
<footer>
	<div id="copyRight">CopyRight @ QuickHobby </div>
</footer>
<!-- //footer -->
 
</body>
</html>