<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--===========Reply Pop-Up 시작================ -->
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModalGroupReply" role="dialog">
			<div class="modal-dialog modal-lg">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title"><span class="glyphicon glyphicon-comment" style="color:white !important"></span> Comments</h4>
		        </div>
		        
		       
		        <div class="modal-Reply-body">
		          <ul class="reply-box">
		          	 <c:forEach var="reply" items="${groupReplyList}">
		               <li class="left clearfix">
		                   <div class="reply-body">                                        
		<%--                        <strong><i class="glyphicon glyphicon-user"></i>${reply.memberNickName}</strong> --%>
		<%--                        <small class="pull-right text-muted"><i class="glyphicon glyphicon-calendar"></i>${reply.boardReplyModifyDate}</small>                                       --%>
		<!--                        <p> -->
		<%--                            ${reply.boardReplyContent} --%>
		<!--                        </p> -->
		                   </div>
		               </li>
		           	 </c:forEach>   
		           </ul>
		        </div>
		       
		        
		        <div class="modal-footer" style="font-color:white">
		        	<a onclick="toContent()" id="toContent" class="btn btn-primary" style="background-color:#BDBDBD; border-color:#BDBDBD;">to Content</a>
		            <a href="#" class="btn btn-primary" name="toList" style="background-color:#BDBDBD; border-color:#BDBDBD; width:11%;">to List</a>
		        </div>
		      </div>
		    </div>
		</div><!-- #myModalReply 끝 -->
	</div><!-- .container 끝 -->
	<!--=============Reply Pop-Up 끝================= -->
</body>
</html>