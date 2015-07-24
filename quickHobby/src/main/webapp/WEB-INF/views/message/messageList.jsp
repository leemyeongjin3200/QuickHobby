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
<link rel="stylesheet" type="text/css" href="${root}/css/message/message.css"/>
<style type="text/css">
.board{
	min-height:100%;
}
</style>
<title>HYERAN</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<!-- Message Content// -->
<div class="container board">
	<!-- Page Title// -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">
					쪽지함 <small>Inbox</small>
				</h2>
			</div>
		</div>
	<!-- //Page Title -->
	
	<!-- Tab1 설정// -->
	  <ul class="nav nav-tabs">
	    <li class="active"><a href="#menu1">All</a></li>
	    <li><a href="#menu2">Receive</a></li>
	    <li><a href="#menu3">Send</a></li>
	  </ul>

	  <div class="tab-content">
	    <div id="menu1" class="tab-pane fade in active">
	    	<div class="row-fluid">
				<div class="span12">
					<ul class="messagesList">
						<li>
							<span class="from" style="text-align:center;"><b>TYPE</b></span>
							<span class="title" style="text-align:center;"><b>CONTENT</b></span>
							<span class="date" style="text-align:center;"><b>DATE</b></span>
						</li>
						<!-- messageList foreach로 불러오기 -->
						<c:forEach var="messageList" items="${messageList}">
							<!-- 수신, 발신 메세지 세션 member에게만 보이기 -->
							<c:if test="${member.memberNum==messageList.message_receiver||member.memberNum==messageList.message_sender}">
							
								<li>
									<!-- message 선택하기 -->
									<c:if test="${member.memberNum==messageList.message_sender}">
										<span class="from label label-info" style="text-align:left; font-size:14px"><input type="checkbox" name="checkedMsg" value="${messageList.message_num}"> Send</span>
									</c:if>
									<c:if test="${member.memberNum==messageList.message_receiver}">
										<span class="from label label-info" style="text-align:left; font-size:14px"><input type="checkbox" name="checkedMsg" value="${messageList.message_num}"> Receive</span>
									</c:if>	
									<!-- message 선택하기 -->
									<span class="title">
										<a href="#" style="font-size:14px; padding-left:30px" onclick="readMessage('${messageList.message_num}', '${member.memberNum}', '${messageList.message_receiver}')">${messageList.message_content} </a>
										<c:if test="${messageList.message_read=='no' && member.memberNum==messageList.message_receiver}">
											<span class="label label-default">new </span>&nbsp;
										</c:if>
										<c:if test="${messageList.message_read=='no' && member.memberNum==messageList.message_sender}">
											<span class="label label-default">Unread</span>&nbsp;
										</c:if>
									</span>
										<span class="date" style="text-align:center;"><b><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate type="both" value="${messageList.message_date}" pattern="E M/d, KK:mm a"/></b></span>
										<div class="${messageList.message_num}" style="display:none"><br/>
											<span class="from"></span>
											<span class="title">
												<c:if test="${member.memberNum==messageList.message_receiver}">
													<span class=""><b> From: ${messageList.message_senderNick}</b></span><br/>
													<div align="center">
														<pre style="padding-top:20px; padding-bottom:20px; text-align:left">${messageList.message_content}</pre>
														
														<span class="label label-default"><a href="#" class="btn" style="color:white" onclick="replyMessage('${messageList.message_sender}', '${messageList.message_senderNick}')">Send</a></span>
														<span class="label label-default"><a href="#" class="btn" style="color:white" onclick="deleteMessage('${messageList.message_num}')">Delete</a></span>
													</div>
												</c:if>
												<c:if test="${member.memberNum==messageList.message_sender}">
													<span class=""><b> To: ${messageList.message_receiverNick}</b></span><br/>
													<div align="center">
														<pre style="padding-top:20px; padding-bottom:20px; text-align:left">${messageList.message_content}</pre>
														<span class="label label-default"><a href="#" class="btn" style="color:white" onclick="replyMessage('${messageList.message_receiver}', '${messageList.message_receiverNick}')">Send</a></span>
														<span class="label label-default"><a href="#" class="btn" style="color:white" onclick="deleteMessage('${messageList.message_num}')">Delete</a></span>
													</div>
												</c:if>
											</span>
										</div>
								</li>
							</c:if>
						</c:forEach>
						<!-- messageList foreach로 불러오기 -->
					</ul>	
				</div> 
		<!-- 버튼(쪽지 보내기, 삭제, 새로고침)// -->	
				<div class="span12">
				  <div class="text-right" style="margin-top:20px">
		                    <a href="#" id="messageDel" class="btn btn-default btn-sm">delete</a>
		                    <a href="${root}/message/messageList.do?pageNumber=${currentPage}" class="btn btn-default btn-sm">refresh</a>
		          </div>
				</div>	
		<!--// 버튼(쪽지 보내기, 삭제, 새로고침)  -->
		
		<!-- Page 설정// -->
		
			<!-- Page 설정에 관련한 변수들 설정 -->
