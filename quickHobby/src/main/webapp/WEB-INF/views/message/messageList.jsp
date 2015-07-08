<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript" src="${root}/css/main/isotope-docs.min.js"></script>
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
						
						<!-- messageList foreach로 불러오기 -->
						<c:forEach var="messageList" items="${messageList}">
							<li>
								<!-- message 선택하기 -->
								<span class="from"><input type="checkbox" name="checkedMsg" value="${messageList.message_num}"> ${messageList.message_receiver}</span>
								<!-- message 선택하기 -->
								<span class="title"><c:if test="${messageList.message_read=='no'}"><span class="label label-default">new</span></c:if><a href="${root}/message/messageRead.do?message_num=${messageList.message_num}">${messageList.message_content}</a></span>
								<span class="date"><b><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate type="both" value="${messageList.message_date}" pattern="E M/d, KK:mm a"/></b></span>
							</li>
						</c:forEach>
						<!-- messageList foreach로 불러오기 -->
					</ul>	
				</div>
		<!-- 버튼(쪽지 보내기, 삭제, 새로고침)// -->	
				<div class="span12">
				  <div class="text-right" style="margin-top:20px">
		                    <a href="#" class="btn btn-default btn-sm" id="myMessage">send</a>
		                    <a href="#" id="messageDel" class="btn btn-default btn-sm">delete</a>
		                    <a href="#" class="btn btn-default btn-sm">refresh</a>
		          </div>
				</div>	
		<!--// 버튼(쪽지 보내기, 삭제, 새로고침)  -->
		
		<!-- Page 설정// -->
		
			<!-- Page 설정에 관련한 변수들 설정 -->
			<c:if test="${count>0}">
			
			<c:set var="pageBlock" value="${3}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			<!-- Page 설정에 관련한 변수들 설정 -->
			<form id="messagePage" name="messagePage">
			
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		        <div class="row text-center">
		            <div class="col-lg-12">
		                <ul class="pagination">
		                	
		                	<!-- prev Page 버튼 생성 관련 -->
		                	<c:if test="${startPage>pageBlock}">
			                    <li>
			                        <a href="#">&laquo;</a>
			                    </li>
		                    </c:if>
		                    <!-- prev Page 버튼 생성 관련 -->
		                    
		                    <!-- 각 Page 버튼 생성 관련 -->
		                    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
				                <c:if test="${currentPage!=i}">
						            <li> 
			                       		<a id="messagePage" href="" data-filter="${i}">${i}</a> 
				                    </li>    	                                                                                                                                                                                                                                                                                                                                                                                                                   
				                </c:if>
				                <c:if test="${currentPage==i}">
					                <li class="active">
						                   	<a href="" id="currentP">${i}</a>
						            </li>  
					            </c:if>  
		                    </c:forEach>
		                    <!-- 각 Page 버튼 생성 관련 -->
		                    
							<!-- next Page 버튼 생성 관련 -->
							<c:if test="${endPage<pageCount}">
			                    <li>
			                        <a href="#">&raquo;</a>
			                    </li>
		                    </c:if>
		                    <!-- next Page 버튼 생성 관련 -->
		                </ul>
		            </div>
		        </div>
		    </form>
		        
			</c:if>
        <!-- //Page 설정 -->
				
 		</div>
    </div>
    <!-- //Tab1 설정 -->
    
    <!-- Tab2 설정// -->
	    <div id="menu2" class="tab-pane fade">
	      <div class="row-fluid">
					<div class="span12">
						<ul class="messagesList">
							
							<!-- messageList foreach로 불러오기 -->
							<c:forEach var="messageList" items="${messageList}">
									<li>
										<!-- message 선택하기 -->
										<span class="from"><input type="checkbox" name="checkedMsg" value="${messageList.message_num}"> ${messageList.message_receiver}</span>
										<!-- message 선택하기 -->
										<span class="title"><span class="label label-default">new</span><a href="${root}/message/messageRead.do?message_num=${messageList.message_num}">${messageList.message_content}</a></span>
										<span class="date"><b><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate type="both" value="${messageList.message_date}" pattern="E M/d, KK:mm a"/></b></span>
									</li>
							</c:forEach>
							<!-- messageList foreach로 불러오기 -->
						</ul>	
					</div>
			<!-- 버튼(쪽지 보내기, 삭제, 새로고침)// -->	
					<div class="span12">
					  <div class="text-right" style="margin-top:20px">
			                    <a href="#" class="btn btn-default btn-sm" id="myMessage">send</a>
			                    <a href="#" id="messageDel" class="btn btn-default btn-sm">delete</a>
			                    <a href="#" class="btn btn-default btn-sm">refresh</a>
			          </div>
					</div>	
			<!--// 버튼(쪽지 보내기, 삭제, 새로고침)  -->
			
			<!-- Page 설정// -->
			
				<!-- Page 설정에 관련한 변수들 설정 -->
				<c:if test="${count>0}">
				
				<c:set var="pageBlock" value="${3}"/>
				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
				
				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
				
				<c:set var="startPage" value="${rs*pageBlock+1}"/>
				<c:set var="endPage" value="${startPage+pageBlock-1}"/>
				
				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				<!-- Page 설정에 관련한 변수들 설정 -->
				<form id="messagePage" name="messagePage">
				
				<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			        <div class="row text-center">
			            <div class="col-lg-12">
			                <ul class="pagination">
			                	
			                	<!-- prev Page 버튼 생성 관련 -->
			                	<c:if test="${startPage>pageBlock}">
				                    <li>
				                        <a href="#">&laquo;</a>
				                    </li>
			                    </c:if>
			                    <!-- prev Page 버튼 생성 관련 -->
			                    
			                    <!-- 각 Page 버튼 생성 관련 -->
			                    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
					                <c:if test="${currentPage!=i}">
							            <li> 
				                       		<a id="messagePage" href="" data-filter="${i}">${i}</a> 
					                    </li>    	                                                                                                                                                                                                                                                                                                                                                                                                                   
					                </c:if>
					                <c:if test="${currentPage==i}">
						                <li class="active">
							                   	<a href="" id="currentP">${i}</a>
							            </li>  
						            </c:if>  
			                    </c:forEach>
			                    <!-- 각 Page 버튼 생성 관련 -->
			                    
								<!-- next Page 버튼 생성 관련 -->
								<c:if test="${endPage<pageCount}">
				                    <li>
				                        <a href="#">&raquo;</a>
				                    </li>
			                    </c:if>
			                    <!-- next Page 버튼 생성 관련 -->
			                </ul>
			            </div>
			        </div>
			    </form>
			        
				</c:if>
	        <!-- //Page 설정 -->
					
	 		</div>
	    </div>
    <!-- //Tab2 설정 -->
    
    <!-- Tab3 설정// -->
    <div id="menu3" class="tab-pane fade">
		<h4>hohohohohohohohoho</h4>
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
        
        <!-- message sending -->
          <form name="sendMsg" role="form">
            <div class="form-group">
              <label for="from" class="col-sm-2 control-label"> From</label>
              <div class="col-sm-10">
              	<input type="text" class="form-control" id="messageFrom" value="1" disabled="disabled">
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
           		 <textarea class="form-control" rows="4" id="messageContent" ></textarea>
        		</div>
            </div>
            <div class="text-center">
              <button type="button" id="sendMsg" class="btn btn-success btn-sm" style="background-color:#BDBDBD; border-color:#BDBDBD; margin-top:10px">
               Send</button>
              <button type="reset" class="btn btn-success btn-sm" style="background-color:#BDBDBD; border-color:#BDBDBD; margin-top:10px">
               Cancel</button>
             </div>
          </form>
          <!-- message sending -->
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