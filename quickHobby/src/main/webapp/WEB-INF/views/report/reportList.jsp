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
<link rel="stylesheet" type="text/css" href="${root}/css/report/report.css"/>
<title>HYERAN</title>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
<!-- Report Content// -->
<div class="container">
	<!-- Page Title// -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					신고 목록 <small>Report</small>
				</h1>
			</div>
		</div>
	<!-- //Page Title -->
	
	<!-- Tab1 설정// -->
	  <div class="tab-content">
	    <div id="menu1" class="tab-pane fade in active">
	    	<div class="row-fluid">
				<div class="span12">
					<ul class="messagesList">
						<li>
							<span class="from" style="text-align:center;"><b>Number</b></span>
							<span class="from" style="text-align:center;"><b>Sender</b></span>
							<span class="from" style="text-align:center;"><b>Receiver</b></span>
							<span class="from" style="text-align:center;"><b>Board Number</b></span>
							<span class="from" style="text-align:center;"><b>Board Type</b></span>
						</li>
						<!-- reportList foreach로 불러오기 -->
						<c:forEach var="reportList" items="${reportList}">
							
								<li>
									<!-- report 선택하기 -->
									<span class="from label label-info" style="text-align:center; font-size:14px">${reportList.report_num}</span>
									<span class="from label label-info" style="text-align:center; font-size:14px"><a href="${root}/memberBoard/check.do?memberNum=${reportList.report_sender}">${reportList.sender_name}</a></span>
									<span class="from label label-info" style="text-align:center; font-size:14px"><a href="${root}/memberBoard/check.do?memberNum=${reportList.report_receiver}">${reportList.receiver_name}</a></span>
									<span class="from label label-info" style="text-align:center; font-size:14px">${reportList.report_boardnum}</span>
									<c:if test="${reportList.report_boardtype == 'A'}">
										<span class="from label label-info" style="text-align:center; font-size:14px">Apply</span>
									</c:if>
									<c:if test="${reportList.report_boardtype == 'T'}">
										<span class="from label label-info" style="text-align:center; font-size:14px">Tip & Review</span>
									</c:if>
									<c:if test="${reportList.report_boardtype == 'G'}">
										<span class="from label label-info" style="text-align:center; font-size:14px">Group</span>
									</c:if>
								</li>
								
								<!-- report 선택하기 -->
								<span>
									<textarea rows="8" cols="119" style="margin-left:10px; margin-bottom:30px; background-color:white;" disabled="disabled">${reportList.report_content}</textarea>
								</span>
								<hr>
						</c:forEach>
						<!-- reportList foreach로 불러오기 -->
					</ul>	
				</div> 
		
		<!-- Page 설정// -->
		
			<!-- Page 설정에 관련한 변수들 설정 -->
			<c:if test="${count>0}">
			
			<c:set var="pageBlock" value="${5}"/>
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
			                        <a href="${root}/report/reportList.do?pageNumber=${startPage-1}">&laquo;</a>
			                    </li>
		                    </c:if>
		                    <!-- prev Page 버튼 생성 관련 -->
		                    
		                    <!-- 각 Page 버튼 생성 관련 -->
		                    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
				                <c:if test="${currentPage!=i}">
						            <li> 
			                       		<a id="messagePage" href="${root}/report/reportList.do?pageNumber=${i}">${i}</a> 
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
			                        <a href="${root}/report/reportList.do?pageNumber=${endPage+1}">&raquo;</a>
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
    
  </div>
</div>
<!-- //Content1 -->
</body>
<script type="text/javascript" src="${root}/css/report/report.js"></script>
<jsp:include page="../template/footer.jsp"></jsp:include>
<script type="text/javascript" src="${root}/css/main/isotope-docs.min.js"></script>
</html>