<%-- 			<c:if test="${count>0}"> --%>
			
<%-- 			<c:set var="pageBlock" value="${3}"/> --%>
<%-- 			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/> --%>
			
<%-- 			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/> --%>
			
<%-- 			<c:set var="startPage" value="${rs*pageBlock+1}"/> --%>
<%-- 			<c:set var="endPage" value="${startPage+pageBlock-1}"/> --%>
			
<%-- 			<c:if test="${endPage>pageCount}"> --%>
<%-- 				<c:set var="endPage" value="${pageCount}"/> --%>
<%-- 			</c:if> --%>
<!-- 			<!-- Page 설정에 관련한 변수들 설정 --> 
<!-- 			<form id="messagePage" name="messagePage"> -->
			
<%-- 			<input type="hidden" name="pageNumber" value="${pageNumber}"/> --%>
<!-- 		        <div class="row text-center"> -->
<!-- 		            <div class="col-lg-12"> -->
<!-- 		                <ul class="pagination"> -->
		                	
<!-- 		                	prev Page 버튼 생성 관련 -->
<%-- 		                	<c:if test="${startPage>pageBlock}"> --%>
<!-- 			                    <li> -->
<!-- 			                        <a href="#">&laquo;</a> -->
<!-- 			                    </li> -->
<%-- 		                    </c:if> --%>
<!-- 		                    prev Page 버튼 생성 관련 -->
		                    
<!-- 		                    각 Page 버튼 생성 관련 -->
<%-- 		                    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status"> --%>
<%-- 				                <c:if test="${currentPage!=i}"> --%>
<!-- 						            <li>  -->
<%-- 			                       		<a id="messagePage" href="" data-filter="${i}">${i}</a>  --%>
<!-- 				                    </li>    	                                                                                                                                                                                                                                                                                                                                                                                                                    -->
<%-- 				                </c:if> --%>
<%-- 				                <c:if test="${currentPage==i}"> --%>
<!-- 					                <li class="active"> -->
<%-- 						                   	<a href="" id="currentP">${i}</a> --%>
<!-- 						            </li>   -->
<%-- 					            </c:if>   --%>
<%-- 		                    </c:forEach> --%>
<!-- 		                    각 Page 버튼 생성 관련 -->
		                    
<!-- 							next Page 버튼 생성 관련 -->
<%-- 							<c:if test="${endPage<pageCount}"> --%>
<!-- 			                    <li> -->
<!-- 			                        <a href="#">&raquo;</a> -->
<!-- 			                    </li> -->
<%-- 		                    </c:if> --%>
<!-- 		                    next Page 버튼 생성 관련 -->
<!-- 		                </ul> -->
<!-- 		            </div> -->
<!-- 		        </div> -->
<!-- 		    </form> -->
		        
