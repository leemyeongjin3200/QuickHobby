<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이메일인증</title>
</head>
<body>
<div class="container">
  <div class="modal fade" id="emailModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Email Confirm</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form name="codeForm" method="get" onsubmit="return checkCode(this)">
            <div class="form-group">
          	  <input type="hidden" name="serverCode" value="${serverCode}"/>
              <label for="userCode"><span class="glyphicon glyphicon-lock"></span> Code</label>
              <input type="text" class="form-control" id="userCode" placeholder="Enter code">
              <p class="text-primary">입력하신 이메일주소로 인증번호가 발송 되었습니다. 확인 후 입력해주세요.</p>
            </div>
              <button type="submit" class="btn btn-success btn-block" style="background-color:#BDBDBD; border-color:#BDBDBD"><span class="glyphicon glyphicon-off"></span> 인증하기</button>
          </form>
        </div>
      </div>
    </div>
  </div> 
</div>
</body>
</html>