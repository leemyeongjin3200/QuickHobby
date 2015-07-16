<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="${root}/css/jquery.cookie.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/css/main/main.js"></script>
<script type="text/javascript" src="${root}/css/member/member.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    	var cookieId=$.cookie('cookieId');
		if(cookieId!=undefined){
			$("#userId").val(cookieId);
			$("#rememberId").attr("checked", true);
		}
		
        $("#myModal").modal("toggle");
    
});
</script>
</head>
<body>
<!-- Login Pop-Up// -->
${param.abc} 하하하하
 <div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" action="${root}/member/login.do" method="post">
            <div class="form-group">
              <label for="username"><span class="glyphicon glyphicon-user"></span> E-mail</label>
              <input type="text" class="form-control" id="userId" name="userId" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="userPassword"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input id="rememberId" name="rememberId" type="checkbox">Remember me</label>
            </div>
              <button type="submit" id="loginBtn" class="btn btn-success btn-block" style="background-color:#BDBDBD; border-color:#BDBDBD"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>Not a member? <a href="${root}/member/register.do">Sign Up</a></p>
          <p>Forgot <a href="${root}/member/findPassword.do">Password?</a></p>
        </div>
      </div>
    </div>
  </div> 
</div>
<!-- //Login Pop-Up -->

</body>
</html>