<%-- 			</c:if> --%>
        <!-- //Page 설정 -->
				
 		</div>
    </div>
    <!-- //Tab1 설정 -->
    
    <!-- Tab2 설정// -->
	    <div id="menu2" class="tab-pane fade">
	      <div class="row-fluid">
					<div class="span12">
						<ul class="messagesList">
							<li>
								<span class="from" style="text-align:center;"><b>SENDER</b></span>
								<span class="title" style="text-align:center;"><b>CONTENT</b></span>
								<span class="date" style="text-align:center;"><b>DATE</b></span>
							</li>
							<!-- messageList foreach로 불러오기 -->
							<c:forEach var="messageList" items="${messageList}">
								<c:if test="${member.memberNum==messageList.message_receiver}">
									<li>
										<!-- message 선택하기 -->
										<span class="from label label-info" style="text-align:left; font-size:14px"><input type="checkbox" name="checkedMsg" value="${messageList.message_num}"> ${messageList.message_senderNick}</span>
										<!-- message 선택하기 -->
										<span class="title"><a href="#" style="font-size:14px; padding-left:30px" onclick="readMessage('${messageList.message_num}')"> ${messageList.message_content} </a><c:if test="${messageList.message_read=='no'}"><span class="label label-default">new</span></c:if></span>
										<span class="date" style="text-align:center;"><b><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate type="both" value="${messageList.message_date}" pattern="E M/d, KK:mm a"/></b></span>
										<div class="${messageList.message_num}" style="display:none"><br/>
											<span class="from"></span>
											<span class="title">
												<c:if test="${member.memberNum==messageList.message_receiver}">
													<span class=""><b> From: ${messageList.message_senderNick}</b></span><br/>
												</c:if>
												<c:if test="${member.memberNum==messageList.message_sender}">
													<span class=""><b> To: ${messageList.message_receiverNick}</b></span><br/>
												</c:if>
												<div align="center">
													<pre style="padding-top:20px; padding-bottom:20px; text-align:left">${messageList.message_content}</pre>
													<span class="label label-default"><a href="#" class="btn" style="color:white" onclick="replyMessage('${messageList.message_sender}', '${messageList.message_senderNick}')">Send</a></span>
													<span class="label label-default"><a href="#" class="btn" style="color:white" onclick="deleteMessage('${messageList.message_num}')">Delete</a></span>
												</div>
											</span>
										</div>
									</li>
								</c:if>
							</c:forEach>
							<!-- messageList foreach로 불러오기 -->
						</ul>	
					</div>
			<!-- 버튼(쪽지 보내기, 삭제, 새로고침)// -->	
					<div class="span12">
					  <div class="text-right" style="margin-top:20px">
			                    <a href="#" id="messageDel" class="btn btn-default btn-sm">delete</a>
			                    <a href="${root}/message/messageList.do?pageNumber=${currentPage}" class="btn btn-default btn-sm">refresh</a>
			          </div>
					</div>	
			<!--// 버튼(쪽지 보내기, 삭제, 새로고침)  -->
			
			<!-- Page 설정// -->
			
				<!-- Page 설정에 관련한 변수들 설정 -->
<%-- 				<c:if test="${count>0}"> --%>
				
<%-- 				<c:set var="pageBlock" value="${3}"/> --%>
<%-- 				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/> --%>
				
<%-- 				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/> --%>
				
<%-- 				<c:set var="startPage" value="${rs*pageBlock+1}"/> --%>
<%-- 				<c:set var="endPage" value="${startPage+pageBlock-1}"/> --%>
				
<%-- 				<c:if test="${endPage>pageCount}"> --%>
<%-- 					<c:set var="endPage" value="${pageCount}"/> --%>
<%-- 				</c:if> --%>
<!-- 				Page 설정에 관련한 변수들 설정 -->
<!-- 				<form id="messagePage" name="messagePage"> -->
				
<%-- 				<input type="hidden" name="pageNumber" value="${pageNumber}"/> --%>
<!-- 			        <div class="row text-center"> -->
<!-- 			            <div class="col-lg-12"> -->
<!-- 			                <ul class="pagination"> -->
			                	
