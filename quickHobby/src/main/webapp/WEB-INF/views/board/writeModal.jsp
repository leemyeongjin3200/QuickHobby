<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
</head>
<body>
	<!-- Login Pop-Up// -->
	<div class="container">
		<!-- Trigger the modal with a button -->
		<!-- Modal -->
		<div class="modal fade" id="writeBoardModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Write
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form name="groupBoardWriteForm" action="${root}/board/write.do" method="post" onsubmit="return boardCheck(this)" enctype="multipart/form-data">
							<input type="hidden" name="boardWriter" value="${member.memberNum}" />
							<div class="form-group">
								<label for=""><span class="glyphicon glyphicon-bookmark"></span> Section</label><br>
								<input type="radio" name="boardSection" value="t"> Tip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="boardSection" value="r"> Review <br>
							</div>
							
							<div class="form-group">
								<label for=""><span class="glyphicon glyphicon-pushpin"></span> Title</label>
								<input class="form-control" type="text"	name="boardSubject" size="50" placeholder="Title" />
							</div>
							
<!-- 							<div class="form-group"> -->
<!-- 								<label for=""><span class="glyphicon glyphicon-th"></span> </label> -->
<!-- 							</div> -->
							<div class="form-group">
								<label for="" class="title"><span class="glyphicon glyphicon-pencil"></span> Content</label>
								<textarea class="form-control" rows="12" cols="58" name="boardContent" placeholder="Content"></textarea>
							</div>

							<div class="form-group">
								<label for=""><span class="glyphicon glyphicon-camera"></span> Picture</label> 
									<input class="btn btn-default" type="file" name="board_file" id="board_file" />
							</div>

							<div class="form-group" style="text-align: center">
								<input type="submit" class="btn btn-default" value="Complete" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>