<!-- 			                	prev Page 버튼 생성 관련 -->
<%-- 			                	<c:if test="${startPage>pageBlock}"> --%>
<!-- 				                    <li> -->
<!-- 				                        <a href="#">&laquo;</a> -->
<!-- 				                    </li> -->
<%-- 			                    </c:if> --%>
<!-- 			                    prev Page 버튼 생성 관련 -->
			                    
<!-- 			                    각 Page 버튼 생성 관련 -->
<%-- 			                    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status"> --%>
<%-- 					                <c:if test="${currentPage!=i}"> --%>
<!-- 							            <li>  -->
<%-- 				                       		<a id="messagePage" href="" data-filter="${i}">${i}</a>  --%>
<!-- 					                    </li>    	                                                                                                                                                                                                                                                                                                                                                                                                                    -->
<%-- 					                </c:if> --%>
<%-- 					                <c:if test="${currentPage==i}"> --%>
<!-- 						                <li class="active"> -->
<%-- 							                   	<a href="" id="currentP">${i}</a> --%>
<!-- 							            </li>   -->
<%-- 						            </c:if>   --%>
<%-- 			                    </c:forEach> --%>
<!-- 			                    각 Page 버튼 생성 관련 -->
			                    
<!-- 								next Page 버튼 생성 관련 -->
<%-- 								<c:if test="${endPage<pageCount}"> --%>
<!-- 				                    <li> -->
<!-- 				                        <a href="#">&raquo;</a> -->
<!-- 				                    </li> -->
<%-- 			                    </c:if> --%>
<!-- 			                    next Page 버튼 생성 관련 -->
<!-- 			                </ul> -->
<!-- 			            </div> -->
<!-- 			        </div> -->
<!-- 			    </form> -->
			        
<%-- 				</c:if> --%>
	        <!-- //Page 설정 -->
					
	 		</div>
	    </div>
    <!-- //Tab2 설정 -->
    
    <!-- Tab3 설정// -->
    <div id="menu3" class="tab-pane fade">
	      <div class="row-fluid">
					<div class="span12">
						<ul class="messagesList">
							<li>
								<span class="from" style="text-align:center;"><b>RECEIVER</b></span>
								<span class="title" style="text-align:center;"><b>CONTENT</b></span>
								<span class="date" style="text-align:center;"><b>DATE</b></span>
							</li>
							<!-- messageList foreach로 불러오기 -->
							<c:forEach var="messageList" items="${messageList}">
								<c:if test="${member.memberNum==messageList.message_sender}">
									<li>
										<!-- message 선택하기 -->
										<span class="from label label-info" style="text-align:left; font-size:14px"><input type="checkbox" name="checkedMsg" value="${messageList.message_num}"> ${messageList.message_receiverNick}</span>
										<!-- message 선택하기 -->
										<span class="title"><a href="#" style="font-size:14px; padding-left:30px" onclick="readMessage('${messageList.message_num}')"> ${messageList.message_content} </a><c:if test="${messageList.message_read=='no'}"><span class="label label-default">Unread</span></c:if></span>
										<span class="date" style="text-align:center;"><b><fmt:setLocale value="en_US" scope="session"/><fmt:formatDate type="both" value="${messageList.message_date}" pattern="E M/d, KK:mm a"/></b></span>
										<div class="${messageList.message_num}" style="display:none"><br/>
											<span class="from"></span>
											<span class="title">
												<c:if test="${member.memberNum==messageList.message_receiver}">
													<span class=""><b> From: ${messageList.message_senderNick}</b></span><br/>
												</c:if>
												<c:if test="${member.memberNum==messageList.message_sender}">
													<span class=""><b> To: ${messageList.message_receiverNick}</b></span><br/>
												</c:if>
												<div align="center">
													<pre style="padding-top:20px; padding-bottom:20px; text-align:left">${messageList.message_content}</pre>
													<span class="label label-default"><a href="#" class="btn" style="color:white" onclick="replyMessage('${messageList.message_receiver}', '${messageList.message_receiverNick}')">Send</a></span>
													<span class="label label-default"><a href="#" class="btn" style="color:white" onclick="deleteMessage('${messageList.message_num}')">Delete</a></span>
												</div>
											</span>
										</div>
									</li>
								</c:if>
							</c:forEach>
							<!-- messageList foreach로 불러오기 -->
						</ul>	
					</div>
			<!-- 버튼(쪽지 보내기, 삭제, 새로고침)// -->	
					<div class="span12">
					  <div class="text-right" style="margin-top:20px">
			                    <a href="#" id="messageDel" class="btn btn-default btn-sm">delete</a>
			                    <a href="${root}/message/messageList.do?pageNumber=${currentPage}" class="btn btn-default btn-sm">refresh</a>
			          </div>
					</div>	
			<!--// 버튼(쪽지 보내기, 삭제, 새로고침)  -->
			
			<!-- Page 설정// -->
			
				<!-- Page 설정에 관련한 변수들 설정 -->
<%-- 				<c:if test="${count>0}"> --%>
				
<%-- 				<c:set var="pageBlock" value="${3}"/> --%>
<%-- 				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/> --%>
				
<%-- 				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/> --%>
				
<%-- 				<c:set var="startPage" value="${rs*pageBlock+1}"/> --%>
<%-- 				<c:set var="endPage" value="${startPage+pageBlock-1}"/> --%>
				
<%-- 				<c:if test="${endPage>pageCount}"> --%>
<%-- 					<c:set var="endPage" value="${pageCount}"/> --%>
<%-- 				</c:if> --%>
<!-- 				Page 설정에 관련한 변수들 설정 -->
<!-- 				<form id="messagePage" name="messagePage"> -->
				
<%-- 				<input type="hidden" name="pageNumber" value="${pageNumber}"/> --%>
<!-- 			        <div class="row text-center"> -->
<!-- 			            <div class="col-lg-12"> -->
<!-- 			                <ul class="pagination"> -->
			                	
<!-- 			                	prev Page 버튼 생성 관련 -->
<%-- 			                	<c:if test="${startPage>pageBlock}"> --%>
<!-- 				                    <li> -->
<!-- 				                        <a href="#">&laquo;</a> -->
<!-- 				                    </li> -->
<%-- 			                    </c:if> --%>
<!-- 			                    prev Page 버튼 생성 관련 -->
			                    
<!-- 			                    각 Page 버튼 생성 관련 -->
<%-- 			                    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status"> --%>
<%-- 					                <c:if test="${currentPage!=i}"> --%>
<!-- 							            <li>  -->
<%-- 				                       		<a id="messagePage" href="" data-filter="${i}">${i}</a>  --%>
<!-- 					                    </li>    	                                                                                                                                                                                                                                                                                                                                                                                                                    -->
<%-- 					                </c:if> --%>
<%-- 					                <c:if test="${currentPage==i}"> --%>
<!-- 						                <li class="active"> -->
<%-- 							                   	<a href="" id="currentP">${i}</a> --%>
<!-- 							            </li>   -->
<%-- 						            </c:if>   --%>
<%-- 			                    </c:forEach> --%>
<!-- 			                    각 Page 버튼 생성 관련 -->
			                    
<!-- 								next Page 버튼 생성 관련 -->
<%-- 								<c:if test="${endPage<pageCount}"> --%>
<!-- 				                    <li> -->
<!-- 				                        <a href="#">&raquo;</a> -->
<!-- 				                    </li> -->
<%-- 			                    </c:if> --%>
<!-- 			                    next Page 버튼 생성 관련 -->
<!-- 			                </ul> -->
<!-- 			            </div> -->
<!-- 			        </div> -->
<!-- 			    </form> -->
			        
<%-- 				</c:if> --%>
	        <!-- //Page 설정 -->
					
	 		</div>
	    </div>
    <!-- //Tab3 설정 -->
  </div>
</div>
<!-- //Content1 -->
</body>
<script type="text/javascript" src="${root}/css/message/message.js"></script>
<jsp:include page="../template/footer.jsp"></jsp:include>
<jsp:include page="messageModal.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/main/isotope-docs.min.js"></script>
</html>